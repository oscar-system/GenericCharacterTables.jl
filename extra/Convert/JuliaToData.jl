# Convert a table stored as Julia code (data/Tables/*/*.jl) into the TOML data
# format read by `load_table_data`.
#
#   julia> include("extra/Convert/JuliaToData.jl")
#   julia> convert_table("data/Tables/A1/GL2.jl", "data/Tables/A1/GL2.toml")
#
# The data is taken from the loaded table, so that it reads back exactly as
# `loadtab` builds it. The source supplies the sums, the written form of
# polynomials (the factored lengths and degrees) where it reads back to the
# same polynomial, and the order of the terms of each value.

using GenericCharacterTables
using GenericCharacterTables.Oscar
import GenericCharacterTables:
  loadtab, load_table_data, UPoly, UPolyFrac, ExprReader, read_poly

#
# Printing expressions
#
# `print_expr` prints the subset of Julia used by the tables so that
# `Meta.parse` gives back the same expression tree. Julia's own printer
# parenthesizes every left-nested subtraction, which is unreadable for the
# long alternating sums of the converted Maple tables.

const PREC_SUM = 1
const PREC_PRODUCT = 2
const PREC_FRAC = 3
const PREC_UNARY = 4
const PREC_POWER = 5
const PREC_ATOM = 6

function expr_precedence(ex)
  ex isa Integer && return ex < 0 ? PREC_UNARY : PREC_ATOM
  ex isa Expr && ex.head == :call || return PREC_ATOM
  f, n = ex.args[1], length(ex.args) - 1
  f in (:+, :-) && n >= 2 && return PREC_SUM
  f == :- && return PREC_UNARY
  f == :* && return PREC_PRODUCT
  f == :// && return PREC_FRAC
  f == :^ && return PREC_POWER
  return PREC_ATOM
end

function print_expr(ex, prec::Int=0)
  s = print_expr_raw(ex)
  return expr_precedence(ex) < prec ? "($s)" : s
end

function print_expr_raw(ex)
  ex isa Union{Symbol,Integer} && return string(ex)
  ex isa Expr || error("cannot print $(repr(ex))")
  h, a = ex.head, ex.args
  h == :(=) && return print_expr(a[1]) * " = " * print_expr(a[2])
  h == :vect && return "[" * join(print_expr.(a), ", ") * "]"
  h == :tuple && return "(" * join(print_expr.(a), ", ") * ")"
  h == :. && return print_expr(a[1]) * ".(" * join(print_expr.(a[2].args), ", ") * ")"
  h == :ref &&
    return print_expr(a[1], PREC_ATOM) * "[" * join(print_expr.(a[2:end]), ", ") * "]"
  h == :call || error("cannot print $ex")
  f = a[1]
  if f in (:+, :*) && length(a) >= 3
    # a nested call of the same operator is not flattened by the parser
    op = f == :+ ? " + " : " * "
    prec = f == :+ ? PREC_SUM : PREC_PRODUCT
    args = [print_expr(x, i == 1 ? prec : prec + 1) for (i, x) in enumerate(a[2:end])]
    return join(args, op)
  elseif f == :- && length(a) == 3
    return print_expr(a[2], PREC_SUM) * " - " * print_expr(a[3], PREC_SUM + 1)
  elseif f == :- && length(a) == 2
    return "-" * print_expr(a[2], PREC_ATOM)
  elseif f == :// && length(a) == 3
    return print_expr(a[2], PREC_FRAC) * "//" * print_expr(a[3], PREC_FRAC + 1)
  elseif f == :^ && length(a) == 3
    return print_expr(a[2], PREC_ATOM) * "^" * print_expr(a[3], PREC_ATOM)
  end
  return print_expr(f, PREC_ATOM) * "(" * join(print_expr.(a[2:end]), ", ") * ")"
end

#
# Reading the source
#

strip_lines(body::Expr) = Any[e for e in body.args if !(e isa LineNumberNode)]

# The statements of `function (tt::...) ... end`.
function function_body(f::Expr)
  f.head == :function || error("expected a function, got $f")
  arg = f.args[1].args[1]
  arg isa Expr && arg.head == :(::) && arg.args[1] == :tt ||
    error("unexpected argument $arg")
  return strip_lines(f.args[2])
end

# `class_center_sums[(7, 1, 1)]` becomes the helper `center_7_1_1`.
function rename_helpers(ex, dict::Symbol)
  ex isa Expr || return ex
  if ex.head == :ref && ex.args[1] == dict
    key = ex.args[2]
    key isa Expr && key.head == :tuple || error("unexpected helper key $key")
    return Symbol("center_" * join(key.args, "_"))
  end
  return Expr(ex.head, (rename_helpers(a, dict) for a in ex.args)...)
end

function sum_text(body::Vector{Any}, dict::Symbol)
  return join((print_expr(rename_helpers(stmt, dict)) for stmt in body), "\n")
end

# The key expressions of a value `S(Dict(k => c, ...); simplify=false)`, or
# `nothing` for a value written differently.
function source_keys(ex)
  ex isa Expr && ex.head == :call && ex.args[1] == :S || return nothing
  simplify, dict = true, nothing
  for a in ex.args[2:end]
    kws = a isa Expr && a.head == :parameters ? a.args : Any[a]
    for b in kws
      if b isa Expr && b.head == :kw && b.args[1] == :simplify
        simplify = b.args[2]
      elseif b isa Expr && b.head == :call && b.args[1] == :Dict
        dict = b
      else
        return nothing
      end
    end
  end
  simplify === false && dict !== nothing || return nothing
  return Any[p.args[2] for p in dict.args[2:end]]
end

# The values of each character, from `table = GenericCyclo[[...] [...]]` or
# from `push!(chars, GenericCyclo[...])`.
function source_values!(src::Dict{Symbol,Any}, e::Expr)
  if e.head == :(=) && e.args[1] == :table && Meta.isexpr(e.args[2], :typed_hcat)
    src[:values] = [col.args for col in e.args[2].args[2:end]]
  elseif e.head == :call && e.args[1] == :push! && e.args[2] == :chars
    push!(get!(src, :values, Vector{Any}[]), e.args[3].args[2:end])
  end
end

# The parts of the source the converter takes verbatim: the order, the class
# lengths and degrees, the order of the terms of the values, and the sums.
function read_source(path::String)
  src = Dict{Symbol,Any}()
  helpers = Dict(d => Dict{String,String}() for d in (:class_center_sums, :char_center_sums))
  for e in Meta.parseall(read(path, String)).args
    e isa Expr || continue
    source_values!(src, e)
    e.head == :(=) || continue
    lhs, rhs = e.args
    if lhs in (:classsums, :charsums)
      fns = rhs.head == :vect ? rhs.args : rhs.args[2:end]  # [f, ...] or Function[f, ...]
      dict = lhs == :classsums ? :class_center_sums : :char_center_sums
      src[lhs] = [sum_text(function_body(f), dict) for f in fns]
    elseif lhs == :order
      src[:order] = rhs
    elseif lhs in (:classparams, :charparams)
      rhs isa Expr && rhs.head == :vect || continue
      src[lhs] = rhs.args
    elseif lhs in (:classinfo, :charinfo)
      # Vector{Any}[...] or [...]
      rhs isa Expr && rhs.head in (:ref, :vect) || continue
      src[lhs] = rhs.head == :ref ? rhs.args[2:end] : rhs.args
    elseif lhs in (:classlength, :chardegree)
      # R.([a, b, ...])
      rhs isa Expr && rhs.head == :. && rhs.args[1] == :R || continue
      src[lhs] = rhs.args[2].args[1].args
    elseif lhs isa Expr && lhs.head == :ref && haskey(helpers, lhs.args[1])
      name = string(rename_helpers(lhs, lhs.args[1]))
      helpers[lhs.args[1]][name] = sum_text(function_body(rhs), lhs.args[1])
    end
  end
  src[:class_helpers] = helpers[:class_center_sums]
  src[:char_helpers] = helpers[:char_center_sums]
  return src
end

#
# Writing TOML
#

# Literal strings keep the LaTeX in the infos free of escapes.
function toml_string(s::AbstractString)
  !occursin('\'', s) && !occursin('\n', s) && return "'$s'"
  occursin('\n', s) && !occursin("'''", s) && return "'''\n$s'''"
  escaped = replace(s, '\\' => "\\\\", '"' => "\\\"", '\n' => "\\n", '\t' => "\\t")
  return "\"$escaped\""
end

# A polynomial from the source if it reads back as `p`, else `p` itself.
function poly_text(r::ExprReader, ex, p::UPoly)
  ex === nothing && return string(p)
  s = print_expr(ex)
  q = try
    read_poly(r, s)
  catch
    nothing
  end
  return q !== nothing && string(q) == string(p) ? s : string(p)
end

# `ex` is the source of the info `x`, if known, for the polynomials in it.
function toml_info(r::ExprReader, x, ex=nothing)
  if x isa AbstractVector
    # [a, b] or Any[a, b]
    exs = ex isa Expr && ex.head == :vect ? ex.args :
      ex isa Expr && ex.head == :ref ? ex.args[2:end] : nothing
    exs !== nothing && length(exs) == length(x) || (exs = fill(nothing, length(x)))
    return "[" * join([toml_info(r, y, e) for (y, e) in zip(x, exs)], ", ") * "]"
  end
  x isa AbstractString && return toml_string(x)
  x isa Integer && return string(x)
  x isa UPoly && return "{ poly = \"$(poly_text(r, ex, x))\" }"
  error("cannot write info entry $(repr(x))")
end

strip_R(ex) = ex isa Expr ? (ex.head == :call && ex.args[1] == :R ? strip_R(ex.args[2]) :
  Expr(ex.head, strip_R.(ex.args)...)) : ex

# The terms of `x` in the order of the source if it wrote `x` as a `Dict`:
# `include` inserted them in this order, and so does the loader. Otherwise
# `nothing`.
function source_order(r::ExprReader, x, ex)
  keys_ex = source_keys(ex)
  keys_ex === nothing && return nothing
  terms = Pair{UPolyFrac,UPoly}[]
  for kex in keys_ex
    kex = strip_R(kex)
    Meta.isexpr(kex, :call) && kex.args[1] == :// || return nothing
    key = read_poly(r, print_expr(kex.args[2]))//read_poly(r, print_expr(kex.args[3]))
    k = getkey(x.f, key, nothing)
    k === nothing && return nothing
    any(t -> isequal(t.first, k), terms) || push!(terms, k => x.f[k])
  end
  return length(terms) == length(x.f) ? terms : nothing
end

# An order of the terms of `f` in which inserting them into an empty `Dict` of
# the same size reproduces its layout: a key goes in after the keys on the
# slots its probe passed over. Relies on the internals of `Dict`.
function insertion_order(f::Dict)
  f.ndel == 0 || return nothing
  sz = length(f.slots)
  pending = Set(i for i in 1:sz if Base.isslotfilled(f, i))
  order = Int[]
  while !isempty(pending)
    ready = [i for i in pending if begin
      j = Base.hashindex(f.keys[i], sz)[1]
      while j != i && !(j in pending)
        j = mod1(j + 1, sz)
      end
      j == i
    end]
    isempty(ready) && return nothing
    sort!(ready)
    append!(order, ready)
    setdiff!(pending, ready)
  end
  return [f.keys[i] => f.vals[i] for i in order]
end

same_order(terms, f) = collect(keys(Dict{UPolyFrac,UPoly}(terms))) == collect(keys(f))

# The terms of `x` in an order in which the loader rebuilds `x.f` with the same
# iteration order, which shows when a value is printed.
function ordered_terms(r::ExprReader, x, ex)
  terms = source_order(r, x, ex)
  terms === nothing || return terms
  terms = collect(x.f)
  same_order(terms, x.f) && return terms
  ordered = insertion_order(x.f)
  ordered !== nothing && same_order(ordered, x.f) && return ordered
  return terms
end

function value_text(terms::Vector{<:Pair})
  terms_text = String[]
  for (k, c) in terms
    n, d = numerator(k, false), denominator(k, false)
    if iszero(n) && isone(d) && !iszero(c)
      push!(terms_text, string(c))
      continue
    end
    root = isone(n) ? "E($d)" : "E($d)^($n)"
    if isone(c)
      push!(terms_text, root)
    elseif isone(-c)
      push!(terms_text, "-" * root)
    elseif length(c) == 1
      push!(terms_text, "$c*$root")
    else
      push!(terms_text, "($c)*$root")
    end
  end
  isempty(terms_text) && return "0"
  s = terms_text[1]
  for t in terms_text[2:end]
    s *= startswith(t, "-") ? " - " * t[2:end] : " + " * t
  end
  return s
end

# The numerator and denominator as stored; the loader builds the fraction from
# them without cancelling.
function fraction_text(e::UPolyFrac)
  wrap(x) = occursin(r"^([A-Za-z_][A-Za-z_0-9]*|[0-9]+)$", x) ? x : "($x)"
  return wrap(string(numerator(e, false))) * "//" * wrap(string(denominator(e, false)))
end

# The moduli of `Parameters([Parameter(i, m), ...], ...)`.
function source_moduli(ex)
  ex isa Expr && ex.head == :call && ex.args[1] == :Parameters || return nothing
  return [p.args[3] for p in ex.args[2].args]
end

function parameters_text(io::IO, r::ExprReader, p::GenericCharacterTables.Parameters, ex)
  ps, es = p.params, p.exceptions.exceptions
  moduli = source_moduli(ex)
  moduli !== nothing && length(moduli) == length(ps) || (moduli = fill(nothing, length(ps)))
  params = ["[\"$(x.var)\", \"$(poly_text(r, m, x.modulus))\"]" for (x, m) in zip(ps, moduli)]
  println(io, "params = [", join(params, ", "), "]")
  isempty(es) || println(io, "exceptions = [", join(["\"$(fraction_text(e))\"" for e in es], ", "), "]")
end

function sum_toml(text::String)
  occursin('\n', text) || return toml_string(text)
  return "'''\n$text\n'''"
end

function convert_table(
  jlpath::String,
  tomlpath::String;
  source::String=joinpath(basename(dirname(jlpath)), basename(jlpath)),
)
  t = loadtab(jlpath)
  src = read_source(jlpath)
  S = t.ring
  R = base_ring(S)
  syms = string.(symbols(R))
  vars = Dict{String,UPoly}(s => gen(R, i) for (i, s) in enumerate(syms))
  r = ExprReader(R, vars)

  issorted(t.charparamindex) || error("character parameters out of order")
  classparams = syms[t.classparamindex]
  charparams = syms[t.charparamindex]

  io = IOBuffer()
  println(io, "# Converted from $source by extra/Convert/JuliaToData.jl.")
  println(io)
  println(io, "format = 1")
  println(io, "kind = \"CharTable\"")
  println(io, "order = \"", poly_text(r, get(src, :order, nothing), t.order), "\"")
  if S.congruence !== nothing
    println(io, "# q^power is congruent to congruence[1] modulo congruence[2]")
    println(io, "congruence = [$(S.congruence[1]), $(S.congruence[2])]")
  end
  S.power == 1 || println(io, "power = $(S.power)")
  syms[1] == "q" || println(io, "variable = \"$(syms[1])\"")
  println(io, "classparams = [", join(["\"$v\"" for v in classparams], ", "), "]")
  println(io, "charparams = [", join(["\"$v\"" for v in charparams], ", "), "]")
  println(io, "information = ", toml_string(t.information))

  for (key, title) in ((:class_helpers, "class"), (:char_helpers, "character"))
    isempty(src[key]) && continue
    println(io)
    println(io, "# Sums over the centralizer types of the Maple source, for the $title sums.")
    println(io, "[$key]")
    for name in sort(collect(keys(src[key])); by=k -> parse.(Int, split(k, "_")[2:end]))
      println(io, name, " = ", sum_toml(src[key][name]))
    end
  end

  lengths = get(src, :classlength, fill(nothing, length(t.classlength)))
  classinfo = get(src, :classinfo, fill(nothing, length(t.classlength)))
  for j in eachindex(t.classlength)
    println(io)
    println(io, "[[classtypes]]  # $j")
    println(io, "info = ", toml_info(r, t.classinfo[j], classinfo[j]))
    println(io, "length = \"", poly_text(r, lengths[j], t.classlength[j]), "\"")
    parameters_text(io, r, t.classparams[j], get(src, :classparams, fill(nothing, j))[j])
    println(io, "sum = ", sum_toml(src[:classsums][j]))
  end

  degrees = get(src, :chardegree, fill(nothing, length(t)))
  charinfo = get(src, :charinfo, fill(nothing, length(t)))
  for (i, c) in enumerate(t.chars)
    println(io)
    println(io, "[[chartypes]]  # $i")
    println(io, "info = ", toml_info(r, c.info, charinfo[i]))
    println(io, "degree = \"", poly_text(r, degrees[i], c.degree), "\"")
    parameters_text(io, r, c.params, get(src, :charparams, fill(nothing, i))[i])
    println(io, "sum = ", sum_toml(src[:charsums][i]))
    println(io, "values = [")
    for (j, v) in enumerate(c.values)
      ex = haskey(src, :values) ? src[:values][i][j] : nothing
      println(io, "  \"", value_text(ordered_terms(r, v, ex)), "\",  # $j")
    end
    println(io, "]")
  end

  write(tomlpath, take!(io))
  return tomlpath
end

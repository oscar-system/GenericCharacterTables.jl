# Converts a CHEVIE3 Maple table (see MapleParser.jl) into a generic character
# table in the current format of this package, as found in `data/Tables`.
#
# Usage:
#
#   julia extra/Convert/MapleTable.jl <maple file> <output .jl file>
#
# Run JuliaFormatter over the result afterwards; the emitted code is correct
# but not formatted to the style of the repository.
#
# The Maple sources are not part of this repository. The library ones ship with
# the Maple part of CHEVIE; the tables of GL_n(q) and GU_n(q) for n = 4, 5, 6
# are at https://www.math.rwth-aachen.de/~Frank.Luebeck/chev (extraGenTabGLGU).
#
# What the Maple files hold, and where it goes:
#
#   NAME := array(-2 .. c, -1 .. k, [...])  the table itself, row -2 being the
#         header [name, id, order, #chars, #classes], row -1 the class info,
#         row 0 the class lengths, and rows 1.. the characters, each starting
#         with its info and its degree
#   Klassen<NAME>Parameter, Char<NAME>Parameter   parameter ranges and the
#         forbidden parameter combinations, per type -> `classparams`
#   CenterSums<ID>[a,b,c], CenterSumsDual<ID>[a,b,c]   sums over a centralizer
#         type, as mutually recursive Maple procedures
#   Klassen<ID>Summe<n>, Char<ID>Summe<n>   a scalar times one of those
#         -> `classsums`, `charsums`
#   parameter<ID>, set/unsetCongruence<ID>, Information<ID>
#
# Ignored: ReprSemiSimple<ID> and its dual (semisimple representatives, which
# the package has no place for), and the `lprint` banner.
#
# Not handled, because the tables this was written for need none of it, but
# present in the Maple library: files marked `NurPolynom`, which hold plain
# polynomials and a `KlassentypOrd` instead of summation procedures and become
# a `SimpleCharTable`; roots of unity whose order involves a square root, as
# for the Suzuki and Ree groups; and parameter exceptions of several
# conditions at once, which `Parameters` cannot express anyway. The converter
# that produced the tables in `data` covered the first two; it is gone from
# the working tree, so look for extra/Convert/Convert.jl in the history.

include("MapleParser.jl")
using .MapleParser

## Polynomial normal form
#
# Used for the exponents of the roots of unity and for the coefficients, where
# the same value has to be recognized in different spellings: the Maple tables
# write both `GEWZ1^(2*iI1*kK1)` and `q*GEWZ1^(2*iI1*kK1)` as separate
# summands of one entry, and `iI1*kK1*q` and `q*iI1*kK1` for one monomial.
# Everything else (the group order, class lengths, degrees, moduli) is printed
# from the parse tree instead, which keeps it factored and readable.

const Mono = Vector{Pair{String,Int}}  # sorted by name, positive exponents

struct Poly
  terms::Dict{Mono,Rational{BigInt}}
end

Poly() = Poly(Dict{Mono,Rational{BigInt}}())
Poly(c::Union{Integer,Rational}) =
  iszero(c) ? Poly() : Poly(Dict{Mono,Rational{BigInt}}(Mono() => Rational{BigInt}(c)))
Poly(var::String) =
  Poly(Dict{Mono,Rational{BigInt}}(Mono([var => 1]) => Rational{BigInt}(1)))

Base.iszero(p::Poly) = isempty(p.terms)

function Base.:+(a::Poly, b::Poly)
  terms = copy(a.terms)
  for (mono, coeff) in b.terms
    new = get(terms, mono, Rational{BigInt}(0)) + coeff
    iszero(new) ? delete!(terms, mono) : (terms[mono] = new)
  end
  return Poly(terms)
end

Base.:-(a::Poly) = Poly(Dict(mono => -coeff for (mono, coeff) in a.terms))
Base.:-(a::Poly, b::Poly) = a + (-b)

function mono_mul(a::Mono, b::Mono)
  degrees = Dict{String,Int}(a)
  for (var, exp) in b
    degrees[var] = get(degrees, var, 0) + exp
  end
  return Mono(sort!([var => exp for (var, exp) in degrees]; by=first))
end

function Base.:*(a::Poly, b::Poly)
  terms = Dict{Mono,Rational{BigInt}}()
  for (mono_a, coeff_a) in a.terms, (mono_b, coeff_b) in b.terms
    mono = mono_mul(mono_a, mono_b)
    new = get(terms, mono, Rational{BigInt}(0)) + coeff_a * coeff_b
    iszero(new) ? delete!(terms, mono) : (terms[mono] = new)
  end
  return Poly(terms)
end

function Base.:^(a::Poly, n::Integer)
  n >= 0 || error("negative exponent")
  result = Poly(1)
  for _ in 1:n
    result = result * a
  end
  return result
end

# `q^2*i1*k1` before `i1*k1`, and `i1` before `k1`: highest total degree first,
# then lexicographic, so that the same polynomial always prints the same way.
function mono_order(mono::Mono)
  return (
    -sum(exp for (_, exp) in mono; init=0), join(["$var^$exp" for (var, exp) in mono])
  )
end

function render_mono(mono::Mono)
  return join([exp == 1 ? var : "$var^$exp" for (var, exp) in mono], "*")
end

function render(p::Poly)
  iszero(p) && return "0"
  out = IOBuffer()
  for (n, mono) in enumerate(sort!(collect(keys(p.terms)); by=mono_order))
    coeff = p.terms[mono]
    negative = coeff < 0
    magnitude = abs(coeff)
    print(out, n == 1 ? (negative ? "-" : "") : (negative ? " - " : " + "))
    text = if isone(denominator(magnitude))
      string(numerator(magnitude))
    else
      "$(numerator(magnitude))//$(denominator(magnitude))"
    end
    if isempty(mono)
      print(out, text)
    elseif isone(magnitude)
      print(out, render_mono(mono))
    else
      print(out, text, "*", render_mono(mono))
    end
  end
  return String(take!(out))
end

## Parse tree to Julia

# The roots of unity, as the modulus they belong to: `GEWZ1^e` is the e-th
# power of a primitive (q-1)-st root of unity.
const GEW_MODULUS = Dict(
  "GEWZ1" => "q - 1", "GEWY1" => "q + 1", "GEWZ2" => "q^2 - 1", "GEWY2" => "q^2 + 1",
  "GEWZ3" => "q^3 - 1", "GEWY3" => "q^3 + 1", "GEWZ4" => "q^4 - 1", "GEWY4" => "q^4 + 1",
  "GEWC3" => "q^2 + q + 1", "GEWC6" => "q^2 - q + 1", "GEWC12" => "q^4 - q^2 + 1",
  "GEW2Z1" => "2 * (q - 1)", "GEWZ1Y2" => "(q - 1) * (q^2 + 1)",
  "GEWZ1Y3" => "(q - 1) * (q^3 + 1)", "GEWY3Z1" => "(q - 1) * (q^3 + 1)",
  "GEWY1Z3" => "(q + 1) * (q^3 - 1)", "GEWZ3Y1" => "(q + 1) * (q^3 - 1)",
  "EW2" => "2", "EW3" => "3", "EW4" => "4",
)

# CHEVIE3 keeps the parameter of the series in `qQ` and lets `setCongruence`
# define `q` in terms of it; for a table without a congruence the two are the
# same name, and the sums of GU5 do use `qQ` in their bounds.
const UNRESTRICTED_Q = Ref(false)

# `iI3` is the third parameter of a class type, `kK3` that of a character type.
function julia_name(name::String)
  name == "q" && return "q"
  if name == "qQ"
    UNRESTRICTED_Q[] ||
      error("`qQ` is not `q` in a table with a congruence, so it needs a translation")
    return "q"
  end
  m = match(r"^([ik])\1*([0-9]+)$"i, name)
  m === nothing && error("unknown Maple name '$name'")
  return lowercase(m.captures[1]) * m.captures[2]
end

const PREC = Dict(:+ => 1, :- => 1, :* => 2, :/ => 2, :^ => 4)

# Prints an expression as Julia, keeping the factored form of the Maple source.
function julia_expr(e::MExpr, prec::Int=0)
  if e isa MNum
    return string(e.value)
  elseif e isa MName
    return julia_name(e.name)
  elseif e isa MNeg
    text = "-" * julia_expr(e.arg, 3)
    return prec > 2 ? "($text)" : text
  elseif e isa MBin
    if e.op === :/  # there are no polynomial denominators outside of exceptions
      denominator = julia_expr(e.right, 5)
      text = julia_expr(e.left, 2) * " * 1//" * denominator
      return prec > 2 ? "($text)" : text
    end
    op = e.op === :^ ? "^" : " " * string(e.op) * " "
    own = PREC[e.op]
    text = julia_expr(e.left, own) * op * julia_expr(e.right, own + 1)
    return prec > own ? "($text)" : text
  end
  return error("cannot print $(typeof(e)) as a Julia expression")
end

function normalize(e::MExpr)
  if e isa MNum
    return Poly(e.value)
  elseif e isa MName
    return Poly(julia_name(e.name))
  elseif e isa MNeg
    return -normalize(e.arg)
  elseif e isa MBin
    if e.op === :+
      return normalize(e.left) + normalize(e.right)
    elseif e.op === :-
      return normalize(e.left) - normalize(e.right)
    elseif e.op === :*
      return normalize(e.left) * normalize(e.right)
    elseif e.op === :^
      e.right isa MNum || error("non-constant exponent")
      return normalize(e.left)^Int(e.right.value)
    elseif e.op === :/
      divisor = normalize(e.right)
      length(divisor.terms) == 1 && haskey(divisor.terms, Mono()) ||
        error("cannot divide by $(render(divisor))")
      return normalize(e.left) * Poly(1//divisor.terms[Mono()])
    end
  end
  return error("cannot normalize $(typeof(e))")
end

# A Maple rational, for the scalar in front of a sum.
function julia_scalar(e::MExpr)
  p = normalize(e)
  iszero(p) && return "0"
  length(p.terms) == 1 && haskey(p.terms, Mono()) || error("not a scalar: $(render(p))")
  return render(p)
end

## Provenance
#
# Where the characters of a series were determined in the literature. The
# Maple sources name no references of their own, while the tables in `data`
# carry one, so the generated tables get these.
const REFERENCES = Dict(
  "GL4" => "- The table was first computed in [Ste51](@cite).",
  "GL5" => "- The characters of \$\\mathrm{GL}_n(q)\$ were determined in [Gre55](@cite).",
  "GL6" => "- The characters of \$\\mathrm{GL}_n(q)\$ were determined in [Gre55](@cite).",
  "GU4" => "- The table was first computed in [Noz72](@cite).",
  "GU5" => "- The table was first computed in [Noz76](@cite).",
  "GU6" => "- The characters of \$\\mathrm{GU}_n(q)\$ were determined in [LS77](@cite).",
)

# Anything else worth saying about a single table.
const NOTES = Dict(
  "GU6" =>
    "- The class types 66, 67 and 98 to 101 are numbered differently here\n" *
    "  than in `uniGU6`, which lists the two components of their Levi\n" *
    "  subgroup the other way round. The tables correspond under\n" *
    "  66 <-> 67, 98 <-> 100 and 99 <-> 101; under that correspondence\n" *
    "  all 112 class lengths and all unipotent character values agree.",
)

## Character values

# One summand of a table entry: a coefficient times a power of a root of unity.
struct Term
  modulus::Union{String,Nothing}  # which root of unity, or nothing for a plain polynomial
  exponent::Poly
  coefficient::Poly
end

function summands(e::MExpr, sign::Int=1)
  if e isa MBin && e.op === :+
    return vcat(summands(e.left, sign), summands(e.right, sign))
  elseif e isa MBin && e.op === :-
    return vcat(summands(e.left, sign), summands(e.right, -sign))
  elseif e isa MNeg
    return summands(e.arg, -sign)
  end
  return [(sign, e)]
end

function factors(e::MExpr)
  if e isa MBin && e.op === :*
    return vcat(factors(e.left), factors(e.right))
  elseif e isa MNeg  # `-GEWZ1^e*q^2` parses as `(-GEWZ1^e)*q^2`
    return vcat(MExpr[MNum(-1)], factors(e.arg))
  end
  return MExpr[e]
end

is_gew(e::MExpr) = e isa MName && haskey(GEW_MODULUS, e.name)
is_exponential(e::MExpr) = e isa MName && e.name == "EE"

# Where it has no GEW symbol for a root of unity -- for a primitive (q^5-1)-st
# one, say -- CHEVIE3 writes it out as `EE^(2*I*Pi*e/m)`.
function exponential(argument::MExpr)
  argument isa MBin && argument.op === :/ ||
    error("exponential without a modulus: $(argument)")
  modulus = julia_expr(argument.right)
  rest = MExpr[]
  two = false
  imaginary = false
  pi = false
  for factor in factors(argument.left)
    if !two && factor isa MNum && factor.value == 2
      two = true
    elseif !imaginary && factor isa MName && factor.name == "I"
      imaginary = true
    elseif !pi && factor isa MName && factor.name == "Pi"
      pi = true
    else
      push!(rest, factor)
    end
  end
  two && imaginary && pi || error("exponential without a 2*I*Pi factor")
  exponent = Poly(1)
  for factor in rest
    exponent = exponent * normalize(factor)
  end
  return modulus, exponent
end

function term(e::MExpr, sign::Int)
  modulus = nothing
  exponent = Poly(1)
  coefficient = Poly(sign)
  for factor in factors(e)
    power = factor isa MBin && factor.op === :^
    if is_gew(factor) || (power && is_gew(factor.left))
      modulus === nothing || error("two roots of unity in one summand")
      modulus = GEW_MODULUS[power ? factor.left.name : factor.name]
      power && (exponent = normalize(factor.right))
    elseif power && is_exponential(factor.left)
      modulus === nothing || error("two roots of unity in one summand")
      modulus, exponent = exponential(factor.right)
    else
      coefficient = coefficient * normalize(factor)
    end
  end
  return Term(modulus, exponent, coefficient)
end

# Groups the summands of a table entry by root of unity and exponent, adding up
# the coefficients. Entries like `GEWZ1^e + q*GEWZ1^e` have to be merged here:
# the generated `Dict` would otherwise keep only one of the two.
function julia_value(e::MExpr)
  groups = Dict{String,Vector{Pair{String,Poly}}}()  # modulus -> exponent => coefficient
  order = String[]  # the groups, in the order they first show up
  for (sign, summand) in summands(e)
    t = term(summand, sign)
    key = t.modulus === nothing ? "" : t.modulus
    if !haskey(groups, key)
      groups[key] = Pair{String,Poly}[]
      push!(order, key)
    end
    exponent = render(t.exponent)
    index = findfirst(p -> first(p) == exponent, groups[key])
    if index === nothing
      push!(groups[key], exponent => t.coefficient)
    else
      groups[key][index] = exponent => (last(groups[key][index]) + t.coefficient)
    end
  end
  parts = String[]
  for key in order
    entries = [
      (exponent, coefficient) for (exponent, coefficient) in groups[key]
      if !iszero(coefficient)
    ]
    isempty(entries) && continue
    if key == ""  # no root of unity, so a plain polynomial
      for (_, coefficient) in entries
        push!(parts, "S(" * render(coefficient) * ")")
      end
    else
      pairs = [
        "R($exponent)//R($key) => R($(render(coefficient)))"
        for (exponent, coefficient) in entries
      ]
      push!(parts, "S(Dict(" * join(pairs, ", ") * "), simplify=false)")
    end
  end
  isempty(parts) && return "S(0)"
  return join(parts, " + ")
end

## Class and character info

function julia_info(e::MExpr)
  if e isa MStr
    return "\"" * escape_string(e.text) * "\""
  elseif e isa MList
    return "[" * join(julia_info.(e.items), ", ") * "]"
  elseif e isa MNum
    return string(e.value)
  end
  return julia_expr(e)
end

## Parameters

# `[[iI1 = 1 .. q-1, iI2 = 1 .. q-1], [[[1, -1, q-1]]]]`: two parameters, which
# must not be congruent modulo q-1.
function julia_parameters(e::MExpr)
  ranges, exceptions = e.items
  names = String[]
  parts = String[]
  for range in ranges.items
    range isa MEq && range.rhs isa MRange || error("malformed parameter range")
    name = julia_name(range.lhs.name)
    push!(names, name)
    push!(parts, "Parameter($name, $(julia_expr(range.rhs.to)))")
  end
  forbidden = String[]
  for exception in exceptions.items
    conditions = exception.items
    length(conditions) == 1 ||
      error(
        "$(length(conditions)) simultaneous conditions in one exception, " *
        "which Parameters cannot express",
      )
    entries = conditions[1].items
    length(entries) == length(names) + 1 ||
      error("exception with $(length(entries)) entries for $(length(names)) parameters")
    terms = String[]
    for (name, coefficient) in zip(names, entries[1:(end - 1)])
      p = normalize(coefficient)
      iszero(p) && continue
      push!(terms, render(p * Poly(name)))
    end
    numerator = join(terms, " + ")
    numerator = replace(numerator, "+ -" => "- ")
    push!(forbidden, "(($numerator) * 1//($(julia_expr(entries[end]))))")
  end
  isempty(forbidden) && return "Parameters([" * join(parts, ", ") * "])"
  return "Parameters([" * join(parts, ", ") * "], [" * join(forbidden, ", ") * "])"
end

## Sums

# Translates the body of a `CenterSums` procedure. `dicts` maps the Maple name
# of a center sum table to the name of the generated Julia dictionary.
function julia_sum_expr(e::MExpr, dicts::Dict{String,String})
  if e isa MName
    return e.name == "tt" ? "tt" : e.name
  elseif e isa MNum
    return string(e.value)
  elseif e isa MCall && e.head isa MName
    name = e.head.name
    if name == "nesum"
      value, range = e.args
      range isa MEq && range.rhs isa MRange || error("malformed summation range")
      return "nesum($(julia_sum_expr(value, dicts)), $(julia_name(range.lhs.name)), " *
             "$(julia_expr(range.rhs.from)), $(julia_expr(range.rhs.to)))"
    elseif name == "eesubs"
      value = e.args[end]
      vars = String[]
      vals = String[]
      for substitution in e.args[1:(end - 1)]
        substitution isa MEq || error("malformed substitution")
        push!(vars, julia_name(substitution.lhs.name))
        push!(vals, julia_expr(substitution.rhs))
      end
      return "evaluate($(julia_sum_expr(value, dicts)), [" * join(vars, ", ") * "], [" *
             join(vals, ", ") * "])"
    elseif name == "linkomb"
      parts = String[]
      for n in 1:2:length(e.args)
        coefficient = julia_scalar(e.args[n])
        summand = julia_sum_expr(e.args[n + 1], dicts)
        if coefficient == "1"
          push!(parts, (isempty(parts) ? "" : " + ") * summand)
        elseif coefficient == "-1"
          push!(parts, (isempty(parts) ? "-" : " - ") * summand)
        else
          sign = if startswith(coefficient, "-")
            (isempty(parts) ? "" : " ")
          else
            (isempty(parts) ? "" : " + ")
          end
          push!(parts, sign * coefficient * " * " * summand)
        end
      end
      return join(parts)
    elseif name == "smalqscew"
      scalar = julia_scalar(e.args[1])
      value = julia_sum_expr(e.args[2], dicts)
      return scalar == "1" ? value : "$scalar * $value"
    end
  elseif e isa MCall && e.head isa MIndex && e.head.head isa MName
    dict = get(dicts, e.head.head.name, nothing)
    dict === nothing && error("call to unknown table $(e.head.head.name)")
    key = join([string(index.value) for index in e.head.args], ", ")
    return "$dict[($key)]($(julia_sum_expr(e.args[1], dicts)))"
  end
  return julia_expr(e)
end

function julia_proc(p::MProc, dicts::Dict{String,String}; indent::String="  ")
  lines = String[]
  for (n, statement) in enumerate(p.body)
    text = julia_sum_expr(statement.value, dicts)
    if statement.target === nothing
      n == length(p.body) || error("a bare expression in the middle of a procedure")
      push!(lines, indent * text)
    else
      push!(lines, indent * statement.target.name * " = " * text)
    end
  end
  return lines
end

## The table

struct Conversion
  name::String  # GL4
  id::String  # A3002
  statements::Vector{MStmt}
  table::MCall
  nchars::Int
  nclasses::Int
end

function assignment(statements::Vector{MStmt}, name::String)
  for s in statements
    s.target isa MName && s.target.name == name && return s.value
  end
  return nothing
end

function indexed_assignments(statements::Vector{MStmt}, name::String)
  out = Pair{Vector{Int},MProc}[]
  for s in statements
    s.target isa MIndex || continue
    s.target.head isa MName && s.target.head.name == name || continue
    push!(out, [Int(index.value) for index in s.target.args] => s.value)
  end
  return out
end

function convert_table(path::AbstractString)
  statements = parse_maple_file(path)
  table = nothing
  name = ""
  for s in statements
    if s.target isa MName && s.value isa MCall && s.value.head isa MName &&
      s.value.head.name == "array" && !endswith(s.target.name, "Parameter")
      name = s.target.name
      table = s.value
      break
    end
  end
  table === nothing && error("no table found in $path")
  header = table.args[3].items[1].items
  id = header[2].text
  nchars = Int(header[4].value)
  nclasses = Int(header[5].value)
  return Conversion(name, id, statements, table, nchars, nclasses)
end

function congruence_of(c::Conversion)
  proc = assignment(c.statements, "setCongruence$(c.id)")
  proc isa MProc || return nothing
  for statement in proc.body
    statement.target isa MName && statement.target.name == "q" || continue
    value = statement.value
    value isa MName && continue  # `q := qQ`, so no congruence
    p = normalize(replace_name(value, "qQ", "q"))
    modulus = get(p.terms, Mono(["q" => 1]), 0)
    shift = get(p.terms, Mono(), 0)
    return (Int(numerator(shift)), Int(numerator(modulus)))
  end
  return nothing
end

function emit(c::Conversion, io::IO)
  congruence = congruence_of(c)
  UNRESTRICTED_Q[] = congruence === nothing
  rows = c.table.args[3].items
  length(rows) == c.nchars + 3 ||
    error("expected $(c.nchars + 3) rows, got $(length(rows))")
  classinfo = rows[2].items[3:(2 + c.nclasses)]
  classlength = rows[3].items[3:(2 + c.nclasses)]
  charrows = rows[4:end]

  classparams = assignment(c.statements, "Klassen$(c.name)Parameter")
  charparams = assignment(c.statements, "Char$(c.name)Parameter")
  (classparams === nothing || charparams === nothing) && error("missing parameter arrays")
  # The parameter arrays are sparse tables `(n) = ...`, and also carry entries
  # for the info and length rows, which are of no interest here.
  function parameter_entries(array::MCall, count::Int)
    out = Dict{Int,MExpr}()
    for entry in array.args[2].items
      entry isa MEq && entry.lhs isa MNum || continue
      index = Int(entry.lhs.value)
      1 <= index <= count && (out[index] = entry.rhs)
    end
    length(out) == count || error("$(length(out)) parameter entries for $count types")
    return [out[n] for n in 1:count]
  end
  classparams = parameter_entries(classparams, c.nclasses)
  charparams = parameter_entries(charparams, c.nchars)

  # The parameters in use, as `i1, ..., in` and `k1, ..., kn`.
  function parameter_names(entries::Vector{<:MExpr})
    names = String[]
    for entry in entries, range in entry.items[1].items
      name = julia_name(range.lhs.name)
      name in names || push!(names, name)
    end
    return sort!(names)
  end
  class_names = parameter_names(classparams)
  char_names = parameter_names(charparams)
  names = vcat(class_names, char_names)

  dicts = Dict("CenterSums$(c.id)" => "class_center_sums",
    "CenterSumsDual$(c.id)" => "char_center_sums")

  information = assignment(c.statements, "Information$(c.id)")
  lines = information === nothing ? String[] : [line.text for line in information.args]

  ## Header
  println(io, "# Converted from the CHEVIE3 Maple table `$(c.name)` ($(c.id))")
  println(io, "# by extra/Convert/MapleTable.jl.")
  println(io, "using ..GenericCharacterTables")
  println(io, "import ..GenericCharacterTables:")
  println(io, "  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum")
  println(io, "using ..GenericCharacterTables.Oscar")
  if congruence === nothing
    println(io, "S, E, q = generic_cyclotomic_ring()")
  else
    println(io, "S, E, q = generic_cyclotomic_ring(; congruence=ZZ.($(congruence)))")
  end
  println(io, "R = base_ring(S)")
  batches = vcat(
    [[name * suffix for name in names] for suffix in ["", "1", "2", "3", "t1", "t2"]]...
  )
  println(io, join(names, ", "), ", _... = params(")
  println(io, "  S,")
  println(io, "  [")
  for name in batches
    println(io, "    \"$name\",")
  end
  println(io, "  ],")
  println(io, ")")
  println(io)

  ## The table
  println(io, "order = ", julia_expr(c.table.args[3].items[1].items[3]))
  # One vector per character type. A single matrix literal of all the values
  # overflows the stack of the Julia parser for the larger tables.
  println(io, "chars = Vector{GenericCyclo}[]")
  for row in charrows
    println(io, "push!(chars, GenericCyclo[")
    for value in row.items[3:(2 + c.nclasses)]
      println(io, "  ", julia_value(value), ",")
    end
    println(io, "])")
  end
  println(io, "table = reduce(hcat, chars)")

  println(io, "classinfo = Vector{Any}[")
  for info in classinfo
    println(io, "  ", julia_info(info), ",")
  end
  println(io, "]")
  println(io, "classlength = R.([")
  for length in classlength
    println(io, "  ", julia_expr(length), ",")
  end
  println(io, "])")

  println(io, "charinfo = Vector{Any}[")
  for row in charrows
    println(io, "  ", julia_info(row.items[1]), ",")
  end
  println(io, "]")
  println(io, "chardegree = R.([")
  for row in charrows
    println(io, "  ", julia_expr(row.items[2]), ",")
  end
  println(io, "])")
  println(io)

  ## Sums
  println(io, "# The sums over a class or character type are built from sums over the")
  println(io, "# centralizer types of the Maple source, which call each other.")
  for (maple, dict) in ["CenterSums$(c.id)" => "class_center_sums",
    "CenterSumsDual$(c.id)" => "char_center_sums"]
    println(io, "$dict = Dict{Tuple{Int,Int,Int},Function}()")
    for (key, proc) in indexed_assignments(c.statements, maple)
      println(
        io,
        "$dict[($(join(key, ", ")))] = function (tt::Union{GenericCyclo,GenericCycloFrac})",
      )
      for line in julia_proc(proc, dicts)
        println(io, line)
      end
      println(io, "end")
    end
    println(io)
  end

  for (prefix, field, count) in [("Klassen", "classsums", c.nclasses),
    ("Char", "charsums", c.nchars)]
    println(io, "$field = Function[")
    for n in 1:count
      proc = assignment(c.statements, "$prefix$(c.id)Summe$n")
      proc === nothing && error("missing $prefix$(c.id)Summe$n")
      println(io, "  function (tt::Union{GenericCyclo,GenericCycloFrac})")
      for line in julia_proc(proc, dicts; indent="    ")
        println(io, line)
      end
      println(io, "  end,")
    end
    println(io, "]")
    println(io)
  end

  ## Parameters
  for (field, entries) in ["classparams" => classparams, "charparams" => charparams]
    println(io, "$field = [")
    for entry in entries
      println(io, "  ", julia_parameters(entry), ",")
    end
    println(io, "]")
    println(io)
  end
  println(io, "classparamindex = var_index.([", join(class_names, ", "), "])")
  println(io, "charparamindex = var_index.([", join(char_names, ", "), "])")
  println(io)

  ## Information
  group = replace(c.name, r"^([A-Z]+)(\d+)$" => s"\\mathrm{\1}_\2")
  println(io, "information = raw\"\"\"The generic character table of \$$group(q)\$.")
  for extra in (REFERENCES, NOTES)
    if haskey(extra, c.name)
      println(io)
      println(io, extra[c.name])
    end
  end
  println(io)
  for line in lines
    println(io, rstrip(line))
  end
  println(io, "\"\"\"")
  println(io)
  println(
    io,
    "TABLE = CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,",
  )
  println(
    io,
    "  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,",
  )
  println(io, "  information, splitext(basename(@__FILE__))[1])")
  return nothing
end

function replace_name(e::MExpr, from::String, to::String)
  if e isa MName
    return e.name == from ? MName(to) : e
  elseif e isa MBin
    return MBin(e.op, replace_name(e.left, from, to), replace_name(e.right, from, to))
  elseif e isa MNeg
    return MNeg(replace_name(e.arg, from, to))
  end
  return e
end

function convert_maple_table(source::AbstractString, destination::AbstractString)
  c = convert_table(source)
  open(destination, "w") do io
    emit(c, io)
  end
  println(
    "$(c.name): $(c.nchars) character types, $(c.nclasses) class types -> $destination"
  )
  return nothing
end

if abspath(PROGRAM_FILE) == @__FILE__
  length(ARGS) == 2 || error("usage: julia MapleTable.jl <maple file> <output .jl file>")
  convert_maple_table(ARGS[1], ARGS[2])
end

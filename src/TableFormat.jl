# Reader for tables stored as TOML data instead of Julia code.
#
# Polynomials, values and exceptions are strings in a small expression
# language, parsed by `ExprReader` below. Class and character sums are short
# programs in a subset of Julia syntax, run by `run_sum`. Nothing is passed to
# `eval`, so loading a table neither lowers code nor advances the world age.
#
# A table file is a TOML document:
#
#   format = 1
#   kind = "CharTable"
#   order = "<polynomial>"
#   congruence = [a, m]            # optional: q^power is a modulo m
#   power = 1                      # optional
#   variable = "q"                 # optional
#   classparams = ["i", "j"]       # the copies i1, ..., jt2 used by the shift
#   charparams = ["l", "k"]        #   functions are added by the reader
#   information = '''<markdown>'''
#
#   [class_helpers]                # optional: sums the class sums call by name
#   <name> = '''<sum>'''
#   [char_helpers]                 # optional: likewise for character sums
#
#   [[classtypes]]                 # one per class type, in order
#   info = [...]                   # any TOML array; { poly = "..." } is a polynomial
#   length = "<polynomial>"
#   params = [["i", "<modulus>"], ...]
#   exceptions = ["<fraction>", ...]  # optional
#   sum = '''<sum>'''
#
#   [[chartypes]]                  # one per character type, in order
#   info, degree, params, exceptions and sum as for class types
#   values = ["<value>", ...]      # one per class type

const TABLE_FORMAT_VERSION = 1

# Suffixes of the copies of the parameters the shift functions rely on, see
# `shift_class_parameters`.
const PARAMETER_SUFFIXES = ["1", "2", "3", "t1", "t2"]

#
# Expressions
#
# Grammar, with Julia's precedences:
#
#   sum     := ["+" | "-"] product (("+" | "-") product)*
#   product := frac ("*" ["-"] frac)*
#   frac    := power ("//" power)*
#   power   := atom ["^" atom]
#   atom    := integer | name | "E(" sum ")" | "(" sum ")"
#
# `E(d)^(n)` is the root of unity exp(2πi n/d); a sum of polynomial multiples
# of such roots is a value. `a//b` is a rational number for integers and an
# unreduced fraction for polynomials, so that exponents and exceptions come
# back exactly as written.

# A generic root of unity `E(d)` before its exponent has been read.
struct RootOfUnity
  order::UPoly
end

# A sum of roots of unity with polynomial coefficients. The terms keep the
# order of the file: a `Dict` built from them in that order iterates like the
# one the file was written from, and the iteration order shows when a value
# is printed.
struct RootSum
  terms::Vector{Pair{UPolyFrac,UPoly}}
end

mutable struct ExprReader
  s::Vector{UInt8}
  pos::Int
  R::UPolyRing
  K::UPolyFracRing
  vars::Dict{String,UPoly}
end

function ExprReader(R::UPolyRing, vars::Dict{String,UPoly})
  return ExprReader(UInt8[], 1, R, fraction_field(R), vars)
end

function read_expression(r::ExprReader, s::AbstractString)
  r.s = codeunits(s)
  r.pos = 1
  x = read_sum!(r)
  skip_space!(r)
  r.pos <= length(r.s) && expression_error(r, "unexpected character")
  return x
end

function expression_error(r::ExprReader, msg::String)
  error("$msg at position $(r.pos) in \"$(String(copy(r.s)))\"")
end

function skip_space!(r::ExprReader)
  while r.pos <= length(r.s) && r.s[r.pos] in (UInt8(' '), UInt8('\t'), UInt8('\n'))
    r.pos += 1
  end
end

function peek_byte(r::ExprReader)
  skip_space!(r)
  return r.pos <= length(r.s) ? r.s[r.pos] : 0x00
end

function expect_byte!(r::ExprReader, c::Char)
  peek_byte(r) == UInt8(c) || expression_error(r, "expected '$c'")
  r.pos += 1
end

function read_sum!(r::ExprReader)
  c = peek_byte(r)
  negate = c == UInt8('-')
  (negate || c == UInt8('+')) && (r.pos += 1)
  x = read_product!(r)
  negate && (x = expr_neg(x))
  while true
    c = peek_byte(r)
    if c == UInt8('+')
      r.pos += 1
      x = expr_add(r, x, read_product!(r))
    elseif c == UInt8('-')
      r.pos += 1
      x = expr_add(r, x, expr_neg(read_product!(r)))
    else
      return x
    end
  end
end

function read_product!(r::ExprReader)
  x = read_frac!(r)
  while peek_byte(r) == UInt8('*')
    r.pos += 1
    if peek_byte(r) == UInt8('-')
      r.pos += 1
      x = expr_mul(x, expr_neg(read_frac!(r)))
    else
      x = expr_mul(x, read_frac!(r))
    end
  end
  return x
end

function read_frac!(r::ExprReader)
  x = read_power!(r)
  while peek_byte(r) == UInt8('/')
    r.pos + 1 <= length(r.s) && r.s[r.pos + 1] == UInt8('/') ||
      expression_error(r, "expected '//'")
    r.pos += 2
    x = expr_frac(r, x, read_power!(r))
  end
  return x
end

function read_power!(r::ExprReader)
  x = read_atom!(r)
  peek_byte(r) == UInt8('^') || return x
  r.pos += 1
  e = read_atom!(r)
  if x isa RootOfUnity
    return RootSum([r.K(r.R(e), x.order) => one(r.R)])
  end
  e isa Integer || expression_error(r, "exponent must be an integer")
  return x^e
end

function read_atom!(r::ExprReader)
  c = peek_byte(r)
  if c == UInt8('(')
    r.pos += 1
    x = read_sum!(r)
    expect_byte!(r, ')')
    return x
  elseif UInt8('0') <= c <= UInt8('9')
    start = r.pos
    while r.pos <= length(r.s) && UInt8('0') <= r.s[r.pos] <= UInt8('9')
      r.pos += 1
    end
    digits = String(r.s[start:(r.pos - 1)])
    n = tryparse(Int, digits)
    return n === nothing ? parse(BigInt, digits) : n
  elseif is_name_start(c)
    start = r.pos
    while r.pos <= length(r.s) && is_name_char(r.s[r.pos])
      r.pos += 1
    end
    name = String(r.s[start:(r.pos - 1)])
    if name == "E" && peek_byte(r) == UInt8('(')
      r.pos += 1
      d = read_sum!(r)
      expect_byte!(r, ')')
      return RootOfUnity(r.R(d))
    end
    x = get(r.vars, name, nothing)
    x === nothing && expression_error(r, "unknown name '$name'")
    return x
  end
  expression_error(r, "unexpected character")
end

is_name_start(c::UInt8) =
  UInt8('a') <= c <= UInt8('z') || UInt8('A') <= c <= UInt8('Z') || c == UInt8('_')
is_name_char(c::UInt8) = is_name_start(c) || UInt8('0') <= c <= UInt8('9')

const PolyLike = Union{Integer,Rational,UPoly}
const RootLike = Union{RootOfUnity,RootSum}

# Arithmetic on polynomials and fractions is Julia's; only sums of roots of
# unity are kept apart, so that their terms are not simplified.
expr_neg(x) = -x
expr_neg(x::RootLike) = RootSum([k => -c for (k, c) in root_sum(x).terms])

expr_add(r::ExprReader, x, y) = x + y
expr_add(r::ExprReader, x::RootLike, y) = join_roots(root_sum(x), root_sum(r, y))
expr_add(r::ExprReader, x, y::RootLike) = join_roots(root_sum(r, x), root_sum(y))
expr_add(r::ExprReader, x::RootLike, y::RootLike) = join_roots(root_sum(x), root_sum(y))
join_roots(x::RootSum, y::RootSum) = RootSum(vcat(x.terms, y.terms))

expr_mul(x, y) = x * y
expr_mul(x::PolyLike, y::RootLike) = expr_mul(y, x)
expr_mul(x::RootLike, y::PolyLike) = RootSum([k => c * y for (k, c) in root_sum(x).terms])

function expr_frac(r::ExprReader, x, y)
  x isa Integer && y isa Integer && return x//y
  return r.K(r.R(x), r.R(y))
end

root_sum(x::RootSum) = x
root_sum(x::RootOfUnity) =
  RootSum([fraction_field(parent(x.order))(one(x.order), x.order) => one(x.order)])
root_sum(r::ExprReader, x::RootLike) = root_sum(x)
root_sum(r::ExprReader, x::PolyLike) = RootSum([r.K(zero(r.R), one(r.R)) => r.R(x)])

function read_poly(r::ExprReader, s::AbstractString)
  x = read_expression(r, s)
  x isa PolyLike || error("expected a polynomial: \"$s\"")
  return r.R(x)
end

function read_fraction(r::ExprReader, s::AbstractString)
  x = read_expression(r, s)
  x isa UPolyFrac && return x
  x isa PolyLike || error("expected a fraction: \"$s\"")
  return r.K(r.R(x), one(r.R))
end

function read_value(r::ExprReader, S::GenericCycloRing, s::AbstractString)
  x = read_expression(r, s)
  x isa PolyLike && iszero(x) && return S()
  x isa Union{PolyLike,RootLike} || error("expected a value: \"$s\"")
  terms = root_sum(r, x).terms
  f = Dict{UPolyFrac,UPoly}(terms)
  length(f) == length(terms) || error("repeated root of unity in \"$s\"")
  return S(f; simplify=false)
end

#
# Sums
#
# A sum is a sequence of statements `name = expression`, followed by the
# expression giving the result. The argument is `tt`. Expressions are
# Julia's arithmetic, `nesum`, `evaluate`, vectors, `R.(v)` and calls of the
# table's helper sums by name.

const SUM_OPERATORS = Dict{Symbol,Function}(:+ => +, :- => -, :* => *, :// => //, :^ => ^)

struct SumContext
  R::UPolyRing
  vars::Dict{Symbol,UPoly}
  helpers::Dict{Symbol,Vector{Any}}
end

function parse_sum(text::AbstractString)
  ex = Meta.parseall(text)
  body = Any[e for e in ex.args if !(e isa LineNumberNode)]
  isempty(body) && error("empty sum")
  return body
end

function check_sum(ctx::SumContext, body::Vector{Any}, where::String)
  locals = Set{Symbol}([:tt])
  for (n, stmt) in enumerate(body)
    if stmt isa Expr && stmt.head == :(=)
      n < length(body) || error("$where: the last statement must be an expression")
      lhs = stmt.args[1]
      lhs isa Symbol || error("$where: cannot assign to $lhs")
      check_sum_expr(ctx, locals, stmt.args[2], where)
      push!(locals, lhs)
    else
      check_sum_expr(ctx, locals, stmt, where)
    end
  end
end

function check_sum_expr(ctx::SumContext, locals::Set{Symbol}, ex, where::String)
  ex isa Integer && return nothing
  if ex isa Symbol
    ex in locals || haskey(ctx.vars, ex) || error("$where: unknown name $ex")
    return nothing
  end
  ex isa Expr || error("$where: unsupported literal $ex")
  if ex.head == :call
    f = ex.args[1]
    f in (:nesum, :evaluate) || haskey(SUM_OPERATORS, f) || haskey(ctx.helpers, f) ||
      error("$where: unknown function $f")
    haskey(ctx.helpers, f) && length(ex.args) != 2 &&
      error("$where: $f takes one argument")
  elseif ex.head == :. && ex.args[1] == :R
    # R.(v)
  elseif ex.head != :vect
    error("$where: unsupported expression $ex")
  end
  args = ex.head == :call ? ex.args[2:end] : ex.head == :. ? ex.args[2].args : ex.args
  foreach(a -> check_sum_expr(ctx, locals, a, where), args)
end

function run_sum(
  ctx::SumContext, body::Vector{Any}, tt::Union{GenericCyclo,GenericCycloFrac}
)
  env = Dict{Symbol,Any}(:tt => tt)
  for stmt in body
    if stmt isa Expr && stmt.head == :(=)
      env[stmt.args[1]] = eval_sum_expr(ctx, env, stmt.args[2])
    else
      return eval_sum_expr(ctx, env, stmt)::Union{GenericCyclo,GenericCycloFrac}
    end
  end
end

function eval_sum_expr(ctx::SumContext, env::Dict{Symbol,Any}, ex)
  ex isa Integer && return ex
  ex isa Symbol && return haskey(env, ex) ? env[ex] : ctx.vars[ex]
  if ex.head == :call
    f = ex.args[1]
    args = Any[eval_sum_expr(ctx, env, a) for a in Iterators.drop(ex.args, 1)]
    f == :nesum && return nesum(args...)
    f == :evaluate && return evaluate(args...)
    op = get(SUM_OPERATORS, f, nothing)
    op === nothing || return op(args...)
    return run_sum(ctx, ctx.helpers[f], args...)
  elseif ex.head == :vect
    return Base.vect((eval_sum_expr(ctx, env, a) for a in ex.args)...)
  elseif ex.head == :.
    return ctx.R.(eval_sum_expr(ctx, env, ex.args[2].args[1]))
  end
  error("unsupported expression $ex")
end

#
# Tables
#

# TOML arrays come back as `Vector{Any}`; `Base.vect` gives them the element
# type a Julia array literal of the same entries would have. A polynomial is
# written as `{ poly = "..." }`.
function read_info(r::ExprReader, x)
  x isa Vector && return Base.vect((read_info(r, y) for y in x)...)
  x isa AbstractDict && return read_poly(r, x["poly"])
  return x
end

function read_parameters(r::ExprReader, d::AbstractDict)
  params = Parameter[Parameter(r.vars[v], read_poly(r, m)) for (v, m) in d["params"]]
  exceptions = UPolyFrac[read_fraction(r, e) for e in get(d, "exceptions", String[])]
  return Parameters(params, exceptions)
end

@doc raw"""
    load_table_data(path::String)

Return the generic character table stored as TOML data in the file `path`.
"""
function load_table_data(path::String)
  d = TOML.parsefile(path)
  get(d, "format", 0) == TABLE_FORMAT_VERSION ||
    error("$path: unsupported table format $(get(d, "format", nothing))")
  get(d, "kind", "") == "CharTable" || error("$path: only CharTable is supported")

  congruence = haskey(d, "congruence") ? Tuple(ZZ.(d["congruence"])) : nothing
  S, _, q = generic_cyclotomic_ring(;
    congruence, variable=Symbol(get(d, "variable", "q")), power=get(d, "power", 1)
  )
  R = base_ring(S)

  classparams = Vector{String}(d["classparams"])
  charparams = Vector{String}(d["charparams"])
  base = vcat(classparams, charparams)
  names = vcat(base, [n * s for s in PARAMETER_SUFFIXES for n in base])
  gens = isempty(names) ? UPoly[] : params(S, names)
  vars = Dict{String,UPoly}(string(q) => q)
  for (n, x) in zip(names, gens)
    vars[n] = x
  end
  r = ExprReader(R, vars)

  classtypes = d["classtypes"]
  chartypes = d["chartypes"]
  m = length(chartypes)
  n = length(classtypes)
  table = Matrix{GenericCyclo}(undef, m, n)
  for (i, c) in enumerate(chartypes)
    values = c["values"]
    length(values) == n || error("$path: character type $i has $(length(values)) values")
    for (j, v) in enumerate(values)
      table[i, j] = read_value(r, S, v)
    end
  end

  symvars = Dict{Symbol,UPoly}(Symbol(k) => v for (k, v) in vars)
  function sum_context(key::String)
    helpers = Dict{Symbol,Vector{Any}}(Symbol(k) => parse_sum(v) for (k, v) in get(d, key, Dict()))
    ctx = SumContext(R, symvars, helpers)
    foreach(((k, body),) -> check_sum(ctx, body, "$path: $key.$k"), helpers)
    return ctx
  end
  class_ctx = sum_context("class_helpers")
  char_ctx = sum_context("char_helpers")
  function sum_function(ctx::SumContext, text::String, where::String)
    body = parse_sum(text)
    check_sum(ctx, body, where)
    return tt::Union{GenericCyclo,GenericCycloFrac} -> run_sum(ctx, body, tt)
  end
  classsums = Function[
    sum_function(class_ctx, c["sum"], "$path: class type $j") for (j, c) in enumerate(classtypes)
  ]
  charsums = Function[
    sum_function(char_ctx, c["sum"], "$path: character type $i") for (i, c) in enumerate(chartypes)
  ]

  return CharTable(
    read_poly(r, d["order"]),
    table,
    Vector{Any}[read_info(r, c["info"]) for c in classtypes],
    UPoly[read_poly(r, c["length"]) for c in classtypes],
    Vector{Any}[read_info(r, c["info"]) for c in chartypes],
    UPoly[read_poly(r, c["degree"]) for c in chartypes],
    classsums,
    charsums,
    Int64[var_index(vars[v]) for v in classparams],
    Int64[var_index(vars[v]) for v in charparams],
    Parameters[read_parameters(r, c) for c in classtypes],
    Parameters[read_parameters(r, c) for c in chartypes],
    S,
    d["information"],
    splitext(basename(path))[1],
  )
end

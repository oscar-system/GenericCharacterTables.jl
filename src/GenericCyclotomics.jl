@doc raw"""
    kempner_with_data(m::Int64)

Return the `m`-th Kempner number, the associated Kempner schemes and a factorization of `m`.

# Examples
```jldoctest
julia> kempner_with_data(12)
(4, Dict(2 => [1, 3], 3 => [1]), 2^2 * 3)

```
"""
function kempner_with_data(m::Int64)
  # factor m for later use
  factorization = factor(m)

  # compute m-th Kempner number by using the schemes introduced by Kempner
  # these schemes can later be reused to compute reductions of m
  schemes = Dict{Int64,Vector{Int64}}()
  for (p, a) in factorization
    multiple = p
    exponent = 1
    schemes[p] = Int64[exponent]
    while exponent < a
      multiple += p
      exponent += valuation(multiple, p)
      push!(schemes[p], exponent)
    end
  end
  if isone(m)
    K_m = 0
  else
    K_m = maximum((length(scheme) * p for (p, scheme) in schemes))
  end

  return (K_m, schemes, factorization)
end

@doc raw"""
    kempner(m::Int64)

Return the minimal non-negative integer `k` such that `k!` is a multiple of `m`. This is called the `m`-th Kempner number.
Details about the Kempner numbers and how to compute them can be found in [Kem21](@cite).

# Examples
```jldoctest
julia> kempner(12)
4

```
"""
kempner(m::Int64) = kempner_with_data(m)[1]

@doc raw"""
    normal_form(f::ZZUPoly, m::Int64)

Return a normal form of `f` modulo `m`, such that `normal_form(f,m)` is equal
to `normal_form(g,m)` if and only if `f` and `g` are congruent modulo `m`.

# Examples
```jldoctest
julia> R=universal_polynomial_ring(ZZ);

julia> x=gen(R, :x);

julia> normal_form(4*x^2,6)
x^2 + 3*x

julia> normal_form(4*x^2-(x^2+3*x),6)
0

julia> normal_form(4*x^9+x^7,12)
x^3 + 4*x

julia> normal_form(4*x^9+x^7-(x^3+4*x),12)
0

```
"""
function normal_form(f::ZZUPoly, m::Int64)
  if m < 1
    throw(DomainError(m, "A normal form for non-positive moduli is not defined!"))
  end
  R = parent(f)
  if is_constant(f)
    return R(mod(constant_coefficient(f), m))
  end
  # find the variable with highest index occurring in f
  i = findlast(x -> x > 0, degrees(f))
  x_i = R[i]

  # save Kempner schemes to be reused to compute reductions of m
  K_m, schemes, factorization = kempner_with_data(m)

  # reduce by the K(m)-th rising factorial of x_i
  S = rising_factorial(x_i, K_m)
  f = mod(f, S)

  for k in reverse(0:(K_m - 1))
    # compute the reduction of m by k by reusing the schemes
    reduction = 1
    for (p, scheme) in schemes
      q = div(k, p)
      if iszero(q)
        reduction *= p^factorization[p]
      elseif q <= length(scheme)
        exponent = factorization[p] - scheme[q]
        if exponent > 0
          reduction *= p^exponent
        end
      end
    end

    # reduce coefficient of x_i^k
    S_ik = rising_factorial(x_i, k)
    C_ik = coeff(f, [x_i], [k])
    c = normal_form(C_ik, reduction)
    f -= (C_ik - c) * S_ik
  end
  return f
end

strip_zeros!(f::Dict{UPolyFrac,UPoly}) = filter!(p -> !iszero(p.second), f)

# Data type and parent object methods

parent_type(::Type{GenericCyclo}) = GenericCycloRing

elem_type(::Type{GenericCycloRing}) = GenericCyclo

base_ring_type(::Type{GenericCycloRing}) = UPolyRing

base_ring(R::GenericCycloRing) = R.base_ring::base_ring_type(typeof(R))

parent(f::GenericCyclo) = f.parent

parent(E::GenericCycloRingGen) = E.parent

is_domain_type(::Type{GenericCyclo}) = false

is_exact_type(::Type{GenericCyclo}) = true

function hash(x::GenericCyclo, h::UInt)
  r = 0x65125ab8e0cd44ca  # TODO Use a different hash this is the one from AA's example.
  return xor(r, hash(x.f, h))
end

function deepcopy_internal(x::GenericCyclo, dict::IdDict)
  return GenericCyclo(deepcopy_internal(x.f, dict), parent(x))
end

# Basic manipulation

zero(R::GenericCycloRing) = R()

one(R::GenericCycloRing) = R(1)

iszero(x::GenericCyclo) = isempty(x.f)

isone(x::GenericCyclo) =
  isone(length(x.f)) && isone(get(x.f, base_ring(parent(x))(0)//base_ring(parent(x))(1), 0))  # TODO Is there a better way?

function is_unit(x::GenericCyclo) # TODO There could be more units than this.
  if isone(length(x.f))
    c = collect(x.f)[1][2]
    return is_unit(c)
  end
  return false
end

characteristic(R::GenericCycloRing) = characteristic(base_ring(R))

# Canonical unit

canonical_unit(x::GenericCyclo) = parent(x)(1)  # TODO We need to know more about the units to improve this.

# String I/O

function show(io::IO, ::MIME"text/plain", R::GenericCycloRing)
  io = pretty(io)
  println(io, "Generic cyclotomic ring", Indent())
  println(io, "over ", coefficient_ring(base_ring(R)))
  print(io, "dependent on ", join(gens(base_ring(R)), ", "))
  if R.congruence !== nothing
    q = gen(base_ring(R), 1)^R.power
    print(
      io,
      "\nwhere ",
      q,
      " is congruent to ",
      R.congruence[1],
      " modulo ",
      R.congruence[2],
    )
  end
end

function show(io::IO, R::GenericCycloRing)
  print(io, "Generic cyclotomic ring")
  if !is_terse(io)
    print(io, " over ", coefficient_ring(base_ring(R)))
  end
end

function show(io::IO, E::GenericCycloRingGen)
  print(io, "Generator of ", parent(E))
end

function expressify(x::GenericCyclo; context = nothing)
  symbol = parent(x).symbol
  sum = Expr(:call, :+)
  for (argument, modulus) in x.f
    modulus_expr = expressify(modulus; context)
    if iszero(argument)
      tmp = modulus_expr
    else
      num = numerator(argument)
      den = denominator(argument)
      d = lcm(denominator(num), denominator(den))
      num *= d
      den *= d
      exp_expr = Expr(:call, symbol, expressify(den; context))
      if !isone(num)
        exp_expr = Expr(:call, :^, exp_expr, expressify(num; context))
      end
      tmp = Expr(:call, :*, modulus_expr, exp_expr)
    end
    push!(sum.args, tmp)
  end
  return sum
end

@enable_all_show_via_expressify GenericCyclo

# Unary operations

function -(x::GenericCyclo)
  # The exponents are never mutated, so they can be shared; a deep copy would
  # also hash each of them again.
  f = copy(x.f)
  map!(-, values(f))
  return parent(x)(f; simplify=false)
end

function conj(x::GenericCyclo)
  f = Dict{UPolyFrac,UPoly}()
  for (key, value) in x.f
    f[negative_exponent!(parent(x), key)] = value
  end
  return parent(x)(f)
end

# Binary operations

function +(x::GenericCyclo, y::GenericCyclo)
  check_parent(x, y)
  f = mergewith(+, x.f, y.f)
  strip_zeros!(f)
  return parent(x)(f)
end

-(x::GenericCyclo, y::GenericCyclo) = x + (-y)  # TODO make this more efficient?

function *(x::GenericCyclo, y::GenericCyclo)
  check_parent(x, y)
  R = parent(x)
  y_summands = [(exponent_entry!(R, key).exponent, value) for (key, value) in y.f]
  f = Summands()
  for (key1, value1) in x.f
    data = exponent_entry!(R, key1)
    for (key2, value2) in y_summands
      add_summand!(f, exponent_sum!(R, data, key2), value1 * value2)
    end
  end
  return simplify_summands(R, summands_dict(f))
end

# Return the stored exponent equal to the sum of the exponent of `data` and the
# stored exponent `g`. The values of different characters on a class share
# many exponents, so the same sums recur in the products of a scalar product.
function exponent_sum!(R::GenericCycloRing, data::ExponentData, g::UPolyFrac)
  if !isdefined(data, :sums)
    data.sums = IdDict{UPolyFrac,UPolyFrac}()
  end
  return get!(data.sums, g) do
    exponent_entry!(R, data.exponent + g).exponent
  end
end

# Return the stored exponent equal to `-g`.
function negative_exponent!(R::GenericCycloRing, g::UPolyFrac)
  data = exponent_entry!(R, g)
  if !isdefined(data, :negative)
    data.negative = exponent_entry!(R, -data.exponent).exponent
  end
  return data.negative
end

+(x::UPoly, y::GenericCyclo) = parent(y)(x) + y

+(x::GenericCyclo, y::UPoly) = y + x

-(x::UPoly, y::GenericCyclo) = parent(y)(x) - y

-(x::GenericCyclo, y::UPoly) = x - parent(x)(y)

*(x::UPoly, y::GenericCyclo) = parent(y)(x) * y

*(x::GenericCyclo, y::UPoly) = y * x

function ^(x::GenericCyclo, y::Union{UPoly, Rational})
  isone(length(x.f)) || error("cyclotomic has to many summands")
  expo, c = collect(x.f)[1]
  if iszero(expo) && isone(-c)  # in this case x is the primitive second root of unity -1
    c = -c
    y = 1//2*y
  end
  isone(c) || error("cyclotomic is not a root of unity")
  S = parent(x)
  R = base_ring(S)
  if iszero(expo)
    return S(Dict(R(y)//R(1) => R(1)))
  end
  return S(Dict(y*expo => R(1)))
end

# Comparison

function ==(x::GenericCyclo, y::GenericCyclo)  # TODO Make compatible with hashes. There might be some missing theory...
  return parent(x) == parent(y) && iszero(x - y)
end

# Exact division

function divexact(x::GenericCyclo, y::GenericCyclo; check::Bool=true)  # TODO We need more theory to implement this.
  check_parent(x, y)
  throw(ArgumentError("not an exact division"))
end

# Inverse

function inv(x::GenericCyclo)  # TODO see is_unit.
  if isone(length(x.f))
    expo, c = collect(x.f)[1]
    return parent(x)(Dict(-expo => inv(c)))
  end
  throw(ArgumentError("Inverse is unknown"))
end

# Unsafe operators

function zero!(x::GenericCyclo)
  x.f = Dict{UPolyFrac,UPoly}()
  return x
end

mul!(x::GenericCyclo, y::GenericCyclo, z::GenericCyclo) = y * z

function add!(x::GenericCyclo, y::GenericCyclo, z::GenericCyclo)
  if x === z
    y, z = z, y
  elseif x !== y
    x.f = deepcopy(y.f)
  end
  mergewith!(+, x.f, z.f)
  strip_zeros!(x.f)
  return x
end

# Random generation

RandomExtensions.maketype(R::GenericCycloRing, _) = elem_type(R)

rand(rng::AbstractRNG, sp::SamplerTrivial{<:Make2{GenericCyclo,GenericCycloRing}}) =
  sp[][1](rand(rng, sp[][2]))

rand(rng::AbstractRNG, R::GenericCycloRing, n::AbstractUnitRange{Int}) = R(rand(rng, n))

rand(R::GenericCycloRing, n::AbstractUnitRange{Int}) = rand(Random.GLOBAL_RNG, R, n)

function ConformanceTests.generate_element(R::GenericCycloRing)
  return rand(R, -999:999)
end

# Promotion rules

promote_rule(::Type{GenericCyclo}, ::Type{GenericCyclo}) = GenericCyclo

promote_rule(::Type{GenericCyclo}, ::Type{UPoly}) = GenericCyclo

function promote_rule(::Type{GenericCyclo}, ::Type{T}) where {T<:RingElement}
  promote_rule(T, UPoly) == T ? GenericCyclo : Union{}
end

# Constructors

(R::GenericCycloRing)() = GenericCyclo(Dict{UPolyFrac,UPoly}(), R)

function (R::GenericCycloRing)(c::Union{Integer,Rational})
  if iszero(c)
    return R()
  end
  return GenericCyclo(Dict(base_ring(R)()//base_ring(R)(1) => base_ring(R)(c)), R)
end

function (R::GenericCycloRing)(c::UPoly)
  base_ring(R) != parent(c) && error("Unable to coerce element")
  return GenericCyclo(Dict(base_ring(R)()//base_ring(R)(1) => c), R)
end

function (R::GenericCycloRing)(x::RingElement; exponent::UPolyFrac)
  return R(Dict(exponent => base_ring(R)(x)))
end

function (R::GenericCycloRing)(f::Dict{UPolyFrac,UPoly}; simplify::Bool=true)  # TODO check parent rings?
  if !simplify
    return GenericCyclo(f, R)
  end
  return simplify_summands(R, f)
end

# Return the simplified generic cyclotomic with the summands `f`.
function simplify_summands(R::GenericCycloRing, f::AbstractDict{UPolyFrac,UPoly})
  # find the common denominator `d` of the polynomial parts of the exponents
  L = Tuple{ExponentData,UPoly}[]
  d = 1
  for (g, c) in f
    iszero(c) && continue
    data = exponent_data!(R, g)
    push!(L, (data, c))
    d = lcm(d, data.a_denominator)
  end

  # return early if `L` is empty
  if isempty(L)
    return R()
  end

  fp = Summands()

  # For `d == 1` all exponents are integral: their normal form is zero and
  # `phi_1 = x - 1` leaves nothing to distribute, so the remainder is already
  # the whole exponent. This is by far the most common case.
  if isone(d)
    for (data, c) in L
      add_summand!(fp, data.remainder, c)
    end
    return GenericCyclo(strip_zeros!(summands_dict(fp)), R)
  end

  for (data, c) in L
    for (g, multiplicity) in distribution!(R, data, d)
      add_summand!(fp, g, multiplicity * c)
    end
  end
  return GenericCyclo(strip_zeros!(summands_dict(fp)), R)
end

# Summands collected by their exponents, which are the stored ones, so that
# they can be compared by identity instead of hashing them. The order of the
# first occurrences is kept: the iteration order of a dictionary depends on the
# order of insertion, and the result of e.g. `nesum` on that iteration order.
struct Summands
  coefficients::IdDict{UPolyFrac,UPoly}
  order::Vector{UPolyFrac}
end

Summands() = Summands(IdDict{UPolyFrac,UPoly}(), UPolyFrac[])

function add_summand!(f::Summands, g::UPolyFrac, c::UPoly)
  old = get(f.coefficients, g, nothing)
  if old === nothing
    push!(f.order, g)
    f.coefficients[g] = c
  else
    f.coefficients[g] = old + c
  end
  return f
end

# Return the summands as a dictionary, built as if they had been added to it
# directly.
function summands_dict(f::Summands)
  fp = Dict{UPolyFrac,UPoly}()
  for g in f.order
    fp[g] = f.coefficients[g]
  end
  return fp
end

function (R::GenericCycloRing)(x::GenericCyclo)
  S = parent(x)
  if R == S
    return x
  end
  if base_ring(R) == base_ring(S)
    if S.congruence === nothing ||
      iszero((R.congruence[1] - S.congruence[1]) % S.congruence[2]) &&
       iszero(R.congruence[2] % S.congruence[2])
      return R(x.f)
    end
  end
  error("Unable to coerce element")
end

# Parent constructor

@doc raw"""
    generic_cyclotomic_ring(symbol::Symbol=:E; congruence::Union{Tuple{ZZRingElem,ZZRingElem},Nothing}=nothing, variable::Symbol=:q, power::Int64=1, cached::Bool=true)

Return a tuple consisting of the generic cyclotomic ring `S` with the main variable `variable`,
a generic root generator `E` and the parameter `q` corresponding to the symbol `variable`.
The symbol `symbol` is used as a compact placeholder for $e^{2 \pi i}$ for printing.
In the simplification process of the elements of `S` it is assumed that `q` to the power of `power`
always represents a whole number cungruent to `congruence[1]` modulo `congruence[2]`.

Currently the optional argument `cached` is ignored.

!!! warning
    In the exponents of the generic cyclotomic numbers `q` may only occur in powers which are a multiple of `power`.
    Otherwise the simplification may return incorrect results.

# Examples
```jldoctest
julia> S, E, q = generic_cyclotomic_ring()
(Generic cyclotomic ring over Rational field, Generator of Generic cyclotomic ring over Rational field, q)

julia> E(q-1)^(q-1)
1

julia> E(3)^2
-E(3) - 1

julia> S, E, q = generic_cyclotomic_ring(congruence=(ZZ(1),ZZ(3)), power=2)
(Generic cyclotomic ring over Rational field, Generator of Generic cyclotomic ring over Rational field, q)

julia> S
Generic cyclotomic ring
  over Rational field
  dependent on q
  where q^2 is congruent to 1 modulo 3

julia> E(3)^(q^2-1)
1

julia> E(3)^(q^2)
E(3)

```
"""
function generic_cyclotomic_ring(
  symbol::Symbol=:E;
  congruence::Union{Tuple{ZZRingElem,ZZRingElem},Nothing}=nothing,
  variable::Symbol=:q,
  power::Int64=1,
  cached::Bool=true,
)
  R, (q,) = universal_polynomial_ring(QQ, [variable]; cached=false)
  S = GenericCycloRing(R, symbol, congruence, power)
  E = GenericCycloRingGen(S)
  return (S, E, q)
end

function (E::GenericCycloRingGen)(order::RingElement)
  S = parent(E)
  R = base_ring(S)
  return S(Dict(R(1)//R(order) => R(1)))
end

# Create parameters

@doc raw"""
    param(S::GenericCycloRing, var::Symbol)

Return the parameter of `S` corresponding to the symbol `var`. If there is no such paramter it creates a new one.

# Examples
```jldoctest
julia> S, E, q = generic_cyclotomic_ring()
(Generic cyclotomic ring over Rational field, Generator of Generic cyclotomic ring over Rational field, q)

julia> param(S, :q)
q

julia> param(S, :i)
i

```
"""
param(S::GenericCycloRing, var::Symbol) = gen(base_ring(S), var)

@doc raw"""
    params(S::GenericCycloRing, vars::Vector{Symbol})
    params(S::GenericCycloRing, vars::Vector{String})

Return the parameters of `S` corresponding to the symbols `vars`. If any of those is missing create a new one.

# Examples
```jldoctest
julia> S, E, q = generic_cyclotomic_ring()
(Generic cyclotomic ring over Rational field, Generator of Generic cyclotomic ring over Rational field, q)

julia> params(S, [:q, :i])
2-element Vector{UniversalRingElem{QQMPolyRingElem, QQFieldElem}}:
 q
 i

```
"""
params(S::GenericCycloRing, vars::Vector{Symbol}) = gens(base_ring(S), vars)
params(S::GenericCycloRing, vars::Vector{String}) = gens(base_ring(S), vars)

# Return `(denominator(g), r, a, den)` where `a` and `r` are the quotient and the
# remainder of `g` and `den` is the common denominator of the coefficients of `a`.
function split_exponent(g::UPolyFrac)
  a, r = divrem(numerator(g), denominator(g))
  return (denominator(g), r, a, Int(denominator(data(a))))
end

@doc raw"""
    prepare_exponent(R::GenericCycloRing, substitutes::Tuple{UPoly,UPoly}, g::UPolyFrac)

Return `g` evaluated at `substitutes[1]`.

That evaluation may open up further simplifications: let `g` be `(q+1)//2` with
`q` congruent to `1` modulo `2`. Then the substitute is `2*q+1` and `g` becomes
`(2*q+2)//2 = q+1`. `R.power` covers the case where the first parameter
represents a root of order `power`; the polynomials are then deflated before the
evaluation and inflated again in `restore_exponent`.
"""
function prepare_exponent(
  R::GenericCycloRing, substitutes::Tuple{UPoly,UPoly}, g::UPolyFrac
)
  if isone(R.power)
    return substitute(g, [1], [substitutes[1]])
  end
  gd = deflate(numerator(g), [R.power])//deflate(denominator(g), [R.power])
  return substitute(gd, [1], [substitutes[1]])
end

@doc raw"""
    restore_exponent(R::GenericCycloRing, substitutes::Tuple{UPoly,UPoly}, g::UPolyFrac)

Undo the evaluation done by `prepare_exponent`.
"""
function restore_exponent(
  R::GenericCycloRing, substitutes::Tuple{UPoly,UPoly}, g::UPolyFrac
)
  gp = substitute(g, [1], [substitutes[2]])
  isone(R.power) && return gp
  return inflate(numerator(gp), [R.power])//inflate(denominator(gp), [R.power])
end

# Return the entry of `R.exponents` for the value of `g`, adding an empty one
# for a new value.
function exponent_entry!(R::GenericCycloRing, g::UPolyFrac)
  data = get(R.exponents_by_id, g, nothing)
  data === nothing || return data
  data = get(R.exponents, g, nothing)
  data === nothing || return data
  data = ExponentData(g)
  R.exponents[g] = data
  R.exponents_by_id[g] = data
  return data
end

# Return the data on `g` that the simplification needs, memoized in `R`.
function exponent_data!(R::GenericCycloRing, g::UPolyFrac)
  data = exponent_entry!(R, g)
  isdefined(data, :remainder) && return data
  substitutes = get_substitutes!(R)
  if substitutes !== nothing
    g = prepare_exponent(R, substitutes, g)
  end
  data.g_2, data.r, data.a, data.a_denominator = split_exponent(g)

  # `r` is a remainder modulo `g_2` and `g` was in lowest terms, so the two are
  # coprime and need no cancelling, which would cost a multivariate gcd.
  remainder = fraction_field(base_ring(R))(data.r, data.g_2)
  if substitutes !== nothing
    remainder = restore_exponent(R, substitutes, remainder)
  end
  data.remainder = exponent_entry!(R, remainder).exponent
  return data
end

# Return the exponents and multiplicities that `E(1)^g` is distributed to if
# the polynomial parts of all exponents have the common denominator `d`, for
# the `g` described by `data`.
function distribution!(R::GenericCycloRing, data::ExponentData, d::Int64)
  if !isdefined(data, :distributions)
    data.distributions = Dict{Int64,Vector{Tuple{UPolyFrac,ZZRingElem}}}()
  end
  return get!(data.distributions, d) do
    S, x = ZZ[:x]
    r_g_2 = fraction_field(base_ring(R))(data.r, data.g_2)

    # normalize the polynomial part of the exponent
    ap = normal_form(change_coefficient_ring(ZZ, d * data.a; parent=get_exponent_ring!(R)), d)

    # normalize the constant part
    t = constant_coefficient(ap)
    app = change_coefficient_ring(coefficient_ring(base_ring(R)), ap - t; parent=base_ring(R))
    p = mod(x^t, cyclotomic_polynomial(d, S))

    # distribute the normalized constant part
    substitutes = get_substitutes!(R)
    summands = Tuple{UPolyFrac,ZZRingElem}[]
    for (i, cp) in enumerate(coefficients(p))
      g = (app + (i - 1))//d + r_g_2
      if substitutes !== nothing
        g = restore_exponent(R, substitutes, g)
      end
      push!(summands, (exponent_entry!(R, g).exponent, cp))
    end
    return summands
  end
end

# Lazily created ZZ counterpart of `base_ring(R)`; see `GenericCycloRing`.
function get_exponent_ring!(R::GenericCycloRing)
  if !isdefined(R, :exponent_ring)
    S = base_ring(R)
    R.exponent_ring = universal_polynomial_ring(
      ZZ, symbols(S); internal_ordering=internal_ordering(S), cached=false
    )[1]
  end
  return R.exponent_ring
end

# congruence computation
function get_substitutes!(R::GenericCycloRing)
  congruence = R.congruence
  if congruence == nothing
    return nothing
  end
  if !isdefined(R, :substitute)
    q = gen(base_ring(R), 1)
    R.substitute = congruence[2] * q + congruence[1]
    R.substitute_inv = (q - congruence[1]) * 1//congruence[2]
  end
  return (R.substitute, R.substitute_inv)
end

# evaluate

function evaluate(x::GenericCyclo, vars::Vector{Int64}, vals::Vector{<:RingElement})
  R = parent(x)
  polys = UPoly[base_ring(R)(v) for v in vals]
  substitution = substitution_id!(R, vars, polys)
  f = Summands()
  for (key, value) in x.f
    new_key = evaluate_exponent!(R, key, substitution, vars, polys)
    new_value = depends_on(value, vars) ? substitute(value, vars, polys) : value
    add_summand!(f, new_key, new_value)
  end
  return simplify_summands(R, summands_dict(f))
end

# Return a number identifying the substitution of `vals` for `vars` in `R`.
function substitution_id!(R::GenericCycloRing, vars::Vector{Int64}, vals::Vector{UPoly})
  return get!(R.substitutions, (copy(vars), vals), length(R.substitutions) + 1)
end

# Return the stored exponent equal to `evaluate_exponent(g, vars, vals)`, where
# `substitution` identifies `vars` and `vals`. A sum over a class type
# substitutes the same parameters in many exponents, and the same sums recur
# within and across scalar products, so the result is memoized.
function evaluate_exponent!(
  R::GenericCycloRing, g::UPolyFrac, substitution::Int,
  vars::Vector{Int64}, vals::Vector{<:RingElement}
)
  data = exponent_entry!(R, g)
  if !isdefined(data, :substitutions)
    data.substitutions = Dict{Int,UPolyFrac}()
  end
  return get!(data.substitutions, substitution) do
    exponent_entry!(R, evaluate_exponent(data.exponent, vars, vals)).exponent
  end
end

depends_on(p::UPoly, vars::Vector{Int64}) = any(v -> degree(p, v) > 0, vars)

# Return `evaluate(p, vars, vals)`. The generic method multiplies out every
# term on its own; collecting the terms of the result in a build context takes
# half the time for the small polynomials in exponents.
function substitute(p::UPoly, vars::Vector{Int64}, vals::Vector{UPoly})
  q = data(AbstractAlgebra.upgrade!(p))
  T = parent(q)
  value_terms = map(vals) do v
    w = data(AbstractAlgebra.upgrade!(v))
    [(coeff(w, j), exponent_vector(w, j)) for j in 1:length(w)]
  end
  ctx = MPolyBuildCtx(T)
  e = Vector{Int}(undef, nvars(T))
  for i in 1:length(q)
    exponent_vector!(e, q, i)
    c = coeff(q, i)
    if all(v -> iszero(e[v]), vars)
      push_term!(ctx, c, e)
      continue
    end

    # multiply the term without the substituted variables by their values
    powers = [e[v] for v in vars]
    e[vars] .= 0
    summands = [(c, copy(e))]
    for (k, m) in enumerate(powers), _ in 1:m
      summands = [(c1 * c2, e1 + e2) for (c1, e1) in summands for (c2, e2) in value_terms[k]]
    end
    for (c1, e1) in summands
      push_term!(ctx, c1, e1)
    end
  end
  return UniversalRingElem(finish(ctx), parent(p))
end

substitute(p::UPoly, vars::Vector{Int64}, vals::Vector{<:RingElement}) =
  substitute(p, vars, UPoly[parent(p)(v) for v in vals])

substitute(g::UPolyFrac, vars::Vector{Int64}, vals::Vector{<:RingElement}) =
  substitute(numerator(g), vars, vals)//substitute(denominator(g), vars, vals)

# Substituting parameters normally changes only the numerator of an exponent,
# the denominator being a polynomial in `q`; evaluating just what changes
# saves most of the work.
function evaluate_exponent(g::UPolyFrac, vars::Vector{Int64}, vals::Vector{<:RingElement})
  den = denominator(g, false)
  depends_on(den, vars) && return substitute(g, vars, vals)
  num = numerator(g, false)
  depends_on(num, vars) || return g
  new_num = substitute(num, vars, vals)
  # A nonzero numerator free of `q` (variable 1) has no common factor with
  # `den`, so `//` would spend a multivariate gcd on finding nothing to cancel.
  # This is the case whenever the substitution only renames parameters.
  if !iszero(new_num) && iszero(degree(new_num, 1))
    return parent(g)(new_num, den)
  end
  return new_num//den
end

function divexact(x::GenericCyclo, y::UPoly; check::Bool=true)
  f = deepcopy(x.f)
  map!(p -> divexact(p, y; check=check), values(f))
  return parent(x)(f)
end

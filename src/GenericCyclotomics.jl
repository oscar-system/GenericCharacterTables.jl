@doc raw"""
    kempner_with_data(m::Int64)

Return the `m`-th Kempner number, the associated Kempner schemes and a factorization of `m`.

# Examples
```jldoctest
julia> kempner_with_data(12)
(4, Dict(2 => [1, 3], 3 => [1]), 2^2 * 3)

```
"""
kempner_with_data(m::Int64) = get!(() -> _kempner_with_data(m), kempner_cache, m)

# FIXME/TODO: once we drop support for Oscar 1.1 we should change
# the `Fac` in the next declaration to `Fac{Int}`.
# Alternatively, we could remove the `factorization` return value
# of `kempner_with_data` (a breaking change), and modify `_kempner_reduction`
# to replace `factorization[p]` by `valuation(m, p)`
const kempner_cache = Dict{Int,Tuple{Int, Dict{Int, Vector{Int}}, Fac}}()

function _kempner_with_data(m::Int64)
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

# helper function for normal_form
const kempner_reduction_cache = Dict{Int,Vector{Tuple{Int,Int}}}()
function _kempner_reduction(m)
  return get!(kempner_reduction_cache, m) do
    res = Tuple{Int,Int}[]
    K_m, schemes, factorization = kempner_with_data(m)

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

      push!(res, (k,reduction))
    end
    return res
  end
end

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

  K_m = kempner(m)

  # reduce by the K(m)-th rising factorial of x_i
  S = rising_factorial(x_i, K_m)
  f = mod(f, S)

  for (k,reduction) in _kempner_reduction(m)

    # reduce coefficient of x_i^k
    S_ik = rising_factorial(x_i, k)
    C_ik = coeff(f, [x_i], [k])
    c = normal_form(C_ik, reduction)
    f = sub!(f, (C_ik - c) * S_ik)
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
  f = deepcopy(x.f)
  map!(-, values(f))
  return parent(x)(f; simplify=false)
end

function conj(x::GenericCyclo)
  f = Dict{UPolyFrac,UPoly}()
  for (key, value) in x.f
    f[-key] = value
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
  f = Dict{UPolyFrac,UPoly}()
  for (key1, value1) in x.f
    for (key2, value2) in y.f
      key = key1 + key2
      if haskey(f, key)
        f[key] += value1 * value2
      else
        f[key] = value1 * value2
      end
    end
  end
  return parent(x)(f)
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

  # congruence preparation
  substitutes = get_substitutes!(R)
  power = R.power

  # reduce numerators modulo denominators
  L = NTuple{4,UPoly}[]
  d = 1
  for (g, c) in f
    if !iszero(c)
      if substitutes === nothing
        gp = g
      else
        # After ensuring the congruence for the first parameter
        # via the evaluation at `substitutes[1]` further
        # simplifications may be possible. Let `g` for
        # example be `(q+1)//2` and `q` congruent to `1`
        # modulo `2`. Then `substitutes[1]` is `2*q+1`
        # and `gp=(2*q+2)//2=q+1` which simplifies to `0`.
        #
        # `power` is used in cases where the first parameter
        # represents a root of order `power`. In this case the
        # polynomials need to be deflated before the evaluation
        # and the inflated back again.
        if isone(power)
          gp = evaluate(g, [1], [substitutes[1]])
        else
          gd = deflate(numerator(g), [power])//deflate(denominator(g), [power])
          gp = evaluate(gd, [1], [substitutes[1]])
        end
      end
      a, r = divrem(numerator(gp), denominator(gp))
      push!(L, (c, denominator(gp), r, a))

      # find the common denominator of the exponents of all 'a'
      d = lcm(d, Int(denominator(a.p)))
    end
  end

  # return early if `L` is empty
  if isempty(L)
    return R()
  end

  fp = Dict{UPolyFrac,UPoly}()
  for (c, g_2, r, a) in L
    # normalize the polynomial part of the exponent
    ap = normal_form(change_base_ring(ZZ, d * a), d)

    # normalize the constant part
    t = constant_coefficient(ap)
    app = change_base_ring(coefficient_ring(base_ring(R)), ap - t; parent=base_ring(R))
    S, x = ZZ[:x]
    p = mod(x^t, cyclotomic_polynomial(d, S))

    # distribute the normalized constant part
    r_g_2 = r//g_2
    for (i, cp) in enumerate(coefficients(p))
      tp = i - 1
      g = (app + tp)//d + r_g_2
      if substitutes === nothing
        gp = g
      else
        gp = evaluate(g, [1], [substitutes[2]])
        if !isone(power)
          gp = inflate(numerator(gp), [power])//inflate(denominator(gp), [power])
        end
      end
      if haskey(fp, gp)
        fp[gp] += cp * c
      else
        fp[gp] = cp * c
      end
    end
  end
  return GenericCyclo(filter(p -> !iszero(p.second), fp), R)
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
2-element Vector{AbstractAlgebra.Generic.UnivPoly{QQFieldElem}}:
 q
 i

```
"""
params(S::GenericCycloRing, vars::Vector{Symbol}) = gens(base_ring(S), vars)
params(S::GenericCycloRing, vars::Vector{String}) = gens(base_ring(S), vars)

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
  f = Dict{UPolyFrac,UPoly}()
  for (key, value) in x.f
    new_key = evaluate(key, vars, vals)
    if haskey(f, new_key)
      f[new_key] += evaluate(value, vars, vals)
    else
      f[new_key] = evaluate(value, vars, vals)
    end
  end
  return parent(x)(f)
end

function divexact(x::GenericCyclo, y::UPoly; check::Bool=true)
  f = deepcopy(x.f)
  map!(p -> divexact(p, y; check=check), values(f))
  return parent(x)(f)
end

@doc raw"""
    CyclotomicFac{T <: PolyRingElem}

The type representing a factorization into cyclotomic polynomials.
"""
struct CyclotomicFac{T <: PolyRingElem}
  unit::T
  fac::Dict{T, Int}
  cyclo_fac::Dict{Int, Int}
  function CyclotomicFac(f::Fac{T}) where T <: PolyRingElem
    fac = Dict{T, Int}()
    cyclo_fac = Dict{Int, Int}()
    for (fact, expo) in f
      b, n = is_cyclotomic_polynomial_with_data(fact)
      if b
        cyclo_fac[n] = expo
      else
        fac[fact] = expo
      end
    end
    return new{T}(unit(f), fac, cyclo_fac)
  end
end

function expressify(x::CyclotomicFac; context=nothing)
  if length(x.fac) == length(x.cyclo_fac) == 0
    return expressify(x.unit, context=context)
  end
  prod = Expr(:call, :*)
  for (fact, expo) in x.fac
    ep = expressify(fact, context=context)
    if isone(expo)
      push!(prod.args, ep)
    else
      push!(prod.args, Expr(:call, :^, ep, expo))
    end
  end
  for (fact, expo) in x.cyclo_fac
    ep = Symbol("Φ_$(fact)")
    if isone(expo)
      push!(prod.args, ep)
    else
      push!(prod.args, Expr(:call, :^, ep, expo))
    end
  end
  return prod
end

@enable_all_show_via_expressify CyclotomicFac

@doc raw"""
    factor_cyclotomic(p::PolyRingElem)

Return a factorization of `p` into cyclotomic polynomials. The main difference
to `factor` is the way the result gets printed.
# Examples
```jldoctest
julia> g=green_function_table("GL6");

julia> factor_cyclotomic(order(g))
q^15*Φ_5*Φ_4*Φ_6*Φ_2^3*Φ_3^2*Φ_1^6
```
"""
factor_cyclotomic(p::PolyRingElem) = CyclotomicFac(factor(p))

@doc raw"""
    factor_cyclotomic(p::Generic.UnivPoly)

Return a factorization of `p` into cyclotomic polynomials. The main difference
to `factor` is the way the result gets printed.
# Examples
```jldoctest
julia> g=generic_character_table("GL3");

julia> factor_cyclotomic(order(g))
q^3*Φ_2*Φ_3*Φ_1^3
```
"""
factor_cyclotomic(p::Generic.UnivPoly) = CyclotomicFac(factor(to_univariate(p)))

@doc raw"""
    evaluate(a::CyclotomicFac)

Multiply out the factorization into a single element.
# Examples
```jldoctest
julia> Qx, x = QQ["x"];

julia> f = x^16 - x^15 - x^14 + 2*x^11 - x^8 - x^7 + x^6;

julia> fac = factor_cyclotomic(f)
x^6*Φ_4*Φ_2^2*Φ_3*Φ_1^4

julia> evaluate(fac)
x^16 - x^15 - x^14 + 2*x^11 - x^8 - x^7 + x^6
```
"""
function evaluate(a::CyclotomicFac)
   r = a.unit
   for (p, e) in Base.Iterators.flatten((a.fac, Base.Iterators.map(x -> cyclotomic_polynomial(first(x), parent(a.unit)) => last(x), a.cyclo_fac)))
      r *= p^e
   end
   return r
end

@doc raw"""
    length(a::CyclotomicFac)

Return the number of factors of $a$, not including the unit.
"""
length(a::CyclotomicFac) = length(a.fac) + length(a.cyclo_fac)

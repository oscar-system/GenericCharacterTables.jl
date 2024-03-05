export eesubs, nesum

function isunitfraction(a::QQFieldElem)
	isone(numerator(a))
end
function isunitfraction(a::AbsSimpleNumFieldElem)
	rational_part=coeff(a,0)
	if a == rational_part
		return isunitfraction(rational_part)
	else
		return false
	end
end
function isunitfraction(a::NfPoly)
	if is_constant(a)
		constant=constant_coefficient(a)
		return isunitfraction(constant)
	else
		return false
	end
end
function isunitfraction(a::FracPoly{T}) where T<:NfPoly
	if is_constant(a)
		constant_numerator=numerator(constant_coefficient(a))
		return isunitfraction(constant_numerator)
	else
		return false
	end
end

function ishalf(a::FracPoly{T}) where T<:NfPoly
	for coeff in coefficients(a)
		if denominator(coeff) != 2 && denominator(coeff) != 1  # second case always true with argument of Cyclo
			return false
		end
	end
	return true
end

"""
    eesubs(a::Union{Cyclotomic{T},FracPoly{T}}, vars::Union{Vector{<:FracPoly{T}},Vector{Int64}}, vals::Vector{<:RingElement}) where T<:PolyRingElem

Substitute `vals[i]` for `vars[i]` in `a`.

If `vars` is `Vector{Int64}`, then `vars[i]` represents the index of the variable to replace.

# Examples
```jldoctest
julia> R, q = polynomial_ring(QQ, \"q\");

julia> Q=fraction_field(R);

julia> S=UniversalPolynomialRing(Q);

julia> i, j, k, l = gens(S, [\"i\", \"j\", \"k\", \"l\"]);

julia> a = e2p(2//(q-1)*i*j+1//q*k^2+1//2*i*l)
(1) * exp(2π𝑖(2//(q - 1)*i*j + 1//2*i*l + 1//q*k^2))

julia> eesubs(a,[i,k],[j,3*i])
(1) * exp(2π𝑖(9//q*i^2 + 2//(q - 1)*j^2 + 1//2*j*l))

```
"""
function eesubs(a::FracPoly{T}, vars::Union{Vector{<:FracPoly{T}},Vector{Int64}}, vals::Vector{<:RingElement}) where T<:PolyRingElem
	return evaluate(a, vars, vals)
end
function eesubs(a::Cyclo{T}, vars::Union{Vector{<:FracPoly{T}},Vector{Int64}}, vals::Vector{<:RingElement}) where T <: PolyRingElem
	return Cyclo(a.modulus, eesubs(a.argument, vars, vals))
end
function eesubs(a::CycloSum{T}, vars::Union{Vector{<:FracPoly{T}},Vector{Int64}}, vals::Vector{<:RingElement}) where T <: PolyRingElem
	return CycloSum(map(x -> eesubs(x, vars, vals), a.summands))
end
function eesubs(a::CycloFrac{T}, vars::Union{Vector{<:FracPoly{T}},Vector{Int64}}, vals::Vector{<:RingElement}) where T <: PolyRingElem
	return CycloFrac(eesubs(a.numerator, vars, vals), eesubs(a.denominator, vars, vals))
end

"""
    nesum(a::Cyclotomic{T}, var::Union{FracPoly{T},Int64}, lower::Int64, upper::Union{Int64,T}, congruence::Union{Tuple{T,T},Nothing}=nothing) where T<:PolyRingElem

Return the sum of `a`, from `var=lower` to `upper` as `CycloFrac{T}`.

`congruence[1]` gives the remainder modulo `congruence[2]` of the generator of the polynomials of type `T`. This is used to simplify the result.
The second return value is a set of exceptions where the result may be false.
# Examples
```jldoctest
julia> R, q = polynomial_ring(QQ, "q");

julia> Q=fraction_field(R);

julia> S=UniversalPolynomialRing(Q);

julia> i, = gens(S, ["i"]);

julia> a = e2p(1//(q-1)*i)
(1) * exp(2π𝑖(1//(q - 1)*i))

julia> nesum(a, i, 1, q-1)
((0)  //  (1), Set(GenericCharacterTables.ParameterException{QQPolyRingElem}[(1)//(q - 1) ∈ ℤ]))
```
"""
function nesum(a::CycloFrac{T}, var::Int64, lower::Int64, upper::Union{Int64,T}, congruence::Union{Tuple{T,T},Nothing}=nothing) where T <: NfPoly
	if isone(lower)
		sum, exc = nesum(a, var, 0, upper, congruence)
		return (sum-eesubs(a, [var], [0]), exc)
	elseif lower > 1
		sum, exc = nesum(a, var, 0, upper, congruence)
		return (sum-nesum(a, var, 0, lower-1), exc)
	end
	if congruence !== nothing
		ring=parent(a.numerator.summands[1].modulus)
		c=congruence[2]*gen(ring)+congruence[1]
		cinv=(gen(ring)-congruence[1])//congruence[2]
	end
	sum=0
	exceptions=Set{ParameterException{T}}()
	for root in a.numerator.summands
		if degrees(root.argument)[var] > 0
			cl=coeff(root.argument, [var], [1])
			co=eesubs(root.argument, [var], [0])
			ke=e2p(cl)
			summand=(root.modulus*e2p((upper+1)*cl+co)-root.modulus*e2p(co))//((ke-1)*a.denominator)
			if congruence === nothing
				sum+=summand
			else
				sum+=simplify(summand, c, cinv)
			end
			if !(ishalf(root.argument) && isunitfraction(cl))
				if congruence === nothing
					push!(exceptions, ParameterException(cl))
				else
					push!(exceptions, simplify(ParameterException(cl), c, cinv))
				end
			end
		else
			sum+=((upper+1)*root)//a.denominator
		end
	end
	return (sum, exceptions)
end
function nesum(a::CycloSum{T}, var::Int64, lower::Int64, upper::Union{Int64,T}, congruence::Union{Tuple{T,T},Nothing}=nothing) where T <: NfPoly
	nesum(convert(CycloFrac{T}, a), var, lower, upper, congruence)
end
function nesum(a::Cyclo{T}, var::Int64, lower::Int64, upper::Union{Int64,T}, congruence::Union{Tuple{T,T},Nothing}=nothing) where T <: NfPoly
	nesum(convert(CycloFrac{T}, a), var, lower, upper, congruence)
end
function nesum(a::Cyclotomic{T}, var::FracPoly{T}, lower::Int64, upper::Union{Int64,T}, congruence::Union{Tuple{T,T},Nothing}=nothing) where T<:NfPoly
	nesum(a, var_index(var), lower, upper, congruence)
end

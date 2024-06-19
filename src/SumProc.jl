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

@doc raw"""
    eesubs(a::Union{Cyclotomic{T},FracPoly{T}}, vars::Union{Vector{<:FracPoly{T}},Vector{Int64}}, vals::Vector{<:RingElement}) where T<:PolyRingElem

Substitute `vals[i]` for `vars[i]` in `a`.

If `vars` is `Vector{Int64}`, then `vars[i]` represents the index of the variable to replace.

# Examples
```jldoctest
julia> R, q = polynomial_ring(QQ, "q");

julia> Q=fraction_field(R);

julia> S=UniversalPolynomialRing(Q);

julia> i, j, k, l = gens(S, ["i", "j", "k", "l"]);

julia> a = e2p(2//(q-1)*i*j+1//q*k^2+1//2*i*l)
exp(2π𝑖(2//(q - 1)*i*j + 1//2*i*l + 1//q*k^2))

julia> eesubs(a,[i,k],[j,3*i])
exp(2π𝑖(9//q*i^2 + 2//(q - 1)*j^2 + 1//2*j*l))

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
	return CycloFrac(eesubs(a.numerator, vars, vals), eesubs(a.denominator, vars, vals), Set{ParameterException{T}}(eesubs.(a.exceptions, Ref(vars), Ref(vals))))
end
function eesubs(a::ParameterException{T}, vars::Union{Vector{<:FracPoly{T}},Vector{Int64}}, vals::Vector{<:RingElement}) where T <: PolyRingElem
	return ParameterExcepion(eesubs(a.expression, vars, vals))
end

@doc raw"""
    nesum(a::Cyclotomic{T}, var::Union{FracPoly{T},Int64}, lower::Int64, upper::Union{Int64,T}, congruence::Union{Tuple{T,T},Nothing}=nothing) where T<:PolyRingElem

Return the sum of `a`, from `var=lower` to `upper` as `CycloFrac{T}` using the closed formular for geometric sums. If this is not possible
an exception will be thrown. Note that any occurence of `var` in the denominator of `a` will be silently ignored.

`congruence[1]` gives the remainder modulo `congruence[2]` of the generator of the polynomials of type `T`. This is used to simplify the result.
# Examples
```jldoctest
julia> R, q = polynomial_ring(QQ, "q");

julia> Q=fraction_field(R);

julia> S=UniversalPolynomialRing(Q);

julia> i, = gens(S, ["i"]);

julia> a = e2p(1//(q-1)*i)
exp(2π𝑖(1//(q - 1)*i))

julia> nesum(a, i, 1, q-1)
0
With exceptions:
  (1)//(q - 1) ∈ ℤ
```
"""
function nesum(a::CycloFrac{T}, var::Int64, lower::Int64, upper::Union{Int64,T}, congruence::Union{Tuple{T,T},Nothing}=nothing) where T <: NfPoly
	if isone(lower)
		return nesum(a, var, 0, upper, congruence)-eesubs(a, [var], [0])
	elseif lower > 1
		return nesum(a, var, 0, upper, congruence)-nesum(a, var, 0, lower-1)
	end
	# From now on `lower` can be assumed to be zero.
	if congruence !== nothing
		ring=parent(a.numerator.summands[1].modulus)
		c=congruence[2]*gen(ring)+congruence[1]
		cinv=(gen(ring)-congruence[1])//congruence[2]
	end
	sum=zero(a)
	# Using the commutativity of the addition in the ring of generic cyclotomics
	# the sum can be computed separately for each of the summands of `a.numerator`.
	# Also `a.denominator` will be ignored and added back to the result later.
	for summand in a.numerator.summands
		var_degree=degrees(summand.argument)[var]
		if var_degree <= 0  # `summand` doesn't depend on `var` at all and thus the sum boils down to a simple multiplication.
			sum+=(upper+1)*summand
		elseif isone(var_degree)  # `summand.argument` linearly depends on `var` hence the sum is a geometric sum.
			var_coeff=coeff(summand.argument, [var], [1])
			constant=eesubs(summand.argument, [var], [0])
			geometric_sum=summand.modulus*e2p(constant)*(e2p((upper+1)*var_coeff)-1)//(e2p(var_coeff)-1)
			if congruence === nothing
				sum+=geometric_sum
			else
				sum+=simplify(geometric_sum, c, cinv)
			end
			# If `var_coeff` evaluates to an integer `e2p(var_coeff)` evaluates to one and thus `e2p(var_coeff)-1` to zero.
			# So in this case the closed formular for the geometric sum doesn't hold.
			if !(ishalf(var_coeff) && isunitfraction(var_coeff))  # TODO make this more general to skip more exceptions?
				if congruence === nothing
					exception=ParameterException(var_coeff)
				else
					exception=simplify(ParameterException(var_coeff), c, cinv)
				end
				add_exception!(sum, exception)
			end
		else  # `summand.argument` nonlinearly depends on `var` so the sum is currently not computable.
			# This exception shouldn't be thrown when using the included character tables.
			throw(DomainError(summand, "Nonlinear dependencies on the summation variable can't be resolved."))
		end
	end
	return sum//a.denominator
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

export eesubs, nesum

function isunitfraction(a::UPolyFrac)
	if isone(denominator(a))
		n=numerator(a)
		if is_constant(n)
			return isone(numerator(constant_coefficient(n)))
		end
		return false
	end
	return false
end

function ishalf(a::UPolyFrac)  # TODO
	if isone(denominator(a))
		n=numerator(a)
		for coeff in coefficients(a)
			if denominator(coeff) != 2 && denominator(coeff) != 1  # TODO the second case should always be true for "argument" of GenericCyclo
				return false
			end
		end
		return true
	end
	return false
end

@doc raw"""
    eesubs(a::Union{GenericCyclo,GenericCycloFrac}, vars::Vector{UPoly}, vals::Vector{<:RingElement})

Substitute `vals[i]` for `vars[i]` in `a`.

If `vars` is `Vector{Int64}`, then `vars[i]` represents the index of the variable to replace.

# Examples
```jldoctest
julia> R = universal_polynomial_ring(QQ; cached=false);

julia> q = gen(R, "q");

julia> S = generic_cyclotomic_ring(R);

julia> i, j, k, l = gens(R, ["i", "j", "k", "l"]);

julia> a = S(Dict(2//(q-1)*i*j+1//q*k^2+1//2*i*l => R(1)))
exp(2π𝑖((1//2*q^2*i*l + 2*q*i*j - 1//2*q*i*l + q*k^2 - k^2)//(q^2 - q)))

julia> eesubs(a,[i,k],[j,3*i])
exp(2π𝑖((1//2*q^2*j*l + 9*q*i^2 + 2*q*j^2 - 1//2*q*j*l - 9*i^2)//(q^2 - q)))

```
"""
eesubs(a::Union{GenericCyclo,GenericCycloFrac}, vars::Vector{UPoly}, vals::Vector{<:RingElement}) = evaluate(a, var_index.(vars), vals)  # TODO remove?

@doc raw"""
    nesum(a::GenericCycloFrac, var::Int64, lower::Int64, upper::Union{Int64,UPoly})

Return the sum of `a`, from `var=lower` to `upper` as `CycloFrac{T}` using the closed formular for geometric sums. If this is not possible
an exception will be thrown. Note that any occurence of `var` in the denominator of `a` will be silently ignored.

# Examples
```jldoctest
julia> R = universal_polynomial_ring(QQ; cached=false);

julia> q = gen(R, "q");

julia> S = generic_cyclotomic_ring(R);

julia> i, = gens(R, ["i"]);

julia> a = S(Dict(1//(q-1)*i => R(1)))
exp(2π𝑖(i//(q - 1)))

julia> nesum(a, i, 1, q-1)
0
With exceptions:
  1 ∈ (q - 1)ℤ
```
"""
function nesum(a::GenericCycloFrac, var::Int64, lower::Int64, upper::Union{Int64,UPoly}, congruence::Union{Tuple{QQFieldElem,QQFieldElem},Nothing}=nothing)
	# TODO implement this just with GenericCyclo and write a wrapper for GenericCycloFrac
	# TODO get rid of `congruence` here
	if isone(lower)
		return nesum(a, var, 0, upper, congruence)-evaluate(a, [var], [0])
	elseif lower > 1
		return nesum(a, var, 0, upper, congruence)-nesum(a, var, 0, lower-1)
	end
	# From now on `lower` can be assumed to be zero.
	sum=zero(a)
	R=parent(a.numerator)
	# Using the commutativity of the addition in the ring of generic cyclotomics
	# the sum can be computed separately for each of the summands of `a.numerator`.
	# Also `a.denominator` will be ignored and added back to the result later.
	for (argument, modulus) in a.numerator.f
		# `denominator(argument)` is assumed to be independent of `var`  # TODO maybe raise an exception otherwise?
		# Also `modulus` is assumed to be independent of `var`  # TODO also rasie an exception?
		var_degree=degrees(numerator(argument))[var]
		if var_degree <= 0  # The current summand doesn't depend on `var` at all and thus the sum boils down to a simple multiplication.
			sum+=(upper+1)*R(Dict(argument => modulus))
		elseif isone(var_degree)  # `argument` linearly depends on `var` hence the sum is a geometric sum.
			var_coeff=coeff(numerator(argument), [var], [1])//denominator(argument)
			constant=evaluate(argument, [var], [0])
			o=one(modulus)
			geometric_sum=R(Dict(constant => modulus))*(R(Dict((upper+1)*var_coeff => o))-1)//(R(Dict(var_coeff => o))-1)
			sum+=geometric_sum
			# If `var_coeff` evaluates to an integer `R(Dict(var_coeff => o))` evaluates to one and thus `R(Dict(var_coeff => o))-1`
			# to zero. So in this case the closed formular for the geometric sum doesn't hold.
			if !(ishalf(var_coeff) && isunitfraction(var_coeff))  # TODO make this more general to skip more exceptions?
				add_exception!(sum, var_coeff)
			end
		else  # `argument` nonlinearly depends on `var` so the sum is currently not computable.
			# This exception shouldn't be thrown when using the included character tables.
			throw(DomainError(argument, "Nonlinear dependencies on the summation variable can't be resolved."))
		end
	end
	return sum//a.denominator
end
function nesum(a::GenericCyclo, var::Int64, lower::Int64, upper::Union{Int64,UPoly}, congruence::Union{Tuple{QQFieldElem,QQFieldElem},Nothing}=nothing)
	nesum(a//one(a), var, lower, upper, congruence)
end
function nesum(a::Union{GenericCyclo,GenericCycloFrac}, var::UPoly, lower::Int64, upper::Union{Int64,UPoly}, congruence::Union{Tuple{QQFieldElem,QQFieldElem},Nothing}=nothing)
	nesum(a, var_index(var), lower, upper, congruence)
end

"""
    weak_sign(a::QQFieldElem)

Return the sign of `a`.
"""
function weak_sign(a::QQFieldElem)
	return sign(a)
end

"""
    weak_sign(a::QQFieldElem)

Return the sign of the leading coefficient of the polynomial representation of `a`.
"""
function weak_sign(a::AbsSimpleNumFieldElem)
	for deg in reverse(range(1, degree(parent(a))-1))
		signum=sign(coeff(a, deg))
		if !iszero(signum)
			return signum
		end
	end
	return sign(coeff(a,0))
end

# This models the parameters of the class and character types.
# Parameters are unique modulo a certain modulus.
struct Parameter{T}
	var::FracPoly{T}  # Actual name of the parameter
	modulus::T  # Said modulus
end
Base.show(io::IO, a::Parameter) = print(io, "$(a.var) ∈ {1,…, $(a.modulus)}")
function Base.show(io::IO, m::MIME{Symbol("text/latex")}, a::Parameter) 
	print(io, "$(repr("text/latex",a.var)) \\in \\{1,\\ldots, $(repr("text/latex",a.modulus))\\}")
end

# This models exceptions of relations of parameters.
# Sometimes calculations are only correct if the involved parameters are in a certain relation.
# The exception is fulfilled if `expression` is a whole number.
struct ParameterException{T}
	expression::FracPoly{T}
	function ParameterException(expression::FracPoly{T}; simplify::Bool=true) where T <: NfPoly
		if simplify
			normalized=normal_form(expression)
			signum=weak_sign(leading_coefficient(numerator(leading_coefficient(normalized))))
			return new{T}(signum*normalized)
		else
			return new{T}(expression)
		end
	end
end
function Base.show(io::IO, a::ParameterException)
    # merge multiple denominators from coefficients into one for nicer printing
    d = lcm(map(denominator,Oscar.coefficients(a.expression)))
    if is_one(d)
        print(io, "$(a.expression) ∈ ℤ")
    else
        print(io, "($(a.expression*d))//($d) ∈ ℤ")
    end
end
function Base.show(io::IO, m::MIME{Symbol("text/latex")}, a::ParameterException)
    # merge multiple denominators from coefficients into one for nicer printing
    d = lcm(map(denominator,Oscar.coefficients(a.expression)))
    if is_one(d)
        print(io, repr("text/latex",a.expression), " \\in \\mathbb{Z}")
    else
        print(io, "\\frac{", repr("text/latex",a.expression*d), "}{", d, "} \\in \\mathbb{Z}")
    end
end
Base.:(==)(x::ParameterException, y::ParameterException) = x.expression == y.expression  # needed for Set to work
Base.hash(x::ParameterException, h::UInt) = hash(x.expression, h)  # needed for Set to work

# This is used to save what variables were substituted, for example by `specclassparam!`.
struct ParameterSubstitution{T}
	var::FracPoly{T}  # The name of the replaced parameter
	expression::FracPoly{T}  # The substitute for the parameter
end
Base.show(io::IO, a::ParameterSubstitution) = print(io, "$(a.var) = $(a.expression)")
Base.show(io::IO, m::MIME{Symbol("text/latex")}, a::ParameterSubstitution) = print(io, "$(a.var) \\eq $(repr("text/latex",a.expression))")

# This models a complete set of parameters of a class/character type.
struct Parameters{T}
	params::Vector{Parameter{T}}
	exceptions::Vector{ParameterException{T}}
	substitutions::Vector{ParameterSubstitution{T}}
end

function Parameters(p::Vector{Parameter{T}},e::Vector{ParameterException{T}}) where T
    return Parameters{T}(p,e,ParameterSubstitution{T}[])
end

function Parameters(p::Vector{Parameter{T}}) where T
    return Parameters{T}(p,ParameterException{T}[],ParameterSubstitution{T}[])
end

function Base.show(io::IO, a::Parameters) 
	if isempty(a.exceptions)
		if isempty(a.substitutions)
			print(io, join(a.params, ", "))
		else
			print(io, "$(join(a.params, ", ")), substitutions: $(join(a.substitutions, ", "))")
		end
	else
		if isempty(a.substitutions)
			print(io, "$(join(a.params, ", ")) except $(join(a.exceptions, ", "))")
		else
			print(io, "$(join(a.params, ", ")) except $(join(a.exceptions, ", ")), substitutions: $(join(a.substitutions, ", "))")
		end
	end
end
function Base.show(io::IO, m::MIME{Symbol("text/latex")}, a::Parameters) 
	params = repr.(Ref("text/latex"),a.params)
	substitutions = repr.(Ref("text/latex"),a.substitutions)
	exceptions = repr.(Ref("text/latex"),a.exceptions)
	if isempty(a.exceptions)
		if isempty(a.substitutions)
			print(io, join(params, ", "))
		else
			print(io, "$(join(params, ", ")), \\textrm{substitutions}\\colon $(join(substitutions, ", "))")
		end
	else
		if isempty(a.substitutions)
			print(io, "$(join(params, ", ")) \\textrm{except} $(join(exceptions, ", "))")
		else
			print(io, "$(join(params, ", ")) \\textrm{except} $(join(exceptions, ", ")), \\textrm{substitutions}\\colon  $(join(substitutions, ", "))")
		end
	end
end


isint(a::QQFieldElem) = isone(denominator(a))
function isint(a::AbsSimpleNumFieldElem)
	rational_part=coeff(a,0)
	if a == rational_part
		return isint(rational_part)
	else
		return false
	end
end
function isint(a::FracPoly)
	if is_constant(a)
		constant = constant_coefficient(a)
		if isone(denominator(constant))
			num = numerator(constant)
			if is_constant(num)
				isint(constant_coefficient(num))
			else
				return false
			end
		else
			return false
		end
	else
		return false
	end
end

"""
    shrink(a::Set{ParameterException{<:NfPoly}})

Remove exceptions from `a` that follow from the others.
"""
function shrink(a::Set{ParameterException{T}}) where T <: NfPoly
	ret = Set{ParameterException{T}}() 
	for exception1 in a
		needed = true
		for exception2 in setdiff(a,[exception1])
			factor,remainder = divrem(exception2.expression,exception1.expression)
			if iszero(remainder)
				if isint(factor)
					needed = false
					break
				end
			end
		end
		if needed
			#test expression//modulus == rational
			push!(ret,exception1)
		end
	end
	return ret
end

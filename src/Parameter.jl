# This models the parameters of the class and character types.
# Parameters are unique modulo a certain modulus.
struct Parameter
	var::UPoly  # Actual name of the parameter  # TODO make this an Int?
	modulus::UPoly  # Said modulus
end
Base.show(io::IO, a::Parameter) = print(io, "$(a.var) ∈ {1,…, $(a.modulus)}")
function Base.show(io::IO, m::MIME{Symbol("text/latex")}, a::Parameter) 
	print(io, "$(repr("text/latex",a.var)) \\in \\{1,\\ldots, $(repr("text/latex",a.modulus))\\}")
end

# This is used to save what variables were substituted, for example by `specclassparam!`.
struct ParameterSubstitution
	var::UPoly  # The name of the replaced parameter  # TODO make this an Int?
	expression::UPoly  # The substitute for the parameter  # TODO do we need UPolyFrac here?
end
Base.show(io::IO, a::ParameterSubstitution) = print(io, "$(a.var) = $(a.expression)")
Base.show(io::IO, m::MIME{Symbol("text/latex")}, a::ParameterSubstitution) = print(io, "$(a.var) \\eq $(repr("text/latex",a.expression))")

# This models a complete set of parameters of a class/character type.
struct Parameters
	params::Vector{Parameter}
	exceptions::Vector{UPolyFrac}
	substitutions::Vector{ParameterSubstitution}
end

function Parameters(p::Vector{Parameter},e::Vector{UPolyFrac})
	return Parameters(p,e,ParameterSubstitution[])
end

function Parameters(p::Vector{Parameter})
	return Parameters(p,UPolyFrac[],ParameterSubstitution[])
end

# TODO Use OSCAR's expressify system here.
function Base.show(io::IO, a::Parameters)
	print(io, join(a.params, ", "))
	if !isempty(a.exceptions)
		print(io, " except ")
		for (i, exception) in enumerate(a.exceptions)
			if isone(denominator(exception))
				print(io, "$(numerator(exception)) ∈ ℤ")
			else
				print(io, "$(numerator(exception)) ∈ ($(denominator(exception)))ℤ")
			end
			if i < length(a.exceptions)
				print(io, ", ")
			end
		end
	end
	if !isempty(a.substitutions)
		print(io, ", substitutions: $(join(a.substitutions, ", "))")
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

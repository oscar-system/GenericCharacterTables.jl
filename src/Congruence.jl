export setcongruence

function setcongruence(x::FracPoly{T}, c::Union{T, Generic.FracFieldElem{T}}) where T <: NfPoly
	composed=parent(x)(0)
	for (coeff, monomial) in zip(coefficients(x), monomials(x))
		composed+=(evaluate(numerator(coeff), c)//evaluate(denominator(coeff), c))*monomial
	end
	return composed
end
function setcongruence(x::Cyclo{T}, c::Union{T, Generic.FracFieldElem{T}}; simplify::Bool=true) where T <: NfPoly
	Cyclo(x.modulus, setcongruence(x.argument, c), simplify=simplify)
end
function setcongruence(x::CycloSum{T}, c::Union{T, Generic.FracFieldElem{T}}; simplify::Bool=true) where T <: NfPoly
	summands=setcongruence.(x.summands, Ref(c))
	CycloSum(summands, simplify=simplify)
end
function setcongruence(x::CycloFrac{T}, c::Union{T, Generic.FracFieldElem{T}}; simplify::Bool=true) where T <: NfPoly
	CycloFrac(setcongruence(x.numerator, c), setcongruence(x.denominator, c), Set{ParameterException{T}}(setcongruence.(x.exceptions, Ref(c))), simplify=simplify)
end
function setcongruence(x::ParameterException{T}, c::Union{T, Generic.FracFieldElem{T}}; simplify::Bool=true) where T <: NfPoly
	ParameterException(setcongruence(x.expression, c), simplify=simplify)
end

# TODO: find a better name
# TODO: what type should `c` have?
# TODO: should we only allow to specify *additional* congruences?
# TODO: simplify? always? on request? never?
function setcongruence(x::CharTable{T}, new_congruence::Tuple{T, T}) where T
	# For now don't allow changing the congruence once it has been set, as this
	# could lead to inconsistencies. In the future we could interpret this as *adding*
	# a congruence relation, but then we need to come up with a way to handle it.
	x.congruence === nothing || error("cannot override already set congruence")
	t=typeof(x)(
		x.order,
		deepcopy(x.classinfo),
		deepcopy(x.classlength),
		deepcopy(x.classsums),
		deepcopy(x.classparamindex),
		deepcopy(x.charparamindex),
		deepcopy(x.classparams),
		new_congruence,  # <- this changed
		x.modulusring,
		x.argumentring,
		x.information,
		Vector{GenericCharacter{T}}(undef, chartypes(x)),
		x.irrchartypes,
		x.importname*"*"
	)
	for i in range(1, chartypes(x))
		char=x[i]
		t.chars[i]=GenericCharacter(
			t,
			deepcopy(char.values),
			deepcopy(char.info),
			deepcopy(char.degree),
			deepcopy(char.sum),
			deepcopy(char.params)
		)
	end
	return t
end

function setcongruence(x::CharTable, new_congruence::Tuple{Int, Int})
	R = parent(x.order)
	setcongruence(x, R.(new_congruence))
end

congruence(x::CharTable) = x.congruence
congruence(x::SimpleCharTable) = nothing

@doc raw"""
    simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, c::T, cinv::Generic.FracFieldElem{T}) where T <: NfPoly

Simplify `x` by replacing the generator of the polynomials of type `T` by `c` and then back to `cinv`.

This is used to remove terms that look fractional but are in fact whole.
"""
function simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, c::T, cinv::Generic.FracFieldElem{T}) where T <: NfPoly
	setcongruence(setcongruence(x, c), cinv, simplify=false)
end

@doc raw"""
    simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, t::CharTable{T}) where T <: NfPoly

Simplify `x` according to the congruence relation given by `t`.
"""
function simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, t::CharTable{T}) where T <: NfPoly
	if t.congruence === nothing
		return x
	else
		q=gen(base_ring(base_ring(t.argumentring)))
		c=t.congruence[2]*q+t.congruence[1]
		cinv=(q-t.congruence[1])//t.congruence[2]
		return simplify(x, c, cinv)
	end
end

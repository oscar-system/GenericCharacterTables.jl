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
	CycloFrac(setcongruence(x.numerator, c), setcongruence(x.denominator, c), simplify=simplify)
end
function setcongruence(x::ParameterException{T}, c::Union{T, Generic.FracFieldElem{T}}; simplify::Bool=true) where T <: NfPoly
	ParameterException(setcongruence(x.expression, c), simplify=simplify)
end

"""
    simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, c::T, cinv::Generic.FracFieldElem{T}) where T <: NfPoly

Simplify `x` by replacing the generator of the polynomials of type `T` by `c` and then back to `cinv`.

This is used to remove terms that look fractional but are in fact whole.
"""
function simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, c::T, cinv::Generic.FracFieldElem{T}) where T <: NfPoly
	setcongruence(setcongruence(x, c), cinv, simplify=false)
end

"""
    simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, t::CharTable{T}) where T <: NfPoly

Simplify `x` according to the congruence relation given by `t`.
"""
function simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, t::CharTable{T}) where T <: NfPoly
	if t.congruence == nothing
		return x
	else
		c=t.congruence[2]*gen(t.modulusring)+t.congruence[1]
		cinv=(gen(t.modulusring)-t.congruence[1])//t.congruence[2]
		return simplify(x, c, cinv)
	end
end

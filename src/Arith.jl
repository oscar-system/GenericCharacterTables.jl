export e2p

const FracPoly{T} = Generic.UnivPoly{Generic.FracFieldElem{T}, Generic.MPoly{Generic.FracFieldElem{T}}} where T
const NfPoly = Union{PolyRingElem{QQFieldElem}, PolyRingElem{AbsSimpleNumFieldElem}}

"""
    normalize(a::FracPoly)

Return a normal form `b` of `a` such that ``\\exp(2\\pi \\mathrm{i} \\cdot a) = \\exp(2\\pi \\mathrm{i} \\cdot b)``.

This is done by reducing the numerators of the coefficients modulo their denominators.
"""
function normalize(a::QQFieldElem)
	if isone(denominator(a))
		return zero(a)
	else
		return mod(numerator(a), denominator(a))//denominator(a)
	end
end
function normalize(a::AbsSimpleNumFieldElem)
	if isone(denominator(a))
		return zero(a)
	else
		rational_part=coeff(a,0)
		return a-rational_part+normalize(rational_part)
	end
end
function normalize(a::Union{QQPolyRingElem, Generic.Poly{AbsSimpleNumFieldElem}})
	return parent(a)(collect(map(normalize, coefficients(a))))
end
function normalize(a::FracPoly{T}) where T <: NfPoly
	normalized=zero(a)
	for (coeff, monomial) in zip(coefficients(a), monomials(a))
		normalized+=(mod(numerator(coeff), denominator(coeff))//denominator(coeff))*monomial
		normalized+=normalize(div(numerator(coeff), denominator(coeff)))*monomial
	end
	return normalized
end

abstract type Cyclotomic{T} end

# This is the base type for generic cyclotomics.
struct Cyclo{T} <: Cyclotomic{T}
	modulus::T  # Distance form the origin as polynomial in one variable over some real number field
	argument::FracPoly{T} # Angle as multiple of 2π
	function Cyclo(modulus::T, argument::FracPoly{T}; simplify::Bool=true) where T<:NfPoly
		if parent(modulus)!=base_ring(base_ring(parent(argument)))
			error("Base rings of modulus and argument do not match!")
		end
		if simplify
			if iszero(modulus)
				return new{T}(modulus, zero(argument))
			else
				new_argument=normalize(argument)
				if constant_coefficient(new_argument) == 1//2
					return new{T}(-modulus, new_argument-1//2)
				else
					return new{T}(modulus, new_argument)
				end
			end
		else
			return new{T}(modulus, argument)
		end
	end
end
function Base.show(io::IO, z::Cyclo)
	if iszero(z.argument)
		print(io, z.modulus)
	else
		print(io, "($(z.modulus)) * exp(2π𝑖($(z.argument)))")
	end
end
function Base.show(io::IO, m::MIME{Symbol("text/latex")}, z::Cyclo)
	if iszero(z.argument)
		show(io,MIME("text/latex"),z.modulus)
	else
		coeffs = collect(coefficients(z.modulus))
		if isone(length(coeffs[coeffs.!=0]))
			if isone(z.modulus)
				print(io, "\\exp\\left(2\\pi \\mathrm{i} \\left($(repr("text/latex",z.argument))\\right)\\right)")
			else
				print(io, "$(repr("text/latex", z.modulus)) \\exp\\left(2\\pi \\mathrm{i} \\left($(repr("text/latex",z.argument))\\right)\\right)")
			end
		else
			print(io, "\\left($(repr("text/latex", z.modulus))\\right) \\cdot \\exp\\left(2\\pi \\mathrm{i} \\left($(repr("text/latex",z.argument))\\right)\\right)")
		end
	end
end
Base.isone(x::Cyclo) = isone(x.modulus) && iszero(x.argument)
Base.iszero(x::Cyclo) = iszero(x.modulus)

# This models sums of cyclotomics.
# Zero is represented as a one element sum where this single element is zero,
# this is done to keep a reference on the base rings.
struct CycloSum{T} <: Cyclotomic{T}
	summands::Vector{Cyclo{T}}
	function CycloSum(summands::Vector{Cyclo{T}}; simplify::Bool=true) where T<:NfPoly
		@assert !isempty(summands)
		if simplify
			# Simplify by combining summands with the same argument
			summands_dict=Dict{FracPoly{T}, T}()
			for summand in summands
				if !iszero(summand.modulus)
					if haskey(summands_dict,summand.argument) 
						summands_dict[summand.argument]+=summand.modulus
					else
						summands_dict[summand.argument]=summand.modulus
					end
				end
			end
			simplified_summands=Cyclo{T}[]
			for (argument, modulus) in summands_dict
				if !iszero(modulus)
					push!(simplified_summands, Cyclo(modulus,argument,simplify=false))
				end
			end
			if isempty(simplified_summands)
				return new{T}([zero(summands[1])])
			else
				return new{T}(simplified_summands)
			end
		else
			return new{T}(summands)
		end
	end
end
function CycloSum(modulus::T, argument::FracPoly{T}) where T<:NfPoly
	# TODO this could be extended to non constant terms
	if constant_coefficient(argument) == 2//3
		return CycloSum([Cyclo(-modulus, argument-1//3), Cyclo(-modulus, argument-2//3)])
	else
		return CycloSum([Cyclo(modulus, argument)])
	end
end
Base.show(io::IO, z::CycloSum) = print(io, join(z.summands, " + "))
Base.show(io::IO, m::MIME{Symbol("text/latex")}, z::CycloSum) = print(io, join(repr.("text/latex", z.summands), " + "))
Base.isone(x::CycloSum) = isone(length(x.summands)) && isone(x.summands[1])
Base.iszero(x::CycloSum) = iszero(x.summands[1])  # isone(length(x.summands)) is implied

# This models fractions of sums of cyclotomics.
# The simplification is currently only very basic.
# According to the original implementation
# more advanced simplifications seem to have
# no positive effect on the performance.
struct CycloFrac{T} <: Cyclotomic{T}
	numerator::CycloSum{T}
	denominator::CycloSum{T}
	function CycloFrac(numerator::CycloSum{T}, denominator::CycloSum{T}; simplify::Bool=true) where T<:NfPoly
		if simplify
			if iszero(numerator)
				return new{T}(numerator, one(denominator))
			elseif numerator == denominator
				o=one(denominator)
				return new{T}(o, o)
			else
				return new{T}(numerator, denominator)
			end
		else
			return new{T}(numerator, denominator)
		end
	end
end
Base.show(io::IO, z::CycloFrac) = print(io, "($(z.numerator))  //  ($(z.denominator))")
Base.show(io::IO, m::MIME{Symbol("text/latex")}, z::CycloFrac) = print(io, "\\frac{$(repr("text/latex", z.numerator))}{$(repr("text/latex",z.denominator))}")
Base.isone(x::CycloFrac) = isone(x.numerator) && isone(x.denominator)
Base.iszero(x::CycloFrac) = iszero(x.numerator)

# operators
"""
    e2p(a::FracPoly{<:NfPoly})

Return a `CycloSum` representing ``\\exp(2\\pi \\mathrm{i} \\cdot a)`` 
```jldoctest
julia> R, q = polynomial_ring(QQ, \"q\");

julia> Q = fraction_field(R);

julia> S = UniversalPolynomialRing(Q);

julia> i, j = gens(S, [\"i\", \"j\"]);

julia> e2p(1//(q-1)*i+j)
(1) * exp(2π𝑖(1//(q - 1)*i))

```
"""
function e2p(a::FracPoly{<:NfPoly})
	modulus=base_ring(base_ring(parent(a)))(1)
	CycloSum(modulus, a)
end

Base.one(x::Cyclo) = Cyclo(one(x.modulus), zero(x.argument), simplify=false)
Base.one(x::CycloSum) = CycloSum([one(x.summands[1])], simplify=false)
function Base.one(x::CycloFrac)
	o=one(x.numerator)
	return CycloFrac(o, o, simplify=false)
end

Base.zero(x::Cyclo) = Cyclo(zero(x.modulus), zero(x.argument), simplify=false)
Base.zero(x::CycloSum) = CycloSum([zero(x.summands[1])], simplify=false)
Base.zero(x::CycloFrac) = CycloFrac(zero(x.numerator), one(x.denominator), simplify=false)

Base.:(==)(x::Cyclo{T}, y::Cyclo{T}) where T<:PolyRingElem = x.modulus == y.modulus && x.argument == y.argument

Base.:+(x::Cyclo{T}, y::Cyclo{T}) where T<:PolyRingElem = CycloSum([x,y])
Base.:+(x::CycloSum{T}, y::CycloSum{T}) where T<:PolyRingElem = CycloSum(vcat(x.summands,y.summands))

Base.:*(factor::T, x::Cyclo{T}) where T<:PolyRingElem = iszero(factor) ? zero(x) : Cyclo(factor*x.modulus, x.argument, simplify=false)
Base.:*(factor::T, x::CycloSum{T}) where T<:PolyRingElem = iszero(factor) ? zero(x) : CycloSum(x.summands.*factor, simplify=false)
Base.:*(factor::T, x::CycloFrac{T}) where T<:PolyRingElem = iszero(factor) ? zero(x) : CycloFrac(x.numerator*factor, x.denominator, simplify=false)
Base.:*(x::Cyclotomic{T}, factor::T) where T<:PolyRingElem = factor*x

Base.:*(factor::S, x::Cyclo{T}) where {S<:RingElement, T<:PolyRingElem{S}} = iszero(factor) ? zero(x) : Cyclo(factor*x.modulus, x.argument, simplify=false)
Base.:*(factor::S, x::CycloSum{T}) where {S<:RingElement, T<:PolyRingElem{S}} = iszero(factor) ? zero(x) : CycloSum(x.summands.*factor, simplify=false)
Base.:*(factor::S, x::CycloFrac{T}) where {S<:RingElement, T<:PolyRingElem{S}} = iszero(factor) ? zero(x) : CycloFrac(x.numerator*factor, x.denominator, simplify=false)
Base.:*(x::Cyclotomic{T}, factor::S) where {S<:RingElement, T<:PolyRingElem{S}} = factor*x

Base.:*(factor::Union{Int64, Rational{Int64}}, x::Cyclo{<:NfPoly}) = iszero(factor) ? zero(x) : Cyclo(factor*x.modulus, x.argument, simplify=false)
Base.:*(factor::Union{Int64, Rational{Int64}}, x::CycloSum{<:NfPoly}) = iszero(factor) ? zero(x) : CycloSum(x.summands.*factor, simplify=false)
Base.:*(factor::Union{Int64, Rational{Int64}}, x::CycloFrac{<:NfPoly}) = iszero(factor) ? zero(x) : CycloFrac(x.numerator*factor, x.denominator, simplify=false)
Base.:*(x::Cyclotomic{<:NfPoly}, factor::Union{Int64, Rational{Int64}}) = factor*x

Base.:*(factor::Generic.FracFieldElem{T}, x::Cyclotomic{T}) where T<:PolyRingElem = (numerator(factor)*x)//denominator(factor)
Base.:*(x::Cyclotomic{T}, factor::Generic.FracFieldElem{T}) where T<:PolyRingElem = factor*x

Base.:+(x::Union{T,Generic.FracFieldElem{T}}, y::Cyclotomic{T}) where T<:PolyRingElem = x*one(y)+y
Base.:+(x::Cyclotomic{T}, y::Union{T,Generic.FracFieldElem{T}}) where T<:PolyRingElem = y+x
Base.:+(x::Union{Int64, Rational{Int64}}, y::Cyclotomic{<:NfPoly}) = x*one(y)+y
Base.:+(x::Cyclotomic{<:NfPoly}, y::Union{Int64, Rational{Int64}}) = y+x

Base.:-(x::Union{T,Generic.FracFieldElem{T}}, y::Cyclotomic{T}) where T<:PolyRingElem = x*one(y)-y
Base.:-(x::Cyclotomic{T}, y::Union{T,Generic.FracFieldElem{T}}) where T<:PolyRingElem = x-(y*one(x))
Base.:-(x::Union{Int64, Rational{Int64}}, y::Cyclotomic{<:NfPoly}) = x*one(y)-y
Base.:-(x::Cyclotomic{<:NfPoly}, y::Union{Int64, Rational{Int64}}) = x-(y*one(x))

Base.:-(y::Cyclotomic) = (-1)*y

Base.:(==)(x::CycloSum, y::CycloSum) = iszero(x-y)

function Base.:*(x::Cyclo, y::Cyclo)
	if isone(x)
		return y
	elseif isone(y)
		return x
	else
		return Cyclo(x.modulus*y.modulus, x.argument+y.argument)
	end
end

function Base.:*(x::CycloSum{T}, y::CycloSum{T}) where T <: PolyRingElem
	if isone(x)
		return y
	elseif isone(y)
		return x
	else
		summands=Vector{Cyclo{T}}(undef, length(x.summands)*length(y.summands))
		i=1
		for factor1 in x.summands
			for factor2 in y.summands
				summands[i]=factor1*factor2
				i+=1
			end
		end
		return CycloSum(summands)
	end
end

function Base.:*(x::CycloFrac, y::CycloFrac)
	numerator=x.numerator*y.numerator
	denominator=x.denominator*y.denominator
	CycloFrac(numerator, denominator)
end

function Base.:+(x::CycloFrac, y::CycloFrac)
	if x.denominator == y.denominator
		return CycloFrac(x.numerator+y.numerator, x.denominator, simplify=!isone(x.denominator))
	else
		numerator=x.numerator*y.denominator+y.numerator*x.denominator
		denominator=x.denominator*y.denominator
		return CycloFrac(numerator, denominator)
	end
end

Base.://(x::CycloSum{T}, y::CycloSum{T}) where T <: PolyRingElem = CycloFrac(x,y)
Base.://(x::Cyclo{T}, y::Cyclo{T}) where T <: PolyRingElem = CycloSum([x], simplify=false)//CycloSum([y], simplify=false)
Base.://(x::CycloFrac{T}, y::CycloFrac{T}) where T <: PolyRingElem = x * CycloFrac(y.denominator, y.numerator, simplify=false)

Base.://(x::Cyclotomic{T}, y::T) where T <: PolyRingElem = x//(y*one(x))
Base.://(x::T, y::Cyclotomic{T}) where T <: PolyRingElem = (x*one(y))//y
Base.://(x::Cyclotomic{<:NfPoly}, y::Int64) = (1//y)*x
Base.://(x::Int64, y::Cyclotomic{<:NfPoly}) = (x*one(y))//y

Base.://(x::Cyclotomic{T}, y::Generic.FracFieldElem{T}) where T <: PolyRingElem = (denominator(y)*x)//numerator(y)
Base.://(x::Generic.FracFieldElem{T}, y::Cyclotomic{T}) where T <: PolyRingElem = numerator(x)//(denominator(x)*y)
Base.://(x::Cyclotomic{<:NfPoly}, y::Rational{Int64}) = inv(y)*x
Base.://(x::Rational{Int64}, y::Cyclotomic{<:NfPoly}) = (x*one(y))//y

Base.conj(x::Cyclo) = Cyclo(x.modulus,-x.argument)  # TODO
Base.conj(x::CycloSum) = CycloSum(conj.(x.summands), simplify=false)
Base.conj(x::CycloFrac) = CycloFrac(conj(x.numerator), conj(x.denominator), simplify=false)

Base.convert(::Type{CycloSum{T}}, x::Cyclo{T}) where T <: PolyRingElem = CycloSum([x], simplify=false)
Base.convert(::Type{CycloFrac{T}}, x::CycloSum{T}) where T <: PolyRingElem = CycloFrac(x, one(x), simplify=false)
Base.convert(::Type{CycloFrac{T}}, x::Cyclo{T}) where T <: PolyRingElem = convert(CycloFrac{T}, convert(CycloSum{T}, x))

Base.promote_rule(::Type{CycloSum{T}}, ::Type{Cyclo{T}}) where T <: PolyRingElem = CycloSum{T}
Base.promote_rule(::Type{CycloFrac{T}}, ::Type{CycloSum{T}}) where T <: PolyRingElem = CycloFrac{T}
Base.promote_rule(::Type{CycloFrac{T}}, ::Type{Cyclo{T}}) where T <: PolyRingElem = CycloFrac{T}

Base.:+(x::Cyclotomic{T}, y::Cyclotomic{T}) where T <: PolyRingElem = +(promote(x,y)...)
Base.:-(x::Cyclotomic{T}, y::Cyclotomic{T}) where T <: PolyRingElem = x+(-y)
Base.:*(x::Cyclotomic{T}, y::Cyclotomic{T}) where T <: PolyRingElem = *(promote(x,y)...)
Base.://(x::Cyclotomic{T}, y::Cyclotomic{T}) where T <: PolyRingElem = //(promote(x,y)...)

function Base.show(io::IO, m::MIME{Symbol("text/latex")}, z::FracPoly{T}) where T <: PolyRingElem
	show(io,MIME("text/latex"),z.p)
end

"""
    try_convert_to_real(x::CycloFrac{<:NfPoly})

Try to convert `x` to a real number.

This only works if `x` is a fraction of trivial sums where all arguments are zero.
"""
function try_convert_to_real(x::CycloFrac{<:NfPoly})
	if isone(length(x.numerator.summands)) && isone(length(x.denominator.summands))
		numerator=x.numerator.summands[1]
		denominator=x.denominator.summands[1]
		if iszero(numerator.argument) && iszero(denominator.argument)
			return numerator.modulus//denominator.modulus
		else
			return x
		end
	else
		return x
	end
end

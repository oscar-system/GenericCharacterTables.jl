import Oscar.AbstractAlgebra: evaluate

import Base: show, isone, iszero, one, zero, conj, inv, +, -, *, //, ==

# This models fractions of sums of cyclotomics.
# The simplification is currently only very basic.
# According to the original implementation
# more advanced simplifications seem to have
# no positive effect on the performance.
struct GenericCycloFrac
	numerator::GenericCyclo
	denominator::GenericCyclo
	exceptions::Set{UPolyFrac}  # The element may only be evaluated if none of the exceptions evaluates to an integer.
	function GenericCycloFrac(numerator::GenericCyclo, denominator::GenericCyclo, exceptions::Set{UPolyFrac}; simplify::Bool=true)
		check_parent(numerator, denominator)
		if simplify
			if iszero(numerator)
				return new(numerator, one(denominator), exceptions)
			elseif numerator == denominator
				o=one(denominator)
				return new(o, o, exceptions)
			end
		end
		return new(numerator, denominator, exceptions)
	end
end

function add_exception!(a::GenericCycloFrac, exception::UPolyFrac)
	push!(a.exceptions, exception)
end

@doc raw"""
    shrink(a::GenericCycloFrac{<:NfPoly})

Remove exceptions from `a` that follow from the others. And try to simplify the representation of `a`.
"""
function shrink(a::GenericCycloFrac)  # TODO Move this to the constructor of GenericCycloFrac?
	new_numerator=a.numerator
	new_denominator=a.denominator
	if isone(length(new_numerator.f)) && isone(length(new_denominator.f))
		numerator_argument,numerator_modulus=collect(new_numerator.f)[1]
		denominator_argument,denominator_modulus=collect(new_denominator.f)[1]
		if numerator_argument == denominator_argument
			b=numerator_modulus//denominator_modulus
			o=one(new_numerator)
			new_numerator=o*numerator(b)
			new_denominator=o*denominator(b)
		end
	end
	new_exceptions = Set{UPolyFrac}()
	exceptions=collect(a.exceptions)
	for i in 1:length(exceptions)
		needed = true
		for j in (i+1):length(exceptions)
			quotient=exceptions[j]//exceptions[i]
			if isone(denominator(quotient))
				if is_constant(numerator(quotient))
					c=constant_coefficient(numerator(quotient))
					if isone(denominator(c))
						# In this case exceptions[j] is an integer multiple of exceptions[i], so if exception1 evaluates to an
						# integer exceptions[j] does as well. Hence, it suffices to track exceptions[j] and we can discard
						# exceptions[i].
						needed = false
						break
					end
				end
			end
		end
		if needed
			# TODO test if exception1 is a rational number and apply normal_form to the "whole" part of exception1, similar to the
			# simplification of GenericCyclotomic.
			push!(new_exceptions,exceptions[i])
		end
	end
	return GenericCycloFrac(new_numerator, new_denominator, new_exceptions, simplify=false)
end

function show(io::IO, x::GenericCycloFrac)
	io=pretty(io)
	if isone(x.denominator)
		print(io, "$(x.numerator)")
	else
		if isone(length(x.numerator.f))
			print(io, "$(x.numerator)//")
		else
			print(io, "($(x.numerator))//")
		end
		if isone(length(x.denominator.f))
			argument,modulus=collect(x.denominator.f)[1]
			if iszero(argument) && (is_monomial(modulus) || is_constant(modulus))
				print(io, "$(x.denominator)")
			else
				print(io, "($(x.denominator))")
			end
		else
			print(io, "($(x.denominator))")
		end
	end
	if !isempty(x.exceptions)
		print(io, "\nWith exceptions:", Indent())
		for exception in x.exceptions
			if isone(denominator(exception))
				print(io, "\n$(numerator(exception)) ∈ ℤ")
			else
				print(io, "\n$(numerator(exception)) ∈ ($(denominator(exception)))ℤ")
			end
		end
		print(io, Dedent())
	end
end

isone(x::GenericCycloFrac) = isone(x.numerator) && isone(x.denominator)

@doc raw"""
    iszero(x::GenericCycloFrac; ignore_exceptions::Bool=false)

Return if `x` is zero. If `ignore_exceptions` is true then the exceptions of `x` will not be considered.
"""
function iszero(x::GenericCycloFrac; ignore_exceptions::Bool=false)
	if ignore_exceptions
		return iszero(x.numerator)
	end
	return iszero(x.numerator) && isempty(x.exceptions)
end

# Unary operations

function one(x::GenericCycloFrac)
	o=one(x.numerator)
	return GenericCycloFrac(o, o, x.exceptions, simplify=false)
end

zero(x::GenericCycloFrac) = GenericCycloFrac(zero(x.numerator), one(x.denominator), x.exceptions, simplify=false)  # TODO construct a generic zero here?

conj(x::GenericCycloFrac) = GenericCycloFrac(conj(x.numerator), conj(x.denominator), x.exceptions, simplify=false)

inv(x::GenericCycloFrac) = GenericCycloFrac(x.denominator, x.numerator, x.exceptions, simplify=false)

-(x::GenericCycloFrac) = GenericCycloFrac(-x.numerator, x.denominator, x.exceptions, simplify=false)

# Binary operations

*(factor::RingElement, x::GenericCycloFrac) = iszero(factor) ? zero(x) : GenericCycloFrac(factor*x.numerator, x.denominator, x.exceptions)
*(x::GenericCycloFrac, factor::RingElement) = factor*x

(==)(x::GenericCycloFrac, y::GenericCycloFrac) = iszero((x-y).numerator)  # TODO compare exceptions?

(==)(x::GenericCycloFrac, y::RingElement) = iszero((x-y).numerator)  # TODO compare exceptions?

(==)(x::RingElement, y::GenericCycloFrac) = y==x

function *(x::GenericCycloFrac, y::GenericCycloFrac)
	numerator=x.numerator*y.numerator
	denominator=x.denominator*y.denominator
	exceptions=union(x.exceptions, y.exceptions)
	GenericCycloFrac(numerator, denominator, exceptions)
end

function +(x::GenericCycloFrac, y::GenericCycloFrac)
	if x.denominator == y.denominator
		return GenericCycloFrac(x.numerator+y.numerator, x.denominator, union(x.exceptions, y.exceptions), simplify=!isone(x.denominator))
	else
		numerator=x.numerator*y.denominator+y.numerator*x.denominator
		denominator=x.denominator*y.denominator
		exceptions=union(x.exceptions, y.exceptions)
		return GenericCycloFrac(numerator, denominator, exceptions)
	end
end

+(x::GenericCycloFrac, y::RingElement) = GenericCycloFrac(x.numerator+y*x.denominator, x.denominator, x.exceptions)

+(x::RingElement, y::GenericCycloFrac) = y+x

-(x::GenericCycloFrac, y::GenericCycloFrac) = x+(-y)

-(x::GenericCycloFrac, y::RingElement) = x+(-y)

-(x::RingElement, y::GenericCycloFrac) = x+(-y)

//(x::GenericCycloFrac, y::GenericCycloFrac) = x*GenericCycloFrac(y.denominator, y.numerator, y.exceptions, simplify=false)

//(x::GenericCycloFrac, y::RingElement) = GenericCycloFrac(x.numerator, x.denominator*y, x.exceptions, simplify=false)

//(x::RingElement, y::GenericCycloFrac) = x*inv(y)

//(x::GenericCyclo, y::GenericCyclo) = GenericCycloFrac(x, y, Set{UPolyFrac}())

//(x::GenericCyclo, y::UPoly) = GenericCycloFrac(x, parent(x)(y), Set{UPolyFrac}())

//(x::UPoly, y::GenericCyclo) = GenericCycloFrac(parent(y)(x), y, Set{UPolyFrac}())

# evaluate

function evaluate(x::GenericCycloFrac, vars::Vector{Int64}, vals::Vector{<:RingElement})
	numerator=evaluate(x.numerator, vars, vals)
	denominator=evaluate(x.denominator, vars, vals)
	exceptions=evaluate.(x.exceptions, Ref(vars), Ref(vals))
	return GenericCycloFrac(numerator, denominator, Set{UPolyFrac}(exceptions))
end

using Oscar
using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclo, CycloSum, CycloFrac, FracPoly, NfPoly

function printlatex(z::Cyclo{T}) where T <: NfPoly 
	coeffs = collect(coefficients(z.modulus))
	if isone(length(coeffs[coeffs.!=0]))
		if isone(z.modulus)
			re=""
		else
			re=repr("text/latex", z.modulus)
		end
	else
		re="\\left($(repr("text/latex", z.modulus))\\right)"
	end
	zetas = Dict{T,FracPoly{T}}()
	for (coeff, monomial) in zip(coefficients(z.argument), monomials(z.argument)) 
		saved=get(zetas, denominator(coeff), nothing)
		if saved === nothing
			zetas[denominator(coeff)] = numerator(coeff)*monomial
		else
			zetas[denominator(coeff)] = saved + numerator(coeff)*monomial
		end
	end
	for (order, exponent) in zetas
		re *= "\\zeta_{$(repr("text/latex", order))}^{$(repr("text/latex",exponent))}"
	end
	return re
end
function printlatex(z::CycloSum)
	return join(printlatex.(z.summands)," + ")
end
function printlatex(z::CycloFrac)
	return "\\frac{$(printlatex(z.numerator))}{$(printlatex(z.denominator))}"
end
using Oscar
using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclo, CycloSum, CycloFrac, FracPoly, NfPoly

export zeta

# needed for finding a pretty printed name of primitive roots, analogeous Chevie 
# this is given, if rootformat has value true, else the primitive root will be given as ζ_($order)
struct Root
	str::String
	tex::String
end
Base.show(io::IO, z::Root) = print(io, z.str)

mutable struct RootKey
	real::Vector{QQFieldElem}
	imag::Vector{QQFieldElem}
	d::Symbol
end
Base.hash(x::RootKey, h::UInt) = xor(hash(x.real, h), hash(x.imag, h), hash(x.d, h)) # needed for Dict to work
function Base.isequal(x::RootKey, y::RootKey)
	if hash(x)!=hash(y)
		return false
	end
	if x.real != y.real
		return false
	end
	if x.imag != y.imag
		return false 
	end 
	if x.d != y.d 
		return false
	end 
	return true
end

function rootkey(f::QQPolyRingElem)
	coeff=collect(coefficients(f))
	return RootKey(coeff, zeros(QQFieldElem, length(coeff)), :nothing)
end
function rootkey(f::Generic.Poly{AbsSimpleNumFieldElem})
	coeffs=collect(coefficients(f))
	return RootKey(coeff.(coeffs,0),coeff.(coeffs,1) ,var(parent(coeffs[1])))
end

#primitive roots
GEWZ1Y2=Root("η₂","\\eta_2")
GEWZ1Y3=Root("η₃","\\eta_3")
GEWY1Z3=Root("μ₃","\\mu_3")
GEW2Z1=Root("ρ₁","\\rho_1")
GEWC12=Root("φ₁₂","\\varphi_{12}")
GEWZ1=Root("ζ₁","\\zeta_1")
GEWY1=Root("ξ₁","\\xi_1")
GEWZ2=Root("ζ₂","\\zeta_2")
GEWY2=Root("ξ₂","\\xi_2")
GEWC3=Root("φ₃","\\varphi_3")
GEWC6=Root("φ₆","\\varphi_6")
GEWZ3=Root("ζ₃","\\zeta_3")
GEWY3=Root("ξ₃","\\xi_3")
GEWZ4=Root("ζ₄","\\zeta_4")
GEWY4=Root("ξ₄","\\xi_4")
EW2=Root("Φ₂","\\Phi_2")
EW3=Root("Φ₃","\\Phi_3")
EW4=Root("Φ₄","\\Phi_4")
GEWC8ppZ2=Root("ψ₈''","\\psi_8''")
GEWC8pZ2=Root("ψ₈'","\\psi_8'")
GEWC12pp=Root("φ₁₂''","\\varphi_{12}''")
GEWC24pp=Root("φ₂₄''","\\varphi_{24}''")
GEWC8pp=Root("φ₈''","\\varphi_8''")
GEWC12p=Root("φ₁₂'","\\varphi_{12}'")
GEWC24p=Root("φ₂₄'","\\varphi_{24}'")
GEWC8p=Root("φ₈'","\\varphi_8'")
ONE=Root("exp(2π𝑖)","\\exp(2\\mathrm{i}\\pi)") #TODO 
NUL=Root("","")

roots = Dict{RootKey, Root}([
(RootKey(QQFieldElem[-1, 1, -1, 1],QQFieldElem[0,0,0,0], :nothing), GEWZ1Y2),
(RootKey(QQFieldElem[-1, 1, 0, -1, 1],QQFieldElem[0,0,0,0,0], :nothing), GEWZ1Y3),
(RootKey(QQFieldElem[-1, -1, 0, 1, 1],QQFieldElem[0,0,0,0,0], :nothing), GEWY1Z3),
(RootKey(QQFieldElem[-2, 2],QQFieldElem[0,0], :nothing), GEW2Z1),
(RootKey(QQFieldElem[1, 0, -1, 0, 1],QQFieldElem[0,0,0,0,0], :nothing), GEWC12),
(RootKey(QQFieldElem[-1, 1],QQFieldElem[0,0], :nothing), GEWZ1),
(RootKey(QQFieldElem[1, 1],QQFieldElem[0,0], :nothing), GEWY1),
(RootKey(QQFieldElem[-1, 0, 1],QQFieldElem[0,0,0], :nothing), GEWZ2),
(RootKey(QQFieldElem[1, 0, 1],QQFieldElem[0,0,0], :nothing), GEWY2),
(RootKey(QQFieldElem[1, 1, 1],QQFieldElem[0,0,0], :nothing), GEWC3),
(RootKey(QQFieldElem[1, -1, 1],QQFieldElem[0,0,0], :nothing), GEWC6),
(RootKey(QQFieldElem[-1, 0, 0, 1],QQFieldElem[0,0,0,0], :nothing), GEWZ3),
(RootKey(QQFieldElem[1, 0, 0, 1],QQFieldElem[0,0,0,0], :nothing), GEWY3),
(RootKey(QQFieldElem[-1, 0, 0, 0, 1],QQFieldElem[0,0,0,0,0], :nothing), GEWZ4),
(RootKey(QQFieldElem[1, 0, 0, 0, 1],QQFieldElem[0,0,0,0,0], :nothing), GEWY4),
(RootKey(QQFieldElem[2], QQFieldElem[0], :nothing),EW2),
(RootKey(QQFieldElem[3], QQFieldElem[0], :nothing),EW3),
(RootKey(QQFieldElem[4], QQFieldElem[0], :nothing),EW4),
(RootKey(QQFieldElem[-1, 0, 0, 0, 1], QQFieldElem[0, 1, 0, -1, 0], Symbol("sqrt(2)")),GEWC8ppZ2),
(RootKey(QQFieldElem[-1, 0, 0, 0, 1], QQFieldElem[0, -1, 0, 1, 0],Symbol("sqrt(2)")),GEWC8pZ2),
(RootKey(QQFieldElem[1, 0, 1], QQFieldElem[0, 1, 0],Symbol("sqrt(3)")),GEWC12pp),
(RootKey(QQFieldElem[1, 0, 1, 0, 1],QQFieldElem[0, -1, 0, -1, 0],Symbol("sqrt(2)")),GEWC24pp),
(RootKey(QQFieldElem[1, 0, 1], QQFieldElem[0, -1, 0],Symbol("sqrt(2)")),GEWC8pp),
(RootKey(QQFieldElem[1, 0, 1], QQFieldElem[0, -1, 0],Symbol("sqrt(3)")),GEWC12p),
(RootKey(QQFieldElem[1, 0, 1, 0, 1], QQFieldElem[0, 1, 0, 1, 0],Symbol("sqrt(2)")),GEWC24p),
(RootKey(QQFieldElem[1, 0, 1], QQFieldElem[0, 1, 0], Symbol("sqrt(2)")) ,GEWC8p),
(RootKey(QQFieldElem[1], QQFieldElem[0], :nothing),ONE),
(RootKey(QQFieldElem[], QQFieldElem[], :nothing),NUL)])

#return matching root for order, given as polynomial
function root(base::T) where T<:PolyRingElem
	key = rootkey(base)
	if haskey(roots,key)
		re = roots[key]
	else
		key.d = :nothing
		if haskey(roots,key)
			re = roots[key]
		else
			re = Root("ζ($base)","\\zeta_{$(repr("text/latex",base))}")
			roots[key] = re
		end
	end
	return re
end

# types for representing Cyclotomic in Primitive Root format
struct Zeta{T}
	modulus::T
	zetas::Dict{T,FracPoly{T}}
	rootformat::Bool
end
function Base.show(io::IO, z::Zeta)
	if isempty(z.zetas)
		print(io, z.modulus)
	else
		if z.rootformat
			mainpart=join(map(pair -> "$(root(pair[1]).str)^($(pair[2]))", collect(z.zetas))," * ")		
			print(io, "($(z.modulus)) * $mainpart")
		else
			mainpart=join(map(pair -> "ζ_($(pair[1]))^($(pair[2]))", collect(z.zetas))," * ")		
			print(io, "($(z.modulus)) * $mainpart")
		end
	end
end
function Base.show(io::IO, m::MIME{Symbol("text/latex")}, z::Zeta)
	if isempty(z.zetas)
		show(io,MIME("text/latex"),z.modulus)
	else
		if z.rootformat
			mainpart=join(map(pair -> "{$(root(pair[1]).tex)}^{\\left($(repr("text/latex",pair[2]))\\right)}", collect(z.zetas))," ")	
			coeffs = collect(coefficients(z.modulus))
			if isone(length(coeffs[coeffs.!=0]))
				if isone(z.modulus)
					print(io, mainpart)
				else
					print(io, "$(repr("text/latex", z.modulus)) $mainpart")
				end
			else
				print(io, "\\left($(repr("text/latex", z.modulus))\\right) \\cdot $mainpart")
			end
		else
			mainpart=join(map(pair -> "\\zeta_{$(repr("text/latex",pair[1]))}^{$(repr("text/latex",pair[2]))}", collect(z.zetas)))		
			coeffs = collect(coefficients(z.modulus))
			if isone(length(coeffs[coeffs.!=0]))
				if isone(z.modulus)
					print(io, mainpart)
				else
					print(io, "$(repr("text/latex", z.modulus)) $mainpart")
				end
			else
				print(io, "\\left($(repr("text/latex", z.modulus))\\right) \\cdot $mainpart")
			end
		end
	end
end

struct ZetaSum{T}
	summands::Vector{Zeta{T}}
end
Base.show(io::IO, z::ZetaSum) = print(io, join(z.summands, " + "))
Base.show(io::IO, m::MIME{Symbol("text/latex")}, z::ZetaSum) = print(io, join(repr.("text/latex", z.summands), " + "))

struct ZetaFrac{T}
	numerator::ZetaSum{T}
	denominator::ZetaSum{T}
end

Base.show(io::IO, z::ZetaFrac) = print(io, "($(z.numerator))  //  ($(z.denominator))")
Base.show(io::IO, m::MIME{Symbol("text/latex")}, z::ZetaFrac) = print(io, "\\frac{$(repr("text/latex", z.numerator))}{$(repr("text/latex",z.denominator))}")

function ordexp(b::Generic.FracFieldElem{QQPolyRingElem})
	num, den = numerator(b), denominator(b)
	d = lcm(denominator.(collect(coefficients(num))))
	return num*d, den*d	
end
function ordexp(b::Generic.FracFieldElem{Generic.Poly{AbsSimpleNumFieldElem}})
	num, den = numerator(b), denominator(b)
	d = lcm(denominator.(coeff.(collect(coefficients(num)),0)))
	return num*d, den*d
end

"""
    zeta(a::Cyclotomic, rootformat::Bool=false)

Return `a` as an expression of primitive roots with whole exponents.

Set `rootformat=true` for using the format of primitive roots as in chevie.
```jldoctest
julia> R, q = polynomial_ring(QQ, \"q\");

julia> Q = fraction_field(R);

julia> S = universal_polynomial_ring(Q);

julia> i, j = gens(S, [\"i\", \"j\"]);

julia> f = e2p(1//(q-1)*i+j)+ e2p(1//(q - 1)*i*j^2 + 1//(q - 1)*j)
(1) * exp(2π𝑖(1//(q - 1)*i))

julia> zeta(f)
(1) * ζ_(q - 1)^(i*j^2 + j) + (1) * ζ_(q - 1)^(i)

julia> zeta(f,true)
(1) * ζ₁^(i*j^2 + j) + (1) * ζ₁^(i)

```
"""
function zeta(a::GenericCharacterTables.Cyclo{T}, rootformat::Bool=false) where T<:PolyRingElem
	zetas = Dict{T,FracPoly{T}}()
	for (coeff, monomial) in zip(coefficients(a.argument), monomials(a.argument)) 
		exponent, order = ordexp(coeff)
		if haskey(zetas, order)
			zetas[order] += exponent*monomial
		else
			zetas[order] = exponent*monomial
		end
	end
	# for (order, exponent) in zetas
	# 	d=lcm(denominator.(coeff.(reduce(vcat,transpose.(collect.(coefficients.(    )))),0)))
	# end
	return Zeta{T}(a.modulus,zetas, rootformat)
end
function zeta(a::GenericCharacterTables.CycloSum{T}, rootformat::Bool=false) where T<:PolyRingElem
	return ZetaSum{T}(zeta.(a.summands, Ref(rootformat)))
end
function zeta(a::GenericCharacterTables.CycloFrac{T}, rootformat::Bool=false) where T<:PolyRingElem
	return ZetaFrac{T}(zeta(a.numerator, a.rootformat),zeta(a.denominator, a.rootformat))
end
if pkgversion(Oscar.AbstractAlgebra) >= v"0.42.0"
	const ZZUPoly = Generic.UnivPoly{ZZRingElem}
	const UPoly = Generic.UnivPoly{QQFieldElem}
	const UPolyRing = Generic.UniversalPolyRing{QQFieldElem}
	const univ_poly_change_base_ring = change_base_ring
else
	const ZZUPoly = Generic.UnivPoly{ZZRingElem, Generic.MPoly{ZZRingElem}}
	const UPoly = Generic.UnivPoly{QQFieldElem, Generic.MPoly{QQFieldElem}}
	const UPolyRing = Generic.UniversalPolyRing{QQFieldElem, Generic.MPoly{QQFieldElem}}

	function Oscar.AbstractAlgebra.evaluate(f::FracElem{T}, vars::Vector{Int}, vals::Vector{U}) where {T <: RingElement, U <: RingElement}
		 return evaluate(numerator(f), vars, vals)//evaluate(denominator(f), vars, vals)
	end

	function Oscar.AbstractAlgebra.check_parent(a, b, throw::Bool = true)
	   flag = parent(a) === parent(b)
	   flag || !throw || error("parents do not match")
	   return flag
	end

	# for compat with Oscar 1.0: workaround for broken change_base_ring (this
	# was fixed in a subsequent AA release)
	function univ_poly_change_base_ring(R, f; cached::Bool=true)
		Rx = parent(f)
		P = Generic.MPolyRing{elem_type(R)}(R, symbols(Rx), internal_ordering(Rx), cached)
		S = universal_polynomial_ring(R; internal_ordering=internal_ordering(Rx), cached)
		S.S = deepcopy(symbols(Rx))
		S.mpoly_ring = P
		return change_base_ring(R, f, parent=S)
	end
end
const UPolyFrac = Generic.FracFieldElem{UPoly}
const UPolyFracRing = Generic.FracField{UPoly}

if isdefined(Oscar,:is_terse)  # for compat with Oscar 1.0
	import Oscar: is_terse
else
	is_terse(io::IO) = get(io, :supercompact, false)::Bool
end

@doc raw"""
    kempner_with_data(m::Int64)

Return the `m`-th Kempner number, the associated Kempner schemes and a factorization of `m`.

# Examples
```jldoctest
julia> kempner_with_data(12)
(4, Dict(2 => [1, 3], 3 => [1]), 1 * 2^2 * 3)

```
"""
function kempner_with_data(m::Int64)
	# factor m for later use
	factorization=factor(m)

	# compute m-th Kempner number by using the schemes introduced by Kempner
	# these schemes can later be reused to compute reductions of m
	schemes=Dict{Int64, Vector{Int64}}()
	for (p,a) in factorization
		multiple=p
		exponent=1
		schemes[p]=Int64[exponent]
		while exponent < a
			multiple+=p
			exponent+=valuation(multiple, p)
			push!(schemes[p], exponent)
		end
	end
	if isone(m)
		K_m=0
	else
		K_m=maximum((length(scheme)*p for (p,scheme) in schemes))
	end

	return (K_m, schemes, factorization)
end

@doc raw"""
    kempner(m::Int64)

Return the minimal non-negative integer `k` such that `k!` is a multiple of `m`. This is called the `m`-th Kempner number.
Details about the Kempner numbers and how to compute them can be found in [Kem21](@cite).

# Examples
```jldoctest
julia> kempner(12)
4

```
"""
kempner(m::Int64) = kempner_with_data(m)[1]

@doc raw"""
    normal_form(f::ZZUPoly, m::Int64)

Return a normal form of `f` modulo `m`, such that `normal_form(f,m)` is equal
to `normal_form(g,m)` if and only if `f` and `g` are congruent modulo `m`.

# Examples
```jldoctest
julia> R=universal_polynomial_ring(ZZ);

julia> x=gen(R, :x);

julia> normal_form(4*x^2,6)
x^2 + 3*x

julia> normal_form(4*x^2-(x^2+3*x),6)
0

julia> normal_form(4*x^9+x^7,12)
x^3 + 4*x

julia> normal_form(4*x^9+x^7-(x^3+4*x),12)
0

```
"""
function normal_form(f::ZZUPoly, m::Int64)
	if m < 1
		throw(DomainError(m, "A normal form for non-positive moduli is not defined!"))
	end
	R=parent(f)
	if is_constant(f)
		return R(mod(constant_coefficient(f),m))
	end
	# find the variable with highest index occurring in f
	i=findlast(x -> degree(f,x)>0, gens(R))
	x_i=R[i]

	# save Kempner schemes to be reused to compute reductions of m
	K_m,schemes,factorization=kempner_with_data(m)

	# reduce by the K(m)-th rising factorial of x_i
	S=rising_factorial(x_i, K_m)
	f=mod(f,S)

	for k in reverse(0:(K_m-1))
		# compute the reduction of m by k by reusing the schemes
		reduction=1
		for (p,scheme) in schemes
			q=div(k,p)
			if iszero(q)
				reduction*=p^factorization[p]
			elseif q <= length(scheme)
				exponent=factorization[p]-scheme[q]
				if exponent > 0
					reduction*=p^exponent
				end
			end
		end

		# reduce coefficient of x_i^k
		S_ik=rising_factorial(x_i, k)
		C_ik=coeff(f,[x_i],[k])
		c=normal_form(C_ik, reduction)
		f-=(C_ik-c)*S_ik
	end
	return f
end

strip_zeros!(f::Dict{UPolyFrac, UPoly}) = filter!(p->!iszero(p.second), f)

@doc raw"""
    GenericCycloRing <: Ring

The ring of generic cyclotomic numbers.

# Examples
```jldoctest
julia> R = universal_polynomial_ring(QQ; cached=false);

julia> q = gen(R, "q");

julia> S = generic_cyclotomic_ring(R)
Generic cyclotomic ring
  over Rational field
  dependent on q
```
"""
mutable struct GenericCycloRing <: Ring
	base_ring::UPolyRing
	congruence::Union{Tuple{ZZRingElem, ZZRingElem}, Nothing}
end

@doc raw"""
    GenericCyclo <: RingElem

The type for generic cyclotomic numbers.

# Examples
```jldoctest
julia> R = universal_polynomial_ring(QQ; cached=false);

julia> q = gen(R, "q");

julia> S = generic_cyclotomic_ring(R);

julia> S(q; exponent=1//(q-1))
q*exp(2π𝑖(1//(q - 1)))
```
"""
mutable struct GenericCyclo <: RingElem
	f::Dict{UPolyFrac, UPoly}
	parent::GenericCycloRing
end

# Data type and parent object methods

parent_type(::Type{GenericCyclo}) = GenericCycloRing

elem_type(::Type{GenericCycloRing}) = GenericCyclo

base_ring_type(::Type{GenericCycloRing}) = UPolyRing

base_ring(R::GenericCycloRing) = R.base_ring::base_ring_type(typeof(R))

parent(f::GenericCyclo) = f.parent

is_domain_type(::Type{GenericCyclo}) = false

is_exact_type(::Type{GenericCyclo}) = true

function hash(x::GenericCyclo, h::UInt)
	r = 0x65125ab8e0cd44ca  # TODO Use a different hash this is the one from AA's example.
	return xor(r, hash(x.f, h))
end

function deepcopy_internal(x::GenericCyclo, dict::IdDict)
	return GenericCyclo(deepcopy_internal(x.f, dict), parent(x))
end

# Basic manipulation

zero(R::GenericCycloRing) = R()

one(R::GenericCycloRing) = R(1)

iszero(x::GenericCyclo) = isempty(x.f)

isone(x::GenericCyclo) = isone(length(x.f)) && isone(get(x.f, base_ring(parent(x))(0)//base_ring(parent(x))(1), 0))  # TODO Is there a better way?

function is_unit(x::GenericCyclo) # TODO There could be more units than this.
	if isone(length(x.f))
		c=collect(x.f)[1][2]
		return is_unit(c)
	end
	return false
end

characteristic(R::GenericCycloRing) = characteristic(base_ring(R))

# Canonical unit

canonical_unit(x::GenericCyclo) = parent(x)(1)  # TODO We need to know more about the units to improve this.

# String I/O

function show(io::IO, ::MIME"text/plain", R::GenericCycloRing)
	io = pretty(io)
	println(io, "Generic cyclotomic ring", Indent())
	println(io, "over ", base_ring(base_ring(R)))
	print(io, "dependent on ", join(gens(base_ring(R)), ", "))
	if R.congruence !== nothing
		print(io, "\nwhere ", gen(base_ring(R), 1), " is congruent to ", R.congruence[1], " modulo ", R.congruence[2])
	end
end

function show(io::IO, R::GenericCycloRing)
	print(io, "Generic cyclotomic ring")
	if !is_terse(io)
		print(io, " over ", base_ring(base_ring(R)))
	end
end

function show(io::IO, x::GenericCyclo)  # TODO Use OSCAR's expressify system here.
	if iszero(x)
		print(io, "0")
		return
	end
	for (i, (argument, modulus)) in enumerate(x.f)
		if iszero(argument)
			print(io, modulus)
		elseif isone(modulus)
			print(io, "exp(2π𝑖($(argument)))")
		elseif is_monomial(modulus)
			print(io, "$(modulus)*exp(2π𝑖($(argument)))")
		else
			print(io, "($(modulus))*exp(2π𝑖($(argument)))")
		end
		if i < length(x.f)
			print(io, " + ")
		end
	end
end

# Unary operations

function -(x::GenericCyclo)
	f=deepcopy(x.f)
	map!(-, values(f))
	return parent(x)(f, simplify=false)
end

function conj(x::GenericCyclo)
	f=Dict{UPolyFrac, UPoly}()
	for (key,value) in x.f
		f[-key]=value
	end
	return parent(x)(f)
end

# Binary operations

function +(x::GenericCyclo, y::GenericCyclo)
	check_parent(x, y)
	f=mergewith(+, x.f, y.f)
	strip_zeros!(f)
	return parent(x)(f)
end

-(x::GenericCyclo, y::GenericCyclo) = x+(-y)  # TODO make this more efficient?

function *(x::GenericCyclo, y::GenericCyclo)
	check_parent(x, y)
	f = Dict{UPolyFrac, UPoly}()
	for (key1,value1) in x.f
		for (key2,value2) in y.f
			key=key1+key2
			if haskey(f, key)
				f[key]+=value1*value2
			else
				f[key]=value1*value2
			end
		end
	end
	return parent(x)(f)
end

+(x::UPoly, y::GenericCyclo) = parent(y)(x)+y

+(x::GenericCyclo, y::UPoly) = y+x

-(x::UPoly, y::GenericCyclo) = parent(y)(x)-y

-(x::GenericCyclo, y::UPoly) = x-parent(x)(y)

*(x::UPoly, y::GenericCyclo) = parent(y)(x)*y

*(x::GenericCyclo, y::UPoly) = y*x

# Comparison

function ==(x::GenericCyclo, y::GenericCyclo)  # TODO Make compatible with hashes. There might be some missing theory...
	check_parent(x, y)
	return iszero(x-y)
end

# Exact division

function divexact(x::GenericCyclo, y::GenericCyclo; check::Bool = true)  # TODO We need more theory to implement this.
	check_parent(x, y)
	throw(ArgumentError("not an exact division"))
end


# Inverse

function inv(x::GenericCyclo)  # TODO see is_unit.
	if isone(length(x.f))
		expo,c=collect(x.f)[1]
		return parent(x)(Dict(-expo => inv(c)))
	end
	throw(ArgumentError("Inverse is unknown"))
end

# Unsafe operators

function zero!(x::GenericCyclo)
	x.f = Dict{UPolyFrac, UPoly}()
	return x
end

mul!(x::GenericCyclo, y::GenericCyclo, z::GenericCyclo) = y*z

function add!(x::GenericCyclo, y::GenericCyclo, z::GenericCyclo)
	if x === z
		y,z=z,y
	elseif x !== y
		x.f = deepcopy(y.f)
	end
	mergewith!(+, x.f, z.f)
	strip_zeros!(x.f)
	return x
end

# Random generation

RandomExtensions.maketype(R::GenericCycloRing, _) = elem_type(R)

rand(rng::AbstractRNG, sp::SamplerTrivial{<:Make2{GenericCyclo,GenericCycloRing}}) = sp[][1](rand(rng, sp[][2]))

rand(rng::AbstractRNG, R::GenericCycloRing, n::AbstractUnitRange{Int}) = R(rand(rng, n))

rand(R::GenericCycloRing, n::AbstractUnitRange{Int}) = rand(Random.GLOBAL_RNG, R, n)

# Promotion rules

promote_rule(::Type{GenericCyclo}, ::Type{GenericCyclo}) = GenericCyclo

promote_rule(::Type{GenericCyclo}, ::Type{UPoly}) = GenericCyclo

function promote_rule(::Type{GenericCyclo}, ::Type{T}) where T <: RingElement
	promote_rule(T, UPoly) == T ? GenericCyclo : Union{}
end

# Constructors

(R::GenericCycloRing)() = GenericCyclo(Dict{UPolyFrac, UPoly}(), R)

function (R::GenericCycloRing)(c::Union{Integer, Rational})
	if iszero(c)
		return R()
	end
	return GenericCyclo(Dict(base_ring(R)()//base_ring(R)(1) => base_ring(R)(c)), R)
end

function (R::GenericCycloRing)(c::UPoly)
	base_ring(R) != parent(c) && error("Unable to coerce element")
	return GenericCyclo(Dict(base_ring(R)()//base_ring(R)(1) => c), R)
end

function (R::GenericCycloRing)(x::RingElement; exponent::UPolyFrac)
	return R(Dict(exponent => base_ring(R)(x)))
end

function (R::GenericCycloRing)(f::Dict{UPolyFrac, UPoly}; simplify::Bool=true)  # TODO check parent rings?
	if !simplify
		return GenericCyclo(f, R)
	end

	# congruence preparation
	if R.congruence !== nothing
		q=gen(base_ring(R), 1)
		substitute=R.congruence[2]*q+R.congruence[1]
		substitute_inv=(q-R.congruence[1])*1//R.congruence[2]
	end

	# reduce numerators modulo denominators
	L=NTuple{4, UPoly}[]
	for (g,c) in f
		if !iszero(c)
			if R.congruence === nothing
				gp=g
			else
				gp=evaluate(numerator(g), [1], [substitute])//evaluate(denominator(g), [1], [substitute])
			end
			a,r=divrem(numerator(gp),denominator(gp))
			push!(L,(c,denominator(gp),r,a))
		end
	end

	# return early if `L` is empty
	if isempty(L)
		return R()
	end

	# find the common denominator of the exponents
	# TODO where did the denominator method for polynomials go?
	# TODO why is lcm of empty list not defined?
	denominators=[denominator(c) for (_,_,_,a) in L for c in coefficients(a)]
	if isempty(denominators)
		d=ZZ(1)
	else
		d=lcm(denominators)
	end

	# check if d fits into an Int64 as it needs to be an Int64 later
	if !fits(Int64, d)
		throw(OverflowError("Denominators are too big!"))
	end
	d=Int64(d)

	fp=Dict{UPolyFrac, UPoly}()
	for (c,g_2,r,a) in L
		# normalize the polynomial part of the exponent
		ap=normal_form(univ_poly_change_base_ring(ZZ,d*a), d)

		# normalize the constant part
		t=constant_coefficient(ap)
		app=change_base_ring(base_ring(base_ring(R)), ap-t, parent=base_ring(R))
		S,x=ZZ[:x]
		p=mod(x^t,cyclotomic_polynomial(d,S))

		# distribute the normalized constant part
		for (i,cp) in enumerate(coefficients(p))
			tp=i-1
			g=1//d*app+r//g_2+tp//d
			if R.congruence === nothing
				gp=g
			else
				gp=evaluate(numerator(g), [1], [substitute_inv])//evaluate(denominator(g), [1], [substitute_inv])
			end
			if haskey(fp,gp)
				fp[gp]+=cp*c
			else
				fp[gp]=cp*c
			end
		end
	end
	return GenericCyclo(filter(p -> !iszero(p.second), fp), R)
end

function (R::GenericCycloRing)(x::GenericCyclo)
	S=parent(x)
	if R == S
		return x
	end
	if base_ring(R) == base_ring(S)
		if S.congruence === nothing || iszero((R.congruence[1]-S.congruence[1])%S.congruence[2]) && iszero(R.congruence[2]%S.congruence[2])
			return R(x.f)
		end
	end
	error("Unable to coerce element")
end

# Parent constructor

# TODO Maybe don't require at least one variable?
function generic_cyclotomic_ring(R::UPolyRing; congruence::Union{Tuple{ZZRingElem, ZZRingElem}, Nothing}=nothing, cached::Bool=true)
	length(gens(R)) < 1 && error("At least one free variable is needed")
	return GenericCycloRing(R, congruence)
end

# evaluate

function evaluate(x::GenericCyclo, vars::Vector{Int64}, vals::Vector{<:RingElement})
	f = Dict{UPolyFrac, UPoly}()
	for (key,value) in x.f
		new_key=evaluate(key, vars, vals)
		if haskey(f, new_key)
			f[new_key]+=evaluate(value, vars, vals)
		else
			f[new_key]=evaluate(value, vars, vals)
		end
	end
	return parent(x)(f)
end

function divexact(x::GenericCyclo, y::UPoly; check::Bool=true)
	f=deepcopy(x.f)
	map!(p -> divexact(p,y,check=check), values(f))
	return parent(x)(f)
end

export tensor!, omega!, lincomb, lincomb!, speccharparam!, specclassparam!

# TODO deal with ParameterSubstitution, this is not done in the original implementation.

function Base.:*(char1::GenericCharacter{T}, char2::GenericCharacter{T}) where T<:PolyRingElem
	if parent(char1) != parent(char2)
		throw(DomainError((parent(char1),parent(char2)), "Tables do not match."))
	end
	t=parent(char1)
	char1id=chartypeid(char1)
	char2id=chartypeid(char2)
	if iszero(char1id) || iszero(char2id)
		throw(DomainError((char1,char2), "Characters are not both irreducible."))
	end
	new_char_degree=char1.degree*char2.degree
	new_char_values=Vector{CycloSum{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		# The first 4 variable sets are reserved for the computations in Ortho.jl
		# so we can use the 5th and 6th set here.
		val1=shift_char_parameters(t, char1[class], 4)
		val2=shift_char_parameters(t, char2[class], 5)
		new_char_values[class]=simplify(val1*val2, t)
	end
	param1 = shift_char_parameters(t, char1.params, 4)
	param2 = shift_char_parameters(t, char2.params, 5)
	new_char_params=Parameters(vcat(param1.params, param2.params), vcat(param1.exceptions, param2.exceptions), ParameterSubstitution{T}[])
	return GenericCharacter{T}(t, new_char_values, ["Tensor of type $char1id and $char2id"], new_char_degree, nothing, new_char_params)
end
function Base.:*(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T<:PolyRingElem
	if parent(char1) != parent(char2)
		throw(DomainError((parent(char1),parent(char2)), "Tables do not match."))
	end
	t=parent(char1)
	char1id=chartypeid(char1)
	char2id=chartypeid(char2)
	if iszero(char1id) || iszero(char2id)
		throw(DomainError((char1,char2), "Characters are not both irreducible."))
	end
	new_char_degree=char1.degree*char2.degree
	new_char_values=Vector{T}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=char1[class]*char2[class]
	end
	return SimpleGenericCharacter{T}(t, new_char_values, ["Tensor of type $char1id and $char2id"], new_char_degree)
end

@doc raw"""
    tensor!(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly

Append the tensor product of the character types `char1` and `char2` to the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> tensor!(g,1,2)
5

julia> printinfochar(g,5)
5	["Tensor of type 1 and 2"]

```
"""
function tensor!(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Some character types are out of range."))
	end
	push!(t.chars, t[char1]*t[char2])
	return length(t.chars)
end

@doc raw"""
    omega!(t::Table{T}, char::Int64) where T <: NfPoly

Append the (generic) central character of the character type `char` to the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> omega!(g,1)
5

julia> printinfochar(g,5)
5	["Omega of type 1"]

```
"""
function omega!(t::CharTable{T}, char::Int64) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	new_char_degree=t.modulusring(1)
	new_char_values=Vector{CycloFrac{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=t.classlength[class]*t[char,class]//t[char].degree
	end
	new_char=GenericCharacter{T}(t, new_char_values, ["Omega of type $char"], new_char_degree, nothing, t[char].params)
	push!(t.chars, new_char)
	return length(t.chars)
end
function omega!(t::SimpleCharTable{T}, char::Int64) where T <: NfPoly  # TODO is correct?
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	new_char_degree=t.ring(1)
	new_char_values=Vector{T}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=div(t.classlength[class]*t[char,class], t[char].degree)
	end
	new_char=SimpleGenericCharacter{T}(t, new_char_values, ["Omega of type $char"], new_char_degree)
	push!(t.chars, new_char)
	return length(t.chars)
end

@doc raw"""
    lincomb(coeffs::Vector{Int64}, chars::Vector{AbstractGenericCharacter{T}}) where T <: NfPoly

Return the linear combination of the character types `chars` with coefficients `coeffs`.
"""
function lincomb(coeffs::Vector{Int64}, chars::Vector{GenericCharacter{T}}) where T <: NfPoly
	if length(coeffs)!=length(chars)
		throw(DomainError((coeffs,chars), "Different number of coefficients and character types."))
	end
	n=length(coeffs)
	t=parent(chars[1])
	for char in chars[2:end]
		if parent(char) != t
			throw(DomainError(parent(char), "Tables do not match."))
		end
	end
	charids=Vector{Int64}(undef, n)
	for i in 1:n
		charids[i]=chartypeid(chars[i])
		if iszero(charids[i])
			throw(DomainError(chars[i], "Character is not irreducible."))
		end
	end
	S=t.argumentring
	# There a 6 pre defined variable sets used in Ortho.jl and for tensor products.
	extra_var_batches=nvars(S)÷nrparams(t)-6
	missing_var_batches=n-extra_var_batches
	if missing_var_batches > 0
		vars=map(x -> String(x), symbols(S)[1:nrparams(t)]).*"l"
		for i in range(1, missing_var_batches)
			gens(S, vars.*string(i))
		end
	end
	coeffs=map(x -> t.modulusring(x), coeffs)  # TODO modulusring needed?
	degrees=map(x -> x.degree, chars)
	new_char_degree=sum(coeffs.*degrees)
	new_char_values=Vector{CycloSum{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=t.modulusring(0)*e2p(t.argumentring(0))
		for i in range(1, n)
			new_char_values[class]+=shift_char_parameters(t, coeffs[i]*chars[i][class], 5+i)
		end
	end
	info=join(map(x -> join(x, " * type "), zip(coeffs, charids)), " + ")  # TODO
	params=Vector{Parameters{T}}(undef, n)
	for i in range(1, n)
		params[i]=shift_char_parameters(t, chars[i].params, 5+i)
	end
	new_char_params=Parameters(vcat(map(x -> x.params, params)...), vcat(map(x -> x.exceptions, params)...), ParameterSubstitution{T}[])
	return GenericCharacter{T}(t, new_char_values, ["Lincomb $info"], new_char_degree, nothing, new_char_params)
end
function lincomb(t::SimpleCharTable{T}, coeffs::Vector{Int64}, chars::Vector{Int64}) where T <: NfPoly
	if length(coeffs)!=length(chars)
		throw(DomainError((coeffs,chars), "Different number of coefficients and character types."))
	end
	n=length(coeffs)
	t=parent(chars[1])
	for char in chars[2:end]
		if parent(char) != t
			throw(DomainError(parent(char), "Tables do not match."))
		end
	end
	charids=Vector{Int64}(undef, n)
	for i in 1:n
		charids[i]=chartypeid(chars[i])
		if iszero(charids[i])
			throw(DomainError(chars[i], "Character is not irreducible."))
		end
	end
	coeffs=map(x -> t.ring(x), coeffs)  # TODO ring needed?
	degrees=map(x -> x.degree, chars)
	new_char_degree=sum(coeffs.*degrees)
	new_char_values=Vector{T}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=t.ring(0)
		for i in range(1, n)
			new_char_values[class]+=coeffs[i]*chars[i][class]
		end
	end
	info=join(map(x -> join(x, " * type "), zip(coeffs, charids)), " + ")  # TODO
	return SimpleGenericCharacter{T}(t, new_char_values, ["Lincomb $info"], new_char_degree)
end

@doc raw"""
    lincomb!(t::Table{T}, coeffs::Vector{Int64}, chars::Vector{Int64}) where T <: NfPoly

Append the linear combination of the character types `chars` with coefficients `coeffs` to the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> lincomb!(g,[5,1],[1,2])
5

julia> printinfochar(g,5)
5	["Lincomb 5 * type 1 + 1 * type 2"]

```
"""
function lincomb!(t::Table{T}, coeffs::Vector{Int64}, chars::Vector{Int64}) where T <: NfPoly
	if any(chars.>chartypes(t))
		throw(DomainError(chars, "Some character types are out of range."))
	end
	new_char=lincomb(coeffs, [t[i] for i in chars])
	push!(t.chars, new_char)
	return length(t.chars)
end

@doc raw"""
    speccharparam!(t::CharTable{T}, char::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly

Replace the parameter `var` with `expr` in the character type `char`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printval(g,char=1)
Value of character type 1 on class type
  1: exp(2π𝑖(2//(q - 1)*i*k))
  2: exp(2π𝑖(2//(q - 1)*i*k))
  3: exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*k))
  4: exp(2π𝑖(1//(q - 1)*i*k))

julia> q,(i,j,l,k) = params(g);

julia> speccharparam!(g, 1, i, q)

julia> printval(g,char=1)
Value of character type 1 on class type
  1: exp(2π𝑖(2//(q - 1)*k))
  2: exp(2π𝑖(2//(q - 1)*k))
  3: exp(2π𝑖(1//(q - 1)*j*k + 1//(q - 1)*k))
  4: exp(2π𝑖(1//(q - 1)*k))
```
"""
function speccharparam!(t::CharTable{T}, char::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	if !is_gen(var)
		throw(DomainError(var, "Not a single variable."))
	end
	for class in range(1,classtypes(t))
		t[char,class]=simplify(eesubs(t[char,class], [var], [expr]), t)
	end
	push!(t[char].params.substitutions, ParameterSubstitution(var, t.argumentring(expr)))
	return nothing
end

@doc raw"""
    specclassparam!(t::CharTable{T}, class::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly

Replace the parameter `var` with `expr` in the class type `class`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printval(g,class=1)
Value of character type 1 on class type
  1: exp(2π𝑖(2//(q - 1)*i*k))
Value of character type 2 on class type
  1: q*exp(2π𝑖(2//(q - 1)*i*k))
Value of character type 3 on class type
  1: (q + 1)*exp(2π𝑖(1//(q - 1)*i*l + 1//(q - 1)*i*k))
Value of character type 4 on class type
  1: (q - 1)*exp(2π𝑖(1//(q - 1)*i*k))

julia> q,(i,j,l,k) = params(g);

julia> specclassparam!(g, 1, k, 3)

julia> printval(g,class=1)
Value of character type 1 on class type
  1: exp(2π𝑖(6//(q - 1)*i))
Value of character type 2 on class type
  1: q*exp(2π𝑖(6//(q - 1)*i))
Value of character type 3 on class type
  1: (q + 1)*exp(2π𝑖(1//(q - 1)*i*l + 3//(q - 1)*i))
Value of character type 4 on class type
  1: (q - 1)*exp(2π𝑖(3//(q - 1)*i))
```
"""
function specclassparam!(t::CharTable{T}, class::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	if !is_gen(var)
		throw(DomainError(var, "Not a single variable."))
	end
	for char in range(1,chartypes(t))
		t[char,class]=simplify(eesubs(t[char,class], [var], [expr]), t)
	end
	push!(t.classparams[class].substitutions, ParameterSubstitution(var, t.argumentring(expr)))
	return nothing
end

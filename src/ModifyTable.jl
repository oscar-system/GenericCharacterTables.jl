import Oscar: tensor_product

export tensor_product, tensor!, omega, omega!, lincomb, lincomb!, specialize, specclassparam!

# TODO deal with ParameterSubstitution, this is not done in the original implementation.

@doc raw"""
    tensor_product(char1::T, char2::T) where T <: AbstractGenericCharacter

Return the tensor product of the character types `char1` and `char2`.
This can also be obtained via `char1 * char2`.

# Examples
```jldoctest
julia> g = genchartab("GL2");

julia> tensor_product(g[1], g[2])
Generic character of GL2
  with parameters
    kt1 ∈ {1,…, q - 1}, kt2 ∈ {1,…, q - 1}
  of degree q
  with values
    q*exp(2π𝑖(2//(q - 1)*i*kt1 + 2//(q - 1)*i*kt2))
    0
    exp(2π𝑖(1//(q - 1)*i*kt1 + 1//(q - 1)*i*kt2 + 1//(q - 1)*j*kt1 + 1//(q - 1)*j*kt2))
    -1*exp(2π𝑖(1//(q - 1)*i*kt1 + 1//(q - 1)*i*kt2))
```
"""
function tensor_product(char1::GenericCharacter{T}, char2::GenericCharacter{T}) where T<:PolyRingElem
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

function tensor_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T<:PolyRingElem
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

# 'classical' group characters in OSCAR treat '*' as tensor product, so we do it, too
Base.:*(char1::AbstractGenericCharacter, char2::AbstractGenericCharacter) = tensor_product(char1, char2)


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
	push!(t.chars, tensor_product(t[char1], t[char2]))
	return length(t.chars)
end

@doc raw"""
    omega(char::T) where T <: AbstractGenericCharacter

Return the (generic) central character of the character type `char`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> omega(g[1])
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}
  of degree 1
  with values
    exp(2π𝑖(2//(q - 1)*i*k))
    (q^2 - 1)*exp(2π𝑖(2//(q - 1)*i*k))
    (q^2 + q)*exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*k))
    (q^2 - q)*exp(2π𝑖(1//(q - 1)*i*k))

```
"""
function omega(char::GenericCharacter{T}) where T <: NfPoly
	t=parent(char)
	charid=chartypeid(char)
	new_char_degree=t.modulusring(1)
	new_char_values=Vector{CycloFrac{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=t.classlength[class]*char[class]//char.degree
	end
	return GenericCharacter{T}(t, new_char_values, ["Omega of type $charid"], new_char_degree, nothing, char.params)
end
function omega(char::SimpleGenericCharacter{T}) where T <: NfPoly  # TODO is correct?
	t=parent(char)
	charid=chartypeid(char)
	new_char_degree=t.ring(1)
	new_char_values=Vector{T}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=div(t.classlength[class]*char[class], char.degree)
	end
	return SimpleGenericCharacter{T}(t, new_char_values, ["Omega of type $charid"], new_char_degree)
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
function omega!(t::Table{T}, char::Int64) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	push!(t.chars, omega(t[char]))
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
		new_char_values[class]=CycloSum(t.modulusring(0), t.argumentring(0))
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
    specialize(char::GenericCharacter{T}, var::FracPoly{T}, expr::RingElement) where T <: NfPoly

Return the generic character where the parameter `var` is replaced with `expr` in `char`.

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

julia> specialize(g[1], i, q)
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}, substitutions: i = q
  of degree 1
  with values
    exp(2π𝑖(2//(q - 1)*k))
    exp(2π𝑖(2//(q - 1)*k))
    exp(2π𝑖(1//(q - 1)*j*k + 1//(q - 1)*k))
    exp(2π𝑖(1//(q - 1)*k))

```
"""
function specialize(char::GenericCharacter{T}, var::FracPoly{T}, expr::RingElement) where T <: NfPoly
	if !is_gen(var)
		throw(DomainError(var, "Not a single variable."))
	end
	t=parent(char)
	new_char_values=Vector{CycloSum{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char_values[class]=simplify(eesubs(char[class], [var], [expr]), t)
	end
	new_params=deepcopy(char.params)
	push!(new_params.substitutions, ParameterSubstitution(var, t.argumentring(expr)))
	# TODO: What about the sum function here?
	return GenericCharacter{T}(t, new_char_values, char.info, char.degree, nothing, new_params)

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

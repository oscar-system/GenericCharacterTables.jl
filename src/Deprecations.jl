export tensor!, omega!, lincomb!, scalar

@doc raw"""
    tensor!(t::Table, char1::Int64, char2::Int64)

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
function tensor!(t::Table, char1::Int64, char2::Int64)
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Some character types are out of range."))
	end
	push!(t.chars, tensor_product(t[char1], t[char2]))
	return length(t.chars)
end

@doc raw"""
    omega!(t::Table, char::Int64)

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
function omega!(t::Table, char::Int64)
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	push!(t.chars, omega(t[char]))
	return length(t.chars)
end

@doc raw"""
    lincomb!(t::Table, coeffs::Vector{Int64}, chars::Vector{Int64})

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
function lincomb!(t::Table, coeffs::Vector{Int64}, chars::Vector{Int64})
	if any(chars.>chartypes(t))
		throw(DomainError(chars, "Some character types are out of range."))
	end
	new_char=lincomb(coeffs, [t[i] for i in chars])
	push!(t.chars, new_char)
	return length(t.chars)
end

@doc raw"""
    norm(t::Table, char::Int64)

Return the norm of the character type `char`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> norm(g,1)
1
```
"""
function Oscar.norm(t::Table, char::Int64)
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	return norm(t[char])
end

@doc raw"""
    scalar_product(t::Table, char1::Int64, char2::Int64)

Return the scalar product between the character types `char1` and `char2`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> scalar_product(g,3,2)
0
With exceptions:
  l1 + k1 - 2*k2 ∈ (q - 1)ℤ
  k1 - k2 ∈ (q - 1)ℤ
  l1 - k2 ∈ (q - 1)ℤ
```
"""
function Oscar.scalar_product(t::Table, char1::Int64, char2::Int64)
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Some character types are out of range."))
	end
	return scalar_product(t[char1], t[char2])
end

@alias scalar scalar_product

setcongruence(x::CharTable, congruence::Tuple{Int, Int}) = setcongruence(x, ZZ.(congruence))

export scalar, irrchartypes, chartypes

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
  l1 - k2 ∈ (q - 1)ℤ
  k1 - k2 ∈ (q - 1)ℤ
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

@doc raw"""
    chartypes(t::Table)

Return the number of character types of table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> chartypes(g)
4

```
"""
chartypes(t::Table) = length(t)

@doc raw"""
    irrchartypes(t::Table)

Return the number of irreducible character types of table `t`.

"""
irrchartypes(t::Table) = length(t)

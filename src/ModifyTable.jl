export tensor!, omega!, lincomb!, speccharparam!, specclassparam!

# TODO deal with ParameterSubstitution, this is not done in the original implementation.

"""
    tensor!(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly

Append the tensor product of the character types `char1` and `char2` to the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> tensor!(g,1,2)
5

julia> printinfochar(g,5)
5	Any[\"Tensor of type 1 and 2\"]

```
"""
function tensor!(t::CharTable{T}, char1::Int64, char2::Int64) where T <: NfPoly
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Some character types are out of range."))
	end
	push!(t.chardegree, t.chardegree[char1]*t.chardegree[char2])
	new_char=Vector{CycloSum{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		val1=shift_char_parameters(t, t.table[char1, class], 4)
		val2=shift_char_parameters(t, t.table[char2, class], 5)
		new_char[class]=simplify(val1*val2, t)
	end
	push!(t.table, new_char)
	push!(t.charinfo, ["Tensor of type $char1 and $char2"])
	param1 = shift_char_parameters(t, t.charparams[char1], 4)
	param2 = shift_char_parameters(t, t.charparams[char2], 5)
	push!(t.charparams, Parameters(vcat(param1.params, param2.params), vcat(param1.exceptions, param2.exceptions), ParameterSubstitution{T}[]))
	return length(t.charinfo)
end
function tensor!(t::SimpleCharTable{T}, char1::Int64, char2::Int64) where T <: NfPoly
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Character types are out of range."))
	end
	push!(t.chardegree, t.chardegree[char1]*t.chardegree[char2])
	new_char=Vector{T}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char[class]=t.table[char1, class]*t.table[char2, class]
	end
	push!(t.table, new_char)
	push!(t.charinfo, ["Tensor of type $char1 and $char2"])
	return length(t.charinfo)
end

"""
    omega!(t::Table{T}, char::Int64) where T <: NfPoly

Append the (generic) central character of the character type `char` to the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> omega!(g,1)
5

julia> printinfochar(g,5)
5	Any[\"Omega of type 1\"]

```
"""
function omega!(t::CharTable{T}, char::Int64) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	push!(t.chardegree, t.modulusring(1))
	new_char=Vector{CycloFrac{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char[class]=t.classlength[class]*t.table[char,class]//t.chardegree[char]
	end
	push!(t.table, new_char)
	push!(t.charinfo, ["Omega of type $char"])
	push!(t.charparams, t.charparams[char])
	return length(t.charinfo)
end
function omega!(t::SimpleCharTable{T}, char::Int64) where T <: NfPoly  # TODO is correct?
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	push!(t.chardegree, t.ring(1))
	new_char=Vector{T}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char[class]=div(t.classlength[class]*t.table[char,class], t.chardegree[char])
	end
	push!(t.table, new_char)
	push!(t.charinfo, ["Omega of type $char"])
	return length(t.charinfo)
end

"""
    lincomb!(t::Table{T}, coeffs::Vector{Int64}, chars::Vector{Int64}) where T <: NfPoly

Append the linear combination of the character types `chars` with coefficients `coeffs` to the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> lincomb!(g,[5,1],[1,2])
5

julia> printinfochar(g,5)
5	Any[\"Lincomb 5 * type 1 + 1 * type 2\"]

```
"""
function lincomb!(t::CharTable{T}, coeffs::Vector{Int64}, chars::Vector{Int64}) where T <: NfPoly
	if length(coeffs)!=length(chars)
		throw(DomainError((coeffs,chars), "Different number of coefficients and character types."))
	end
	if any(chars.>chartypes(t))
		throw(DomainError(chars, "Some character types are out of range."))
	end
	n=length(coeffs)
	S=t.argumentring
	extra_var_batches=nvars(S)÷nrparams(t)-6
	missing_var_batches=n-extra_var_batches
	if missing_var_batches > 0
		vars=map(x -> String(x), symbols(S)[1:nrparams(t)]).*"l"
		for i in range(1, missing_var_batches)
			gens(S, vars.*string(i))
		end
	end
	coeffs=map(x -> t.modulusring(x), coeffs)  # TODO modulusring needed?
	degrees=map(x -> t.chardegree[x], chars)
	push!(t.chardegree, sum(coeffs.*degrees))
	new_char=Vector{CycloSum{T}}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char[class]=t.modulusring(0)*e2p(t.argumentring(0))
		for i in range(1, n)
			new_char[class]+=shift_char_parameters(t, coeffs[i]*t.table[chars[i], class], 5+i)
		end
	end
	push!(t.table, new_char)
	info=join(map(x -> join(x, " * type "), zip(coeffs, chars)), " + ")  # TODO
	push!(t.charinfo, ["Lincomb $info"])  
	params=Vector{Parameters{T}}(undef, n)
	for i in range(1, n)
		params[i]=shift_char_parameters(t, t.charparams[chars[i]], 5+i)
	end
	push!(t.charparams, Parameters(vcat(map(x -> x.params, params)...), vcat(map(x -> x.exceptions, params)...), ParameterSubstitution{T}[]))
	return length(t.charinfo)
end
function lincomb!(t::SimpleCharTable{T}, coeffs::Vector{Int64}, chars::Vector{Int64}) where T <: NfPoly
	if length(coeffs)!=length(chars)
		throw(DomainError((coeffs,chars), "Different number of coefficients and character types."))
	end
	n=length(coeffs)
	coeffs=map(x -> t.ring(x), coeffs)  # TODO ring needed?
	degrees=map(x -> t.chardegree[x], chars)
	push!(t.chardegree, sum(coeffs.*degrees))
	new_char=Vector{T}(undef, classtypes(t))
	for class in range(1, classtypes(t))
		new_char[class]=t.ring(0)
		for i in range(1, n)
			new_char[class]+=coeffs[i]*t.table[chars[i], class]
		end
	end
	push!(t.table, new_char)
	info=join(map(x -> join(x, " * type "), zip(coeffs, chars)), " + ")  # TODO
	push!(t.charinfo, ["Lincomb $info"])
	return length(t.charinfo)
end

"""
    speccharparam!(t::CharTable{T}, char::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly

Replace the parameter `var` with `expr` in the character type `char`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> printval(g,char=1)

Value of charater type 1 on class type

1	(1) * exp(2π𝑖(2//(q - 1)*i*k))
2	(1) * exp(2π𝑖(2//(q - 1)*i*k))
3	(1) * exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*k))
4	(1) * exp(2π𝑖(1//(q - 1)*i*k))

julia> q,(i,j,l,k) = params(g);

julia> speccharparam!(g, 1, i, q)

julia> printval(g,char=1)

Value of charater type 1 on class type

1	(1) * exp(2π𝑖(2//(q - 1)*k))
2	(1) * exp(2π𝑖(2//(q - 1)*k))
3	(1) * exp(2π𝑖(1//(q - 1)*j*k + 1//(q - 1)*k))
4	(1) * exp(2π𝑖(1//(q - 1)*k))

```
"""
function speccharparam!(t::CharTable{T}, char::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	if !isgen(var)
		throw(DomainError(var, "Not a single variable."))
	end
	for class in range(1,classtypes(t))
		t.table[char,class]=simplify(eesubs(t.table[char,class], [var], [expr]), t)
	end
	push!(t.charparams[char].substitutions, ParameterSubstitution(var, t.argumentring(expr)))
	return nothing
end

"""
    specclassparam!(t::CharTable{T}, class::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly

Replace the parameter `var` with `expr` in the class type `class`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> printval(g,class=1)

Value of charater type 1 on class type

1	(1) * exp(2π𝑖(2//(q - 1)*i*k))

Value of charater type 2 on class type

1	(q) * exp(2π𝑖(2//(q - 1)*i*k))

Value of charater type 3 on class type

1	(q + 1) * exp(2π𝑖(1//(q - 1)*i*l + 1//(q - 1)*i*k))

Value of charater type 4 on class type

1	(q - 1) * exp(2π𝑖(1//(q - 1)*i*k))

julia> q,(i,j,l,k) = params(g);

julia> specclassparam!(g, 1, k, 3)

julia> printval(g,class=1)

Value of charater type 1 on class type

1	(1) * exp(2π𝑖(6//(q - 1)*i))

Value of charater type 2 on class type

1	(q) * exp(2π𝑖(6//(q - 1)*i))

Value of charater type 3 on class type

1	(q + 1) * exp(2π𝑖(1//(q - 1)*i*l + 3//(q - 1)*i))

Value of charater type 4 on class type

1	(q - 1) * exp(2π𝑖(3//(q - 1)*i))

```
"""
function specclassparam!(t::CharTable{T}, class::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	if !isgen(var)
		throw(DomainError(var, "Not a single variable."))
	end
	for char in range(1,chartypes(t))
		t.table[char,class]=simplify(eesubs(t.table[char,class], [var], [expr]), t)
	end
	push!(t.classparams[class].substitutions, ParameterSubstitution(var, t.argumentring(expr)))
	return nothing
end

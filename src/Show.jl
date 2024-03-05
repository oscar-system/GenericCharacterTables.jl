import Oscar.order

export centord
export chardeg
export chartypes
export classtypes
export irrchartypes
export nrchars
export nrclasses
export nrirrchars
export nrparams
export order
export param
export params
export printcharparam
export printclassparam
export printinfochar
export printinfoclass
export printinfotab
export printval
export status
# TODO PrintValPhi, PrintToTex?

import Oscar: pretty, Indent

function Base.show(io::IO, t::Table)
    io = pretty(io)
    println(io, "Generic character table", Indent())
    println(io, "of order ", t.order)
    c = congruence(t)
    if c !== nothing
        println(io, "restricted to q congruent to ", c[1], " modulo ", c[2])
    end
    println(io, "with ", irrchartypes(t)," irreducible character types")
    println(io, "with ", classtypes(t)," class types")
    if t isa SimpleCharTable
        print(io, "without parameters")
    else
        print(io, "with parameters ", params(t)[2])
    end
end

"""
    chartypes(t::Table)

Return the number of character types of table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> chartypes(g)
4

```
"""
function chartypes(t::Table)
	size(t.table, 1)
end

"""
    irrchartypes(t::Table)

Return the number of irreducible character types of table `t`.

For example this excludes character types created with [`tensor!`](@ref) or [`lincomb!`](@ref).
"""
function irrchartypes(t::Table)
	return t.table.original_m
end

"""
    nrirrchars(t::Table)

Return the number of irreducible characters of table `t`.

For example this excludes characters created with [`tensor!`](@ref) or [`lincomb!`](@ref).

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> nrirrchars(g)
q^2 - 1

```
"""
function nrirrchars(t::Table)
	return sum(nrchars.(Ref(t), 1:irrchartypes(t)))
end

"""
    classtypes(t::Table)

Return the number of conjugacy class types of table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> classtypes(g)
4

```
"""
function classtypes(t::Table)
	size(t.table, 2)
end

"""
    nrclasses(t::Table)

Return the number of conjugacy classes of table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> nrclasses(g)
q^2 - 1

```
"""
function nrclasses(t::Table)
	return sum(nrclasses.(Ref(t), 1:classtypes(t)))
end

"""
    status(t::Table)

Print the order of the group associated to `t` and the number of class and character types of the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> status(g)
Order:                     q^4 - q^3 - q^2 + q
Number of character types: 4
Number of class types:     4

```
"""
function status(t::Table)
	println("Order:                     ", t.order)
	println("Number of character types: ", chartypes(t))
	println("Number of class types:     ", classtypes(t))
end

"""
    printinfotab(t::Table)

Print metadata of `t` in the latex format.

This usually includes the time the table was first computed.
"""
function printinfotab(t::Table)
	println(t.information)
end

"""
    order(t::Table)

Return the order of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> order(g)
q^4 - q^3 - q^2 + q
```
"""
order(t::Table) = t.order

"""
    centord(t::Table, class::Int64)

Return the order of the centralizer of the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> centord(g, 1)
q^4 - q^3 - q^2 + q

```
"""
function centord(t::Table, class::Int64)
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	div(t.order, t.classlength[class])
end

"""
    chardeg(t::Table, char::Int64)

Return the character degree of the character type `char` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> chardeg(g, 3)
q + 1

```
"""
function chardeg(t::Table, char::Int64)
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	t.chardegree[char]
end

"""
    nrchars(t::Table{T}, char::Int64) where T <: NfPoly

Return the number of characters in the character type `char` of the table `t`.

In the case of a `SimpleCharTable` this is always one.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> nrchars(g, 1)
q - 1

```
"""
function nrchars(t::CharTable{T}, char::Int64) where T <: NfPoly
	if char > irrchartypes(t)
		throw(DomainError(char, "Cannot calculate number of characters in reducible types."))
	else
		result=simplify(t.charsums[char](e2p(t.argumentring(0))//e2p(t.argumentring(0)))[1], t)
		return try_convert_to_real(result)
	end
end
function nrchars(t::SimpleCharTable, char::Int64)
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	1
end

"""
    nrclasses(t::Table{T}, class::Int64) where T <: NfPoly

Return the number of conjugacy classes in the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> nrclasses(g, 1)
q - 1

```
"""
function nrclasses(t::CharTable{T}, class::Int64) where T <: NfPoly
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	result=simplify(t.classsums[class](e2p(t.argumentring(0))//e2p(t.argumentring(0)))[1], t)
	return try_convert_to_real(result)
end
function nrclasses(t::SimpleCharTable, class::Int64)
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	t.classtypeorder[class]
end

"""
    printcharparam(t::CharTable, char::Union{Int64, Nothing}=nothing)

Print the parameters of the character type `char` of the table `t`.

This includes the parameter names, ranges and exceptions. Leaving `char` unspecified will print the parameters of all character types.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> printcharparam(g)
1	k ∈ {1,…, q - 1}
2	k ∈ {1,…, q - 1}
3	k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except 1//(q - 1)*l - 1//(q - 1)*k ∈ ℤ
4	k ∈ {1,…, q^2 - 1} except 1//(q + 1)*k ∈ ℤ

```
"""
function printcharparam(t::CharTable, char::Union{Int64, Nothing}=nothing)
	if char === nothing
		chars=range(1, chartypes(t))
	else
		if char > chartypes(t)
			throw(DomainError(char, "Character type is out of range."))
		end
		chars=[char]
	end
	for i in chars
		println(i, "\t", t.charparams[i])
	end
end

"""
    printclassparam(t::CharTable, class::Union{Int64, Nothing}=nothing)

Print the parameters of the class type `class` of the table `t`.

This includes the parameter names, ranges and exceptions. Leaving `class` unspecified will print the parameters of all character types.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> printclassparam(g)
1	i ∈ {1,…, q - 1}
2	i ∈ {1,…, q - 1}
3	i ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except 1//(q - 1)*i - 1//(q - 1)*j ∈ ℤ
4	i ∈ {1,…, q^2 - 1} except 1//(q + 1)*i ∈ ℤ

```
"""
function printclassparam(t::CharTable, class::Union{Int64, Nothing}=nothing)
	if class === nothing
		classes=range(1, classtypes(t))
	else
		if class > classtypes(t)
			throw(DomainError(class, "Class type is out of range."))
		end
		classes=[class]
	end
	for i in classes
		println(i, "\t", t.classparams[i])
	end
end

"""
    printinfochar(t::Table, char::Union{Int64, Nothing}=nothing)

Print the infolists of the character type `char` of the table `t`.

Leaving `char` unspecified will print the infolists of all character types.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> printinfochar(g)
1	Any[\"\", [1, 0], Any[\"A_1\", [2]]]
2	Any[\"\", [1, 1], Any[\"A_1\", [1, 1]]]
3	Any[\"\", [2, 0], Any[\"A_0\", [1]]]
4	Any[\"\", [3, 0], Any[\"A_0\", [1]]]

```
"""
function printinfochar(t::Table, char::Union{Int64, Nothing}=nothing)
	if char === nothing
		chars=range(1, chartypes(t))
	else
		if char > chartypes(t)
			throw(DomainError(char, "Character type is out of range."))
		end
		chars=[char]
	end
	for i in chars
		println(i, "\t", t.charinfo[i])
	end
end

"""
    printinfoclass(t::Table, class::Union{Int64, Nothing}=nothing)

Print the infolists of the class type `class` of the table `t`.

Leaving `class` unspecified will print the infolists of all class types.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> printinfoclass(g)
1	Any[\"\", [1, 0], Any[\"A_1\", [1, 1]]]
2	Any[\"\", [1, 1], Any[\"A_1\", [2]]]
3	Any[\"\", [2, 0], Any[\"A_0\", [1]]]
4	Any[\"\", [3, 0], Any[\"A_0\", [1]]]

```
"""
function printinfoclass(t::Table, class::Union{Int64, Nothing}=nothing)
	if class === nothing
		classes=range(1, classtypes(t))
	else
		if class > classtypes(t)
			throw(DomainError(class, "Class type is out of range."))
		end
		classes=[class]
	end
	for i in classes
		println(i, "\t", t.classinfo[i])
	end
end

"""
    printval(t::Table; char::Union{Int64, Nothing}=nothing, class::Union{Int64, Nothing}=nothing)

Print the values of the char type `char` and the class type `class` of the table `t`.

Leaving `class` unspecified will print the values of all class types at `char`.
Leaving both unspecified will print all values of t

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> printval(g,char=1)

Value of character type 1 on class type

1	(1) * exp(2π𝑖(2//(q - 1)*i*k))
2	(1) * exp(2π𝑖(2//(q - 1)*i*k))
3	(1) * exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*k))
4	(1) * exp(2π𝑖(1//(q - 1)*i*k))

julia> printval(g,char=4,class=2)

Value of character type 4 on class type

2	(-1) * exp(2π𝑖(1//(q - 1)*i*k))

```
"""
function printval(t::Table; char::Union{Int64, Nothing}=nothing, class::Union{Int64, Nothing}=nothing)
	if char === nothing
		chars=range(1, chartypes(t))
	else
		if char > chartypes(t)
			throw(DomainError(char, "Character type is out of range."))
		end
		chars=[char]
	end
	if class === nothing
		classes=range(1, classtypes(t))
	else
		if class > classtypes(t)
			throw(DomainError(class, "Class type is out of range."))
		end
		classes=[class]
	end
	for i in chars
		println("\nValue of character type $i on class type\n")
		for j in classes
			println(j, "\t", t.table[i,j])
		end
	end
end

"""
    nrparams(t::CharTable)

Return the number of class and character parameters of the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> nrparams(g)
4

```
"""
function nrparams(t::CharTable)
	return length(t.classparamindex)+length(t.charparamindex)
end

"""
    params(t::CharTable)

Return all parameters the table `t` depends on.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> params(g)
(q, (i, j, l, k))

```
"""
function params(t::CharTable)
	q=gen(t.modulusring)
	return (q, Tuple(gens(t.argumentring)[1:nrparams(t)]))
end

# HACK: allow requesting a free form parameter e.g. for use with `speccharparam!`
# TODO: document this? or replace it by a better interface...
param(t::CharTable, x::VarName) = gen(t.argumentring, x)

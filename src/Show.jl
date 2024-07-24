import Oscar.order

export centord
export chardeg
export chartypes
export classtypes
export irrchartypes
export nrchars
export nrclasses
export nrirrchars
export chartypeid
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

import Oscar: pretty, Indent, Dedent, terse, is_terse

@doc raw"""
    show(io::IO, t::Table)

Display a summary of the generic character table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2")
Generic character table GL2
  of order q^4 - q^3 - q^2 + q
  with 4 irreducible character types
  with 4 class types
  with parameters (i, j, l, k)

julia> [g]
1-element Vector{GenericCharacterTables.CharTable{QQPolyRingElem}}:
 Generic character table GL2

```
"""
function Base.show(io::IO, ::MIME"text/plain", t::Table)
	io = pretty(io)
	println(io, "Generic character table ", t.importname, Indent())
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

function Base.show(io::IO, t::Table)
	print(io, "Generic character table ", t.importname)
end

@doc raw"""
    show(io::IO, c::AbstractGenericCharacter)

Display a summary of the generic character `c`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> g[3]
Generic character of GL2
  with paramenters
    k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except (l - k)//(q - 1) ∈ ℤ
  of degree q + 1
  with values
    (q + 1)*exp(2π𝑖(1//(q - 1)*i*l + 1//(q - 1)*i*k))
    exp(2π𝑖(1//(q - 1)*i*l + 1//(q - 1)*i*k))
    exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*l)) + exp(2π𝑖(1//(q - 1)*i*l + 1//(q - 1)*j*k))
    0

julia> [g[3]]
1-element Vector{GenericCharacterTables.GenericCharacter{QQPolyRingElem}}:
 Generic character of GL2

```
"""
function Base.show(io::IO, ::MIME"text/plain", c::AbstractGenericCharacter)
	io = pretty(io)
	println(io, "Generic character of ", parent(c).importname, Indent())
	if c isa GenericCharacter
		println(io, "with paramenters ", Indent())
		println(io, c.params, Dedent())
	end
	println(io, "of degree ", c.degree)
	print(io, "with values", Indent())
	for val in c.values
		print(io, "\n", val)
	end
end

function Base.show(io::IO, c::AbstractGenericCharacter)
	print(io, "Generic character of ", parent(c).importname)
end

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
function chartypes(t::Table)
	length(t.chars)
end

@doc raw"""
    irrchartypes(t::Table)

Return the number of irreducible character types of table `t`.

For example this excludes character types created with [`tensor!`](@ref) or [`lincomb!`](@ref).
"""
function irrchartypes(t::Table)
	return t.irrchartypes
end

@doc raw"""
    nrirrchars(t::Table)

Return the number of irreducible characters of table `t`.

For example this excludes characters created with [`tensor!`](@ref) or [`lincomb!`](@ref).

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> nrirrchars(g)
q^2 - 1

```
"""
function nrirrchars(t::Table)
	return sum(nrchars.(Ref(t), 1:irrchartypes(t)))
end

@doc raw"""
    chartypeid(c::AbstractGenericCharacter)

Return if the index of `c` in `parent(c)`. If `c` is not in `parent(c)` (e.g. if it is a tensor product) `0` is returned.
# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> chartypeid(g[1])
1

```
"""
function chartypeid(c::AbstractGenericCharacter)
	ct=parent(c)
	for i in 1:irrchartypes(ct)
		if ct[i] === c
			return i
		end
	end
	return 0
end

@doc raw"""
    classtypes(t::Table)

Return the number of conjugacy class types of table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> classtypes(g)
4

```
"""
function classtypes(t::Table)  # TODO ?
	length(t.chars[1].values)
end

@doc raw"""
    nrclasses(t::Table)

Return the number of conjugacy classes of table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> nrclasses(g)
q^2 - 1

```
"""
function nrclasses(t::Table)
	return sum(nrclasses.(Ref(t), 1:classtypes(t)))
end

@doc raw"""
    status(t::Table)

Print the order of the group associated to `t` and the number of class and character types of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

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

@doc raw"""
    printinfotab(io::IO, t::Table)

Print metadata of `t` in the latex format to `io` where `io` is optional.

This usually includes the time the table was first computed.
"""
function printinfotab(io::IO, t::Table)
	println(io, t.information)
end

printinfotab(t::Table) = printinfotab(Base.stdout, t)

@doc raw"""
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

@doc raw"""
    centord(t::Table, class::Int64)

Return the order of the centralizer of the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

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

@doc raw"""
    chardeg(t::Table, char::Int64)

Return the character degree of the character type `char` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> chardeg(g, 3)
q + 1

```
"""
function chardeg(t::Table, char::Int64)
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	t[char].degree
end

@doc raw"""
    nrchars(t::Table{T}, char::Int64) where T <: NfPoly

Return the number of characters in the character type `char` of the table `t`.

In the case of a `SimpleCharTable` this is always one.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> nrchars(g, 1)
q - 1

```
"""
function nrchars(t::CharTable{T}, char::Int64) where T <: NfPoly
	if char > irrchartypes(t)
		throw(DomainError(char, "Cannot calculate number of characters in reducible types."))
	else
		o=CycloSum(t.modulusring(1), t.argumentring(0))
		result=simplify(t[char].sum(o//o), t)
		return shrink(result)
	end
end
function nrchars(t::SimpleCharTable, char::Int64)
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	1
end

@doc raw"""
    nrclasses(t::Table{T}, class::Int64) where T <: NfPoly

Return the number of conjugacy classes in the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> nrclasses(g, 1)
q - 1

```
"""
function nrclasses(t::CharTable{T}, class::Int64) where T <: NfPoly
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	o=CycloSum(t.modulusring(1), t.argumentring(0))
	result=simplify(t.classsums[class](o//o), t)
	return shrink(result)
end
function nrclasses(t::SimpleCharTable, class::Int64)
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	t.classtypeorder[class]
end

@doc raw"""
    printcharparam(io::IO, t::CharTable, char::Union{Int64, Nothing}=nothing)

Print the parameters of the character type `char` of the table `t` to `io` where `io` is optional.

This includes the parameter names, ranges and exceptions. Leaving `char` unspecified will print the parameters of all character types.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printcharparam(g)
1	k ∈ {1,…, q - 1}
2	k ∈ {1,…, q - 1}
3	k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except (l - k)//(q - 1) ∈ ℤ
4	k ∈ {1,…, q^2 - 1} except (k)//(q + 1) ∈ ℤ
```
"""
function printcharparam(io::IO, t::CharTable, char::Union{Int64, Nothing}=nothing)
	if char === nothing
		chars=range(1, chartypes(t))
	else
		if char > chartypes(t)
			throw(DomainError(char, "Character type is out of range."))
		end
		chars=[char]
	end
	for i in chars
		println(io, i, "\t", t[i].params)
	end
end

printcharparam(t::CharTable, char::Union{Int64, Nothing}=nothing) = printcharparam(Base.stdout, t, char)

@doc raw"""
    printclassparam(io::IO, t::CharTable, class::Union{Int64, Nothing}=nothing)

Print the parameters of the class type `class` of the table `t` to `io` where `io` is optional.

This includes the parameter names, ranges and exceptions. Leaving `class` unspecified will print the parameters of all character types.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printclassparam(g)
1	i ∈ {1,…, q - 1}
2	i ∈ {1,…, q - 1}
3	i ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except (i - j)//(q - 1) ∈ ℤ
4	i ∈ {1,…, q^2 - 1} except (i)//(q + 1) ∈ ℤ
```
"""
function printclassparam(io::IO, t::CharTable, class::Union{Int64, Nothing}=nothing)
	if class === nothing
		classes=range(1, classtypes(t))
	else
		if class > classtypes(t)
			throw(DomainError(class, "Class type is out of range."))
		end
		classes=[class]
	end
	for i in classes
		println(io, i, "\t", t.classparams[i])
	end
end

printclassparam(t::CharTable, class::Union{Int64, Nothing}=nothing) = printclassparam(Base.stdout, t, class)

@doc raw"""
    printinfochar(io::IO, t::Table, char::Union{Int64, Nothing}=nothing)

Print the infolists of the character type `char` of the table `t` to `io` where `io` is optional.

Leaving `char` unspecified will print the infolists of all character types.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printinfochar(g)
1	Any[Any[1, 0], Any["A_1", [2]]]
2	Any[Any[1, 1], Any["A_1", [1, 1]]]
3	Any[Any[2, 0], Any["A_0", [1]]]
4	Any[Any[3, 0], Any["A_0", [1]]]

```
"""
function printinfochar(io::IO, t::Table, char::Union{Int64, Nothing}=nothing)
	if char === nothing
		chars=range(1, chartypes(t))
	else
		if char > chartypes(t)
			throw(DomainError(char, "Character type is out of range."))
		end
		chars=[char]
	end
	for i in chars
		println(io, i, "\t", t[i].info)
	end
end

printinfochar(t::Table, char::Union{Int64, Nothing}=nothing) = printinfochar(Base.stdout, t, char)

@doc raw"""
    printinfoclass(io::IO, t::Table, class::Union{Int64, Nothing}=nothing)

Print the infolists of the class type `class` of the table `t` to `io` where `io` is optional.

Leaving `class` unspecified will print the infolists of all class types.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printinfoclass(g)
1	Any[Any[1, 0], Any["A_1", [1, 1]]]
2	Any[Any[1, 1], Any["A_1", [2]]]
3	Any[Any[2, 0], Any["A_0", [1]]]
4	Any[Any[3, 0], Any["A_0", [1]]]

```
"""
function printinfoclass(io::IO, t::Table, class::Union{Int64, Nothing}=nothing)
	if class === nothing
		classes=range(1, classtypes(t))
	else
		if class > classtypes(t)
			throw(DomainError(class, "Class type is out of range."))
		end
		classes=[class]
	end
	for i in classes
		println(io, i, "\t", t.classinfo[i])
	end
end

printinfoclass(t::Table, class::Union{Int64, Nothing}=nothing) = printinfoclass(Base.stdout, t, class)

@doc raw"""
    printval(io::IO, t::Table; char::Union{Int64, Nothing}=nothing, class::Union{Int64, Nothing}=nothing)

Print the values of the char type `char` and the class type `class` of the table `t` to `io` where `io` is optional.

Leaving `class` unspecified will print the values of all class types at `char`.
Leaving both unspecified will print all values of t

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printval(g,char=1)
Value of character type 1 on class type
  1: exp(2π𝑖(2//(q - 1)*i*k))
  2: exp(2π𝑖(2//(q - 1)*i*k))
  3: exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*k))
  4: exp(2π𝑖(1//(q - 1)*i*k))

julia> printval(g,char=4,class=2)
Value of character type 4 on class type
  2: -1*exp(2π𝑖(1//(q - 1)*i*k))
```
"""
function printval(io::IO, t::Table; char::Union{Int64, Nothing}=nothing, class::Union{Int64, Nothing}=nothing)
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
	io = pretty(io)
	for i in chars
		println(io, "Value of character type $i on class type", Indent())
		for j in classes
			println(io, j, ": ", t[i,j])
		end
		print(io, Dedent())
	end
end

printval(t::Table; kwarg...) = printval(stdout, t; kwarg...)

# TODO: document this (and/or replace it by something better)
function print_decomposition(io::IO, t::CharTable, chi::AbstractGenericCharacter)
	io = pretty(io)
	print(io, "Decomposing character chi:", Indent())
	for i in 1:irrchartypes(t)
		println(io)
		s = scalar(t[i], chi)
		print(io, "<$i,chi> = ", Indent(), s, Dedent())
	end
	print(io, Dedent())
end

print_decomposition(io::IO, t::CharTable, char::Int) = print_decomposition(io, t, t[char])
print_decomposition(t::CharTable, char::AbstractGenericCharacter) = print_decomposition(stdout, t, char)
print_decomposition(t::CharTable, char::Int) = print_decomposition(stdout, t, char)
export print_decomposition

@doc raw"""
    nrparams(t::CharTable)

Return the number of class and character parameters of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> nrparams(g)
4

```
"""
function nrparams(t::CharTable)
	return length(t.classparamindex)+length(t.charparamindex)
end

@doc raw"""
    params(t::CharTable)

Return all parameters the table `t` depends on.

# Examples
```jldoctest
julia> g=genchartab("GL2");

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

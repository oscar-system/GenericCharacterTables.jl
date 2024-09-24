import Oscar.order
import Oscar.AbstractAlgebra: degree

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
1-element Vector{GenericCharacterTables.CharTable}:
 Generic character table GL2

```
"""
function Base.show(io::IO, ::MIME"text/plain", t::Table)
	io = pretty(io)
	println(io, "Generic character table ", t.importname, Indent())
	println(io, "of order ", t.order)
	c = congruence(t)
	if c !== nothing
		println(io, "restricted to ", gens(base_ring(t.ring))[1], " congruent to ", c[1], " modulo ", c[2])
	end
	println(io, "with ", length(t)," irreducible character types")
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
  with parameters
    k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ
  of degree q + 1
  with values
    (q + 1)*exp(2π𝑖((i*l + i*k)//(q - 1)))
    exp(2π𝑖((i*l + i*k)//(q - 1)))
    exp(2π𝑖((i*l + j*k)//(q - 1))) + exp(2π𝑖((i*k + j*l)//(q - 1)))
    0

julia> [g[3]]
1-element Vector{GenericCharacterTables.GenericCharacter}:
 Generic character of GL2

```
"""
function Base.show(io::IO, ::MIME"text/plain", c::AbstractGenericCharacter)
	io = pretty(io)
	println(io, "Generic character of ", parent(c).importname, Indent())
	if c isa GenericCharacter && !isempty(c.params.params)
		println(io, "with parameters ", Indent())
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
    nrirrchars(t::Table)

Return the number of irreducible characters of table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> nrirrchars(g)
q^2 - 1

```
"""
nrirrchars(t::Table) = sum(nrchars.(t))

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
	length(t[1].values)
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
    info(t::Table)

Return the metadata of `t` in LaTeX format. This usually includes the time the table was first computed.
"""
info(t::Table) = t.information

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
centord(t::Table, class::Int64) = div(t.order, t.classlength[class])

@doc raw"""
    nrclasses(t::Table, class::Int64)

Return the number of conjugacy classes in the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> nrclasses(g, 1)
q - 1

```
"""
function nrclasses(t::CharTable, class::Int64)
	o=t.ring(1)
	result=t.classsums[class](o//o)
	return shrink(result)
end
nrclasses(t::SimpleCharTable, class::Int64) = t.classtypeorder[class]

@doc raw"""
    printclassparam([io::IO], t::CharTable, class::Union{Int64, Nothing}=nothing)

Print to `io` (or to the default output stream `stdout` if `io` is not given)
the parameters of the class type `class` of the table `t`.

This includes the parameter names, ranges and exceptions. Leaving `class` unspecified will print the parameters of all character types.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> printclassparam(g)
1	i ∈ {1,…, q - 1}
2	i ∈ {1,…, q - 1}
3	i ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except i - j ∈ (q - 1)ℤ
4	i ∈ {1,…, q^2 - 1} except i ∈ (q + 1)ℤ
```
"""
function printclassparam(io::IO, t::CharTable, class::Union{Int64, Nothing}=nothing)
	if class === nothing
		classes=1:classtypes(t)
	else
		classes=[class]
	end
	for i in classes
		println(io, i, "\t", t.classparams[i])
	end
end

printclassparam(t::CharTable, class::Union{Int64, Nothing}=nothing) = printclassparam(Base.stdout, t, class)

@doc raw"""
    printinfochar([io::IO], t::Table, char::Union{Int64, Nothing}=nothing)

Print to `io` (or to the default output stream `stdout` if `io` is not given)
the infolists of the character type `char` of the table `t`.

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
		chars=1:length(t)
	else
		chars=[char]
	end
	for i in chars
		println(io, i, "\t", t[i].info)
	end
end

printinfochar(t::Table, char::Union{Int64, Nothing}=nothing) = printinfochar(Base.stdout, t, char)

@doc raw"""
    printinfoclass([io::IO], t::Table, class::Union{Int64, Nothing}=nothing)

Print to `io` (or to the default output stream `stdout` if `io` is not given)
the infolists of the class type `class` of the table `t`.

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
		classes=1:classtypes(t)
	else
		classes=[class]
	end
	for i in classes
		println(io, i, "\t", t.classinfo[i])
	end
end

printinfoclass(t::Table, class::Union{Int64, Nothing}=nothing) = printinfoclass(Base.stdout, t, class)

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
	vars=gens(base_ring(t.ring))
	q=vars[1]
	return (q, Tuple(vars[2:(nrparams(t)+1)]))
end

# HACK: allow requesting a free form parameter e.g. for use with `specclassparam!`
# TODO: document this? or replace it by a better interface...
param(t::CharTable, x::VarName) = gen(base_ring(t.ring), x)

import Oscar: order, degree, number_of_conjugacy_classes, pretty, Indent, Dedent, terse, is_terse
import Base: show

# TODO PrintValPhi, PrintToTex?

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
function show(io::IO, ::MIME"text/plain", t::Table)
	io = pretty(io)
	println(io, "Generic character table ", t.importname, Indent())
	println(io, "of order ", order(t))
	c = congruence(t)
	if c !== nothing
		println(io, "restricted to ", gen(base_ring(t.ring), 1), " congruent to ", c[1], " modulo ", c[2])
	end
	println(io, "with ", length(t)," irreducible character types")
	println(io, "with ", number_of_conjugacy_class_types(t)," class types")
	if t isa SimpleCharTable
		print(io, "without parameters")
	else
		print(io, "with parameters ", params(t)[2])
	end
end

function show(io::IO, t::Table)
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
function show(io::IO, ::MIME"text/plain", c::AbstractGenericCharacter)
	io = pretty(io)
	println(io, "Generic character of ", parent(c).importname, Indent())
	if c isa GenericCharacter && !isempty(c.params.params)
		println(io, "with parameters ", Indent())
		println(io, c.params, Dedent())
	end
	println(io, "of degree ", degree(c))
	print(io, "with values", Indent())
	for val in c.values
		print(io, "\n", val)
	end
end

function show(io::IO, c::AbstractGenericCharacter)
	print(io, "Generic character of ", parent(c).importname)
end

@doc raw"""
    number_of_characters(t::Table)

Return the number of irreducible characters of table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> number_of_characters(g)
q^2 - 1

```
"""
number_of_characters(t::Table) = sum(number_of_characters.(t))

@doc raw"""
    number_of_character_types(t::Table)

Return the number of character types of table `t`.
This can also be obtained via `length(t)`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> number_of_character_types(g)
4

```
"""
number_of_character_types(t::Table) = length(t)

@doc raw"""
    number_of_conjugacy_class_types(t::Table)

Return the number of conjugacy class types of table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> number_of_conjugacy_class_types(g)
4

```
"""
function number_of_conjugacy_class_types(t::Table)  # TODO ?
	length(t[1])
end

@doc raw"""
    number_of_conjugacy_classes(t::Table)

Return the number of conjugacy classes of table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> number_of_conjugacy_classes(g)
q^2 - 1

```
"""
function number_of_conjugacy_classes(t::Table)
	return sum(number_of_conjugacy_classes.(Ref(t), 1:number_of_conjugacy_class_types(t)))
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
    centralizer_order(t::Table, class::Int64)

Return the order of the centralizer of the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> centralizer_order(g, 1)
q^4 - q^3 - q^2 + q

```
"""
centralizer_order(t::Table, class::Int64) = div(order(t), t.classlength[class])

@doc raw"""
    number_of_conjugacy_classes(t::CharTable, class::Int64)

Return the number of conjugacy classes in the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> number_of_conjugacy_classes(g, 1)
q - 1

```
"""
function number_of_conjugacy_classes(t::CharTable, class::Int64)
	o=t.ring(1)
	result=t.classsums[class](o//o)
	return shrink(result)
end

@doc raw"""
    number_of_conjugacy_classes(t::SimpleCharTable, class::Int64)

Return the number of conjugacy classes in the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=greenfuntab("GL2");

julia> number_of_conjugacy_classes(g, 1)
1

```
"""
number_of_conjugacy_classes(t::SimpleCharTable, class::Int64) = t.classtypeorder[class]

@doc raw"""
    params(t::CharTable, class::Int64)

Return the parameters of the class type `class` of the table `t`.
This includes the parameter names, ranges and exceptions.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> params(g, 3)
i ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except i - j ∈ (q - 1)ℤ

```
"""
params(t::CharTable, class::Int64) = t.classparams[class]

@doc raw"""
    info(t::Table, class::Int64)

Return the infolists of the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> info(g, 1)
2-element Vector{Any}:
 Any[1, 0]
 Any["A_1", [1, 1]]

```
"""
info(t::Table, class::Int64) = t.classinfo[class]

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

classsum(t::CharTable, class::Integer, x::Union{GenericCyclo,GenericCycloFrac}) =
  t.classsums[class](x)::Union{GenericCyclo,GenericCycloFrac}

charsum(c::GenericCharacter, x::Union{GenericCyclo,GenericCycloFrac}) =
  c.sum(x)::Union{GenericCyclo,GenericCycloFrac}

@doc raw"""
    (t::CharTable)(c::GenericCharacter)

Return `c` as a generic character of `t`. This will only work if `t` is a version of the parent table of `c` with a more restricted congruence.
"""
function (t::CharTable)(c::GenericCharacter)
  return GenericCharacter(
    t,
    t.ring.(c.values),
    deepcopy(c.info),
    deepcopy(c.degree),
    deepcopy(c.sum),
    deepcopy(c.params),
    deepcopy(c.substitutions),
  )
end

function loadtab(path::String)
  return evalfile(path)
end

function gentab(table::String, tabletype::String)
  !isempty(table) || error("table name must not be empty")
  !isempty(tabletype) || error("tabletype name must not be empty")
  path = joinpath(@__DIR__, "..", "data")
  for dir in readdir("$path/$tabletype")
    fname = "$path/$tabletype/$dir/$table.jl"
    isfile(fname) && return loadtab(fname)
  end
  error("table '$table' not found")
end

function gentab(tabletype::String)
  tables = []
  path = joinpath(@__DIR__, "..", "data")
  for dir in readdir("$path/$tabletype")
    for table_file in readdir("$path/$tabletype/$dir")
      push!(tables, replace(table_file, ".jl" => ""))
    end
  end
  return tables
end

@doc raw"""
    generic_character_table(x::String)

Return the generic character table with name `x`.

Omitting `x` will return the names of all importable character tables.

# Examples
```jldoctest
julia> g = generic_character_table("GL2")
Generic character table GL2
  of order q^4 - q^3 - q^2 + q
  with 4 irreducible character types
  with 4 class types
  with parameters (i, j, l, k)
```
"""
generic_character_table(x::String) = gentab(x, "Tables")
generic_character_table() = gentab("Tables")

@doc raw"""
    green_function_table(x::String)

Return the greenfunction table with name `x`.

Omitting `x` will return the names of all importable greenfunctions.

# Examples
```jldoctest
julia> g = green_function_table("GL2")
Generic character table GL2
  of order q^4 - q^3 - q^2 + q
  with 2 irreducible character types
  with 2 class types
  without parameters
```
"""
green_function_table(x::String) = gentab(x, "Greenfunctions")
green_function_table() = gentab("Greenfunctions")

@doc raw"""
    number_of_characters(t::Table)

Return the number of irreducible characters of table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

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
julia> g=generic_character_table("GL2");

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
julia> g=generic_character_table("GL2");

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
julia> g=generic_character_table("GL2");

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

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> info(g)
  The generic character table of \mathrm{GL}_2(q).

    •  The table was first computed in Jor07 (@cite), Sch07 (@cite).

    •  See also: Ste51 (@cite).
```
"""
info(t::Table) = Markdown.parse(t.information)

@doc raw"""
    order(t::Table)

Return the order of the table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> order(g)
q^4 - q^3 - q^2 + q
```
"""
order(t::Table) = t.order

@doc raw"""
    number_of_parameters(t::CharTable)

Return the number of class and character parameters of the table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> number_of_parameters(g)
4

```
"""
function number_of_parameters(t::CharTable)
  return length(t.classparamindex) + length(t.charparamindex)
end

@doc raw"""
    number_of_parameters(t::SimpleCharTable)

Return the number of class and character parameters of the table `t`.

# Examples
```jldoctest
julia> g=green_function_table("GL2");

julia> number_of_parameters(g)
0

```
"""
number_of_parameters(t::SimpleCharTable) = 0

@doc raw"""
    parameters(t::CharTable)

Return all parameters the table `t` depends on.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> parameters(g)
(q, (i, j, l, k))

```
"""
function parameters(t::CharTable)
  vars = gens(base_ring(t.ring))
  q = vars[1]
  return (q, Tuple(vars[2:(number_of_parameters(t) + 1)]))
end

@doc raw"""
    parameters(t::SimpleCharTable)

Return all parameters the table `t` depends on.

# Examples
```jldoctest
julia> g=green_function_table("GL2");

julia> parameters(g)
(q, ())

```
"""
parameters(t::SimpleCharTable) = (gen(t.ring), ())

# HACK: allow requesting a free form parameter e.g. for use with `specclassparam!`
# TODO: document this? or replace it by a better interface...
parameter(t::CharTable, x::VarName) = gen(base_ring(t.ring), x)

@doc raw"""
    show(io::IO, t::Table)

Display a summary of the generic character table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2")
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
    S = t.ring
    q = gen(base_ring(S), 1)^S.power
    println(
      io,
      "restricted to ",
      q,
      " congruent to ",
      c[1],
      " modulo ",
      c[2],
    )
  end
  println(io, "with ", length(t), " irreducible character types")
  println(io, "with ", number_of_conjugacy_class_types(t), " class types")
  if t isa SimpleCharTable
    print(io, "without parameters")
  else
    print(io, "with parameters ", parameters(t)[2])
  end
end

function show(io::IO, t::Table)
  print(io, "Generic character table ", t.importname)
end

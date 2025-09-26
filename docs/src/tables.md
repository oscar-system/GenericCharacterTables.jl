```@meta
CurrentModule = GenericCharacterTables
DocTestSetup = :(using GenericCharacterTables, Oscar)
```

# Tables

This section describes how to instantiate generic character tables and tables of Green functions,
as well as various functions for accessing properties of these tables.

## Loading tables

Before doing anything you need to load a table first. GenericCharacterTables comes with a variety of precomputed tables.

```@docs
generic_character_table
```

GenericCharacterTables also provides some tables of Green functions. They can be loaded similarly.

```@docs
green_function_table
```

## Properties

```@docs
info(t::Table)
number_of_characters(t::Table)
number_of_parameters
parameters
order(t::Table)
```

## Iteration

Tables implement Julia's iteration interface to iterate over the irreducible character types
stored in the table. For a table `T`,
- `length(T)` returns the number of character types in the table,
- `T[i]` returns the $i$th character type,
- `T[i:j]` returns a vector containing the character types $i$ to $j$.

For example we can use this to compute the order of the underlying group type.
(Of course this can also be checked via [`order`](@ref), which retrieves a
precomputed value.)
```jldoctest
julia> g=generic_character_table("GL2");

julia> sum(number_of_characters(c)*degree(c)^2 for c in g)
q^4 - q^3 - q^2 + q

julia> order(g)
q^4 - q^3 - q^2 + q
```

Tables also implement a part of Julia's interface for matrices. This can be used
to extract "subtables" (although these are then of course merely matrices
and not generic character table objects).
```jldoctest
julia> g=generic_character_table("GL3");

julia> g[3:5,2:4]
3×3 Matrix{GenericCharacterTables.GenericCyclo}:
 0                               …  q*E(q - 1)^(2*a*n + b*n)
 (q + 1)*E(q - 1)^(a*m + 2*a*n)     E(q - 1)^(2*a*n + b*m) + (q + 1)*E(q - 1)^(a*m + a*n + b*n)
 q*E(q - 1)^(a*m + 2*a*n)           q*E(q - 1)^(2*a*n + b*m) + (q + 1)*E(q - 1)^(a*m + a*n + b*n)

```

Here we extracted the values of the character types 3, 4 and 5 on the conjugacy
class types 2, 3 and 4. Only a single colon in at least one coordinate direction
can be used to obtain ranges of character or conjugacy class types.
```jldoctest
julia> g=generic_character_table("GL2");

julia> g[2:3,:]
2-element Vector{GenericCharacterTables.GenericCharacter}:
 Generic character of GL2
 Generic character of GL2

julia> g[:,2:3]
2-element Vector{GenericCharacterTables.GenericConjugacyClass}:
 Generic conjugacy class of GL2
 Generic conjugacy class of GL2

julia> g[:,:]
4-element Vector{GenericCharacterTables.GenericConjugacyClass}:
 Generic conjugacy class of GL2
 Generic conjugacy class of GL2
 Generic conjugacy class of GL2
 Generic conjugacy class of GL2
```

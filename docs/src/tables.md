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
genchartab
```

GenericCharacterTables also provides some tables of Green functions. They can be loaded similarly.

```@docs
greenfuntab
```

## Properties

```@docs
info(t::Table)
number_of_characters(t::Table)
nrparams
params
order(t::Table)
```

## Iteration

Tables implement Julia's iteration interface to iterate over the irreducible character types
stored in the table. For a table `T`,
- `length(T)` returns the number of character types in the table,
- `T[i]` returns the $i$th character type.

For example we can use this to compute the order of the underlying group type.
(Of course this can also be checked via [`order`](@ref), which retrieves a
precomputed value.)
```jldoctest
julia> g=genchartab("GL2");

julia> sum(number_of_characters(c)*degree(c)^2 for c in g)
q^4 - q^3 - q^2 + q

julia> order(g)
q^4 - q^3 - q^2 + q
```

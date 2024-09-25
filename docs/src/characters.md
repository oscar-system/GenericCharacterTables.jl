```@meta
CurrentModule = GenericCharacterTables
DocTestSetup = :(using GenericCharacterTables, Oscar)
```

# Character types

A *character type* is a family of characters which are indexed by a set of parameters,
together with ranges of admissible values for each parameters, and a set of
excluded parameter values. The characters in a character type share many properties,
e.g. they all have the same degree.

Since "types" already have a very specific meaning in Julia (and other programming
languages), we instead sometimes refer to character types as "generic characters".
In particular the Julia types we use to represent character types are called
`AbstractGenericCharacter`, `GenericCharacter` and `SimpleGenericCharacter`.

## Properties

```@docs
number_of_character_types
number_of_characters(char::GenericCharacter)
degree(chi::AbstractGenericCharacter)
params(chi::GenericCharacter)
info(char::AbstractGenericCharacter)
```

## Iteration

Tables implement Julia's iteration interface to iterate over values stored in character types.
For a character type `ct`,
- `length(ct)` returns the number of values in the character type (which is equal to the number
   of class types s in the table), and
- `ct[i]` returns the $i$th value of the character type.

```jldoctest
julia> g=genchartab("GL2");

julia> ct = g[3]
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ
  of degree q + 1
  with values
    (q + 1)*exp(2π𝑖((i*l + i*k)//(q - 1)))
    exp(2π𝑖((i*l + i*k)//(q - 1)))
    exp(2π𝑖((i*l + j*k)//(q - 1))) + exp(2π𝑖((i*k + j*l)//(q - 1)))
    0

julia> collect(ct)
4-element Vector{GenericCharacterTables.GenericCyclo}:
 (q + 1)*exp(2π𝑖((i*l + i*k)//(q - 1)))
 exp(2π𝑖((i*l + i*k)//(q - 1)))
 exp(2π𝑖((i*l + j*k)//(q - 1))) + exp(2π𝑖((i*k + j*l)//(q - 1)))
 0
```

## Constructing new character types

The immediate way to obtain a character type object is to get it from a 
table `T` via indexing, i.e., as `T[i]` for some index $i$.

In addition, there are a few ways to construct new character types.

```@docs
tensor_product(char1::GenericCharacter, char2::GenericCharacter)
tensor_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <: PolyRingElem
lincomb
omega
```

## Norms and scalar products

`GenericCharacterTables` allows you to compute norms and scalar products
of character types. The results are correct for all
possible combinations of parameters except possibly for those where the
additionally returned exceptions apply. Those consist of multivariate
polynomials with coefficients in a rational function field and are
satisfied if the evaluation of this polynomial is an integer.

```@docs
norm(char::GenericCharacter)
norm(char::SimpleGenericCharacter{T}) where T <: NfPoly
scalar_product(char1::GenericCharacter, char2::GenericCharacter)
scalar_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <: NfPoly
```

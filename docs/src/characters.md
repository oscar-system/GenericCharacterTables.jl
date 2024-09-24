```@meta
CurrentModule = GenericCharacterTables
```

# Character types

TODO: recall what those are. Explain that "character types" are represented
by the type `GenericCharacter` (because "type" already has another meaning in Julia).

## Properties

```@docs
nrchars
nrirrchars
degree(chi::AbstractGenericCharacter)
params(chi::GenericCharacter)
printinfochar
```

## Deriving new character types

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

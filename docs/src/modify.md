```@meta
CurrentModule = GenericCharacterTables
```

# Modify Tables

# Add Characters
It is also possible to create new character types with GenericCharacterTables.

```@docs
tensor_product(char1::GenericCharacter, char2::GenericCharacter)
tensor_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <: PolyRingElem
lincomb
omega
```

# Change Values
Sometimes one likes to specify some of the free variables in the tables to simplify the often very complicated values a bit.

```@docs
specialize
specclassparam!
```

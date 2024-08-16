```@meta
CurrentModule = GenericCharacterTables
```

# Modify Tables

# Add Characters
It is also possible to create new character types with GenericCharacterTables. These new characters will be added to the tables inplace.

```@docs
tensor!
lincomb!
omega!
```

# Change Values
Sometimes one likes to specify some of the free variables in the tables to simplify the often very complicated values a bit.

```@docs
specialize
specclassparam!
```

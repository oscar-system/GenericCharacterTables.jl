```@meta
CurrentModule = GenericCharacterTables
```

# Calculate with Tables

GenericCharacterTables allows you to compute for example scalar products
of whole class or character types. The results are correct for all
possible combinations of parameters except possibly for those where the
additionally returned exceptions apply. Those consist of multivariate
polynomials with coefficients in a rational function field and are
fulfilled if the evaluation of this polynomial is an integer.

## On Characters
```@docs
norm(t::Table{T}, char::Int64) where T <: NfPoly
scalar
```

## On Classes
```@docs
ortho2norm
ortho2scalar
classmult
```
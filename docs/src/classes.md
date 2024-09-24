```@meta
CurrentModule = GenericCharacterTables
```

# Conjugacy class types

A *class type* is a family of conjugacy classes which are indexed by a set of parameters,
together with ranges of admissible values for each parameters, and a set of
excluded parameter values.


## Properties

```@docs
classtypes
nrclasses
centord
printclassparam
printinfoclass
```

## Norms and scalar products

`GenericCharacterTables` allows you to compute norms and scalar products
of class types. The results are correct for all
possible combinations of parameters except possibly for those where the
additionally returned exceptions apply. Those consist of multivariate
polynomials with coefficients in a rational function field and are
satisfied if the evaluation of this polynomial is an integer.


```@docs
ortho2norm
ortho2scalar
classmult
```
```@meta
CurrentModule = GenericCharacterTables
```

# Conjugacy class types

A *class type* is a family of conjugacy classes which are indexed by a set of parameters,
together with ranges of admissible values for each parameters, and a set of
excluded parameter values.


## Properties

```@docs
number_of_conjugacy_class_types
number_of_conjugacy_classes(t::Table)
number_of_conjugacy_classes(t::CharTable, class::Int64)
number_of_conjugacy_classes(t::SimpleCharTable, class::Int64)
centralizer_order
params(t::CharTable, class::Int64)
info(t::Table, class::Int64)
```

## Norms and scalar products

`GenericCharacterTables` allows you to compute norms and scalar products
of class types. The results are correct for all
possible combinations of parameters except possibly for those where the
additionally returned exceptions apply. Those consist of multivariate
polynomials with coefficients in a rational function field and are
satisfied if the evaluation of this polynomial is an integer.


```@docs
norm(t::CharTable, class::Int64)
norm(t::SimpleCharTable{T}, class::Int64) where T <: NfPoly
scalar_product(t::CharTable, class1::Int64, class2::Int64)
scalar_product(t::SimpleCharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly
class_multiplication_coefficient(t::CharTable, class1::Int64, class2::Int64, class3::Int64)
class_multiplication_coefficient(t::SimpleCharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly
```
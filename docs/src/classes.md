```@meta
CurrentModule = GenericCharacterTables
DocTestSetup = :(using GenericCharacterTables, Oscar)
```

# Conjugacy class types

A *class type* is a family of conjugacy classes which are indexed by a set of parameters,
together with ranges of admissible values for each parameters, and a set of
excluded parameter values.


## Properties

```@docs
conjugacy_class_type
number_of_conjugacy_class_types
number_of_conjugacy_classes(t::Table)
number_of_conjugacy_classes(class::GenericConjugacyClass)
number_of_conjugacy_classes(class::SimpleGenericConjugacyClass)
number_of_conjugacy_classes(t::Table, class::Int64)
order(class::AbstractGenericConjugacyClass)
order(t::Table, class::Int64)
centralizer_order
parameters(class::GenericConjugacyClass)
parameters(class::SimpleGenericConjugacyClass)
parameters(t::Table, class::Int64)
info(class::GenericConjugacyClass)
info(class::SimpleGenericConjugacyClass)
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
norm(class::GenericConjugacyClass)
norm(class::SimpleGenericConjugacyClass)
norm(t::Table, class::Int64)
scalar_product(class1::GenericConjugacyClass, class2::GenericConjugacyClass)
scalar_product(class1::SimpleGenericConjugacyClass, class2::SimpleGenericConjugacyClass)
scalar_product(t::Table, class1::Int64, class2::Int64)
class_multiplication_coefficient(class1::SimpleGenericConjugacyClass, class2::SimpleGenericConjugacyClass, class3::SimpleGenericConjugacyClass)
class_multiplication_coefficient(class1::GenericConjugacyClass, class2::GenericConjugacyClass, class3::GenericConjugacyClass)
class_multiplication_coefficient(t::Table, class1::Int64, class2::Int64, class3::Int64)
```

## Iteration

To get a specific conjugacy class type one can also use the indexing features
of generic character tables. Moreover the conjugacy class type itself implements
the standard iteration and indexing interfaces and can thus be treated similarly
to a `Vector` object.

```jldoctest
julia> g=generic_character_table("GL2");

julia> cl=g[:,1]
Generic conjugacy class of GL2
  with parameters
    i ∈ {1,…, q - 1}
  of order 1
  with values
    1: E(q - 1)^(2*i*k)
    2: q*E(q - 1)^(2*i*k)
    3: (q + 1)*E(q - 1)^(i*l + i*k)
    4: (q - 1)*E(q - 1)^(i*k)

julia> cl[1]
E(q - 1)^(2*i*k)

julia> cl[2:3]
2-element Vector{GenericCharacterTables.GenericCyclo}:
 q*E(q - 1)^(2*i*k)
 (q + 1)*E(q - 1)^(i*l + i*k)

julia> cl[:]
4-element Vector{GenericCharacterTables.GenericCyclo}:
 E(q - 1)^(2*i*k)
 q*E(q - 1)^(2*i*k)
 (q + 1)*E(q - 1)^(i*l + i*k)
 (q - 1)*E(q - 1)^(i*k)

julia> for v in cl
           println(v)
       end
E(q - 1)^(2*i*k)
q*E(q - 1)^(2*i*k)
(q + 1)*E(q - 1)^(i*l + i*k)
(q - 1)*E(q - 1)^(i*k)

```

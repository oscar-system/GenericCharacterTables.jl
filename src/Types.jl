const ZZUPoly = Generic.UnivPoly{ZZRingElem}
const UPoly = Generic.UnivPoly{QQFieldElem}
const UPolyRing = Generic.UniversalPolyRing{QQFieldElem}
const UPolyFrac = Generic.FracFieldElem{UPoly}
const UPolyFracRing = Generic.FracField{UPoly}

@doc raw"""
    GenericCycloRing <: Ring

The ring of generic cyclotomic numbers.

# Examples
```jldoctest
julia> R = universal_polynomial_ring(QQ; cached=false);

julia> q = gen(R, "q");

julia> S, E = generic_cyclotomic_ring(R)
(Generic cyclotomic ring over Rational field, Generator of Generic cyclotomic ring over Rational field)
```
"""
mutable struct GenericCycloRing <: Ring
  base_ring::UPolyRing
  symbol::Symbol
  congruence::Union{Tuple{ZZRingElem,ZZRingElem},Nothing}
  substitute::UPoly
  substitute_inv::UPoly
  function GenericCycloRing(
    R::UPolyRing,
    symbol::Symbol,
    congruence::Union{Tuple{ZZRingElem,ZZRingElem},Nothing},
  )
    return new(R, symbol, congruence)
  end
end

struct GenericCycloRingGen
  parent::GenericCycloRing
end

@doc raw"""
    GenericCyclo <: RingElem

The type for generic cyclotomic numbers.

# Examples
```jldoctest
julia> R = universal_polynomial_ring(QQ; cached=false);

julia> q = gen(R, "q");

julia> S, E = generic_cyclotomic_ring(R);

julia> S(q; exponent=1//(q-1))
q*E(q - 1)
```
"""
mutable struct GenericCyclo <: RingElem
  f::Dict{UPolyFrac,UPoly}
  parent::GenericCycloRing
end

@doc raw"""
    ParameterExceptions

A collection of parameter exceptions used in `GenericCycloFrac`.
"""
struct ParameterExceptions
  exceptions::Vector{UPolyFrac}
end

function parameter_exceptions()
  ParameterExceptions(UPolyFrac[])
end

# This models fractions of sums of cyclotomics.
# The simplification is currently only very basic.
# According to the original implementation
# more advanced simplifications seem to have
# no positive effect on the performance.
@doc raw"""
    GenericCycloFrac

The type for fractions of generic cyclotomic numbers.

# Examples
```jldoctest
julia> R = universal_polynomial_ring(QQ; cached=false);

julia> q = gen(R, "q");

julia> S, E = generic_cyclotomic_ring(R);

julia> a = S(q; exponent=1//(q-1))
q*E(q - 1)

julia> b = S(q^2; exponent=1//(q^2-1))
q^2*E(q^2 - 1)

julia> a//b
q*E(q - 1)//(q^2*E(q^2 - 1))
```
"""
struct GenericCycloFrac
  numerator::GenericCyclo
  denominator::GenericCyclo
  exceptions::ParameterExceptions  # The element may only be evaluated if none of the exceptions evaluates to an integer.
  function GenericCycloFrac(
    numerator::GenericCyclo,
    denominator::GenericCyclo,
    exceptions::ParameterExceptions;
    simplify::Bool=true,
  )
    check_parent(numerator, denominator)
    if simplify
      if iszero(numerator)
        return new(numerator, one(denominator), exceptions)
      elseif numerator == denominator
        o = one(denominator)
        return new(o, o, exceptions)
      end
    end
    return new(numerator, denominator, exceptions)
  end
end

@doc raw"""
    Parameter

A paramter of a generic character or class type unique up to a polynomial modulus. They are used in `Parameters`.
"""
struct Parameter
  var::UPoly  # Actual name of the parameter  # TODO make this an Int?
  modulus::UPoly  # Said modulus
end

@doc raw"""
    ParameterSubstitution

A substitution of paramters used in `Parameters`. They are generated by for example `specclassparam!`.
"""
struct ParameterSubstitution
  var::UPoly  # The name of the replaced parameter  # TODO make this an Int?
  expression::UPoly  # The substitute for the parameter  # TODO do we need UPolyFrac here?
end

@doc raw"""
    Parameters

Parameters of generic characters and class types. This is used in `GenericCharacter` and `CharTable` and is only of internal use.
"""
struct Parameters
  params::Vector{Parameter}
  exceptions::Vector{UPolyFrac}
end

abstract type Table end
abstract type AbstractGenericCharacter end

# T is usually of the type NfPoly.
# `argumentring` is expected to have 6 complete batches of variables.
# These are used to shift the variables to calculate e.g. scalar products.
# `linkomb!` may add variables to `argumentring` to shift the variables even further.
# Therefore it is needed to disable caching in `argumentring`
# to fix possible interplay issues caused by using multiple tables.
# See for example A1/GL2.jl
@doc raw"""
    CharTable <: Table

The type for generic character tables. This is used to model generic character tables containing generic cyclotomic entries.

# Examples
```jldoctest
julia> g=generic_character_table("GL2")
Generic character table GL2
  of order q^4 - q^3 - q^2 + q
  with 4 irreducible character types
  with 4 class types
  with parameters (i, j, l, k)
```
"""
struct CharTable <: Table
  order::UPoly  # Order of the associated group
  classinfo::Vector{<:Any}  # Info about class types
  classlength::Vector{UPoly}  # Order of the classes in each type
  classsums::Vector{Function}  # Functions to sum a cyclotomic over all classes in a type
  classparamindex::Vector{Int64}  # Indices of the class parameters
  charparamindex::Vector{Int64}  # Indices of the character parameters
  classparams::Vector{Parameters}  # Info about the parameters of each class type
  ring::GenericCycloRing  # Parent ring of the cyclotomics in this table
  information::String  # General info about the table
  chars::Vector{<:AbstractGenericCharacter}
  importname::String  # This name can be used to import the table, a "*" indicates a modified table
end
function CharTable(order::UPoly, table::Matrix{GenericCyclo}, classinfo::Vector{<:Any},
  classlength::Vector{UPoly},
  charinfo::Vector{<:Any}, chardegree::Vector{UPoly}, classsums::Vector{Function},
  charsums::Vector{Function},
  classparamindex::Vector{Int64}, charparamindex::Vector{Int64},
  classparams::Vector{Parameters}, charparams::Vector{Parameters},
  ring::GenericCycloRing, information::String, importname::String)
  num_chars = size(table, 1)
  chars = Vector{GenericCharacter}(undef, num_chars)
  ct = CharTable(order, classinfo, classlength, classsums, classparamindex, charparamindex,
    classparams, ring, information, chars, importname)
  for i in 1:num_chars
    ct.chars[i] = GenericCharacter(
      ct,
      table[i, :],
      charinfo[i],
      chardegree[i],
      charsums[i],
      charparams[i],
      ParameterSubstitution[],
    )
  end
  return ct
end

@doc raw"""
    GenericCharacter <: AbstractGenericCharacter

The type for generic characters. These are the generic characters used in `CharTable`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> g[1]
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}
  of degree 1
  with values
    1: E(q - 1)^(2*i*k)
    2: E(q - 1)^(2*i*k)
    3: E(q - 1)^(i*k + j*k)
    4: E(q - 1)^(i*k)
```
"""
struct GenericCharacter <: AbstractGenericCharacter
  parent::CharTable
  values::Vector{GenericCyclo}
  info::Any
  degree::UPoly  # Degree of the characters in this type
  sum::Union{Function,Nothing}  # Function to sum a Cyclotomic over all characters in this type
  params::Parameters  # Info about the parameters in this character type
  substitutions::Vector{ParameterSubstitution}
end

# T is usually of th type NfPoly.
@doc raw"""
    SimpleCharTable{T} <: Table

The type for simple generic character tables. This is used to model generic character tables containing polynomial entries. The type parameter `T` is
the type of the table entries.

# Examples
```jldoctest
julia> g=generic_character_table("uniGL2")
Generic character table uniGL2
  of order q^4 - q^3 - q^2 + q
  with 2 irreducible character types
  with 4 class types
  without parameters
```
"""
struct SimpleCharTable{T} <: Table
  order::T  # Order of the associated group
  classinfo::Vector{<:Any}  # Info about class types
  classlength::Vector{T}  # Order of the classes in each type
  classtypeorder::Vector{T}  # Number of classes in each type
  ring::PolyRing  # Ring of polynomials of type T used in table
  information::String  # General info about the table
  chars::Vector{<:AbstractGenericCharacter}
  importname::String  # This name can be used to import the table
  function SimpleCharTable(order::T, table::Matrix{T}, classinfo::Vector{<:Any},
    classlength::Vector{T},
    classtypeorder::Vector{T}, charinfo::Vector{<:Any}, chardegree::Vector{T},
    ring::PolyRing, information::String, importname::String) where {T<:NfPoly}
    num_chars = size(table, 1)
    chars = Vector{SimpleGenericCharacter{T}}(undef, num_chars)
    ct = new{T}(
      order, classinfo, classlength, classtypeorder, ring, information, chars, importname
    )
    for i in 1:num_chars
      ct.chars[i] = SimpleGenericCharacter(ct, table[i, :], charinfo[i], chardegree[i])
    end
    return ct
  end
end

@doc raw"""
    SimpleGenericCharacter <: AbstractGenericCharacter

The type for simple generic characters. These are the generic characters used in `SimpleCharTable`.

# Examples
```jldoctest
julia> g=generic_character_table("uniGL2")
Generic character table uniGL2
  of order q^4 - q^3 - q^2 + q
  with 2 irreducible character types
  with 4 class types
  without parameters

julia> g[1]
Generic character of uniGL2
  of degree q
  with values
    1: q
    2: 0
    3: 1
    4: -1
```
"""
struct SimpleGenericCharacter{T} <: AbstractGenericCharacter
  parent::SimpleCharTable{T}
  values::Vector{T}
  info::Any
  degree::T  # Degree of the characters in this type
end

abstract type AbstractGenericConjugacyClass end

@doc raw"""
    GenericConjugacyClass <: AbstractGenericConjugacyClass

The type for generic conjugacy classes. These are the generic conjugacy classes used in `CharTable`.
"""
struct GenericConjugacyClass <: AbstractGenericConjugacyClass
  parent::CharTable
  index::Int64
  values::Union{Vector{GenericCyclo},Nothing}
  substitutions::Vector{ParameterSubstitution}
end

@doc raw"""
    SimpleGenericConjugacyClass <: AbstractGenericConjugacyClass

The type for simple generic conjugacy classes. These are the generic conjugacy classes used in `SimpleCharTable`.
"""
struct SimpleGenericConjugacyClass{T} <: AbstractGenericConjugacyClass
  parent::SimpleCharTable{T}
  index::Int64
end


export genchartab, greenfuntab

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
julia> g=genchartab("GL2")
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
	irrchartypes::Int64  # Number of irreducible character types
	importname::String  # This name can be used to import the table, a "*" indicates a modified table
end
function CharTable(order::UPoly, table::Matrix{GenericCyclo}, classinfo::Vector{<:Any}, classlength::Vector{UPoly},
	charinfo::Vector{<:Any}, chardegree::Vector{UPoly}, classsums::Vector{Function}, charsums::Vector{Function},
	classparamindex::Vector{Int64}, charparamindex::Vector{Int64}, classparams::Vector{Parameters}, charparams::Vector{Parameters},
	ring::GenericCycloRing, information::String, importname::String)
	num_chars=size(table, 1)
	chars=Vector{GenericCharacter}(undef, num_chars)
	ct=CharTable(order, classinfo, classlength, classsums, classparamindex, charparamindex,
			classparams, ring, information, chars, num_chars, importname)
	for i in 1:num_chars
		ct.chars[i]=GenericCharacter(ct, table[i,:], charinfo[i], chardegree[i], charsums[i], charparams[i])
	end
	return ct
end

Base.getindex(ct::CharTable, i::Integer) = ct.chars[i]::GenericCharacter
Base.getindex(ct::CharTable, i::Integer, j::Integer) = ct.chars[i].values[j]::GenericCyclo

@doc raw"""
    GenericCharacter <: AbstractGenericCharacter

The type for generic characters. These are the generic characters used in `CharTable`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> g[1]
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}
  of degree 1
  with values
    exp(2π𝑖((2*i*k)//(q - 1)))
    exp(2π𝑖((2*i*k)//(q - 1)))
    exp(2π𝑖((i*k + j*k)//(q - 1)))
    exp(2π𝑖((i*k)//(q - 1)))
```
"""
struct GenericCharacter <: AbstractGenericCharacter
	parent::CharTable
	values::Vector{GenericCyclo}
	info::Any
	degree::UPoly  # Degree of the characters in this type
	sum::Union{Function, Nothing}  # Function to sum a Cyclotomic over all characters in this type
	params::Parameters  # Info about the parameters in this character type
end

@doc raw"""
    (t::CharTable)(c::GenericCharacter)

Return `c` as a generic character of `t`. This will only work if `t` is a version of the parent table of `c` with a more restricted congruence.
"""
function (t::CharTable)(c::GenericCharacter)
	return GenericCharacter(
			t,
			t.ring.(c.values),
			deepcopy(c.info),
			deepcopy(c.degree),
			deepcopy(c.sum),
			deepcopy(c.params)
		)
end

# T is usually of th type NfPoly.
@doc raw"""
    SimpleCharTable{T} <: Table

The type for simple generic character tables. This is used to model generic character tables containing polynomial entries. The type parameter `T` is
the type of the table entries.

# Examples
```jldoctest
julia> g=genchartab("uniGL2")
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
	irrchartypes::Int64  # Number of irreducible character types
	importname::String  # This name can be used to import the table
	function SimpleCharTable(order::T, table::Matrix{T}, classinfo::Vector{<:Any}, classlength::Vector{T},
		classtypeorder::Vector{T}, charinfo::Vector{<:Any}, chardegree::Vector{T},
		ring::PolyRing, information::String, importname::String) where T<:NfPoly
		num_chars=size(table, 1)
		chars=Vector{SimpleGenericCharacter{T}}(undef, num_chars)
		ct=new{T}(order, classinfo, classlength, classtypeorder, ring, information, chars, num_chars, importname)
		for i in 1:num_chars
			ct.chars[i]=SimpleGenericCharacter(ct, table[i,:], charinfo[i], chardegree[i])
		end
		return ct
	end
end

Base.getindex(ct::SimpleCharTable{T}, i::Integer) where T<:NfPoly = ct.chars[i]::SimpleGenericCharacter{T}
Base.getindex(ct::SimpleCharTable{T}, i::Integer, j::Integer) where T<:NfPoly = ct.chars[i].values[j]::T
Base.setindex!(ct::SimpleCharTable{T}, v::T, i::Integer, j::Integer) where T<:NfPoly = setindex!(ct.chars[i].values, v, j)

@doc raw"""
    SimpleGenericCharacter <: AbstractGenericCharacter

The type for simple generic characters. These are the generic characters used in `SimpleCharTable`.

# Examples
```jldoctest
julia> g=genchartab("uniGL2")
Generic character table uniGL2
  of order q^4 - q^3 - q^2 + q
  with 2 irreducible character types
  with 4 class types
  without parameters

julia> g[1]
Generic character of uniGL2
  of degree q
  with values
    q
    0
    1
    -1
```
"""
struct SimpleGenericCharacter{T} <: AbstractGenericCharacter
	parent::SimpleCharTable{T}
	values::Vector{T}
	info::Any
	degree::T  # Degree of the characters in this type
end

AbstractAlgebra.parent(c::AbstractGenericCharacter) = c.parent
Base.getindex(c::AbstractGenericCharacter, i::Integer) = c.values[i]

function loadtab(path::String)
	return (@eval module $(gensym("CHAR_TABLE")) include($(path)) end).TABLE
end

function gentab(table::String, tabletype::String)
	!isempty(table) || error("table name must not be empty")
	!isempty(tabletype) || error("tabletype name must not be empty")
	path=joinpath(@__DIR__, "..", "data")
	for dir in readdir("$path/$tabletype")
		fname = "$path/$tabletype/$dir/$table.jl"
		isfile(fname) && return loadtab(fname)
	end
	error("table '$table' not found")
end

function gentab(tabletype::String)
	tables=[]
	path=joinpath(@__DIR__, "..", "data")
	for dir in readdir("$path/$tabletype")
		for table_file in readdir("$path/$tabletype/$dir")
		push!(tables, replace(table_file, ".jl" => ""))
		end
	end
	return tables
end

@doc raw"""
    genchartab(x::String)

Return the generic character table with name `x`.

Omitting `x` will return the names of all importable character tables.

# Examples
```jldoctest
julia> g = genchartab("GL2")
Generic character table GL2
  of order q^4 - q^3 - q^2 + q
  with 4 irreducible character types
  with 4 class types
  with parameters (i, j, l, k)
```
"""
genchartab(x::String) = gentab(x, "Tables")
genchartab() = gentab("Tables")

@doc raw"""
    greenfuntab(x::String)

Return the greenfunction table with name `x`.

Omitting `x` will return the names of all importable greenfunctions.

# Examples
```jldoctest
julia> g = greenfuntab("GL2")
Generic character table GL2
  of order q^4 - q^3 - q^2 + q
  with 2 irreducible character types
  with 2 class types
  without parameters
```
"""
greenfuntab(x::String) = gentab(x, "Greenfunctions")
greenfuntab() = gentab("Greenfunctions")

export genchartab, greenfuntab

abstract type Table{T} end
abstract type AbstractGenericCharacter{T} end

# This is the main generic character table type.
# T is usually of the type NfPoly.
# `argumentring` is expected to have 6 complete batches of variables.
# These are used to shift the variables to calculate e.g. scalar products.
# `linkomb!` may add variables to `argumentring` to shift the variables even further.
# Therefore it is needed to disable caching in `argumentring`
# to fix possible interplay issues caused by using multiple tables.
# See for example A1/GL2.jl
struct CharTable{T} <: Table{T}
	order::T  # Order of the associated group
	classinfo::Vector{<:Any}  # Info about class types
	classlength::Vector{T}  # Order of the classes in each type
	classsums::Vector{Function}  # Functions to sum a Cyclotomic over all classes in a type
	classparamindex::Vector{Int64}  # Indices of the class parameters
	charparamindex::Vector{Int64}  # Indices of the character parameters
	classparams::Vector{Parameters{T}}  # Info about the parameters of each class type
	congruence::Union{Tuple{T, T}, Nothing}  # Congruence of the main parameter q (of T). q is congruent to congruence[1] mod congruence[2].
	modulusring::PolyRing  # Ring of polynomials of type T used in table (also ring of modulus of Cyclotomics)
	argumentring::Generic.UniversalPolyRing{Generic.FracFieldElem{T}}  # Ring of argument of the Cyclotomics in table
	information::String  # General info about the table
	chars::Vector{<:AbstractGenericCharacter{T}}
	irrchartypes::Int64  # Number of irreducible character types
	importname::String  # This name can be used to import the table, a "*" indicates a modified table
end
function CharTable(order::T, table::Matrix{Cyclotomic{T}}, classinfo::Vector{<:Any}, classlength::Vector{T},
	charinfo::Vector{<:Any}, chardegree::Vector{T}, classsums::Vector{Function}, charsums::Vector{Function},
	classparamindex::Vector{Int64}, charparamindex::Vector{Int64}, classparams::Vector{Parameters{T}}, charparams::Vector{Parameters{T}},
	congruence::Union{Tuple{T, T}, Nothing}, modulusring::PolyRing, argumentring::Generic.UniversalPolyRing{Generic.FracFieldElem{T}},
	information::String, importname::String) where T<:NfPoly
	num_chars=size(table, 1)
	chars=Vector{GenericCharacter{T}}(undef, num_chars)
	ct=CharTable{T}(order, classinfo, classlength, classsums, classparamindex, charparamindex,
			classparams, congruence, modulusring, argumentring, information, chars, num_chars, importname)
	for i in range(1, num_chars)
		ct.chars[i]=GenericCharacter(ct, table[i,:], charinfo[i], chardegree[i], charsums[i], charparams[i])
	end
	return ct
end

Base.getindex(ct::CharTable{T}, i::Integer) where T<:NfPoly = ct.chars[i]::GenericCharacter{T}
Base.getindex(ct::CharTable{T}, i::Integer, j::Integer) where T<:NfPoly = ct.chars[i].values[j]::Cyclotomic{T}

struct GenericCharacter{T} <: AbstractGenericCharacter{T}
	parent::CharTable{T}
	values::Vector{Cyclotomic{T}}
	info::Any
	degree::T  # Degree of the characters in this type
	sum::Union{Function, Nothing}  # Function to sum a Cyclotomic over all characters in this type
	params::Parameters{T}  # Info about the parameters in this character type
end

# This is another generic character table type used for much simpler tables.
# T is usually of th type NfPoly.
struct SimpleCharTable{T} <: Table{T}
	order::T  # Order of the associated group
	classinfo::Vector{<:Any}  # Info about class types
	classlength::Vector{T}  # Order of the classes in each type
	classtypeorder::Vector{T}  # Number of classes in each type
	ring::PolyRing  # Ring of polynomials of type T used in table
	information::String  # General info about the table
	chars::Vector{<:AbstractGenericCharacter{T}}
	irrchartypes::Int64  # Number of irreducible character types
	importname::String  # This name can be used to import the table
	function SimpleCharTable(order::T, table::Matrix{T}, classinfo::Vector{<:Any}, classlength::Vector{T},
		classtypeorder::Vector{T}, charinfo::Vector{<:Any}, chardegree::Vector{T},
		ring::PolyRing, information::String, importname::String) where T<:NfPoly
		num_chars=size(table, 1)
		chars=Vector{SimpleGenericCharacter{T}}(undef, num_chars)
		ct=new{T}(order, classinfo, classlength, classtypeorder, ring, information, chars, num_chars, importname)
		for i in range(1, num_chars)
			ct.chars[i]=SimpleGenericCharacter(ct, table[i,:], charinfo[i], chardegree[i])
		end
		return ct
	end
end

Base.getindex(ct::SimpleCharTable{T}, i::Integer) where T<:NfPoly = ct.chars[i]::SimpleGenericCharacter{T}
Base.getindex(ct::SimpleCharTable{T}, i::Integer, j::Integer) where T<:NfPoly = ct.chars[i].values[j]::T
Base.setindex!(ct::SimpleCharTable{T}, v::T, i::Integer, j::Integer) where T<:NfPoly = setindex!(ct.chars[i].values, v, j)

struct SimpleGenericCharacter{T} <: AbstractGenericCharacter{T}
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

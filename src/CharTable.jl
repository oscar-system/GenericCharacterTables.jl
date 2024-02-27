export genchartab, greenfuntab

abstract type Table{T} end

# This matrix type is needed to be able to extend the character tables by new character types calculated by the methods in ModifyTable.jl
# https://discourse.julialang.org/t/silly-question-how-to-add-a-row-to-array/33601/10
mutable struct ExtendableMatrix{T} <: AbstractMatrix{T}
	m::Int
	original_m::Int
	n::Int
	data::Vector{T}
	function ExtendableMatrix{T}(m::Int, n::Int, data::Vector{T}) where T
		new{T}(m,m,n,data)
	end
end
Base.size(a::ExtendableMatrix) = (a.m, a.n)
Base.getindex(a::ExtendableMatrix, i::Integer, j::Integer) = a.data[(Int(i)-1)*a.n + Int(j)]
Base.setindex!(a::ExtendableMatrix, v, i::Integer, j::Integer) = setindex!(a.data, v, (Int(i)-1)*a.n + Int(j))
ExtendableMatrix{T}(::UndefInitializer, m::Integer, n::Integer) where {T} = ExtendableMatrix{T}(m, n, Array{T}(undef, m*n))
ExtendableMatrix(a::AbstractMatrix{T}) where {T} = copyto!(ExtendableMatrix{T}(undef, size(a)...), a)
function Base.push!(a::ExtendableMatrix, row::AbstractVector)
	a.n == length(row) || throw(DimensionMismatch("row size must match matrix"))
	resize!(a.data, length(a) + a.n)
	a.data[length(a)+1:length(a.data)] = row
	a.m += 1
	return a
end

# This is the main generic character table type.
# T is usually of the type NfPoly.
# `argumentring` is expected to have 6 complete batches of variables.
# These are used to shift the variables to calculate e.g. scalar products.
# `linkomb!` may add variables to `argumentring` to shift the variables even further.
# Therefore it is needed to disable chaching in `argumentring`
# to fix possible interplay issues caused by using multiple tables.
# See for example A1/GL2.jl
struct CharTable{T} <: Table{T}
	order::T  # Order of the associated group
	table::ExtendableMatrix{Cyclotomic{T}}  # Character values
	classinfo::Vector{<:Any}  # Info about class types
	classlength::Vector{T}  # Order of the classes in each type
	charinfo::Vector{<:Any}  # Info about char types
	chardegree::Vector{T}  # Degree of the characters in each type
	classsums::Vector{Function}  # Functions to sum a Cyclotomic over all classes in a type
	charsums::Vector{Function}  # Functions to sum a Cyclotomic over all characters in a type
	classparamindex::Vector{Int64}  # Indices of the class parameters
	charparamindex::Vector{Int64}  # Indices of the character parameters
	classparams::Vector{Parameters{T}}  # Info about the parameters of each class type
	charparams::Vector{Parameters{T}}  # Info about the parameters of each character type
	congruence::Union{Tuple{T, T}, Nothing}  # Congruence of the main parameter q (of T). q is congruent to congruence[1] mod congruence[2].
	modulusring::PolyRing  # Ring of polynomials of type T used in table (also ring of modulus of Cyclotomics)
	argumentring::Generic.UniversalPolyRing{Generic.FracFieldElem{T}, Generic.MPoly{Generic.FracFieldElem{T}}}  # Ring of argument of the Cyclotomics in table
	information::String  # General info about the table
end

# This is another generic character table type used for much simpler tables.
# T is usually of th type NfPoly.
struct SimpleCharTable{T} <: Table{T}
	order::T  # Order of the associated group
	table::ExtendableMatrix{T}  # Character values
	classinfo::Vector{<:Any}  # Info about class types
	classlength::Vector{T}  # Order of the classes in each type
	classtypeorder::Vector{T}  # Number of classes in each type
	charinfo::Vector{<:Any}  # Info about char types
	chardegree::Vector{T}  # Degree of the characters in each type
	ring::PolyRing  # Ring of polynomials of type T used in table
	information::String  # General info about the table
end

function loadtab(path::String)
	return (@eval module $(gensym("CHAR_TABLE")) include($(path)) end).TABLE
end

function gentab(table::String, tabletype::String)
	if isempty(table)
		tables=[]
	end
	path=@__DIR__
	for dir in readdir("$path/$tabletype")
		for table_file in readdir("$path/$tabletype/$dir")
			if isempty(table)
				push!(tables, replace(table_file, ".jl" => ""))
			else
				if table_file == "$table.jl"
					return loadtab("$path/$tabletype/$dir/$table.jl")
				end
			end
		end
	end
	if isempty(table)
		return tables
	end
end

"""
	genchartab(x::String)

Return the generic character table with name `x`.

Omitting `x` will return the names of all importable character tables.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

```
"""
genchartab(x::String) = gentab(x, "Tables")
genchartab() = genchartab("")

"""
	greenfuntab(x::String)

Return the greenfunction table with name `x`.

Omitting `x` will return the names of all importable greenfunctions.

# Examples
```jldoctest
julia> g=greenfuntab(\"GL2\");

```
"""
greenfuntab(x::String) = gentab(x, "Greenfunctions")
greenfuntab() = greenfuntab("")

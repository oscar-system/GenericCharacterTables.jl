getindex(ct::CharTable, i::Integer) = ct.chars[i]::GenericCharacter
getindex(ct::CharTable, i::Integer, j::Integer) = ct[i].values[j]::GenericCyclo
getindex(ct::SimpleCharTable{T}, i::Integer) where {T<:NfPoly} =
  ct.chars[i]::SimpleGenericCharacter{T}
getindex(ct::SimpleCharTable{T}, i::Integer, j::Integer) where {T<:NfPoly} =
  ct[i].values[j]::T

function getindex(ct::CharTable, ri::UnitRange{<:Integer}, rj::UnitRange{<:Integer})
  m = Array{GenericCyclo}(undef, (length(ri), length(rj)))
  for (i1, i2) in enumerate(ri)
    for (j1, j2) in enumerate(rj)
      m[i1,j1] = ct[i2,j2]
    end
  end
  return m
end

function getindex(ct::SimpleCharTable{T}, ri::UnitRange{<:Integer}, rj::UnitRange{<:Integer}) where {T<:NfPoly}
  m = Array{T}(undef, (length(ri), length(rj)))
  for (i1, i2) in enumerate(ri)
    for (j1, j2) in enumerate(rj)
      m[i1,j1] = ct[i2,j2]
    end
  end
  return m
end

getindex(ct::Table, ::Colon, rj::UnitRange{<:Integer}) = ct[1:end,rj]
getindex(ct::Table, ri::UnitRange{<:Integer}, ::Colon) = ct[ri,1:end]
getindex(ct::Table, ::Colon, ::Colon) = ct[1:end,1:end]

getindex(ct::Table, ::Colon, j::Integer) = conjugacy_class_type(ct, j)
getindex(ct::Table, i::Integer, ::Colon) = ct[i]

getindex(ct::Table, i::Integer, rj::UnitRange{<:Integer}) = ct[i,:][rj]
getindex(ct::Table, ri::UnitRange{<:Integer}, j::Integer) = ct[:,j][ri]

function Base.axes(ct::Table, i::Integer)
  if i == 1
    return 1:number_of_character_types(ct)
  elseif i == 2
    return 1:number_of_conjugacy_class_types(ct)
  else
    return 1:1
  end
end

getindex(c::AbstractGenericCharacter, i::Integer) = c.values[i]
getindex(c::GenericConjugacyClass, i::Integer) =
  c.values === nothing ? parent(c)[i][c.index] : c.values[i]
getindex(c::SimpleGenericConjugacyClass, i::Integer) = parent(c)[i][c.index]

function getindex(c::Union{AbstractGenericConjugacyClass, AbstractGenericCharacter}, ri::UnitRange{<:Integer})
  m = Array{eltype(c)}(undef, length(ri))
  for (i1, i2) in enumerate(ri)
    m[i1] = c[i2]
  end
  return m
end

getindex(c::Union{AbstractGenericConjugacyClass, AbstractGenericCharacter}, ::Colon) = c[1:length(c)]

length(ct::Table) = length(ct.chars)
length(c::AbstractGenericCharacter) = length(c.values)
length(c::AbstractGenericConjugacyClass) = length(parent(c))

iterate(ct::Table, state::Integer=1) = state > length(ct) ? nothing : (ct[state], state + 1)
iterate(c::AbstractGenericCharacter, state::Integer=1) =
  state > length(c) ? nothing : (c[state], state + 1)
iterate(c::AbstractGenericConjugacyClass, state::Integer=1) =
  state > length(c) ? nothing : (c[state], state + 1)

eltype(::Type{CharTable}) = GenericCharacter
eltype(::Type{SimpleCharTable{T}}) where {T<:NfPoly} = SimpleGenericCharacter{T}
eltype(::Type{GenericCharacter}) = GenericCyclo
eltype(::Type{SimpleGenericCharacter{T}}) where {T<:NfPoly} = T
eltype(::Type{GenericConjugacyClass}) = GenericCyclo
eltype(::Type{SimpleGenericConjugacyClass{T}}) where {T<:NfPoly} = T

Base.lastindex(c::Union{AbstractGenericConjugacyClass, AbstractGenericCharacter}) = length(c)

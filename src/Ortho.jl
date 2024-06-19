export norm, scalar, ortho2norm, ortho2scalar, classmult
# TODO Should we really return Set{ParameterException{T}}() in SimpleCharTable methods? This seems a bit weird.

@doc raw"""
    classmult(t::Table{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly

Return the (generic) class multiplication constant of the class types `class1`, `class2` and `class3` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("SL2.0");

julia> classmult(g,2,2,4)
q + 1
With exceptions:
  (a3)//(q + 1) ∈ ℤ
```
"""
function classmult(t::CharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly
	if any((class1, class2, class3).>classtypes(t))
		throw(DomainError((class1,class2,class3), "Some class types are out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		val1=shift_class_parameters(t, t[char, class1], 1)
		val2=shift_class_parameters(t, t[char, class2], 2)
		val3=shift_class_parameters(t, t[char, class3], 3)
		sum+=t.order*t[char].sum(val1*val2*conj(val3))//t[char].degree  # TODO move t.order* to the end of the function
	end
	return shrink(simplify((t.classlength[class1]*t.classlength[class2])*sum//(t.order^2), t))
end
function classmult(t::SimpleCharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly  # TODO is correct?
	if any((class1, class2, class3).>classtypes(t))
		throw(DomainError((class1,class2,class3), "Some class types are out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		sum1=t[char, class1]*t[char, class2]*t[char, class3]
		sum+=t.order*sum1//t[char].degree  # TODO move t.order* to the end of the function
	end
	return (t.classlength[class1]*t.classlength[class2])*sum//(t.order^2)
end

@doc raw"""
    norm(char::AbstractGenericCharacter{T}) where T <: NfPoly

Return the norm of the character type `char`.
"""
function Oscar.norm(char::GenericCharacter{T}) where T <: NfPoly
	t=parent(char)
	sum=0
	for class in range(1, classtypes(t))
		val=char[class]
		sum+=t.classlength[class]*t.classsums[class](val*conj(val))
	end
	return shrink(simplify(sum//t.order, t))
end
function Oscar.norm(char::SimpleGenericCharacter{T}) where T <: NfPoly
	t=parent(char)
	sum=0
	for class in range(1, classtypes(t))
		sum+=char[class]^2*t.classlength[class]*t.classtypeorder[class]
	end
	return sum//t.order
end

@doc raw"""
    norm(t::Table{T}, char::Int64) where T <: NfPoly

Return the norm of the character type `char`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> norm(g,1)
1

```
"""
function Oscar.norm(t::Table{T}, char::Int64) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	return norm(t[char])
end

@doc raw"""
    scalar(char1::AbstractGenericCharacter{T}, char2::AbstractGenericCharacter{T}) where T <: NfPoly

Return the scalar product between the character types `char1` and `char2`.
"""

function scalar(char1::GenericCharacter{T}, char2::GenericCharacter{T}) where T <: NfPoly
	if parent(char1) != parent(char2)
		throw(DomainError((parent(char1),parent(char2)), "Tables do not match."))
	end
	t=parent(char1)
	sum=0
	for class in range(1, classtypes(t))
		val1=shift_char_parameters(t, char1[class], 1)
		val2=shift_char_parameters(t, char2[class], 2)
		sum+=t.classlength[class]*t.classsums[class](val1*conj(val2))
	end
	return shrink(simplify(sum//t.order, t))
end
function scalar(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <:NfPoly
	if parent(char1) != parent(char2)
		throw(DomainError((parent(char1),parent(char2)), "Tables do not match."))
	end
	t=parent(char1)
	sum=0
	for class in range(1, classtypes(t))
		sum+=char1[class]*char2[class]*t.classlength[class]*t.classtypeorder[class]
	end
	return sum//t.order
end

@doc raw"""
    scalar(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly

Return the scalar product between the character types `char1` and `char2`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> scalar(g,3,2)
0
With exceptions:
  (l1 + k1 - 2*k2)//(q - 1) ∈ ℤ
  (l1 - k2)//(q - 1) ∈ ℤ
  (k1 - k2)//(q - 1) ∈ ℤ
```
"""
function scalar(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Some character types are out of range."))
	end
	return scalar(t[char1], t[char2])
end

#TODO remove
function scalar(t::Table{T}) where T <: NfPoly
	for char1 in range(1, chartypes(t))
		for char2 in range(1, char1)
			println("$char1, $char2:\t", scalar(t,char1,char2))
		end
	end
end


@doc raw"""
    ortho2norm(t::Table{T}, class::Int64) where T <: NfPoly

Return the (generic) norm of the class type `class`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> ortho2norm(g,2)
1
```
"""
function ortho2norm(t::CharTable{T}, class::Int64) where T <: NfPoly
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		val=t[char, class]
		sum+=t[char].sum(val*conj(val))
	end
	return shrink(simplify(t.classlength[class]*sum//t.order, t))
end
function ortho2norm(t::SimpleCharTable{T}, class::Int64) where T <: NfPoly  # TODO is correct?
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		sum+=t[char, class]^2
	end
	return t.classlength[class]*sum//t.order
end

@doc raw"""
    ortho2scalar(t::Table{T}, class1::Int64, class2::Int64) where T <: NfPoly

Return the (generic) scalar product between the class types `class1` and `class2`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> ortho2scalar(g,3,2)
0
With exceptions:
  (i1 + j1 - 2*i2)//(q - 1) ∈ ℤ
  (i1 - i2)//(q - 1) ∈ ℤ
  (j1 - i2)//(q - 1) ∈ ℤ
```
"""
function ortho2scalar(t::CharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly
	if any((class1, class2).>classtypes(t))
		throw(DomainError((class1,class2), "Some class types are out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		val1=shift_class_parameters(t, t[char, class1], 1)
		val2=shift_class_parameters(t, t[char, class2], 2)
		sum+=t[char].sum(val1*conj(val2))
	end
	return shrink(simplify(t.classlength[class1]*sum//t.order, t))
end
function ortho2scalar(t::SimpleCharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly  # TODO is correct?
	if any((class1, class2).>classtypes(t))
		throw(DomainError((class1,class2), "Some class types are out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		sum+=t[char, class1]*t[char, class2]
	end
	return t.classlength[class1]*sum//t.order
end

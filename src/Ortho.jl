@doc raw"""
    classmult(t::CharTable, class1::Int64, class2::Int64, class3::Int64)

Return the (generic) class multiplication constant of the class types `class1`, `class2` and `class3` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab("SL2.0");

julia> classmult(g,2,2,4)
q + 1
With exceptions:
  a3 ∈ (q + 1)ℤ
```
"""
function classmult(t::CharTable, class1::Int64, class2::Int64, class3::Int64)
	if any((class1, class2, class3).>classtypes(t))
		throw(DomainError((class1,class2,class3), "Some class types are out of range."))
	end
	sum=0
	for char in t
		val1=shift_class_parameters(t, char[class1], 1)
		val2=shift_class_parameters(t, char[class2], 2)
		val3=shift_class_parameters(t, char[class3], 3)
		sum+=t.order*charsum(char, val1*val2*conj(val3))//char.degree  # TODO move t.order* to the end of the function
	end
	return shrink((t.classlength[class1]*t.classlength[class2])*sum//(t.order^2))
end

@doc raw"""
    classmult(t::SimpleCharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly

Return the (generic) class multiplication constant of the class types `class1`, `class2` and `class3` of the table `t`.

# Examples
```jldoctest
julia> g=greenfuntab("GL3");

julia> classmult(g,1,2,3)
(q + 3)//(q^5 - 2*q^4 + q^3)
```
"""
function classmult(t::SimpleCharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly  # TODO is correct?
	if any((class1, class2, class3).>classtypes(t))
		throw(DomainError((class1,class2,class3), "Some class types are out of range."))
	end
	sum=0
	for char in t
		sum1=char[class1]*char[class2]*char[class3]
		sum+=t.order*sum1//char.degree  # TODO move t.order* to the end of the function
	end
	return (t.classlength[class1]*t.classlength[class2])*sum//(t.order^2)
end

@doc raw"""
    ortho2norm(t::CharTable, class::Int64)

Return the (generic) norm of the class type `class`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> ortho2norm(g,2)
1
```
"""
function ortho2norm(t::CharTable, class::Int64)
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	sum=0
	for char in t
		val=char[class]
		sum+=charsum(char, val*conj(val))
	end
	return shrink(t.classlength[class]*sum//t.order)
end

@doc raw"""
    ortho2norm(t::SimpleCharTable{T}, class::Int64) where T <: NfPoly

Return the (generic) norm of the class type `class`.

# Examples
```jldoctest
julia> g=greenfuntab("GL3");

julia> ortho2norm(g,2)
(5*q^2 + 2*q + 3)//(q^5 - 2*q^4 + q^3)
```
"""
function ortho2norm(t::SimpleCharTable{T}, class::Int64) where T <: NfPoly  # TODO is correct?
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	sum=0
	for char in t
		sum+=char[class]^2
	end
	return t.classlength[class]*sum//t.order
end

@doc raw"""
    ortho2scalar(t::CharTable, class1::Int64, class2::Int64)

Return the (generic) scalar product between the class types `class1` and `class2`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> ortho2scalar(g,3,2)
0
With exceptions:
  i1 + j1 - 2*i2 ∈ (q - 1)ℤ
  i1 - i2 ∈ (q - 1)ℤ
  j1 - i2 ∈ (q - 1)ℤ
```
"""
function ortho2scalar(t::CharTable, class1::Int64, class2::Int64)
	if any((class1, class2).>classtypes(t))
		throw(DomainError((class1,class2), "Some class types are out of range."))
	end
	sum=0
	for char in t
		val1=shift_class_parameters(t, char[class1], 1)
		val2=shift_class_parameters(t, char[class2], 2)
		sum+=charsum(char, val1*conj(val2))
	end
	return shrink(t.classlength[class1]*sum//t.order)
end

@doc raw"""
    ortho2scalar(t::SimpleCharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly

Return the (generic) scalar product between the class types `class1` and `class2`.

# Examples
```jldoctest
julia> g=greenfuntab("GL3");

julia> ortho2scalar(g,2,2)
(5*q^2 + 2*q + 3)//(q^5 - 2*q^4 + q^3)
```
"""
function ortho2scalar(t::SimpleCharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly  # TODO is correct?
	if any((class1, class2).>classtypes(t))
		throw(DomainError((class1,class2), "Some class types are out of range."))
	end
	sum=0
	for char in t
		sum+=char[class1]*char[class2]
	end
	return t.classlength[class1]*sum//t.order
end

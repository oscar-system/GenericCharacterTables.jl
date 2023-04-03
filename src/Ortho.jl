export norm, scalar, ortho2norm, ortho2scalar, classmult
# TODO Should we really return Set{ParameterException{T}}() in SimpleCharTable methods? This seems a bit weird.

"""
    classmult(t::Table{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly

Return the (generic) class multiplication constant of the class types `class1`, `class2` and `class3` of the table `t`.

# Examples
```jldoctest
julia> g=genchartab(\"SL2.0\");

julia> classmult(g,2,2,4)
(q + 1, Set(GenericCharacterTables.ParameterException{Nemo.QQPolyRingElem}[1//(q + 1)*a3 ∈ ℤ]))

```
"""
function classmult(t::CharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly
	if any((class1, class2, class3).>classtypes(t))
		throw(DomainError((class1,class2,class3), "Some class types are out of range."))
	end
	sum=0
	exceptions=Set{ParameterException{T}}()
	for char in range(1, irrchartypes(t))
		val1=shift_class_parameters(t, t.table[char, class1], 1)
		val2=shift_class_parameters(t, t.table[char, class2], 2)
		val3=shift_class_parameters(t, t.table[char, class3], 3)
		sum1,exceptions1=t.charsums[char](val1*val2*conj(val3))
		sum+=t.order*sum1//t.chardegree[char]  # TODO move t.order* to the end of the function
		union!(exceptions, exceptions1)
	end
	result=simplify((t.classlength[class1]*t.classlength[class2])*sum//(t.order^2), t)
	return (try_convert_to_real(result), shrink(exceptions))
end
function classmult(t::SimpleCharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly  # TODO is correct?
	if any((class1, class2, class3).>classtypes(t))
		throw(DomainError((class1,class2,class3), "Some class types are out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		sum1=t.table[char, class1]*t.table[char, class2]*t.table[char, class3]
		sum+=t.order*sum1//t.chardegree[char]  # TODO move t.order* to the end of the function
	end
	return ((t.classlength[class1]*t.classlength[class2])*sum//(t.order^2), Set{ParameterException{T}}())
end

"""
    norm(t::Table{T}, char::Int64) where T <: NfPoly

Return the norm of the character type `char`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> norm(g,1)
(1, Set{GenericCharacterTables.ParameterException{QQPolyRingElem}}())

```
"""
function Oscar.norm(t::CharTable{T}, char::Int64) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	sum=0
	exceptions=Set{ParameterException{T}}()
	for class in range(1, classtypes(t))
		val=t.table[char, class]
		sum1,exceptions1=t.classsums[class](val*conj(val))
		sum+=t.classlength[class]*sum1
		union!(exceptions, exceptions1)
	end
	result=simplify(sum//t.order, t)
	return (try_convert_to_real(result), shrink(exceptions))
end
function Oscar.norm(t::SimpleCharTable{T}, char::Int64) where T <: NfPoly
	if char > chartypes(t)
		throw(DomainError(char, "Character type is out of range."))
	end
	sum=0
	for class in range(1, classtypes(t))
		sum+=t.table[char,class]^2*t.classlength[class]*t.classtypeorder[class]
	end
	return (sum//t.order, Set{ParameterException{T}}())
end

"""
    scalar(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly

Return the scalar product between the character types `char1` and `char2`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> scalar(g,3,2)
(0, Set(GenericCharacterTables.ParameterException{Nemo.QQPolyRingElem}[1//(q - 1)*l1 + 1//(q - 1)*k1 - 2//(q - 1)*k2 ∈ ℤ, 1//(q - 1)*l1 - 1//(q - 1)*k2 ∈ ℤ, 1//(q - 1)*k1 - 1//(q - 1)*k2 ∈ ℤ]))

```
"""
function scalar(t::CharTable{T}, char1::Int64, char2::Int64) where T <: NfPoly
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Some character types are out of range."))
	end
	sum=0
	exceptions=Set{ParameterException{T}}()
	for class in range(1, classtypes(t))
		val1=shift_char_parameters(t, t.table[char1, class], 1)
		val2=shift_char_parameters(t, t.table[char2, class], 2)
		sum1,exceptions1=t.classsums[class](val1*conj(val2))
		sum+=t.classlength[class]*sum1
		union!(exceptions, exceptions1)
	end
	result=simplify(sum//t.order, t)
	return (try_convert_to_real(result), shrink(exceptions))
end
function scalar(t::SimpleCharTable{T}, char1::Int64, char2::Int64) where T <:NfPoly
	if any((char1, char2).>chartypes(t))
		throw(DomainError((char1,char2), "Some character types are out of range."))
	end
	sum=0
	for class in range(1, classtypes(t))
		sum+=t.table[char1,class]*t.table[char2,class]*t.classlength[class]*t.classtypeorder[class]
	end
	return (sum//t.order, Set{ParameterException{T}}())
end

#TODO remove
function scalar(t::Table{T}) where T <: NfPoly
	for char1 in range(1, chartypes(t))
		for char2 in range(1, char1)
			println("$char1, $char2:\t", scalar(t,char1,char2))
		end
	end
end


"""
    ortho2norm(t::Table{T}, class::Int64) where T <: NfPoly

Return the (generic) norm of the class type `class`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> ortho2norm(g,2)
(1, Set{GenericCharacterTables.ParameterException{QQPolyRingElem}}())

```
"""
function ortho2norm(t::CharTable{T}, class::Int64) where T <: NfPoly
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	sum=0
	exceptions=Set{ParameterException{T}}()
	for char in range(1, irrchartypes(t))
		val=t.table[char, class]
		sum1,exceptions1=t.charsums[char](val*conj(val))
		sum+=sum1
		union!(exceptions, exceptions1)
	end
	result=simplify(t.classlength[class]*sum//t.order, t)
	return (try_convert_to_real(result), shrink(exceptions))
end
function ortho2norm(t::SimpleCharTable{T}, class::Int64) where T <: NfPoly  # TODO is correct?
	if class > classtypes(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		sum+=t.table[char, class]^2
	end
	return (t.classlength[class]*sum//t.order, Set{ParameterException{T}}())
end

"""
    ortho2scalar(t::Table{T}, class1::Int64, class2::Int64) where T <: NfPoly

Return the (generic) scalar product between the class types `class1` and `class2`.

# Examples
```jldoctest
julia> g=genchartab(\"GL2\");

julia> ortho2scalar(g,3,2) 
(0, Set(GenericCharacterTables.ParameterException{Nemo.QQPolyRingElem}[1//(q - 1)*i1 + 1//(q - 1)*j1 - 2//(q - 1)*i2 ∈ ℤ, 1//(q - 1)*i1 - 1//(q - 1)*i2 ∈ ℤ, 1//(q - 1)*j1 - 1//(q - 1)*i2 ∈ ℤ]))

```
"""
function ortho2scalar(t::CharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly
	if any((class1, class2).>classtypes(t))
		throw(DomainError((class1,class2), "Some class types are out of range."))
	end
	sum=0
	exceptions=Set{ParameterException{T}}()
	for char in range(1, irrchartypes(t))
		val1=shift_class_parameters(t, t.table[char, class1], 1)
		val2=shift_class_parameters(t, t.table[char, class2], 2)
		sum1,exceptions1=t.charsums[char](val1*conj(val2))
		sum+=sum1
		union!(exceptions, exceptions1)
	end
	result=simplify(t.classlength[class1]*sum//t.order, t)
	return (try_convert_to_real(result), shrink(exceptions))
end
function ortho2scalar(t::SimpleCharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly  # TODO is correct?
	if any((class1, class2).>classtypes(t))
		throw(DomainError((class1,class2), "Some class types are out of range."))
	end
	sum=0
	for char in range(1, irrchartypes(t))
		sum+=t.table[char, class1]*t.table[char, class2]
	end
	return (t.classlength[class1]*sum//t.order, Set{ParameterException{T}}())
end

@doc raw"""
    conjugacy_class_type(t::CharTable, class::Int64)

Return the generic conjugacy class `class` of `t`.
"""
conjugacy_class_type(t::CharTable, class::Int64) =
  GenericConjugacyClass(t, class, nothing, ParameterSubstitution[])

getindex(c::GenericConjugacyClass, i::Integer) =
  c.values === nothing ? parent(c)[i][c.index] : c.values[i]

eltype(::Type{GenericConjugacyClass}) = GenericCyclo

@doc raw"""
    conjugacy_class_type(t::SimpleCharTable{T}, class::Int64) where T <: NfPoly

Return the generic conjugacy class `class` of `t`.
"""
conjugacy_class_type(t::SimpleCharTable{T}, class::Int64) where {T<:NfPoly} =
  SimpleGenericConjugacyClass{T}(t, class)

getindex(c::SimpleGenericConjugacyClass, i::Integer) = parent(c)[i][c.index]

eltype(::Type{SimpleGenericConjugacyClass{T}}) where {T<:NfPoly} = T

parent(c::AbstractGenericConjugacyClass) = c.parent

length(c::AbstractGenericConjugacyClass) = length(parent(c))
iterate(c::AbstractGenericConjugacyClass, state::Integer=1) =
  state > length(c) ? nothing : (c[state], state + 1)

@doc raw"""
    info(class::AbstractGenericConjugacyClass)

Return the infolists of the generic conjugacy class `class`.
"""
info(class::AbstractGenericConjugacyClass) = parent(class).classinfo[class.index]

@doc raw"""
    info(t::Table, class::Int64)

Return the infolists of the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> info(g, 1)
2-element Vector{Any}:
 Any[1, 0]
 Any["A_1", [1, 1]]

```
"""
info(t::Table, class::Int64) = info(conjugacy_class_type(t, class))

@doc raw"""
    order(class::AbstractGenericConjugacyClass)

Return the order of the conjugacy classes in `class`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> order(conjugacy_class_type(g, 3))
q^2 + q
```
"""
order(class::AbstractGenericConjugacyClass) = parent(class).classlength[class.index]

@doc raw"""
    order(t::Table, class::Int64)

Return the order of the conjugacy classes in the class type `class` of `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> order(g, 3)
q^2 + q
```
"""
order(t::Table, class::Int64) = order(conjugacy_class_type(t, class))

@doc raw"""
    number_of_conjugacy_classes(class::GenericConjugacyClass)

Return the number of conjugacy classes in `class`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> number_of_conjugacy_classes(conjugacy_class_type(g, 1))
q - 1
```
"""
function number_of_conjugacy_classes(class::GenericConjugacyClass)
  t = parent(class)
  o = t.ring(1)
  result = classsum(t, conjugacy_class_type_index(class), o//o)
  return shrink(result)
end

@doc raw"""
    number_of_conjugacy_classes(class::SimpleGenericConjugacyClass)

Return the number of conjugacy classes in `class`.

# Examples
```jldoctest
julia> g=green_function_table("GL2");

julia> number_of_conjugacy_classes(conjugacy_class_type(g, 1))
1
```
"""
number_of_conjugacy_classes(class::SimpleGenericConjugacyClass) =
  parent(class).classtypeorder[class.index]

@doc raw"""
    number_of_conjugacy_classes(t::Table, class::Int64)

Return the number of conjugacy classes in the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> number_of_conjugacy_classes(g, 1)
q - 1
```
"""
number_of_conjugacy_classes(t::Table, class::Int64) =
  number_of_conjugacy_classes(conjugacy_class_type(t, class))

@doc raw"""
    class_multiplication_coefficient(class1::GenericConjugacyClass, class2::GenericConjugacyClass, class3::GenericConjugacyClass)

Return the (generic) class multiplication coefficient of `class1`, `class2` and `class3`.

# Examples
```jldoctest
julia> g=generic_character_table("SL2.0");

julia> class_multiplication_coefficient(conjugacy_class_type(g, 2), conjugacy_class_type(g, 2), conjugacy_class_type(g, 4))
q + 1
With exceptions:
  a3 ∈ (q + 1)ℤ
```
"""
function class_multiplication_coefficient(
  class1::GenericConjugacyClass,
  class2::GenericConjugacyClass,
  class3::GenericConjugacyClass,
)
  check_parent(class1, class2)
  check_parent(class1, class3)
  t = parent(class1)
  sum = 0
  for (i, char) in enumerate(t)
    val1 = shift_class_parameters(t, class1[i], 1)
    val2 = shift_class_parameters(t, class2[i], 2)
    val3 = shift_class_parameters(t, class3[i], 3)
    sum += charsum(char, val1 * val2 * conj(val3))//degree(char)
  end
  return shrink((order(class1) * order(class2)) * sum//order(t))
end

@doc raw"""
    class_multiplication_coefficient(class1::SimpleGenericConjugacyClass, class2::SimpleGenericConjugacyClass, class3::SimpleGenericConjugacyClass)

Return the (generic) class multiplication coefficient of `class1`, `class2` and `class3`.

# Examples
```jldoctest
julia> g=green_function_table("GL3");

julia> class_multiplication_coefficient(conjugacy_class_type(g, 1), conjugacy_class_type(g, 2), conjugacy_class_type(g, 3))
(q + 3)//(q^5 - 2*q^4 + q^3)
```
"""
function class_multiplication_coefficient(
  class1::SimpleGenericConjugacyClass,
  class2::SimpleGenericConjugacyClass,
  class3::SimpleGenericConjugacyClass,
)
  check_parent(class1, class2)
  check_parent(class1, class3)
  t = parent(class1)
  sum = 0
  for (i, char) in enumerate(t)
    sum += (class1[i] * class2[i] * class3[i])//degree(char)
  end
  return (order(class1) * order(class2) * sum)//order(t)
end

@doc raw"""
    class_multiplication_coefficient(t::Table, class1::Int64, class2::Int64, class3::Int64)

Return the (generic) class multiplication coefficient of the class types `class1`, `class2` and `class3` of the table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("SL2.0");

julia> class_multiplication_coefficient(g,2,2,4)
q + 1
With exceptions:
  a3 ∈ (q + 1)ℤ
```
"""
function class_multiplication_coefficient(
  t::Table, class1::Int64, class2::Int64, class3::Int64
)
  return class_multiplication_coefficient(
    conjugacy_class_type(t, class1),
    conjugacy_class_type(t, class2),
    conjugacy_class_type(t, class3),
  )
end

@doc raw"""
    norm(class::GenericConjugacyClass)

Return the (generic) norm of `class`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> norm(conjugacy_class_type(g, 2))
1
```
"""
function norm(class::GenericConjugacyClass)
  t = parent(class)
  sum = 0
  for (i, char) in enumerate(t)
    val = class[i]
    sum += charsum(char, val * conj(val))
  end
  return shrink((order(class) * sum)//order(t))
end

@doc raw"""
    norm(class::SimpleGenericConjugacyClass)

Return the (generic) norm of `class`.

# Examples
```jldoctest
julia> g=green_function_table("GL3");

julia> norm(conjugacy_class_type(g, 2))
(5*q^2 + 2*q + 3)//(q^5 - 2*q^4 + q^3)
```
"""
norm(class::SimpleGenericConjugacyClass) =
  (order(class) * sum(class .^ 2))//order(parent(class))

@doc raw"""
    norm(t::Table, class::Int64)

Return the (generic) norm of the class type `class`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> norm(g,2)
1
```
"""
norm(t::Table, class::Int64) = norm(conjugacy_class_type(t, class))

@doc raw"""
    scalar_product(class1::GenericConjugacyClass, class2::GenericConjugacyClass)

Return the (generic) scalar product between `class1` and `class2`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> scalar_product(conjugacy_class_type(g, 3), conjugacy_class_type(g, 2))
0
With exceptions:
  i1 + j1 - 2*i2 ∈ (q - 1)ℤ
  i1 - i2 ∈ (q - 1)ℤ
  j1 - i2 ∈ (q - 1)ℤ
```
"""
function scalar_product(class1::GenericConjugacyClass, class2::GenericConjugacyClass)
  check_parent(class1, class2)
  t = parent(class1)
  sum = 0
  for (i, char) in enumerate(t)
    val1 = shift_class_parameters(t, class1[i], 1)
    val2 = shift_class_parameters(t, class2[i], 2)
    sum += charsum(char, val1 * conj(val2))
  end
  return shrink((order(class1) * sum)//order(t))
end

@doc raw"""
    scalar_product(class1::SimpleGenericConjugacyClass, class2::SimpleGenericConjugacyClass)

Return the (generic) scalar product between `class1` and `class2`.

# Examples
```jldoctest
julia> g=green_function_table("GL3");

julia> scalar_product(conjugacy_class_type(g, 2), conjugacy_class_type(g, 2))
(5*q^2 + 2*q + 3)//(q^5 - 2*q^4 + q^3)
```
"""
function scalar_product(
  class1::SimpleGenericConjugacyClass, class2::SimpleGenericConjugacyClass
)
  check_parent(class1, class2)
  return (order(class1) * sum(class1 .* class2))//order(parent(class1))
end

@doc raw"""
    scalar_product(t::Table, class1::Int64, class2::Int64)

Return the (generic) scalar product between the class types `class1` and `class2`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> scalar_product(g,3,2)
0
With exceptions:
  i1 + j1 - 2*i2 ∈ (q - 1)ℤ
  i1 - i2 ∈ (q - 1)ℤ
  j1 - i2 ∈ (q - 1)ℤ
```
"""
scalar_product(t::Table, class1::Int64, class2::Int64) =
  scalar_product(conjugacy_class_type(t, class1), conjugacy_class_type(t, class2))

@doc raw"""
    specialize(class::GenericConjugacyClass, var::UPoly, expr::RingElement)

Return the generic conjugacy class where the parameter `var` is replaced with `expr` in `class`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> conjugacy_class_type(g, 1)
Generic conjugacy class of GL2
  with parameters 
    i ∈ {1,…, q - 1}
  of order 1
  with values
    exp(2π𝑖*(2*i*k)//(q - 1))
    q*exp(2π𝑖*(2*i*k)//(q - 1))
    (q + 1)*exp(2π𝑖*(i*l + i*k)//(q - 1))
    (q - 1)*exp(2π𝑖*(i*k)//(q - 1))

julia> q,(i,j,l,k) = parameters(g);

julia> specialize(conjugacy_class_type(g, 1), i, q)
Generic conjugacy class of GL2
  with parameters 
    i ∈ {1,…, q - 1}, substitutions: i = q
  of order 1
  with values
    exp(2π𝑖*(2*k)//(q - 1))
    q*exp(2π𝑖*(2*k)//(q - 1))
    (q + 1)*exp(2π𝑖*(l + k)//(q - 1))
    (q - 1)*exp(2π𝑖*k//(q - 1))
```
"""
function specialize(class::GenericConjugacyClass, var::UPoly, expr::RingElement)
  t = parent(class)
  values = map(v -> evaluate(v, [var_index(var)], [expr]), class)
  substitutions = deepcopy(class.substitutions)
  push!(substitutions, ParameterSubstitution(var, base_ring(t.ring)(expr)))
  return GenericConjugacyClass(parent(class), class.index, values, substitutions)
end

@doc raw"""
    parameters(class::GenericConjugacyClass)

Return the parameters of the conjugacy class type `class`.
This includes the parameter names, ranges and exceptions.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> parameters(conjugacy_class_type(g, 3))
i ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except i - j ∈ (q - 1)ℤ
```
"""
parameters(class::GenericConjugacyClass) = parent(class).classparams[class.index]

@doc raw"""
    parameters(class::SimpleGenericConjugacyClass)

Return the parameters of the conjugacy class type `class`.
This includes the parameter names, ranges and exceptions.

# Examples
```jldoctest
julia> g=generic_character_table("uniGL2");

julia> parameters(conjugacy_class_type(g, 1))

```
"""
parameters(class::SimpleGenericConjugacyClass) = Parameters(Parameter[])

@doc raw"""
    parameters(t::Table, class::Int64)

Return the parameters of the class type `class` of the table `t`.
This includes the parameter names, ranges and exceptions.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> parameters(g, 3)
i ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except i - j ∈ (q - 1)ℤ

```
"""
parameters(t::Table, class::Int64) = parameters(conjugacy_class_type(t, class))

@doc raw"""
    centralizer_order(class::AbstractGenericConjugacyClass)

Return the order of the centralizer of the class type `class`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> centralizer_order(conjugacy_class_type(g, 1))
q^4 - q^3 - q^2 + q

```
"""
centralizer_order(class::AbstractGenericConjugacyClass) =
  div(order(parent(class)), order(class))

@doc raw"""
    centralizer_order(t::Table, class::Int64)

Return the order of the centralizer of the class type `class` of the table `t`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> centralizer_order(g, 1)
q^4 - q^3 - q^2 + q

```
"""
centralizer_order(t::Table, class::Int64) =
  centralizer_order(conjugacy_class_type(t, class))

@doc raw"""
    conjugacy_class_type_index(c::AbstractGenericConjugacyClass)

Return the index of `c` in `parent(c)`. If `c` is not an actual conjugacy class type (e.g. if it is specialized)
then `nothing` is returned.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> conjugacy_class_type_index(conjugacy_class_type(g, 1))
1

julia> q,(i,j,l,k) = parameters(g);

julia> conjugacy_class_type_index(specialize(conjugacy_class_type(g, 1), i, q))

```
"""
function conjugacy_class_type_index(c::GenericConjugacyClass)
  if c.values === nothing
    return c.index
  end
  return nothing
end
conjugacy_class_type_index(c::SimpleGenericConjugacyClass) = c.index

@doc raw"""
    show(io::IO, c::AbstractGenericConjugacyClass)

Display a summary of the generic character `c`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> conjugacy_class_type(g, 3)
Generic conjugacy class of GL2
  with parameters
    i ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except i - j ∈ (q - 1)ℤ
  of order q^2 + q
  with values
    exp(2π𝑖*(i*k + j*k)//(q - 1))
    exp(2π𝑖*(i*k + j*k)//(q - 1))
    exp(2π𝑖*(i*l + j*k)//(q - 1)) + exp(2π𝑖*(i*k + j*l)//(q - 1))
    0

julia> [conjugacy_class_type(g, 3)]
1-element Vector{GenericCharacterTables.GenericConjugacyClass}:
 Generic conjugacy class of GL2

```
"""
function show(io::IO, ::MIME"text/plain", c::AbstractGenericConjugacyClass)
  io = pretty(io)
  println(io, "Generic conjugacy class of ", parent(c).importname, Indent())
  if !isempty(parameters(c))
    println(io, "with parameters", Indent())
    print(io, parameters(c))
    if !isempty(c.substitutions)
      print(io, ", substitutions: $(join(c.substitutions, ", "))")
    end
    println(io, Dedent())
  end
  println(io, "of order ", order(c))
  print(io, "with values", Indent())
  for val in c
    print(io, "\n", val)
  end
end

function show(io::IO, c::AbstractGenericConjugacyClass)
  print(io, "Generic conjugacy class of ", parent(c).importname)
end

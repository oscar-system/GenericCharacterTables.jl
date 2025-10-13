# TODO deal with ParameterSubstitution when creating new characters, this is not done in the original implementation.

@doc raw"""
    character_type(t::Table, char::Int64)

Return the generic character `char` of `t`.
"""
character_type(t::Table, char::Int64) = t[char]

parent(c::AbstractGenericCharacter) = c.parent

@doc raw"""
    tensor_product(char1::GenericCharacter, char2::GenericCharacter)

Return the tensor product of the character types `char1` and `char2`.
This can also be obtained via `char1 * char2`.

# Examples
```jldoctest
julia> g = generic_character_table("GL2");

julia> tensor_product(g[1], g[2])
Generic character of GL2
  with parameters
    kt1 ∈ {1,…, q - 1}, kt2 ∈ {1,…, q - 1}
  of degree q
  with values
    1: q*E(q - 1)^(2*i*kt1 + 2*i*kt2)
    2: 0
    3: E(q - 1)^(i*kt1 + i*kt2 + j*kt1 + j*kt2)
    4: -E(q - 1)^(i*kt1 + i*kt2)
```
"""
function tensor_product(char1::GenericCharacter, char2::GenericCharacter)
  check_parent(char1, char2)
  t = parent(char1)
  char1id = character_type_index(char1)
  char2id = character_type_index(char2)
  char1id !== nothing || error("Characters are not both irreducible.")
  char2id !== nothing || error("Characters are not both irreducible.")
  new_char_degree = degree(char1) * degree(char2)
  new_char_values = Vector{GenericCyclo}(undef, number_of_conjugacy_class_types(t))
  for class in 1:number_of_conjugacy_class_types(t)
    # The first 4 variable sets are reserved for the computations in Ortho.jl
    # so we can use the 5th and 6th set here.
    val1 = shift_char_parameters(t, char1[class], 4)
    val2 = shift_char_parameters(t, char2[class], 5)
    new_char_values[class] = val1 * val2
  end
  param1 = shift_char_parameters(t, char1.params, 4)
  param2 = shift_char_parameters(t, char2.params, 5)
  new_char_params = Parameters(
    vcat(param1.params, param2.params), vcat(param1.exceptions, param2.exceptions)
  )
  return GenericCharacter(
    t,
    new_char_values,
    ["Tensor of type $char1id and $char2id"],
    new_char_degree,
    nothing,
    new_char_params,
    ParameterSubstitution[],
  )
end

@doc raw"""
    tensor_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T<:PolyRingElem

Return the tensor product of the character types `char1` and `char2`.
This can also be obtained via `char1 * char2`.

# Examples
```jldoctest
julia> g = green_function_table("GL3");

julia> tensor_product(g[1],g[2])
Generic character of GL3
  of degree -q^6 - 2*q^5 - 2*q^4 + 2*q^2 + 2*q + 1
  with values
    1: -q^6 - 2*q^5 - 2*q^4 + 2*q^2 + 2*q + 1
    2: 2*q + 1
    3: 1
```
"""
function tensor_product(
  char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}
) where {T<:PolyRingElem}
  check_parent(char1, char2)
  t = parent(char1)
  char1id = character_type_index(char1)
  char2id = character_type_index(char2)
  char1id !== nothing || error("Characters are not both irreducible.")
  char2id !== nothing || error("Characters are not both irreducible.")
  new_char_degree = degree(char1) * degree(char2)
  new_char_values = Vector{T}(undef, number_of_conjugacy_class_types(t))
  for class in 1:number_of_conjugacy_class_types(t)
    new_char_values[class] = char1[class] * char2[class]
  end
  return SimpleGenericCharacter{T}(
    t, new_char_values, ["Tensor of type $char1id and $char2id"], new_char_degree
  )
end

# 'classical' group characters in OSCAR treat '*' as tensor product, so we do it, too
*(char1::AbstractGenericCharacter, char2::AbstractGenericCharacter) =
  tensor_product(char1, char2)

@doc raw"""
    omega(char::GenericCharacter)

Return the (generic) central character of the character type `char`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> omega(g[1])
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}
  of degree 1
  with values
    1: E(q - 1)^(2*i*k)
    2: (q^2 - 1)*E(q - 1)^(2*i*k)
    3: (q^2 + q)*E(q - 1)^(i*k + j*k)
    4: (q^2 - q)*E(q - 1)^(i*k)

```
"""
function omega(char::GenericCharacter)
  t = parent(char)
  charid = character_type_index(char)
  new_char_degree = base_ring(t.ring)(1)
  new_char_values = Vector{GenericCyclo}(undef, number_of_conjugacy_class_types(t))
  for class in 1:number_of_conjugacy_class_types(t)
    new_char_values[class] = divexact(t.classlength[class] * char[class], degree(char))
  end
  return GenericCharacter(
    t,
    new_char_values,
    ["Omega of type $charid"],
    new_char_degree,
    nothing,
    char.params,
    ParameterSubstitution[],
  )
end

@doc raw"""
    omega(char::SimpleGenericCharacter{T}) where T <: NfPoly

Return the (generic) central character of the character type `char`.

# Examples
```jldoctest
julia> g=green_function_table("GL3");

julia> omega(g[1])
Generic character of GL3
  of degree 1
  with values
    1: 1
    2: 2*q^2 - q - 1
    3: q^3 - 2*q^2 + q
```
"""
function omega(char::SimpleGenericCharacter{T}) where {T<:NfPoly}
  t = parent(char)
  charid = character_type_index(char)
  new_char_degree = t.ring(1)
  new_char_values = Vector{T}(undef, number_of_conjugacy_class_types(t))
  for class in 1:number_of_conjugacy_class_types(t)
    new_char_values[class] = divexact(t.classlength[class] * char[class], degree(char))
  end
  return SimpleGenericCharacter{T}(
    t, new_char_values, ["Omega of type $charid"], new_char_degree
  )
end

@doc raw"""
    linear_combination(coeffs::Vector{<:RingElement}, chars::Vector{<:GenericCharacter})

Return the linear combination of the character types `chars` with coefficients `coeffs`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> linear_combination([5,1],[g[1],g[2]])
Generic character of GL2
  with parameters
    kl1 ∈ {1,…, q - 1}, kl2 ∈ {1,…, q - 1}
  of degree q + 5
  with values
    1: 5*E(q - 1)^(2*i*kl1) + q*E(q - 1)^(2*i*kl2)
    2: 5*E(q - 1)^(2*i*kl1)
    3: E(q - 1)^(i*kl2 + j*kl2) + 5*E(q - 1)^(i*kl1 + j*kl1)
    4: -E(q - 1)^(i*kl2) + 5*E(q - 1)^(i*kl1)
```
"""
function linear_combination(coeffs::Vector{<:RingElement}, chars::Vector{<:GenericCharacter})
  length(coeffs) == length(chars) ||
    error("Different number of coefficients and character types.")
  n = length(coeffs)
  t = parent(chars[1])
  for char in chars[2:end]
    check_parent(char, chars[1])
  end
  charids = Vector{Int64}(undef, n)
  for i in 1:n
    tmp = character_type_index(chars[i])
    tmp !== nothing || error("Characters are not all irreducible.")
    charids[i] = tmp
  end
  S = base_ring(t.ring)
  # There a 6 pre defined variable sets used in Ortho.jl and for tensor products.
  extra_var_batches = (nvars(S) - 1) ÷ number_of_parameters(t) - 6
  missing_var_batches = n - extra_var_batches
  if missing_var_batches > 0
    vars = map(x -> String(x), symbols(S)[2:(number_of_parameters(t) + 1)]) .* "l"
    for i in 1:missing_var_batches
      gens(S, vars .* string(extra_var_batches + i))
    end
  end
  degrees = map(degree, chars)
  new_char_degree = sum(coeffs .* degrees)
  new_char_values = Vector{GenericCyclo}(undef, number_of_conjugacy_class_types(t))
  for class in 1:number_of_conjugacy_class_types(t)
    new_char_values[class] = t.ring(0)
    for i in 1:n
      new_char_values[class] += shift_char_parameters(t, coeffs[i] * chars[i][class], 5 + i)
    end
  end
  info = join(map(x -> join(x, " * type "), zip(coeffs, charids)), " + ")  # TODO
  params = Vector{Parameters}(undef, n)
  for i in 1:n
    params[i] = shift_char_parameters(t, chars[i].params, 5 + i)
  end
  new_char_params = Parameters(
    vcat(map(x -> x.params, params)...), vcat(map(x -> x.exceptions, params)...)
  )
  return GenericCharacter(
    t,
    new_char_values,
    ["linear_combination $info"],
    new_char_degree,
    nothing,
    new_char_params,
    ParameterSubstitution[],
  )
end

@doc raw"""
    linear_combination(coeffs::Vector{<:RingElement}, chars::Vector{SimpleGenericCharacter{T}}) where T <: NfPoly

Return the linear combination of the character types `chars` with coefficients `coeffs`.

# Examples
```jldoctest
julia> g=green_function_table("GL3");

julia> linear_combination([5,1],[g[1],g[2]])
Generic character of GL3
  of degree 4*q^3 + 10*q^2 + 10*q + 6
  with values
    1: 4*q^3 + 10*q^2 + 10*q + 6
    2: 10*q + 6
    3: 6
```
"""
function linear_combination(
  coeffs::Vector{<:RingElement}, chars::Vector{SimpleGenericCharacter{T}}
) where {T<:NfPoly}
  length(coeffs) == length(chars) ||
    error("Different number of coefficients and character types.")
  n = length(coeffs)
  t = parent(chars[1])
  for char in chars[2:end]
    check_parent(char, chars[1])
  end
  charids = Vector{Int64}(undef, n)
  for i in 1:n
    tmp = character_type_index(chars[i])
    tmp !== nothing || error("Characters are not all irreducible.")
    charids[i] = tmp
  end
  coeffs = map(x -> t.ring(x), coeffs)  # TODO ring needed?
  degrees = map(degree, chars)
  new_char_degree = sum(coeffs .* degrees)
  new_char_values = Vector{T}(undef, number_of_conjugacy_class_types(t))
  for class in 1:number_of_conjugacy_class_types(t)
    new_char_values[class] = t.ring(0)
    for i in 1:n
      new_char_values[class] += coeffs[i] * chars[i][class]
    end
  end
  info = join(map(x -> join(x, " * type "), zip(coeffs, charids)), " + ")  # TODO
  return SimpleGenericCharacter{T}(
    t, new_char_values, ["linear_combination $info"], new_char_degree
  )
end

@doc raw"""
    norm(char::GenericCharacter)

Return the norm of the character type `char`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> norm(g[1])
1
```
"""
function norm(char::GenericCharacter)
  t = parent(char)
  sum = 0
  for class in 1:number_of_conjugacy_class_types(t)
    val = char[class]
    sum += t.classlength[class] * classsum(t, class, val * conj(val))
  end
  return shrink(sum//order(t))
end

@doc raw"""
    norm(char::SimpleGenericCharacter{T}) where T <: NfPoly

Return the norm of the character type `char`.

# Examples
```jldoctest
julia> g=green_function_table("GL3");

julia> norm(g[1])
6//(q^3 - 3*q^2 + 3*q - 1)
```
"""
function norm(char::SimpleGenericCharacter{T}) where {T<:NfPoly}
  t = parent(char)
  sum = 0
  for class in 1:number_of_conjugacy_class_types(t)
    sum += char[class]^2 * t.classlength[class] * t.classtypeorder[class]
  end
  return sum//order(t)
end

@doc raw"""
    scalar_product(char1::GenericCharacter, char2::GenericCharacter)

Return the scalar product between the character types `char1` and `char2`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> scalar_product(g[3],g[2])
0
With exceptions:
  l1 + k1 - 2*k2 ∈ (q - 1)ℤ
  l1 - k2 ∈ (q - 1)ℤ
  k1 - k2 ∈ (q - 1)ℤ
```
"""
function scalar_product(char1::GenericCharacter, char2::GenericCharacter)
  check_parent(char1, char2)
  t = parent(char1)
  sum = 0
  for class in 1:number_of_conjugacy_class_types(t)
    val1 = shift_char_parameters(t, char1[class], 1)
    val2 = shift_char_parameters(t, char2[class], 2)
    sum += t.classlength[class] * classsum(t, class, val1 * conj(val2))
  end
  return shrink(sum//order(t))
end

@doc raw"""
    scalar_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <: NfPoly

Return the scalar product between the character types `char1` and `char2`.

# Examples
```jldoctest
julia> g=green_function_table("GL3");

julia> scalar_product(g[1],g[2])
0
```
"""
function scalar_product(
  char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}
) where {T<:NfPoly}
  check_parent(char1, char2)
  t = parent(char1)
  sum = 0
  for class in 1:number_of_conjugacy_class_types(t)
    sum += char1[class] * char2[class] * t.classlength[class] * t.classtypeorder[class]
  end
  return sum//order(t)
end

function character_decomposition_multiplicity(char1::GenericCharacter, char2::GenericCharacter, char3::GenericCharacter)
  check_parent(char1, char2)
  check_parent(char1, char3)
  t = parent(char1)
  sum = 0
  for class in 1:number_of_conjugacy_class_types(t)
    val1 = shift_char_parameters(t, char1[class], 1)
    val2 = shift_char_parameters(t, char2[class], 2)
    val3 = shift_char_parameters(t, char3[class], 3)
    sum += t.classlength[class] * classsum(t, class, val1 * val2 * conj(val3))
  end
  return shrink(sum//order(t))
end

@doc raw"""
    specialize(char::GenericCharacter, var::UPoly, expr::RingElement)

Return the generic character where the parameter `var` is replaced with `expr` in `char`.

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

julia> q,(i,j,l,k) = parameters(g);

julia> specialize(g[1], i, q)
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}, substitutions: i = q
  of degree 1
  with values
    1: E(q - 1)^(2*k)
    2: E(q - 1)^(2*k)
    3: E(q - 1)^(j*k + k)
    4: E(q - 1)^k

```
"""
function specialize(char::GenericCharacter, var::UPoly, expr::RingElement)
  t = parent(char)
  new_char_values = Vector{GenericCyclo}(undef, number_of_conjugacy_class_types(t))
  for class in 1:number_of_conjugacy_class_types(t)
    new_char_values[class] = evaluate(char[class], [var_index(var)], [expr])
  end
  substitutions = deepcopy(char.substitutions)
  push!(substitutions, ParameterSubstitution(var, base_ring(t.ring)(expr)))
  # TODO: What about the sum function here?
  return GenericCharacter(
    t, new_char_values, char.info, degree(char), nothing, char.params, substitutions
  )
end

@doc raw"""
    character_type_index(c::AbstractGenericCharacter)

Return the index of `c` in `parent(c)`. If `c` is not an irreducible character type (e.g. if it is a tensor product)
then `nothing` is returned.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> character_type_index(g[1])
1

julia> character_type_index(g[1]*g[1])

```
"""
function character_type_index(c::AbstractGenericCharacter)
  ct = parent(c)
  for i in 1:length(ct)
    if ct[i] === c
      return i
    end
  end
  return nothing
end

@doc raw"""
    degree(char::AbstractGenericCharacter)

Return the character degree of the characters in `char`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> degree(g[3])
q + 1

```
"""
degree(char::AbstractGenericCharacter) = char.degree

@doc raw"""
    number_of_characters(char::GenericCharacter)

Return the number of characters in the generic character `char`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> number_of_characters(g[1])
q - 1

```
"""
function number_of_characters(char::GenericCharacter)
  character_type_index(char) !== nothing ||
    error("Cannot calculate number of characters in reducible types.")
  o = parent(char).ring(1)
  result = charsum(char, o//o)
  return shrink(result)
end

number_of_characters(char::SimpleGenericCharacter) = 1

@doc raw"""
    info(char::AbstractGenericCharacter)

Return the infolists of the character type `char`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> info(g[2])
2-element Vector{Any}:
 Any[1, 1]
 Any["A_1", [1, 1]]

```
"""
info(char::AbstractGenericCharacter) = char.info

@doc raw"""
    parameters(char::AbstractGenericCharacter)

Return the parameters of the character type `char`.
This includes the parameter names, ranges and exceptions.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> parameters(g[3])
k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ
```
"""
parameters(char::GenericCharacter) = char.params
parameters(char::SimpleGenericCharacter) = Parameters(Parameter[])

@doc raw"""
    show(io::IO, c::AbstractGenericCharacter)

Display a summary of the generic character `c`.

# Examples
```jldoctest
julia> g=generic_character_table("GL2");

julia> g[3]
Generic character of GL2
  with parameters
    k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ
  of degree q + 1
  with values
    1: (q + 1)*E(q - 1)^(i*l + i*k)
    2: E(q - 1)^(i*l + i*k)
    3: E(q - 1)^(i*l + j*k) + E(q - 1)^(i*k + j*l)
    4: 0

julia> [g[3]]
1-element Vector{GenericCharacterTables.GenericCharacter}:
 Generic character of GL2

```
"""
function show(io::IO, ::MIME"text/plain", c::AbstractGenericCharacter)
  io = pretty(io)
  println(io, "Generic character of ", parent(c).importname, Indent())
  if !isempty(parameters(c))
    println(io, "with parameters ", Indent())
    print(io, parameters(c))
    if !isempty(c.substitutions)
      print(io, ", substitutions: $(join(c.substitutions, ", "))")
    end
    println(io, Dedent())
  end
  println(io, "of degree ", degree(c))
  print(io, "with values", Indent())
  pad = ndigits(length(c))
  for (i, val) in enumerate(c)
    print(io, "\n", lpad(i, pad), ": ", val)
  end
end

function show(io::IO, c::AbstractGenericCharacter)
  print(io, "Generic character of ", parent(c).importname)
end

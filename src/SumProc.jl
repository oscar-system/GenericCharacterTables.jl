@doc raw"""
    evaluate(a::Union{GenericCyclo,GenericCycloFrac}, vars::Vector{UPoly}, vals::Vector{<:RingElement})

Substitute `vals[i]` for `vars[i]` in `a`.

If `vars` is `Vector{Int64}`, then `vars[i]` represents the index of the variable to replace.

# Examples
```jldoctest
julia> S, E, q = generic_cyclotomic_ring();

julia> R = base_ring(S);

julia> i, j, k, l = params(S, [:i, :j, :k, :l]);

julia> a = S(Dict(2//(q-1)*i*j+1//q*k^2+1//2*i*l => R(1)))
E(2*q^2 - 2*q)^(q^2*i*l + 4*q*i*j - q*i*l + 2*q*k^2 - 2*k^2)

julia> evaluate(a,[i,k],[j,3*i])
E(2*q^2 - 2*q)^(q^2*j*l + 18*q*i^2 + 4*q*j^2 - q*j*l - 18*i^2)

```
"""
evaluate(
  a::Union{GenericCyclo,GenericCycloFrac}, vars::Vector{UPoly}, vals::Vector{<:RingElement}
) = evaluate(a, var_index.(vars), vals)  # TODO remove?

@doc raw"""
    nesum(a::GenericCyclo, var::Int64, lower::Int64, upper::Union{Int64,UPoly})

Return the sum of `a`, from `var=lower` to `upper` as `GenericCycloFrac` using the closed formular for geometric sums. If this is not possible
an exception will be thrown.

# Examples
```jldoctest
julia> S, E, q = generic_cyclotomic_ring();

julia> R = base_ring(S);

julia> i = param(S, :i);

julia> a = S(Dict(1//(q-1)*i => R(1)))
E(q - 1)^i

julia> GenericCharacterTables.nesum(a, i, 1, q-1)
0
With exceptions:
  1 ∈ (q - 1)ℤ
```
"""
function nesum(a::GenericCyclo, var::Int64, lower::Int64, upper::Union{Int64,UPoly})
  if isone(lower)
    return nesum(a, var, 0, upper) - evaluate(a, [var], [0])
  elseif lower > 1
    return nesum(a, var, 0, upper) - nesum(a, var, 0, lower - 1)
  end
  # From now on `lower` can be assumed to be zero.
  sum = zero(a)
  R = parent(a)
  # Using the commutativity of the addition in the ring of generic cyclotomics
  # the sum can be computed separately for each of the summands of `a`.
  for (argument, modulus) in a.f
    # `denominator(argument)` is assumed to be independent of `var`  # TODO maybe raise an exception otherwise?
    # Also `modulus` is assumed to be independent of `var`  # TODO also rasie an exception?
    var_degree = degrees(numerator(argument))[var]
    if var_degree <= 0  # The current summand doesn't depend on `var` at all and thus the sum boils down to a simple multiplication.
      sum += (upper + 1) * R(Dict(argument => modulus))
    elseif isone(var_degree)  # `argument` linearly depends on `var` hence the sum is a geometric sum.
      var_coeff = coeff(numerator(argument), [var], [1])//denominator(argument)
      constant = evaluate(argument, [var], [0])
      o = one(modulus)
      geometric_sum =
        R(Dict(constant => modulus)) *
        (R(Dict((upper + 1) * var_coeff => o)) - 1)//(R(Dict(var_coeff => o)) - 1)
      sum += geometric_sum
      # If `var_coeff` evaluates to an integer `R(Dict(var_coeff => o))` evaluates to one and thus `R(Dict(var_coeff => o))-1`
      # to zero. So in this case the closed formular for the geometric sum doesn't hold.
      add_exception!(sum, var_coeff)
    else  # `argument` nonlinearly depends on `var` so the sum is currently not computable.
      # This exception shouldn't be thrown when using the included character tables.
      throw(
        DomainError(
          argument, "Nonlinear dependencies on the summation variable can't be resolved."
        ),
      )
    end
  end
  return sum
end
function nesum(a::GenericCycloFrac, var::Int64, lower::Int64, upper::Union{Int64,UPoly})
  one(a) * nesum(a.numerator, var, lower, upper)//a.denominator  # one(a) is needed to track all exceptions
end
function nesum(
  a::Union{GenericCyclo,GenericCycloFrac},
  var::UPoly,
  lower::Int64,
  upper::Union{Int64,UPoly},
)
  nesum(a, var_index(var), lower, upper)
end

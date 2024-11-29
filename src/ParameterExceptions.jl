@doc raw"""
    is_integer(x::UPolyFrac)

Return if `x` represents an integer.
"""
function is_integer(x::UPolyFrac)
  if isone(denominator(x))
    if is_constant(numerator(x))
      c = constant_coefficient(numerator(x))
      if isone(denominator(c))
        return true
      end
    end
  end
  return false
end

@doc raw"""
    add_exception!(a::ParameterExceptions, exception::UPolyFrac)

Include `exception` into `a`. This also removes all now redundant exceptions from `a`.
"""
function add_exception!(a::ParameterExceptions, exception::UPolyFrac)
  !is_integer(inv(exception)) || return nothing  # TODO make this more general
  new_exception = sign(leading_coefficient(numerator(exception))) * exception
  for old_exception in a.exceptions
    if is_integer(old_exception//new_exception)
      return nothing
    end
  end
  filter!(e -> !is_integer(new_exception//e), a.exceptions)
  push!(a.exceptions, new_exception)
end

@doc raw"""
    merge(x::ParameterExceptions, y::ParameterExceptions)

Return a new collection of parameter exceptions composed of `x` and `y` where all redundant exceptions are omitted.
"""
function merge(x::ParameterExceptions, y::ParameterExceptions)
  is_restriction(x) || return y
  is_restriction(y) || return x
  exceptions = deepcopy(x)
  for exception in y.exceptions
    add_exception!(exceptions, exception)
  end
  return exceptions
end

@doc raw"""
    is_restriction(x::ParameterExceptions)

Return if `x` actually restricts something.
"""
is_restriction(x::ParameterExceptions) = !isempty(x.exceptions)

function show(io::IO, x::ParameterExceptions)
  for (i, exception) in enumerate(x.exceptions)
    if isone(denominator(exception))
      print(io, "$(numerator(exception)) ∈ ℤ")
    else
      print(io, "$(numerator(exception)) ∈ ($(denominator(exception)))ℤ")
    end
    if i < length(x.exceptions)
      print(io, "\n")
    end
  end
end

# evaluate

function evaluate(x::ParameterExceptions, vars::Vector{Int64}, vals::Vector{<:RingElement})
  exceptions = evaluate.(x.exceptions, Ref(vars), Ref(vals))
  return ParameterExceptions(exceptions)
end

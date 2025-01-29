function add_exception!(a::GenericCycloFrac, exception::UPolyFrac)
  add_exception!(a.exceptions, exception)
end

@doc raw"""
    shrink(a::GenericCycloFrac{<:NfPoly})

Remove exceptions from `a` that follow from the others. And try to simplify the representation of `a`.
"""
function shrink(a::GenericCycloFrac)  # TODO Move this to the constructor of GenericCycloFrac?
  new_numerator = a.numerator
  new_denominator = a.denominator
  if isone(length(new_numerator.f)) && isone(length(new_denominator.f))
    numerator_argument, numerator_modulus = collect(new_numerator.f)[1]
    denominator_argument, denominator_modulus = collect(new_denominator.f)[1]
    if numerator_argument == denominator_argument
      b = numerator_modulus//denominator_modulus
      o = one(new_numerator)
      new_numerator = o * numerator(b)
      new_denominator = o * denominator(b)
    end
  end
  return GenericCycloFrac(new_numerator, new_denominator, a.exceptions; simplify=false)
end

function expressify(x::GenericCycloFrac; context = nothing)
  n = expressify(x.numerator; context)
  isone(x.denominator) && return n
  d = expressify(x.denominator; context)
  return Expr(:call, ://, n, d)
end

@enable_all_show_via_expressify GenericCycloFrac

isone(x::GenericCycloFrac) = isone(x.numerator) && isone(x.denominator)

@doc raw"""
    iszero(x::GenericCycloFrac; ignore_exceptions::Bool=false)

Return if `x` is zero. If `ignore_exceptions` is true then the exceptions of `x` will not be considered.
"""
function iszero(x::GenericCycloFrac; ignore_exceptions::Bool=false)
  if ignore_exceptions
    return iszero(x.numerator)
  end
  return iszero(x.numerator) && !is_restriction(x.exceptions)
end

# Unary operations

function one(x::GenericCycloFrac)
  o = one(x.numerator)
  return GenericCycloFrac(o, o, x.exceptions; simplify=false)
end

zero(x::GenericCycloFrac) =
  GenericCycloFrac(zero(x.numerator), one(x.denominator), x.exceptions; simplify=false)  # TODO construct a generic zero here?

conj(x::GenericCycloFrac) =
  GenericCycloFrac(conj(x.numerator), conj(x.denominator), x.exceptions; simplify=false)

inv(x::GenericCycloFrac) =
  GenericCycloFrac(x.denominator, x.numerator, x.exceptions; simplify=false)

-(x::GenericCycloFrac) =
  GenericCycloFrac(-x.numerator, x.denominator, x.exceptions; simplify=false)

# Binary operations

*(factor::RingElement, x::GenericCycloFrac) =
  if iszero(factor)
    zero(x)
  else
    GenericCycloFrac(factor * x.numerator, x.denominator, x.exceptions)
  end
*(x::GenericCycloFrac, factor::RingElement) = factor * x

(==)(x::GenericCycloFrac, y::GenericCycloFrac) = iszero((x - y).numerator)  # TODO compare exceptions?

(==)(x::GenericCycloFrac, y::RingElement) = iszero((x - y).numerator)  # TODO compare exceptions?

(==)(x::RingElement, y::GenericCycloFrac) = y == x

function *(x::GenericCycloFrac, y::GenericCycloFrac)
  numerator = x.numerator * y.numerator
  denominator = x.denominator * y.denominator
  exceptions = merge(x.exceptions, y.exceptions)
  GenericCycloFrac(numerator, denominator, exceptions)
end

function +(x::GenericCycloFrac, y::GenericCycloFrac)
  if x.denominator == y.denominator
    return GenericCycloFrac(
      x.numerator + y.numerator,
      x.denominator,
      merge(x.exceptions, y.exceptions);
      simplify=!isone(x.denominator),
    )
  else
    numerator = x.numerator * y.denominator + y.numerator * x.denominator
    denominator = x.denominator * y.denominator
    exceptions = merge(x.exceptions, y.exceptions)
    return GenericCycloFrac(numerator, denominator, exceptions)
  end
end

+(x::GenericCycloFrac, y::RingElement) =
  GenericCycloFrac(x.numerator + y * x.denominator, x.denominator, x.exceptions)

+(x::RingElement, y::GenericCycloFrac) = y + x

-(x::GenericCycloFrac, y::GenericCycloFrac) = x + (-y)

-(x::GenericCycloFrac, y::RingElement) = x + (-y)

-(x::RingElement, y::GenericCycloFrac) = x + (-y)

//(x::GenericCycloFrac, y::GenericCycloFrac) =
  x * GenericCycloFrac(y.denominator, y.numerator, y.exceptions)

//(x::GenericCycloFrac, y::RingElement) =
  GenericCycloFrac(x.numerator, x.denominator * y, x.exceptions)

//(x::RingElement, y::GenericCycloFrac) = x * inv(y)

//(x::GenericCyclo, y::GenericCyclo) = GenericCycloFrac(x, y, parameter_exceptions())

//(x::GenericCyclo, y::UPoly) = GenericCycloFrac(x, parent(x)(y), parameter_exceptions())

//(x::UPoly, y::GenericCyclo) = GenericCycloFrac(parent(y)(x), y, parameter_exceptions())

# evaluate

function evaluate(x::GenericCycloFrac, vars::Vector{Int64}, vals::Vector{<:RingElement})
  numerator = evaluate(x.numerator, vars, vals)
  denominator = evaluate(x.denominator, vars, vals)
  exceptions = evaluate(x.exceptions, vars, vals)
  return GenericCycloFrac(numerator, denominator, exceptions)
end

# Generic character tables of central quotients G/Z, derived from the table of G.
#
# The characters of G/Z are the characters of G with Z in their kernel, the classes
# of G/Z are the Z-orbits of classes of G. Neither is visible in the value matrix,
# so `CentralQuotientData` supplies, in the parameters of the parent table:
#
#   character type  parent type, the parametrization `τ` of the characters with Z in
#                   their kernel and a left inverse of it
#   class type      parent type, a representative `σ`, a Z-invariant projection `π`
#                   onto the new parameters, and the order of the stabilizer in Z
#   G               |Z|, the parameters of a generator `z` of Z, and for |Z| not
#                   constant (GL, GU) how the twist by a linear character moves the
#                   character parameters
#
# Values, degrees, class lengths and exceptions follow by substitution. The sums
# follow from the parent's sums:
#
#   classes   Σ_{free C} f(C) = 1/|Z| Σ_{C' in T} f(π(C')) - Σ_{special C} f(C)/|Stab C|
#
#             since a class of G/Z with stabilizer S in Z has |Z|/|S| preimages in T.
#
#   chars     Σ_{χ in T, Z ⊆ ker χ} f(χ) = 1/|Z| Σ_{s<g} Σ_{χ in T} ω_χ(z^(s|Z|/g)) F(χ)
#
#             The inner sum over s filters the characters whose central character
#             is trivial on the subgroup of order g. With no twist, g = |Z| and F is
#             f∘τ⁻¹. Otherwise twisting by the linear character shifts the central
#             character by g, and F averages f over the g twists of χ with trivial
#             central character; these are g/|Z| of each twist orbit.
#
# The filter has to run over a constant number g of terms: a symbolic sum over Z
# would be zero generically, and `nesum` only reports where that fails. With a
# twist, F has exponents with denominator g, so the geometric sums in `nesum` no
# longer cancel: on products of values the sums of PGL3.1 take minutes, not ms.

@doc raw"""
    QuotientCharacterType

A character type of a central quotient: the characters of the parent type `parent`
whose kernel contains the center, parametrized by `substitution`, which maps parent
parameters to expressions in `params`. `inverse` maps each of `params` to an
expression in the parent parameters; it only needs to be a left inverse.
`exceptions` are added to the substituted parent exceptions.
"""
struct QuotientCharacterType
  parent::Int
  substitution::Vector{Pair{UPoly,UPoly}}
  inverse::Vector{Pair{UPoly,UPolyFrac}}
  params::Vector{Parameter}
  exceptions::Vector{UPolyFrac}
  info::Any
end

function QuotientCharacterType(parent::Int; substitution=Pair{UPoly,UPoly}[],
  inverse=Pair{UPoly,UPolyFrac}[], params=Parameter[], exceptions=UPolyFrac[],
  info=nothing)
  return QuotientCharacterType(parent, poly_pairs(substitution), frac_pairs(inverse),
    params, exceptions, info)
end

# `(q - 1)//2` is a fraction, so accept fractions with constant denominators.
as_poly(x::UPoly) = x
function as_poly(x::UPolyFrac)
  @req is_constant(denominator(x)) "$x is not a polynomial"
  return numerator(x) * inv(constant_coefficient(denominator(x)))
end
poly_pairs(s) = Pair{UPoly,UPoly}[v => as_poly(e) for (v, e) in s]
frac_pairs(s) = Pair{UPoly,UPolyFrac}[v => fraction_field(parent(v))(e) for (v, e) in s]

@doc raw"""
    QuotientClassType

A class type of a central quotient: the images of the classes of the parent type
`parent`, represented by `substitution`, which maps parent parameters to expressions
in `params`. `stabilizer` is the order of the stabilizer in the center of each class.

A type with trivial stabilizer and parameters needs `projection`, which maps each of
`params` to an expression in the parent parameters that is invariant under the
center; its sum is derived from the parent's. A type with nontrivial stabilizer lists
the parameter values of its classes in `points`, a type without parameters is a
single class.
"""
struct QuotientClassType
  parent::Int
  substitution::Vector{Pair{UPoly,UPoly}}
  projection::Vector{Pair{UPoly,UPoly}}
  stabilizer::Int
  params::Vector{Parameter}
  exceptions::Vector{UPolyFrac}
  points::Vector{Vector{UPoly}}
  info::Any
end

function QuotientClassType(parent::Int; substitution=Pair{UPoly,UPoly}[],
  projection=Pair{UPoly,UPoly}[], stabilizer::Int=1, params=Parameter[],
  exceptions=UPolyFrac[], points=Vector{UPoly}[], info=nothing)
  points = [as_poly.(p) for p in points]
  (stabilizer > 1 || isempty(params)) && isempty(points) && push!(points, UPoly[])
  return QuotientClassType(parent, poly_pairs(substitution), poly_pairs(projection),
    stabilizer, params, exceptions, points, info)
end

@doc raw"""
    CentralQuotientData

The data needed to derive the table of `G/Z` from the table of `G`, see
[`central_quotient`](@ref). `center_class` is the class type of the parent containing
`Z`, `center_generator` the parameter values of a generator `z` there; the parameters
of `z^m` are assumed to be `m` times those. `filter` is the order of the subgroup of
`Z` whose characters are filtered.

`twist[T]` maps the parameters of parent character type `T` to their shift under
tensoring with a linear character whose restriction to `Z` is `z ↦ z^filter`. Without
`twist`, `filter` must equal `center_order`.
"""
struct CentralQuotientData
  name::String
  congruence::Union{Tuple{ZZRingElem,ZZRingElem},Nothing}
  center_order::UPoly
  center_class::Int
  center_generator::Vector{Pair{UPoly,UPoly}}
  filter::Int
  twist::Union{Vector{Vector{Pair{UPoly,UPoly}}},Nothing}
  chars::Vector{QuotientCharacterType}
  classes::Vector{QuotientClassType}
  information::String
end

function CentralQuotientData(name::String; congruence=nothing, center_order,
  center_class::Int, center_generator, filter::Int, twist=nothing, chars, classes,
  information::String="")
  twist = twist === nothing ? nothing : [poly_pairs(d) for d in twist]
  return CentralQuotientData(name, congruence, as_poly(center_order), center_class,
    poly_pairs(center_generator), filter, twist, chars, classes, information)
end

# Simultaneous substitution `v => e` for each pair of `s`. Unlike `evaluate` this
# accepts fractions `e`; they may only end up in exponents and exceptions.
substitute(x, s::Vector{<:Pair}) =
  substitute(x, Int[var_index(v) for (v, _) in s], [e for (_, e) in s])

function substitute(x::UPolyFrac, vars::Vector{Int}, vals::Vector)
  isempty(vars) && return x
  R = base_ring(parent(x))
  F = parent(x)
  allvals = [F(v) for v in gens(R)]
  allvals[vars] = F.(vals)
  # constants evaluate to rationals
  return F(evaluate(numerator(x, false), allvals))//F(
    evaluate(denominator(x, false), allvals)
  )
end

function substitute(x::UPoly, vars::Vector{Int}, vals::Vector)
  y = substitute(fraction_field(parent(x))(x), vars, vals)
  @req is_constant(denominator(y)) "substitution leaves a fraction outside the exponents"
  return numerator(y) * inv(constant_coefficient(denominator(y)))
end

function substitute(x::GenericCyclo, vars::Vector{Int}, vals::Vector)
  isempty(vars) && return x
  f = Dict{UPolyFrac,UPoly}()
  for (key, value) in x.f
    key = substitute(key, vars, vals)
    f[key] = get(f, key, zero(value)) + substitute(value, vars, vals)
  end
  return parent(x)(f)
end

function substitute(x::ParameterExceptions, vars::Vector{Int}, vals::Vector)
  result = parameter_exceptions()
  for e in x
    add_exception!(result, substitute(e, vars, vals))
  end
  return result
end

substitute(x::GenericCycloFrac, vars::Vector{Int}, vals::Vector) = GenericCycloFrac(
  substitute(x.numerator, vars, vals), substitute(x.denominator, vars, vals),
  substitute(x.exceptions, vars, vals),
)

ring_of(x::GenericCyclo) = parent(x)
ring_of(x::GenericCycloFrac) = parent(x.numerator)

# The image of `x` in `S`, a ring with the same base ring as `parent(x)`.
coerce_to(S::GenericCycloRing, x::GenericCyclo) = S(x.f)
coerce_to(S::GenericCycloRing, x::GenericCycloFrac) = GenericCycloFrac(
  coerce_to(S, x.numerator), coerce_to(S, x.denominator), x.exceptions
)

function substituted_exceptions(exceptions, s::Vector{<:Pair}, extra::Vector{UPolyFrac})
  result = parameter_exceptions()
  for e in exceptions
    e = substitute(e, s)
    # an exception that became a constant excludes nothing, or everything
    is_rational_number(e) && continue
    add_exception!(result, e)
  end
  for e in extra
    add_exception!(result, e)
  end
  return result
end

# ω_χ(z^m) for every character χ of the parent type `char`.
function central_character(t::CharTable, data::CentralQuotientData, char::Int, m)
  c = t[char]
  vals = [m * e for (_, e) in data.center_generator]
  v = substitute(
    c[data.center_class], [var_index(v) for (v, _) in data.center_generator], vals
  )
  return divexact(v, degree(c))
end

# The linear form `c` with `ω_χ(z) = E(|Z|)^c(χ)` on the parent type `char`.
function central_exponent(t::CharTable, data::CentralQuotientData, char::Int)
  w = central_character(t, data, char, 1)
  @req length(w.f) == 1 && isone(only(values(w.f))) "central character of type $char is not a root of unity"
  c = only(keys(w.f)) * data.center_order
  @req is_constant(denominator(c)) "central character of type $char is not linear"
  return numerator(c) * (1//constant_coefficient(denominator(c)))
end

@doc raw"""
    central_quotient(t::CharTable, data::CentralQuotientData; check::Bool=true)

Return the generic character table of the quotient of the group of `t` by a central
subgroup `Z`, described by `data`, see [`CentralQuotientData`](@ref).

With `check`, verify that the characters have `Z` in their kernel, that the inverse
substitutions are left inverses, that the class projections are compatible with the
values of the characters, and that the twists shift the central characters by
`data.filter`.
"""
function central_quotient(t::CharTable, data::CentralQuotientData; check::Bool=true)
  R = t.ring
  B = base_ring(R)
  congruence = data.congruence
  if congruence !== nothing && R.congruence !== nothing
    congruence = (crt(congruence..., R.congruence...), lcm(congruence[2], R.congruence[2]))
  elseif congruence === nothing
    congruence = R.congruence
  end
  S = GenericCycloRing(B, R.symbol, congruence, R.power)
  Zorder = data.center_order
  g = data.filter
  @req data.twist !== nothing || Zorder == g "without a twist the filter must be all of Z"

  check && check_quotient_data(t, data, S)

  # values, degrees, lengths and exceptions follow by substitution
  chars, classes = data.chars, data.classes
  table = Matrix{GenericCyclo}(undef, length(chars), length(classes))
  for (i, c) in enumerate(chars), (j, k) in enumerate(classes)
    v = substitute(substitute(t[c.parent, k.parent], c.substitution), k.substitution)
    table[i, j] = coerce_to(S, v)
  end
  chardegree = [degree(t[c.parent]) for c in chars]
  classlength = [t.classlength[k.parent] * (1//k.stabilizer) for k in classes]
  charparams = [
    Parameters(
      c.params,
      substituted_exceptions(
        exceptions(parameters(t[c.parent])), c.substitution, c.exceptions),
    ) for c in chars
  ]
  # the sum of a type with nontrivial stabilizer runs over its points only
  classparams = [
    Parameters(
      k.params,
      substituted_exceptions(
        k.stabilizer > 1 ? UPolyFrac[] : exceptions(t.classparams[k.parent]),
        k.substitution,
        k.exceptions),
    ) for k in classes
  ]

  classsums = Function[quotient_classsum(t, data, j) for j in eachindex(classes)]
  charsums = Function[quotient_charsum(t, data, i) for i in eachindex(chars)]

  classinfo = [k.info === nothing ? t.classinfo[k.parent] : k.info for k in classes]
  charinfo = [c.info === nothing ? info(t[c.parent]) : c.info for c in chars]
  information = isempty(data.information) ? t.information : data.information
  return CharTable(divexact(order(t), Zorder), table, classinfo, classlength, charinfo,
    chardegree, classsums, charsums, t.classparamindex, t.charparamindex, classparams,
    charparams, S, information, data.name)
end

function quotient_classsum(t::CharTable, data::CentralQuotientData, j::Int)
  k = data.classes[j]
  vars = [var_index(p.var) for p in k.params]
  # A type without parameters is a single class. The others need the parent type
  # to be stable under Z: in SL2.1 for q ≡ 3 mod 4, -1 maps class type 2 into 3.
  if k.stabilizer > 1 || isempty(k.params)
    return function (tt::Union{GenericCyclo,GenericCycloFrac})
      return sum(substitute(tt, vars, p) for p in k.points)
    end
  end

  # The classes of the parent type with nontrivial stabilizer, as points in the
  # parameters of this type.
  specials = Tuple{Int,Vector{UPoly}}[]
  for other in data.classes
    other.parent == k.parent && other.stabilizer > 1 || continue
    for p in other.points
      p = [
        substitute(substitute(e, other.substitution),
          [x.var => v for (x, v) in zip(other.params, p)]) for (_, e) in k.projection
      ]
      push!(specials, (other.stabilizer, p))
    end
  end

  projection = [e for (_, e) in k.projection]
  Zorder = data.center_order
  return function (tt::Union{GenericCyclo,GenericCycloFrac})
    s = classsum(t, k.parent, substitute(tt, vars, projection))//Zorder
    for (stabilizer, p) in specials
      s -= (1//stabilizer) * substitute(tt, vars, p)
    end
    return s
  end
end

function quotient_charsum(t::CharTable, data::CentralQuotientData, i::Int)
  c = data.chars[i]
  T = c.parent
  vars = [var_index(p.var) for p in c.params]
  inverse = Dict(c.inverse)
  inverse = [get(inverse, p.var, fraction_field(parent(p.var))(p.var)) for p in c.params]

  Zorder = data.center_order
  g = data.filter
  omegas = [central_character(t, data, T, s * divexact(Zorder, g)) for s in 0:(g - 1)]

  # `twists[u+1]` maps the parent parameters to a twist with trivial central character
  if data.twist === nothing
    twists = [Pair{UPoly,UPoly}[]]
  else
    shift = central_exponent(t, data, T) * (1//g)
    twists = [
      [v => v - (shift + u * divexact(Zorder, g)) * d for (v, d) in data.twist[T]]
      for u in 0:(g - 1)
    ]
  end
  substitutions = [[substitute(e, twist) for e in inverse] for twist in twists]

  return function (tt::Union{GenericCyclo,GenericCycloFrac})
    F = sum(substitute(tt, vars, s) for s in substitutions) * (1//length(substitutions))
    # coerce here, as `set_congruence` copies the sums into another ring
    S = ring_of(F)
    return sum(charsum(t[T], coerce_to(S, omega) * F) for omega in omegas)//Zorder
  end
end

function check_quotient_data(t::CharTable, data::CentralQuotientData, S::GenericCycloRing)
  # whether Z is in the kernel may depend on the congruence of the quotient
  for (i, c) in enumerate(data.chars)
    omega = substitute(central_character(t, data, c.parent, 1), c.substitution)
    @req isone(coerce_to(S, omega)) "character type $i does not have the center in its kernel"
    inverse = Dict(c.inverse)
    for p in c.params
      x = substitute(
        get(inverse, p.var, fraction_field(parent(p.var))(p.var)), c.substitution
      )
      @req x == p.var "inverse of character type $i is wrong for $(p.var)"
    end
  end

  if data.twist !== nothing
    g = data.filter
    for (T, twist) in enumerate(data.twist)
      c = central_exponent(t, data, T)
      d = substitute(c, [v => v + d for (v, d) in twist]) - c - g
      ok, r = divides(d, data.center_order)
      @req ok && all(x -> isone(denominator(x)), coefficients(r)) "twist of character type $T does not shift the central character by $g"
    end
  end

  # σ∘π maps each class to one in the same Z-orbit, so the characters of G/Z agree
  for (j, k) in enumerate(data.classes)
    k.stabilizer == 1 && !isempty(k.params) || continue
    for (i, c) in enumerate(data.chars)
      v = substitute(t[c.parent, k.parent], c.substitution)
      w = substitute(substitute(v, k.substitution), k.projection)
      @req coerce_to(S, v) == coerce_to(S, w) "projection of class type $j is not invariant for character type $i"
    end
  end
end

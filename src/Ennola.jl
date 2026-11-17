# Ennola duality: the generic character table of GU_n(q) is the one of GL_n(q)
# with q replaced by -q, each character up to sign [Enn63], [Kaw85].
#
# Polynomials, cyclotomic entries, parameter moduli and parameter exceptions
# are substituted directly. The class and character sums are not: in
# `nesum(x, i, 0, q - 2)` the parameter `i` runs over the q - 1 residues modulo
# q - 1, and in the dual it has to run over the q + 1 residues modulo q + 1. No
# global sign corrects the substituted sum: the m*(m - 1)/2 pairs of distinct
# residues become (q + 1)*(q + 2)/2 at m = -(q + 1), not (q + 1)*q/2. So each
# `nesum` called by a dual sum function maps its argument to the dual side,
# sums over |m(-q)| residues there and maps the result back.

const ENNOLA_NESUM = :GenericCharacterTables_ennola_nesum

ennola_nesum_active() = get(task_local_storage(), ENNOLA_NESUM, false)::Bool

ennola(x::UPoly) = evaluate(x, [1], [-gen(parent(x), 1)])
ennola(x::UPolyFrac) = evaluate(x, [1], [-gen(parent(numerator(x)), 1)])
ennola(x::GenericCyclo) = evaluate(x, [1], [-gen(base_ring(parent(x)), 1)])
ennola(x::GenericCycloFrac) = evaluate(x, [1], [-gen(base_ring(parent(x.numerator)), 1)])

function ennola(x::ParameterExceptions)
  isempty(x.exceptions) && return x
  return evaluate(x, [1], [-gen(parent(numerator(x[1])), 1)])
end

ennola(x::Parameter) = Parameter(x.var, positive_lead(ennola(x.modulus)))
ennola(x::Parameters) = Parameters(ennola.(x.params), ennola(x.exceptions))

# The sign making the leading coefficient of `x` positive. Degrees, class
# lengths and moduli are polynomials in q only.
lead_sign(x::UPoly) = Int(sign(leading_coefficient(x)))
positive_lead(x::UPoly) = lead_sign(x) * x

# Class and character infos name Levi factors such as "A_2(q) + A_1(q^2)" and
# hold polynomials such as the order of their centre. The dual of GL_{n+1}(q^d)
# is GU_{n+1}(q^d), named ^2A_n, for odd d, and GL_{n+1}(q^d) for even d.
const LEVI_FACTOR = r"(\^2)?A_(\d+)(\(q(\^(\d+))?\))?"

ennola_info(x) = x
ennola_info(x::UPoly) = positive_lead(ennola(x))
ennola_info(x::Vector) = eltype(x)[ennola_info(y) for y in x]

function ennola_info(x::String)
  return replace(x, LEVI_FACTOR => function (s)
    m = match(LEVI_FACTOR, s)
    rank = parse(Int, m[2])
    d = m[5] === nothing ? 1 : parse(Int, m[5])
    (rank >= 2 && isodd(d)) || return s
    return m[1] === nothing ? "^2" * s : s[3:end]
  end)
end

# `nesum` called by an `EnnolaSum`: `a` and `upper` are on the side of the
# original table.
function ennola_nesum(
  a::Union{GenericCyclo,GenericCycloFrac}, var::Int64, lower::Int64, upper::Union{Int64,UPoly}
)
  if upper isa UPoly
    upper = positive_lead(ennola(upper + 1)) - 1
  end
  return task_local_storage(ENNOLA_NESUM, false) do
    ennola(nesum(ennola(a), var, lower, upper))
  end
end

# A class or character sum of the dual table, running the sum function `f` of
# the original table.
struct EnnolaSum <: Function
  f::Function
end

ennola_sum(::Nothing) = nothing
ennola_sum(f::Function) = EnnolaSum(f)
ennola_sum(f::EnnolaSum) = f.f

function (s::EnnolaSum)(tt::Union{GenericCyclo,GenericCycloFrac})
  return task_local_storage(ENNOLA_NESUM, true) do
    ennola(s.f(ennola(tt)))
  end
end

@doc raw"""
    ennola_dual(t::CharTable; importname::String=t.importname * "*", information::String)

Return the generic character table obtained from `t` by Ennola duality
[Enn63](@cite), [Kaw85](@cite): replace `q` by `-q`, then negate each character
whose degree has become negative.

Applied to the table of $\mathrm{GL}_n(q)$ this yields a table of
$\mathrm{GU}_n(q)$. Its class and character types keep the numbering and the
parameters of `t`; a stored table of $\mathrm{GU}_n(q)$ may number them
differently or use negated parameters. Tables with a congruence on `q` are not
supported.

# Examples
```jldoctest
julia> g = GenericCharacterTables.ennola_dual(generic_character_table("GL2"))
Generic character table GL2*
  of order q^4 + q^3 - q^2 - q
  with 4 irreducible character types
  with 4 class types
  with parameters (i, j, l, k)

julia> degree.(g)
4-element Vector{UniversalRingElem{QQMPolyRingElem, QQFieldElem}}:
 1
 q
 q - 1
 q + 1
```
"""
function ennola_dual(
  t::CharTable;
  importname::String=t.importname * "*",
  information::String="The Ennola dual of the generic character table $(t.importname).",
)
  @req t.ring.congruence === nothing "tables with congruences are not supported"
  chars = Vector{GenericCharacter}(undef, length(t.chars))
  ct = CharTable(
    positive_lead(ennola(t.order)),
    ennola_info(t.classinfo),
    positive_lead.(ennola.(t.classlength)),
    Function[ennola_sum(f) for f in t.classsums],
    t.classparamindex,
    t.charparamindex,
    ennola.(t.classparams),
    t.ring,  # the sum functions of `t` compute in it
    information,
    chars,
    importname,
  )
  for (k, c) in enumerate(t.chars)
    degree = ennola(c.degree)
    s = lead_sign(degree)
    chars[k] = GenericCharacter(
      ct,
      [s * ennola(v) for v in c.values],
      ennola_info(c.info),
      s * degree,
      ennola_sum(c.sum),
      ennola(c.params),
      ParameterSubstitution[],
    )
  end
  return ct
end

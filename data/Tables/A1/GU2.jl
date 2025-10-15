using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring()
R = base_ring(S)
k, l, u, v, _... = params(
  S,
  [
    "k",
    "l",
    "u",
    "v",
    "k1",
    "l1",
    "u1",
    "v1",
    "k2",
    "l2",
    "u2",
    "v2",
    "k3",
    "l3",
    "u3",
    "v3",
    "kt1",
    "lt1",
    "ut1",
    "vt1",
    "kt2",
    "lt2",
    "ut2",
    "vt2",
  ],
)

order = q * (q + 1)^2 * (q - 1)
table = GenericCyclo[[
  S(1; exponent=(2 * u * k) * 1//R((q + 1))),
  S(1; exponent=(2 * u * k) * 1//R((q + 1))),
  S(1; exponent=(u * k + u * l) * 1//R((q + 1))),
  S(1; exponent=(-u * k) * 1//R((q + 1)))] [
  q * S(1; exponent=(2 * u * k) * 1//R((q + 1))),
  S(0),
  -S(1; exponent=(u * k + u * l) * 1//R((q + 1))),
  S(1; exponent=(-u * k) * 1//R((q + 1)))] [
  (q - 1) * S(1; exponent=(u * k + v * k) * 1//R((q + 1))),
  -S(1; exponent=(u * k + v * k) * 1//R((q + 1))),
  -S(1; exponent=(u * k + v * l) * 1//R((q + 1))) -
  S(1; exponent=(u * l + v * k) * 1//R((q + 1))),
  S(0)] [
  (q + 1) * S(1; exponent=(u * k) * 1//R((q + 1))),
  S(1; exponent=(u * k) * 1//R((q + 1))),
  S(0),
  S(1; exponent=(u * k) * 1//R((q^2 - 1))) + S(1; exponent=(-u * k * q) * 1//R((q^2 - 1)))]]
classinfo = Vector{Any}[
  [[1, 0], ["A_1", [1, 1]]],
  [[1, 1], ["A_1", [2]]],
  [[2, 0], ["A_0", [1]]],
  [[3, 0], ["A_0", [1]]],
]
classlength = R.([1, (q - 1) * (q + 1), q * (q - 1), q * (q + 1)])
charinfo = Vector{Any}[
  [[1, 0], ["A_1", [2]]],
  [[1, 1], ["A_1", [1, 1]]],
  [[2, 0], ["A_0", [1]]],
  [[3, 0], ["A_0", [1]]],
]
chardegree = R.([1, q, q - 1, q + 1])

classsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [l], [k])
    s2 = nesum(tt, l, 0, q)
    s1 = s2 - s1
    s2 = nesum(s1, k, 0, q)
    1//2 * s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [k], [(q - 1) * k])
    s1 = nesum(s1, k, 0, q)
    s2 = nesum(tt, k, 0, q^2 - 2)
    1//2 * s2 - 1//2 * s1
  end,
]

charsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, u, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, u, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [v], [u])
    s2 = nesum(tt, v, 0, q)
    s1 = s2 - s1
    s2 = nesum(s1, u, 0, q)
    1//2 * s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [u], [(q - 1) * u])
    s1 = nesum(s1, u, 0, q)
    s2 = nesum(tt, u, 0, q^2 - 2)
    1//2 * s2 - 1//2 * s1
  end,
]

classparams = [
  Parameters([Parameter(k, q + 1)]),
  Parameters([Parameter(k, q + 1)]),
  Parameters(
    [Parameter(k, q + 1), Parameter(l, q + 1)],
    [((k) * 1//(q + 1)), ((l) * 1//(q + 1)), ((k - l) * 1//(q + 1))],
  ),
  Parameters([Parameter(k, q^2 - 1)], [((k) * 1//(q - 1))]),
]

charparams = [
  Parameters([Parameter(u, q + 1)]),
  Parameters([Parameter(u, q + 1)]),
  Parameters(
    [Parameter(u, q + 1), Parameter(v, q + 1)],
    [((u) * 1//(q + 1)), ((v) * 1//(q + 1)), ((u - v) * 1//(q + 1))],
  ),
  Parameters([Parameter(u, q^2 - 1)], [((u) * 1//(q - 1))]),
]

classparamindex = var_index.([k, l])
charparamindex = var_index.([u, v])

information = raw"""The generic character table of $\mathrm{GU}_2(q)$.

- The table was first computed in [Enn63](@cite).

- See also: [Enn62](@cite).
"""

TABLE = CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q0 = generic_cyclotomic_ring()
R = base_ring(S)
a, b, c, s, k, u, _... = params(
  S,
  [
    "a",
    "b",
    "c",
    "s",
    "k",
    "u",
    "a1",
    "b1",
    "c1",
    "s1",
    "k1",
    "u1",
    "a2",
    "b2",
    "c2",
    "s2",
    "k2",
    "u2",
    "a3",
    "b3",
    "c3",
    "s3",
    "k3",
    "u3",
    "at1",
    "bt1",
    "ct1",
    "st1",
    "kt1",
    "ut1",
    "at2",
    "bt2",
    "ct2",
    "st2",
    "kt2",
    "ut2",
  ],
)

order = 4 * q0^4 * (4 * q0^4 + 1) * (2 * q0^2 - 1)
table = GenericCyclo[[
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1)] [
  (q0 * (2 * q0^2 - 1)) * S(1),
  (-q0) * S(1),
  q0 * S(1; exponent=1//R((4))),
  -q0 * S(1; exponent=1//R((4))),
  S(0),
  S(1),
  -S(1)] [
  (q0 * (2 * q0^2 - 1)) * S(1),
  (-q0) * S(1),
  -q0 * S(1; exponent=1//R((4))),
  q0 * S(1; exponent=1//R((4))),
  S(0),
  S(1),
  -S(1)] [
  (4 * q0^4) * S(1),
  S(0),
  S(0),
  S(0),
  S(1),
  -S(1),
  -S(1)] [
  (4 * q0^4 + 1) * S(1),
  S(1),
  S(1),
  S(1),
  S(1; exponent=(s * a) * 1//R((2 * q0^2 - 1))) +
  S(1; exponent=(-s * a) * 1//R((2 * q0^2 - 1))),
  S(0),
  S(0)] [
  ((2 * q0^2 - 1) * (2 * q0^2 - 2 * q0 + 1)) * S(1),
  (2 * q0 - 1) * S(1),
  -S(1),
  -S(1),
  S(0),
  -(
    S(1; exponent=(k * b) * 1//R((2 * q0^2 + 2 * q0 + 1))) +
    S(1; exponent=(-k * b) * 1//R((2 * q0^2 + 2 * q0 + 1))) +
    S(1; exponent=(2 * q0^2 * k * b) * 1//R((2 * q0^2 + 2 * q0 + 1))) +
    S(1; exponent=(-2 * q0^2 * k * b) * 1//R((2 * q0^2 + 2 * q0 + 1)))
  ),
  S(0)] [
  ((2 * q0^2 - 1) * (2 * q0^2 + 2 * q0 + 1)) * S(1),
  (-2 * q0 - 1) * S(1),
  -S(1),
  -S(1),
  S(0),
  S(0),
  -(
    S(1; exponent=(u * c) * 1//R((2 * q0^2 - 2 * q0 + 1))) +
    S(1; exponent=(-u * c) * 1//R((2 * q0^2 - 2 * q0 + 1))) +
    S(1; exponent=(2 * q0^2 * u * c) * 1//R((2 * q0^2 - 2 * q0 + 1))) +
    S(1; exponent=(-2 * q0^2 * u * c) * 1//R((2 * q0^2 - 2 * q0 + 1)))
  )]]
classinfo = [
  [[1, 0], ["^2B_2", "u_0"]],
  [[1, 1], ["^2B_2", "u_1"]],
  [[1, 2], ["^2B_2", "u_2"]],
  [[1, 3], ["^2B_2", "u_3"]],
  [[2, 0], ["A_0", [1]]],
  [[3, 0], ["A_0", [1]]],
  [[4, 0], ["A_0", [1]]]]
classlength =
  R.([
    1,
    (2 * q0^2 - 1) * (4 * q0^4 + 1),
    2 * q0^2 * 1//2 * (2 * q0^2 - 1) * (4 * q0^4 + 1),
    2 * q0^2 * 1//2 * (2 * q0^2 - 1) * (4 * q0^4 + 1),
    4 * q0^4 * (4 * q0^4 + 1),
    4 * q0^4 * (2 * q0^2 - 1) * (2 * q0^2 - 2 * q0 + 1),
    4 * q0^4 * (2 * q0^2 - 1) * (2 * q0^2 + 2 * q0 + 1)])
charinfo = [
  [[1, 0], ["^2B_2", "1"], "1"],
  [[1, 1], ["^2B_2", "2B2[a]"], "2B2[a]"],
  [[1, 2], ["^2B_2", "2B2[b]"], "2B2[b]"],
  [[1, 3], ["^2B_2", "\\epsilon"], "St"],
  [[2, 0], ["A_0", [1]], "chi5"],
  [[3, 0], ["A_0", [1]], "chi6"],
  [[4, 0], ["A_0", [1]], "chi7"]]
chardegree =
  R.([
    1,
    q0 * (2 * q0^2 - 1),
    q0 * (2 * q0^2 - 1),
    4 * q0^4,
    4 * q0^4 + 1,
    (2 * q0^2 - 1) * (2 * q0^2 - 2 * q0 + 1),
    (2 * q0^2 - 1) * (2 * q0^2 + 2 * q0 + 1),
  ])

classsums = [
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, 2 * q0^2 - 2)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, b, 1, 2 * q0^2 + 2 * q0)
    1//4 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, c, 1, 2 * q0^2 - 2 * q0)
    1//4 * s1
  end,
]

charsums = [
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, s, 1, 2 * q0^2 - 2)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, 2 * q0^2 + 2 * q0)
    1//4 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, u, 1, 2 * q0^2 - 2 * q0)
    1//4 * s1
  end,
]

classparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(a, 2 * q0^2 - 1)], [((a) * 1//(2 * q0^2 - 1))]),
  Parameters([Parameter(b, 2 * q0^2 + 2 * q0 + 1)], [((b) * 1//(2 * q0^2 + 2 * q0 + 1))]),
  Parameters([Parameter(c, 2 * q0^2 - 2 * q0 + 1)], [((c) * 1//(2 * q0^2 - 2 * q0 + 1))]),
]

charparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(s, 2 * q0^2 - 1)], [((s) * 1//(2 * q0^2 - 1))]),
  Parameters([Parameter(k, 2 * q0^2 + 2 * q0 + 1)], [((k) * 1//(2 * q0^2 + 2 * q0 + 1))]),
  Parameters([Parameter(u, 2 * q0^2 - 2 * q0 + 1)], [((u) * 1//(2 * q0^2 - 2 * q0 + 1))]),
]

classparamindex = var_index.([a, b, c])
charparamindex = var_index.([s, k, u])

information = raw"""The generic character table of $^2\mathrm{B}_2(q^2)$,
  where $q = \sqrt{2}q_0$.

- The table was first computed in [Suz62](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

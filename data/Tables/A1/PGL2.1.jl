using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring(; congruence=ZZ.((1, 2)))
R = base_ring(S)
i, j, l, k, _... = params(
  S,
  [
    "i",
    "j",
    "l",
    "k",
    "i1",
    "j1",
    "l1",
    "k1",
    "i2",
    "j2",
    "l2",
    "k2",
    "i3",
    "j3",
    "l3",
    "k3",
    "it1",
    "jt1",
    "lt1",
    "kt1",
    "it2",
    "jt2",
    "lt2",
    "kt2",
  ],
)

order = q * (q^2 - 1)
table = GenericCyclo[[
  S(1),
  S(1),
  S(1; exponent=(k * (q - 1)) * 1//R((4))),
  S(1; exponent=(k * i) * 1//R((2))),
  S(1; exponent=(k * (q + 1)) * 1//R((4))),
  S(1; exponent=(k * i) * 1//R((2)))] [
  (q) * S(1),
  S(0),
  S(1; exponent=(k * (q - 1)) * 1//R((4))),
  S(1; exponent=(k * i) * 1//R((2))),
  -S(1; exponent=(k * (q + 1)) * 1//R((4))),
  -S(1; exponent=(k * i) * 1//R((2)))] [
  (q + 1) * S(1),
  S(1),
  S(1; exponent=k * 1//R((2))) + S(1; exponent=(-k) * 1//R((2))),
  S(1; exponent=(k * i) * 1//R((q - 1))) + S(1; exponent=(-k * i) * 1//R((q - 1))),
  S(0),
  S(0)] [
  (q - 1) * S(1),
  -S(1),
  S(0),
  S(0),
  -S(1; exponent=k * 1//R((2))) - S(1; exponent=(-k) * 1//R((2))),
  -S(1; exponent=(k * i) * 1//R((q + 1))) - S(1; exponent=(-k * i) * 1//R((q + 1)))]]
classinfo = Vector{Any}[
  ["1", [1, 0], ["A_1", [1, 1]]],
  ["2", [1, 1], ["A_1", [2]]],
  ["3", [2, 0], ["A_0:2", [1]]],
  ["4", [3, 0], ["A_0", [1]]],
  ["5", [4, 0], ["A_0:2", [1]]],
  ["6", [5, 0], ["A_0", [1]]]]
classlength =
  R.([1, q^2 - 1, q * (q + 1) * 1//2, q * (q + 1), q * (q - 1) * 1//2, q * (q - 1)])
charinfo = Vector{Any}[
  ["1", [1, 0], ["A_1", [2]]],
  ["2", [1, 1], ["A_1", [1, 1]]],
  ["3", [2, 0], ["A_0", [1]]],
  ["4", [3, 0], ["A_0", [1]]],
]
chardegree = R.([1, q, q + 1, q - 1])

classsums = [
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q - 2)
    tt1 = evaluate(tt, [i], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q)
    tt1 = evaluate(tt, [i], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
]

charsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, 1)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, 1)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q - 2)
    tt1 = evaluate(tt, [k], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q)
    tt1 = evaluate(tt, [k], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
]

classparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(i, q - 1)], [((i) * 1//((q - 1) * 1//2))]),
  Parameters(Parameter[]),
  Parameters([Parameter(i, q + 1)], [((i) * 1//((q + 1) * 1//2))]),
]

charparams = [
  Parameters([Parameter(k, R(2))]),
  Parameters([Parameter(k, R(2))]),
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
]

classparamindex = var_index.([i, j])
charparamindex = var_index.([l, k])

information = raw"""The generic character table of $\mathrm{PGL}_2(q)$, $q$ odd
  (See `SL2.0` for the generic character table of $\mathrm{PGL}_2(q)$, $q$ even)

- CHEVIE-name of the table: `PGL2.1`

- The table was first computed in [Jor07](@cite), [Sch07](@cite).

- See also: [Ste51](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

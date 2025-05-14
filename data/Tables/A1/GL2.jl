using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring()
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

order = (q^2 - 1) * (q^2 - q)
table = GenericCyclo[[
  S(1; exponent=(2 * k * i) * 1//R((q - 1))),
  S(1; exponent=(2 * k * i) * 1//R((q - 1))),
  S(1; exponent=(k * i + k * j) * 1//R((q - 1))),
  S(1; exponent=(k * i) * 1//R((q - 1)))] [
  q * S(1; exponent=(2 * k * i) * 1//R((q - 1))),
  S(0),
  S(1; exponent=(k * i + k * j) * 1//R((q - 1))),
  -S(1; exponent=(k * i) * 1//R((q - 1)))] [
  (q + 1) * S(1; exponent=(l * i + k * i) * 1//R((q - 1))),
  S(1; exponent=(l * i + k * i) * 1//R((q - 1))),
  S(1; exponent=(l * i + k * j) * 1//R((q - 1))) +
  S(1; exponent=(k * i + l * j) * 1//R((q - 1))),
  S(0)] [
  (q - 1) * S(1; exponent=(k * i) * 1//R((q - 1))),
  -S(1; exponent=(k * i) * 1//R((q - 1))),
  S(0),
  -S(1; exponent=(k * i) * 1//R((q^2 - 1))) - S(1; exponent=(k * i * q) * 1//R((q^2 - 1)))]]
classinfo = Vector{Any}[
  [[1, 0], ["A_1", [1, 1]]],
  [[1, 1], ["A_1", [2]]],
  [[2, 0], ["A_0", [1]]],
  [[3, 0], ["A_0", [1]]],
]
classlength = R.([1, q^2 - 1, q * (q + 1), q * (q - 1)])
charinfo = Vector{Any}[
  [[1, 0], ["A_1", [2]]],
  [[1, 1], ["A_1", [1, 1]]],
  [[2, 0], ["A_0", [1]]],
  [[3, 0], ["A_0", [1]]],
]
chardegree = R.([1, q, q + 1, q - 1])

classsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, i, 0, q - 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, i, 0, q - 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [j], [i])
    s2 = nesum(tt, j, 0, q - 2)
    s1 = s2 - s1
    s2 = nesum(s1, i, 0, q - 2)
    1//2 * s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [(q + 1) * i])
    s1 = nesum(s1, i, 0, q - 2)
    s2 = nesum(tt, i, 0, q^2 - 2)
    1//2 * s2 - 1//2 * s1
  end,
]

charsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, q - 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, q - 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [l], [k])
    s2 = nesum(tt, l, 0, q - 2)
    s1 = s2 - s1
    s2 = nesum(s1, k, 0, q - 2)
    1//2 * s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [k], [(q + 1) * k])
    s1 = nesum(s1, k, 0, q - 2)
    s2 = nesum(tt, k, 0, q^2 - 2)
    1//2 * s2 - 1//2 * s1
  end,
]

classparams = [
  Parameters([Parameter(i, q - 1)]),
  Parameters([Parameter(i, q - 1)]),
  Parameters([Parameter(i, q - 1), Parameter(j, q - 1)], [((i - j) * 1//(q - 1))]),
  Parameters([Parameter(i, q^2 - 1)], [((i) * 1//(q + 1))]),
]

charparams = [
  Parameters([Parameter(k, q - 1)]),
  Parameters([Parameter(k, q - 1)]),
  Parameters([Parameter(k, q - 1), Parameter(l, q - 1)], [((k - l) * 1//(q - 1))]),
  Parameters([Parameter(k, q^2 - 1)], [((k) * 1//(q + 1))]),
]

classparamindex = var_index.([i, j])
charparamindex = var_index.([l, k])

information = raw"""- Information about the generic character table of $\mathrm{GL}_2(q)$.

- CHEVIE-name of the table: `GL2`

- The table was first computed in [Jor07](@cite), [Sch07](@cite).

- See also: [Ste51](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

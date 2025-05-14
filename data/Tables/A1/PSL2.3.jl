using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring(; congruence=ZZ.((-1, 4)))
R = base_ring(S)
i, k, _... = params(
  S, ["i", "k", "i1", "k1", "i2", "k2", "i3", "k3", "it1", "kt1", "it2", "kt2"]
)

order = q^2 * (q^2 - 1) * (q^2 + 1) * 1//2
table = GenericCyclo[[
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1)] [
  (q^2) * S(1),
  S(0),
  S(0),
  S(1),
  -S(1),
  -S(1)] [
  (1//2 * (q^2 - 1)) * S(1),
  -1//2 + 1//2 * q * S(1; exponent=1//R((4))),
  -1//2 - 1//2 * q * S(1; exponent=1//R((4))),
  S(0),
  -S(1; exponent=i * 1//R((2))),
  -S(1; exponent=((q^2 + 1) * 1//4) * 1//R((2)))] [
  (1//2 * (q^2 - 1)) * S(1),
  -1//2 - 1//2 * q * S(1; exponent=1//R((4))),
  -1//2 + 1//2 * q * S(1; exponent=1//R((4))),
  S(0),
  -S(1; exponent=i * 1//R((2))),
  -S(1; exponent=((q^2 + 1) * 1//4) * 1//R((2)))] [
  (q^2 + 1) * S(1),
  S(1),
  S(1),
  S(1; exponent=(2 * i * k) * 1//R((q^2 - 1))) +
  S(1; exponent=(-2 * i * k) * 1//R((q^2 - 1))),
  S(0),
  S(0)] [
  (q^2 - 1) * S(1),
  -S(1),
  -S(1),
  S(0),
  -S(1; exponent=(2 * i * k) * 1//R((q^2 + 1))) -
  S(1; exponent=(-2 * i * k) * 1//R((q^2 + 1))),
  -S(1; exponent=k * 1//R((2))) - S(1; exponent=(-k) * 1//R((2)))]]
classinfo = Vector{Any}[
  ["1", [1, 0], ["A_1", [1, 1]]],
  ["2", [1, 1], ["A_1", [2]]],
  ["3", [1, 2], ["A_1", [2]]],
  ["4", [2, 0], ["A_0", [1]]],
  ["5", [3, 0], ["A_0", [1]]],
  ["6", [2, 0, 1], ["A_0", [1, 0]]]]
classlength =
  R.([
    1,
    (q^2 - 1) * (q^2 + 1) * 1//2,
    (q^2 - 1) * (q^2 + 1) * 1//2,
    q^2 * (q^2 + 1),
    q^2 * (q^2 - 1),
    q^2 * (q^2 - 1) * 1//2,
  ])
charinfo = Vector{Any}[
  ["1", [1, 0], ["A_1", [2]], "1"],
  ["2", [1, 1], ["A_1", [1, 1]], "St"],
  ["3", [3, 0], ["A_0:2", [1]]],
  ["4", [3, 0], ["A_0:2", [1]]],
  ["5", [4, 0], ["A_0", [1]]],
  ["6", [5, 0], ["A_0", [1]]]]
chardegree = R.([1, q^2, 1//2 * (q^2 - 1), 1//2 * (q^2 - 1), q^2 + 1, q^2 - 1])

classsums = [
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, (q^2 - 3) * 1//2)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, (q^2 - 1) * 1//2)
    s2 = evaluate(tt, [i], [(q^2 + 1) * 1//4])
    1//2 * s1 - 1//2 * s2
  end,
  identity,
]

charsums = [
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, (q^2 - 3) * 1//2)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [k], [(q^2 + 1) * 1//4])
    t1 = nesum(tt, k, 1, (q^2 - 1) * 1//2)
    1//2 * t1 - 1//2 * s1
  end,
]

classparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(i, (q^2 - 1) * 1//2)], [((i) * 1//((q^2 - 1) * 1//2))]),
  Parameters([Parameter(i, (q^2 + 1) * 1//2)], [((i) * 1//((q^2 + 1) * 1//4))]),
  Parameters(Parameter[]),
]

charparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(k, (q^2 - 1) * 1//2)], [((k) * 1//((q^2 - 1) * 1//2))]),
  Parameters([Parameter(k, (q^2 + 1) * 1//2)], [((k) * 1//((q^2 + 1) * 1//4))]),
]

classparamindex = var_index.([i])
charparamindex = var_index.([k])

information = raw"""- Information about the generic character table of $\mathrm{PSL}_2(q^2)$,
  $q^2$ congruent to $3$ modulo $4$. The possible values for q are given by
  $q^2 = p^m$ with m a non negative integer and $p$ a prime number.

- CHEVIE-name of the table: `PSL2.3`

- The table was first (implicitly) computed in [Fro96](@cite).

- See also: [Sch07](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

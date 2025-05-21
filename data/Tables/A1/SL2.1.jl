using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q0 = generic_cyclotomic_ring(; congruence=ZZ.((1, 2)), power=2)
R = base_ring(S)
q = q0^2
i, k, _... = params(
  S, ["i", "k", "i1", "k1", "i2", "k2", "i3", "k3", "it1", "kt1", "it2", "kt2"]
)

order = q * (q - 1) * (q + 1)
table = GenericCyclo[[
  S(1),
  S(1),
  S(1),
  S(1),
  S(1)] [
  (q) * S(1),
  S(0),
  S(0),
  S(1),
  -S(1)] [
  1//2 * (q + 1) * S(1; exponent=(1//2 * (q - 1) * i) * 1//R((2))),
  1//2 * S(1; exponent=(1//2 * (q - 1) * i) * 1//R((2))) +
  1//2 * q0 * S(1; exponent=(1//2 * (q - 1)) * 1//R((4))),
  1//2 * S(1; exponent=(1//2 * (q - 1) * i) * 1//R((2))) -
  1//2 * q0 * S(1; exponent=(1//2 * (q - 1)) * 1//R((4))),
  S(1; exponent=i * 1//R((2))),
  S(0)] [
  1//2 * (q + 1) * S(1; exponent=(1//2 * (q - 1) * i) * 1//R((2))),
  1//2 * S(1; exponent=(1//2 * (q - 1) * i) * 1//R((2))) -
  1//2 * q0 * S(1; exponent=(1//2 * (q - 1)) * 1//R((4))),
  1//2 * S(1; exponent=(1//2 * (q - 1) * i) * 1//R((2))) +
  1//2 * q0 * S(1; exponent=(1//2 * (q - 1)) * 1//R((4))),
  S(1; exponent=i * 1//R((2))),
  S(0)] [
  1//2 * (q - 1) * S(1; exponent=(1//2 * i * q + 1//2 * i) * 1//R((2))),
  -1//2 * S(1; exponent=(1//2 * (q + 1) * i) * 1//R((2))) +
  1//2 * q0 * S(1; exponent=(2 * i + 1//2 * (q - 1)) * 1//R((4))),
  -1//2 * S(1; exponent=(1//2 * (q + 1) * i) * 1//R((2))) -
  1//2 * q0 * S(1; exponent=(2 * i + 1//2 * (q - 1)) * 1//R((4))),
  S(0),
  -S(1; exponent=i * 1//R((2)))] [
  1//2 * (q - 1) * S(1; exponent=(1//2 * i * q + 1//2 * i) * 1//R((2))),
  -1//2 * S(1; exponent=(1//2 * (q + 1) * i) * 1//R((2))) -
  1//2 * q0 * S(1; exponent=(2 * i + 1//2 * (q - 1)) * 1//R((4))),
  -1//2 * S(1; exponent=(1//2 * (q + 1) * i) * 1//R((2))) +
  1//2 * q0 * S(1; exponent=(2 * i + 1//2 * (q - 1)) * 1//R((4))),
  S(0),
  -S(1; exponent=i * 1//R((2)))] [
  (q + 1) * S(1; exponent=(i * k) * 1//R((2))),
  S(1; exponent=(i * k) * 1//R((2))),
  S(1; exponent=(i * k) * 1//R((2))),
  S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1))),
  S(0)] [
  (q - 1) * S(1; exponent=(i * k) * 1//R((2))),
  -S(1; exponent=(i * k) * 1//R((2))),
  -S(1; exponent=(i * k) * 1//R((2))),
  S(0),
  -S(1; exponent=(i * k) * 1//R((q + 1))) - S(1; exponent=(-i * k) * 1//R((q + 1)))]]
classinfo = Vector{Any}[
  [[1, 0], ["A_1", [1, 1]]],
  [[1, 1], ["A_1", [2]]],
  [[1, 2], ["A_1", [2]]],
  [[2, 0], ["A_0", [1]]],
  [[3, 0], ["A_0", [1]]]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * 1//2,
    (q - 1) * (q + 1) * 1//2,
    q * (q + 1),
    q * (q - 1),
  ])
charinfo = Vector{Any}[
  [[1, 0], ["A_1", [2]], "1"],
  [[1, 1], ["A_1", [1, 1]], "St"],
  [[2, 0], ["A_0:2", [1]]],
  [[2, 0], ["A_0:2", [1]]],
  [[3, 0], ["A_0:2", [1]]],
  [[3, 0], ["A_0:2", [1]]],
  [[4, 0], ["A_0", [1]]],
  [[5, 0], ["A_0", [1]]]]
chardegree =
  R.([
    1,
    q,
    1//2 * (q + 1),
    1//2 * (q + 1),
    1//2 * (q - 1),
    1//2 * (q - 1),
    q + 1,
    q - 1,
  ])

classsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [0])
    s2 = evaluate(tt, [i], [1])
    s1 + s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [0])
    s2 = evaluate(tt, [i], [1])
    s1 + s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [0])
    s2 = evaluate(tt, [i], [1])
    s1 + s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [(q - 1) * 1//2])
    t1 = nesum(tt, i, 1, q - 2)
    1//2 * t1 - 1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [(q + 1) * 1//2])
    t1 = nesum(tt, i, 1, q)
    1//2 * t1 - 1//2 * s1
  end,
]

charsums = [
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [k], [(q - 1) * 1//2])
    t1 = nesum(tt, k, 1, q - 2)
    1//2 * t1 - 1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [k], [(q + 1) * 1//2])
    t1 = nesum(tt, k, 1, q)
    1//2 * t1 - 1//2 * s1
  end,
]

classparams = [
  Parameters([Parameter(i, R(2))]),
  Parameters([Parameter(i, R(2))]),
  Parameters([Parameter(i, R(2))]),
  Parameters([Parameter(i, q - 1)], [((i) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(i, q + 1)], [((i) * 1//((q + 1) * 1//2))]),
]

charparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
]

classparamindex = var_index.([i])
charparamindex = var_index.([k])

information = raw"""The generic character table of $\mathrm{SL}_2(q)$,
  $q$ odd. The possible values for $q$ are given by
  $q = q_0^2 = p^m$ with m a non negative integer and $p$ a prime number.
  Note that the variable $q_0$ represents $\sqrt{q}$ which is needed as
  some table entries involve this value.
  (See `SL2.0` for the generic character table of $\mathrm{SL}_2(q)$, $q$ even).

- The table was first computed in [Fro96](@cite).

- See also: [Sch07](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

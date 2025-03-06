using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
R = universal_polynomial_ring(QQ; cached=false)
q = gen(R, "q")
S = generic_cyclotomic_ring(R; congruence=ZZ.((-1, 3)))
k, l, u, v, _... = gens(
  R,
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

order = q^3 * (q + 1)^2 * (q - 1) * (q^2 - q + 1)
table = GenericCyclo[[
  S(1),
  S(1),
  S(1),
  S(1),
  S(1; exponent=(k * u) * 1//R((3))),
  S(1; exponent=(k * u) * 1//R((3))),
  S(1; exponent=(k * u) * 1//R((3))),
  S(1; exponent=(k * u + l * u) * 1//R((3))),
  S(1; exponent=(k * u) * 1//R((3))),
  S(1; exponent=(k * u) * 1//R((3)))] [
  (q^2 - q) * S(1),
  (-q) * S(1),
  S(0),
  (2) * S(1),
  -S(1; exponent=(k * u) * 1//R((3))),
  (1 - q) * S(1; exponent=(k * u) * 1//R((3))),
  S(1; exponent=(k * u) * 1//R((3))),
  2 * S(1; exponent=(k * u + l * u) * 1//R((3))),
  S(0),
  -S(1; exponent=(k * u) * 1//R((3)))] [
  (q^3) * S(1),
  S(0),
  S(0),
  -S(1),
  -S(1; exponent=(k * u) * 1//R((3))),
  q * S(1; exponent=(k * u) * 1//R((3))),
  S(0),
  -S(1; exponent=(k * u + l * u) * 1//R((3))),
  S(1; exponent=(k * u) * 1//R((3))),
  -S(1; exponent=(k * u) * 1//R((3)))] [
  (q^2 - q + 1) * S(1),
  (1 - q) * S(1),
  S(1),
  (3) * S(1),
  S(0),
  -(q - 1) * S(1; exponent=(k * u) * 1//R((q + 1))) +
  S(1; exponent=(-2 * k * u) * 1//R((q + 1))),
  S(1; exponent=(k * u) * 1//R((q + 1))) + S(1; exponent=(-2 * k * u) * 1//R((q + 1))),
  S(1; exponent=(k * u + l * u) * 1//R((q + 1))) +
  S(1; exponent=(k * u - 2 * l * u) * 1//R((q + 1))) +
  S(1; exponent=(l * u - 2 * k * u) * 1//R((q + 1))),
  S(1; exponent=(k * u) * 1//R((q + 1))),
  S(0)] [
  (q * (q^2 - q + 1)) * S(1),
  (q) * S(1),
  S(0),
  (-3) * S(1),
  S(0),
  (q - 1) * S(1; exponent=(k * u) * 1//R((q + 1))) +
  q * S(1; exponent=(-2 * k * u) * 1//R((q + 1))),
  -S(1; exponent=(k * u) * 1//R((q + 1))),
  -S(1; exponent=(k * u + l * u) * 1//R((q + 1))) -
  S(1; exponent=(k * u - 2 * l * u) * 1//R((q + 1))) -
  S(1; exponent=(l * u - 2 * k * u) * 1//R((q + 1))),
  S(1; exponent=(k * u) * 1//R((q + 1))),
  S(0)] [
  ((q - 1) * (q^2 - q + 1)) * S(1),
  (2 * q - 1) * S(1),
  -S(1),
  -3 * S(1; exponent=(u - v) * 1//R((3))) - 3 * S(1; exponent=(v - u) * 1//R((3))),
  S(0),
  (q - 1) * (
    S(1; exponent=(u * k) * 1//R((q + 1))) + S(1; exponent=(v * k) * 1//R((q + 1))) +
    S(1; exponent=(-u * k - v * k) * 1//R((q + 1)))
  ),
  -S(1; exponent=(u * k) * 1//R((q + 1))) - S(1; exponent=(v * k) * 1//R((q + 1))) -
  S(1; exponent=(-u * k - v * k) * 1//R((q + 1))),
  -S(1; exponent=(-v * l - l * u + k * u) * 1//R((q + 1))) -
  S(1; exponent=(-v * l - l * u + v * k) * 1//R((q + 1))) -
  S(1; exponent=(v * l - k * u - v * k) * 1//R((q + 1))) -
  S(1; exponent=(l * u - k * u - v * k) * 1//R((q + 1))) -
  S(1; exponent=(v * k + l * u) * 1//R((q + 1))) -
  S(1; exponent=(k * u + v * l) * 1//R((q + 1))),
  S(0),
  S(0)] [
  (q^3 + 1) * S(1),
  S(1),
  S(1),
  S(0),
  S(0),
  (q + 1) * S(1; exponent=(-u * k) * 1//R((q + 1))),
  S(1; exponent=(-u * k) * 1//R((q + 1))),
  S(0),
  S(1; exponent=(-u * k) * 1//R((q^2 - 1))) + S(1; exponent=(u * k * q) * 1//R((q^2 - 1))),
  S(0)] [
  ((q + 1)^2 * (q - 1)) * S(1),
  (-q - 1) * S(1),
  -S(1),
  S(0),
  -3 * S(1; exponent=(u * k) * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(k * u) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-k * u * q) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(k * u * q^2) * 1//R((q^2 - q + 1)))]]
classinfo = Vector{Any}[
  [[1, 0], ["^2A_2", [1, 1, 1]]],
  [[1, 1], ["^2A_2", [2, 1]]],
  [[1, 2], ["^2A_2", [3]]],
  [[6, 0], ["A_0\\colon3", [1]]],
  [[7, 0], ["A_0\\colon3", [1]]],
  [[2, 0], ["A_1", [1, 1]]],
  [[2, 1], ["A_1", [2]]],
  [[3, 0], ["A_0", [1]]],
  [[4, 0], ["A_0", [1]]],
  [[5, 0], ["A_0", [1]]]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 - q + 1),
    q * (q + 1)^2 * (q - 1) * (q^2 - q + 1),
    q^3 * (q - 1) * (q^2 - q + 1) * 1//3,
    q^3 * (q + 1)^2 * (q - 1) * 1//3,
    q^2 * (q^2 - q + 1),
    q^2 * (q - 1) * (q + 1) * (q^2 - q + 1),
    q^3 * (q - 1) * (q^2 - q + 1),
    q^3 * (q + 1) * (q^2 - q + 1),
    q^3 * (q + 1)^2 * (q - 1)])
charinfo = Vector{Any}[
  [[1, 0], ["^2A_2", [3]]],
  [[1, 1], ["^2A_2", [2, 1]]],
  [[1, 2], ["^2A_2", [1, 1, 1]]],
  [[2, 0], ["A_1", [2]]],
  [[2, 1], ["A_1", [1, 1]]],
  [[3, 0], ["A_0", [1]]],
  [[4, 0], ["A_0", [1]]],
  [[5, 0], ["A_0", [1]]]]
chardegree =
  R.([
    1,
    q^2 - q,
    q^3,
    q^2 - q + 1,
    q * (q^2 - q + 1),
    (q - 1) * (q^2 - q + 1),
    q^3 + 1,
    (q + 1)^2 * (q - 1),
  ])

classsums = [
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 1, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 1, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 1, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss5a = nesum(tt, k, 1, q)
    ss5 = nesum(ss5a, l, 1, q)
    tt1 = evaluate(tt, [l], [k])
    ss6 = nesum(tt1, k, 1, q)
    ss7 = evaluate(tt, [k, l], R.([(q + 1) * 1//3, 2 * (q + 1) * 1//3]))
    1//6 * ss5 - 1//6 * ss6 - 1//3 * ss7
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, k, 0, q^2 - 2)
    tt1 = evaluate(tt, [k], [(q - 1) * k])
    ss8 = nesum(tt1, k, 0, q)
    1//2 * ss7 - 1//2 * ss8
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss10 = nesum(tt, k, 0, q^2 - q)
    tt1 = evaluate(tt, [k], [(q^2 - q + 1) * 1//3 * k])
    ss11 = nesum(tt1, k, 0, 2)
    1//3 * ss10 - 1//3 * ss11
  end,
]

charsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, u, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, u, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, u, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss6 = nesum(tt, u, 1, q)
    tt1 = evaluate(tt, [u], [(q + 1) * 1//3])
    tt2 = evaluate(tt, [u], [2 * (q + 1) * 1//3])
    ss6 - tt1 - tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss6 = nesum(tt, u, 1, q)
    tt1 = evaluate(tt, [u], [(q + 1) * 1//3])
    tt2 = evaluate(tt, [u], [2 * (q + 1) * 1//3])
    ss6 - tt1 - tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss5 = nesum(tt, u, 0, q)
    ss8 = nesum(ss5, v, 0, q)
    tt1 = evaluate(tt, [v], [-2 * u])
    ss9 = nesum(tt1, u, 0, q)
    tt1 = evaluate(tt, [u], [-2 * v])
    ss10 = nesum(tt1, v, 0, q)
    tt1 = evaluate(tt, [v], [u])
    ss11 = nesum(tt1, u, 0, q)
    tt1 = evaluate(tt1, [u], [(q + 1) * 1//3 * u])
    ss12 = nesum(tt1, u, 0, 2)
    1//6 * ss8 - 1//6 * ss9 - 1//6 * ss10 - 1//6 * ss11 + 1//3 * ss12
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, u, 0, q^2 - 2)
    tt1 = evaluate(tt, [u], [(q - 1) * u])
    ss8 = nesum(tt1, u, 0, q)
    1//2 * ss7 - 1//2 * ss8
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss10 = nesum(tt, u, 0, q^2 - q)
    tt1 = evaluate(tt, [u], [(q^2 - q + 1) * 1//3 * u])
    ss11 = nesum(tt1, u, 0, 2)
    1//3 * ss10 - 1//3 * ss11
  end,
]

classparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(k, R(2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//(q + 1))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//(q + 1))]),
  Parameters(
    [Parameter(k, q + 1), Parameter(l, q + 1)],
    [((k) * 1//(q + 1)), ((l) * 1//(q + 1)), ((k - l) * 1//(q + 1))],
  ),
  Parameters([Parameter(k, q^2 - 1)], [((k) * 1//(q - 1))]),
  Parameters([Parameter(k, q^2 - q + 1)], [((k) * 1//((q^2 - q + 1) * 1//3))]),
]

charparams = [
  Parameters([Parameter(u, R(3))]),
  Parameters([Parameter(u, R(3))]),
  Parameters([Parameter(u, R(3))]),
  Parameters([Parameter(u, q + 1)], [((u) * 1//((q + 1) * 1//3))]),
  Parameters([Parameter(u, q + 1)], [((u) * 1//((q + 1) * 1//3))]),
  Parameters(
    [Parameter(u, q + 1), Parameter(v, q + 1)],
    [((u + 2 * v) * 1//(q + 1)), ((v + 2 * u) * 1//(q + 1)), ((u - v) * 1//(q + 1))],
  ),
  Parameters([Parameter(u, q^2 - 1)], [((u) * 1//(q - 1))]),
  Parameters([Parameter(u, q^2 - q + 1)], [((u) * 1//((q^2 - q + 1) * 1//3))]),
]

classparamindex = var_index.([k, l])
charparamindex = var_index.([u, v])

information = raw"""- Information about the generic character table of $PGU_3(q)$,
  $q$ congruent to $2$ modulo $3$.
  (See ``SU3.n2`` for the generic character table of $PGU_3(q)$,
  $q$ not congruent to $2$ modulo $3$.)

- CHEVIE-name of the table: ``PGU3.2``

- The table was derived by Meinolf Geck from:
  {\sc V.~Ennola}, On the characters of the finite unitary groups,
  {\em Ann.\ Acad.\ Sci.\ Fenn.\ Ser.~A~I} {\bf 323} (1963), 1--36.


- See also:
  {\sc V.~Ennola}, On the conjugacy classes of the finite unitary groups,
  {\em Ann.\ Acad.\ Sci.\ Fenn.\ Ser.~A~I} {\bf 313} (1962), 1--14.
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring(; congruence=ZZ.((-1, 3)))
R = base_ring(S)
a, b, m, n, _... = params(
  S,
  [
    "a",
    "b",
    "m",
    "n",
    "a1",
    "b1",
    "m1",
    "n1",
    "a2",
    "b2",
    "m2",
    "n2",
    "a3",
    "b3",
    "m3",
    "n3",
    "at1",
    "bt1",
    "mt1",
    "nt1",
    "at2",
    "bt2",
    "mt2",
    "nt2",
  ],
)

order = q^3 * (q + 1)^2 * (q - 1) * (q^2 - q + 1)
table = GenericCyclo[[
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1)] [
  (q^2 - q) * S(1),
  (-q) * S(1),
  S(0),
  S(0),
  S(0),
  (1 - q) * S(1),
  S(1),
  (2) * S(1),
  S(0),
  -S(1)] [
  (q^3) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (q) * S(1),
  S(0),
  -S(1),
  S(1),
  -S(1)] [
  (q^2 - q + 1) * S(1; exponent=(n * a) * 1//R((3))),
  (1 - q) * S(1; exponent=(n * a) * 1//R((3))),
  S(1; exponent=(n * a) * 1//R((3))),
  S(1; exponent=(n * a) * 1//R((3))),
  S(1; exponent=(n * a) * 1//R((3))),
  (1 - q) * S(1; exponent=(n * a) * 1//R((q + 1))) +
  S(1; exponent=(-2 * n * a) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))) + S(1; exponent=(-2 * n * a) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))) + S(1; exponent=(n * b) * 1//R((q + 1))) +
  S(1; exponent=(n * (-a - b)) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))),
  S(0)] [
  q * (q^2 - q + 1) * S(1; exponent=(n * a) * 1//R((3))),
  q * S(1; exponent=(n * a) * 1//R((3))),
  S(0),
  S(0),
  S(0),
  (q - 1) * S(1; exponent=(n * a) * 1//R((q + 1))) +
  q * S(1; exponent=(-2 * n * a) * 1//R((q + 1))),
  -1 * S(1; exponent=(n * a) * 1//R((q + 1))),
  -(
    S(1; exponent=(n * a) * 1//R((q + 1))) + S(1; exponent=(n * b) * 1//R((q + 1))) +
    S(1; exponent=(n * (-a - b)) * 1//R((q + 1)))
  ),
  S(1; exponent=(n * a) * 1//R((q + 1))),
  S(0)] [
  (q + 1) * (q^2 - q + 1) * S(1; exponent=(n * a) * 1//R((3))),
  S(1; exponent=(n * a) * 1//R((3))),
  S(1; exponent=(n * a) * 1//R((3))),
  S(1; exponent=(n * a) * 1//R((3))),
  S(1; exponent=(n * a) * 1//R((3))),
  (q + 1) * S(1; exponent=(n * a) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))),
  S(0),
  S(1; exponent=(n * a) * 1//R((q^2 - 1))) +
  S(1; exponent=(-1 * n * a * q) * 1//R((q^2 - 1))),
  S(0)] [
  ((q - 1) * (q^2 - q + 1) * 1//3) * S(1),
  ((2 * q - 1) * 1//3) * S(1),
  (q - (q + 1) * 1//3) * S(1),
  (-(q + 1) * 1//3) * S(1),
  (-(q + 1) * 1//3) * S(1),
  (q - 1) * S(1),
  -S(1),
  -(S(1; exponent=(a - b) * 1//R((3))) + S(1; exponent=(b - a) * 1//R((3)))),
  S(0),
  S(0)] [
  ((q - 1) * (q^2 - q + 1) * 1//3) * S(1),
  ((2 * q - 1) * 1//3) * S(1),
  (-(q + 1) * 1//3) * S(1),
  (q - (q + 1) * 1//3) * S(1),
  (-(q + 1) * 1//3) * S(1),
  (q - 1) * S(1),
  -S(1),
  -(S(1; exponent=(a - b) * 1//R((3))) + S(1; exponent=(b - a) * 1//R((3)))),
  S(0),
  S(0)] [
  ((q - 1) * (q^2 - q + 1) * 1//3) * S(1),
  ((2 * q - 1) * 1//3) * S(1),
  (-(q + 1) * 1//3) * S(1),
  (-(q + 1) * 1//3) * S(1),
  (q - (q + 1) * 1//3) * S(1),
  (q - 1) * S(1),
  -S(1),
  -(S(1; exponent=(a - b) * 1//R((3))) + S(1; exponent=(b - a) * 1//R((3)))),
  S(0),
  S(0)] [
  (q - 1) * (q^2 - q + 1) * S(1; exponent=(n * a + m * a) * 1//R((3))),
  (2 * q - 1) * S(1; exponent=(n * a + m * a) * 1//R((3))),
  -S(1; exponent=(n * a + m * a) * 1//R((3))),
  -S(1; exponent=(n * a + m * a) * 1//R((3))),
  -S(1; exponent=(n * a + m * a) * 1//R((3))),
  (q - 1) * (
    S(1; exponent=(n * a - 2 * m * a) * 1//R((q + 1))) +
    S(1; exponent=(m * a - 2 * n * a) * 1//R((q + 1))) +
    S(1; exponent=(n * a + m * a) * 1//R((q + 1)))
  ),
  -(
    S(1; exponent=(n * a - 2 * m * a) * 1//R((q + 1))) +
    S(1; exponent=(m * a - 2 * n * a) * 1//R((q + 1))) +
    S(1; exponent=(n * a + m * a) * 1//R((q + 1)))
  ),
  -(
    S(1; exponent=(m * a + n * b) * 1//R((q + 1))) +
    S(1; exponent=(m * b + n * a) * 1//R((q + 1))) +
    S(1; exponent=(m * (-a - b) + n * a) * 1//R((q + 1))) +
    S(1; exponent=(m * a + n * (-a - b)) * 1//R((q + 1))) +
    S(1; exponent=(m * (-a - b) + n * b) * 1//R((q + 1))) +
    S(1; exponent=(m * b + n * (-a - b)) * 1//R((q + 1)))
  ),
  S(0),
  S(0)] [
  (q + 1)^2 * (q - 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  (q - (q + 1) * 1//3) * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=a * 1//R((3)))] [
  (q + 1)^2 * (q - 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  (q - (q + 1) * 1//3) * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=a * 1//R((3)))] [
  (q + 1)^2 * (q - 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=a * 1//R((3))),
  (q - (q + 1) * 1//3) * S(1; exponent=a * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=a * 1//R((3)))] [
  (q + 1)^2 * (q - 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  (q - (q + 1) * 1//3) * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(-a) * 1//R((3)))] [
  (q + 1)^2 * (q - 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  (q - (q + 1) * 1//3) * S(1; exponent=(-a) * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(-a) * 1//R((3)))] [
  (q + 1)^2 * (q - 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  (q - (q + 1) * 1//3) * S(1; exponent=(-a) * 1//R((3))),
  -(q + 1) * 1//3 * S(1; exponent=(-a) * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(-a) * 1//R((3)))] [
  (q + 1)^2 * (q - 1) * S(1; exponent=(n * a) * 1//R((3))),
  -(q + 1) * S(1; exponent=(n * a) * 1//R((3))),
  -S(1; exponent=(n * a) * 1//R((3))),
  -S(1; exponent=(n * a) * 1//R((3))),
  -S(1; exponent=(n * a) * 1//R((3))),
  S(0),
  S(0),
  S(0),
  S(0),
  -(
    S(1; exponent=(n * a) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-1 * n * a * q) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(n * a * q^2) * 1//R((q^2 - q + 1)))
  )]]
classinfo = Vector{Any}[
  [[1, 0], ["^2A_2", [1, 1, 1]]],
  [[1, 1], ["^2A_2", [2, 1]]],
  [[1, 2], ["^2A_2", [3]]],
  [[1, 3], ["^2A_2", [3]]],
  [[1, 4], ["^2A_2", [3]]],
  [[2, 0], ["A_1", [1, 1]]],
  [[2, 1], ["A_1", [2]]],
  [[3, 0], ["A_0", [1]]],
  [[4, 0], ["A_0", [1]]],
  [[5, 0], ["A_0", [1]]]]
classlength =
  R.([
    1,
    (q + 1) * (q - 1) * (q^2 - q + 1),
    q * (q + 1)^2 * (q - 1) * (q^2 - q + 1) * 1//3,
    q * (q + 1)^2 * (q - 1) * (q^2 - q + 1) * 1//3,
    q * (q + 1)^2 * (q - 1) * (q^2 - q + 1) * 1//3,
    q^2 * (q^2 - q + 1),
    q^2 * (q + 1) * (q - 1) * (q^2 - q + 1),
    q^3 * (q - 1) * (q^2 - q + 1),
    q^3 * (q + 1) * (q^2 - q + 1),
    q^3 * (q + 1)^2 * (q - 1)])
charinfo = Vector{Any}[
  [[1, 0], ["^2A_2", [3]]],
  [[1, 1], ["^2A_2", [2, 1]]],
  [[1, 2], ["^2A_2", [1, 1, 1]]],
  [[2, 0], ["A_1", [1, 1]]],
  [[2, 1], ["A_1", [1, 1]]],
  [[4, 0], ["A_0", [1]]],
  [[3, 0, 1], ["A_0:3", [1]]],
  [[3, 0, 2], ["A_0:3", "\\omega"]],
  [[3, 0, 3], ["A_0:3", "\\omega^2"]],
  [[5, 0], ["A_0", [1]]],
  [[6, 0, 1], ["A_0:3", [1]]],
  [[6, 0, 2], ["A_0:3", "\\omega"]],
  [[6, 0, 3], ["A_0:3", "\\omega^2"]],
  [[7, 0, 1], ["A_0:3", [1]]],
  [[7, 0, 2], ["A_0:3", "\\omega"]],
  [[7, 0, 3], ["A_0:3", "\\omega^2"]],
  [[8, 0], ["A_0", [1]]]]
chardegree =
  R.([
    1,
    q^2 - q,
    q^3,
    q^2 - q + 1,
    q * (q^2 - q + 1),
    (q + 1) * (q^2 - q + 1),
    (q - 1) * (q^2 - q + 1) * 1//3,
    (q - 1) * (q^2 - q + 1) * 1//3,
    (q - 1) * (q^2 - q + 1) * 1//3,
    (q - 1) * (q^2 - q + 1),
    (q + 1)^2 * (q - 1) * 1//3,
    (q + 1)^2 * (q - 1) * 1//3,
    (q + 1)^2 * (q - 1) * 1//3,
    (q + 1)^2 * (q - 1) * 1//3,
    (q + 1)^2 * (q - 1) * 1//3,
    (q + 1)^2 * (q - 1) * 1//3,
    (q + 1)^2 * (q - 1)])

classsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, a, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, a, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, a, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, a, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, a, 0, 2)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss6 = nesum(tt, a, 1, q)
    tt1 = evaluate(tt, [a], [(q + 1) * 1//3])
    tt2 = evaluate(tt, [a], [2 * (q + 1) * 1//3])
    ss6 - tt1 - tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss6 = nesum(tt, a, 1, q)
    tt1 = evaluate(tt, [a], [(q + 1) * 1//3])
    tt2 = evaluate(tt, [a], [2 * (q + 1) * 1//3])
    ss6 - tt1 - tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss5 = nesum(tt, a, 0, q)
    ss8 = nesum(ss5, b, 0, q)
    tt1 = evaluate(tt, [b], [a])
    ss9 = nesum(tt1, a, 0, q)
    tt2 = evaluate(tt1, [a], [(q + 1) * 1//3 * a])
    ss10 = nesum(tt2, a, 0, 2)
    1//6 * ss8 - 1//2 * ss9 + 1//3 * ss10
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, a, 0, q^2 - 2)
    tt1 = evaluate(tt, [a], [(q - 1) * a])
    ss8 = nesum(tt1, a, 0, q)
    1//2 * ss7 - 1//2 * ss8
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss10 = nesum(tt, a, 0, q^2 - q)
    tt1 = evaluate(tt, [a], [(q^2 - q + 1) * 1//3 * a])
    ss11 = nesum(tt1, a, 0, 2)
    1//3 * ss10 - 1//3 * ss11
  end,
]

charsums = [
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, n, 1, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, n, 1, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, n, 0, q^2 - 2)
    tt1 = evaluate(tt, [n], [(q - 1) * n])
    ss8 = nesum(tt1, n, 0, q)
    1//2 * ss7 - 1//2 * ss8
  end,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss5a = nesum(tt, n, 1, q)
    ss5 = nesum(ss5a, m, 1, q)
    tt1 = evaluate(tt, [m], [n])
    ss6 = nesum(tt1, n, 1, q)
    ss7 = evaluate(tt, [m, n], [(q + 1) * 1//3, 2 * (q + 1) * 1//3])
    1//6 * ss5 - 1//6 * ss6 - 1//3 * ss7
  end,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss8 = nesum(tt, n, 0, q^2 - q)
    tt1 = evaluate(tt, [n], [(q^2 - q + 1) * 1//3 * n])
    ss9 = nesum(tt1, n, 0, 2)
    1//3 * ss8 - 1//3 * ss9
  end,
]

classparams = [
  Parameters([Parameter(a, R(3))]),
  Parameters([Parameter(a, R(3))]),
  Parameters([Parameter(a, R(3))]),
  Parameters([Parameter(a, R(3))]),
  Parameters([Parameter(a, R(3))]),
  Parameters([Parameter(a, q + 1)], [((a) * 1//((q + 1) * 1//3))]),
  Parameters([Parameter(a, q + 1)], [((a) * 1//((q + 1) * 1//3))]),
  Parameters(
    [Parameter(a, q + 1), Parameter(b, q + 1)],
    [((a) * 1//(q + 1)), ((b) * 1//(q + 1)), ((a - b) * 1//(q + 1))],
  ),
  Parameters([Parameter(a, q^2 - 1)], [((a) * 1//(q - 1))]),
  Parameters([Parameter(a, q^2 - q + 1)], [((a) * 1//((q^2 - q + 1) * 1//3))]),
]

charparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(n, q + 1)], [((n) * 1//(q + 1))]),
  Parameters([Parameter(n, q + 1)], [((n) * 1//(q + 1))]),
  Parameters([Parameter(n, q^2 - 1)], [((n) * 1//(q - 1))]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(
    [Parameter(n, q + 1), Parameter(m, q + 1)],
    [((n) * 1//(q + 1)), ((m) * 1//(q + 1)), ((n - m) * 1//(q + 1))],
  ),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(n, q^2 - q + 1)], [((n) * 1//((q^2 - q + 1) * 1//3))]),
]

classparamindex = var_index.([a, b])
charparamindex = var_index.([m, n])

information = raw"""The generic character table of $\mathrm{SU}_3(q)$,
  $q$ congruent to $2$ modulo $3$
  (See `SU3.n2` for the generic character table of $\mathrm{SL}_3(q)$,
  $q$ not congruent to $2$ modulo $3$.)

- The table was first computed in [SF73](@cite).

- Corrections in [Gec90](@cite).

- See also: [Enn63](@cite), [Enn62](@cite), [Ste51](@cite).
"""

TABLE = CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

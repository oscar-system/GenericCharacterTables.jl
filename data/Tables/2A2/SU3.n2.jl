using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring()
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
  S(1)] [
  (q^2 - q) * S(1),
  (-q) * S(1),
  S(0),
  (1 - q) * S(1),
  S(1),
  (2) * S(1),
  S(0),
  -S(1)] [
  (q^3) * S(1),
  S(0),
  S(0),
  (q) * S(1),
  S(0),
  -S(1),
  S(1),
  -S(1)] [
  (q^2 - q + 1) * S(1),
  (1 - q) * S(1),
  S(1),
  (1 - q) * S(1; exponent=(n * a) * 1//R((q + 1))) +
  S(1; exponent=(-2 * n * a) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))) + S(1; exponent=(-2 * n * a) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))) + S(1; exponent=(n * b) * 1//R((q + 1))) +
  S(1; exponent=(n * (-a - b)) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))),
  S(0)] [
  (q * (q^2 - q + 1)) * S(1),
  (q) * S(1),
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
  ((q - 1) * (q^2 - q + 1)) * S(1),
  (2 * q - 1) * S(1),
  -S(1),
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
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1),
  (q + 1) * S(1; exponent=(n * a) * 1//R((q + 1))),
  S(1; exponent=(n * a) * 1//R((q + 1))),
  S(0),
  S(1; exponent=(n * a) * 1//R((q^2 - 1))) +
  S(1; exponent=(-1 * n * a * q) * 1//R((q^2 - 1))),
  S(0)] [
  ((q + 1)^2 * (q - 1)) * S(1),
  (-(q + 1)) * S(1),
  -S(1),
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
  [[2, 0], ["A_1", [1, 1]]],
  [[2, 1], ["A_1", [2]]],
  [[3, 0], ["A_0", [1]]],
  [[4, 0], ["A_0", [1]]],
  [[5, 0], ["A_0", [1]]]]
classlength =
  R.([
    1,
    (q + 1) * (q - 1) * (q^2 - q + 1),
    q * (q + 1)^2 * (q - 1) * (q^2 - q + 1),
    q^2 * (q^2 - q + 1),
    q^2 * (q + 1) * (q - 1) * (q^2 - q + 1),
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
    (q + 1) * (q^2 - q + 1),
    (q + 1)^2 * (q - 1),
  ])

classsums = [
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, a, 1, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, a, 1, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss5 = nesum(tt, a, 0, q)
    ss6 = nesum(ss5, b, 0, q)
    tt1 = evaluate(tt, [b], [a])
    ss7 = nesum(tt1, a, 0, q)
    tt2 = evaluate(tt1, [a], [0])
    1//6 * ss6 - 1//2 * ss7 + 1//3 * tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, a, 0, q^2 - 2)
    tt1 = evaluate(tt, [a], [(q - 1) * a])
    ss8 = nesum(tt1, a, 0, q)
    1//2 * ss7 - 1//2 * ss8
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss8 = nesum(tt, a, 1, q^2 - q)
    1//3 * ss8
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
    ss5 = nesum(tt, n, 1, q)
    ss6 = nesum(ss5, m, 1, q)
    tt1 = evaluate(tt, [m], [n])
    ss7 = nesum(tt1, n, 1, q)
    1//6 * ss6 - 1//6 * ss7
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, n, 0, q^2 - 2)
    tt1 = evaluate(tt, [n], [(q - 1) * n])
    ss8 = nesum(tt1, n, 0, q)
    1//2 * ss7 - 1//2 * ss8
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss8 = nesum(tt, n, 1, q^2 - q)
    1//3 * ss8
  end,
]

classparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(a, q + 1)], [((a) * 1//(q + 1))]),
  Parameters([Parameter(a, q + 1)], [((a) * 1//(q + 1))]),
  Parameters([Parameter(a, q + 1), Parameter(b, q + 1)], [((a - b) * 1//(q + 1))]),
  Parameters([Parameter(a, q^2 - 1)], [((a) * 1//(q - 1))]),
  Parameters([Parameter(a, q^2 - q + 1)], [((a) * 1//(q^2 - q + 1))]),
]

charparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(n, q + 1)], [((n) * 1//(q + 1))]),
  Parameters([Parameter(n, q + 1)], [((n) * 1//(q + 1))]),
  Parameters([Parameter(n, q + 1), Parameter(m, q + 1)], [((n - m) * 1//(q + 1))]),
  Parameters([Parameter(n, q^2 - 1)], [((n) * 1//(q - 1))]),
  Parameters([Parameter(n, q^2 - q + 1)], [((n) * 1//(q^2 - q + 1))]),
]

classparamindex = var_index.([a, b])
charparamindex = var_index.([m, n])

information = raw"""- Information about the generic character table of $SU_3(q)$,
  $q$ not congruent to $2$ modulo $3$
  (See ``SU3.2`` for the generic character table of $SL_3(q)$,
  $q$ congruent to $2$ modulo $3$.)

- Note:
  The three groups $SU_3(q)$, $PGU_3(q)$ and $PSU_3(q)$ are
  mutually isomorphic for these values of $q$.

- CHEVIE-name of the table: ``SU3.n2``

- The table was first computed in:
  {\sc W.~A.~Simpson and J.~S.~Frame}, The character tables for
  $SL(3,q)$, $SU(3,q^2)$, $PSL(3,q)$, $PSU(3,q^2)$,
  {\em Can.\ J.~Math.} {\bf 25} (1973), 486--494.

- Corrections in:
  {\sc M.~Geck}, Irreducible Brauer characters of the $3$-dimensional
  special unitary groups in non-defining characteristic,
  {\em Comm.\ Algebra}, {\bf 18} (1990), 563--584.

- See also: [Enn63](@cite), [Enn62](@cite), [Ste51](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

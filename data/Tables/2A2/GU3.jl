using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring()
R = base_ring(S)
k, l, m, u, v, w, _... = params(
  S,
  [
    "k",
    "l",
    "m",
    "u",
    "v",
    "w",
    "k1",
    "l1",
    "m1",
    "u1",
    "v1",
    "w1",
    "k2",
    "l2",
    "m2",
    "u2",
    "v2",
    "w2",
    "k3",
    "l3",
    "m3",
    "u3",
    "v3",
    "w3",
    "kt1",
    "lt1",
    "mt1",
    "ut1",
    "vt1",
    "wt1",
    "kt2",
    "lt2",
    "mt2",
    "ut2",
    "vt2",
    "wt2",
  ],
)

order = q^3 * (q + 1)^3 * (q - 1) * (q^2 - q + 1)
table = GenericCyclo[[
  S(1; exponent=(3 * u * k) * 1//R((q + 1))),
  S(1; exponent=(3 * u * k) * 1//R((q + 1))),
  S(1; exponent=(3 * u * k) * 1//R((q + 1))),
  S(1; exponent=(2 * k * u + l * u) * 1//R((q + 1))),
  S(1; exponent=(2 * k * u + l * u) * 1//R((q + 1))),
  S(1; exponent=(u * k + u * l + u * m) * 1//R((q + 1))),
  S(1; exponent=(u * k - u * l) * 1//R((q + 1))),
  S(1; exponent=(u * k) * 1//R((q + 1)))] [
  q * (q - 1) * S(1; exponent=(3 * u * k) * 1//R((q + 1))),
  -q * S(1; exponent=(3 * u * k) * 1//R((q + 1))),
  S(0),
  -(q - 1) * S(1; exponent=(2 * u * k + u * l) * 1//R((q + 1))),
  S(1; exponent=(2 * u * k + u * l) * 1//R((q + 1))),
  2 * S(1; exponent=(u * k + u * l + u * m) * 1//R((q + 1))),
  S(0),
  -S(1; exponent=(u * k) * 1//R((q + 1)))] [
  q^3 * S(1; exponent=(3 * u * k) * 1//R((q + 1))),
  S(0),
  S(0),
  q * S(1; exponent=(2 * u * k + u * l) * 1//R((q + 1))),
  S(0),
  -S(1; exponent=(u * k + u * l + u * m) * 1//R((q + 1))),
  S(1; exponent=(u * k - u * l) * 1//R((q + 1))),
  -S(1; exponent=(u * k) * 1//R((q + 1)))] [
  (q^2 - q + 1) * S(1; exponent=(2 * u * k + v * k) * 1//R((q + 1))),
  -(q - 1) * S(1; exponent=(2 * u * k + v * k) * 1//R((q + 1))),
  S(1; exponent=(2 * u * k + v * k) * 1//R((q + 1))),
  -(q - 1) * S(1; exponent=(u * k + v * k + u * l) * 1//R((q + 1))) +
  S(1; exponent=(2 * u * k + v * l) * 1//R((q + 1))),
  S(1; exponent=(u * k + v * k + u * l) * 1//R((q + 1))) +
  S(1; exponent=(2 * u * k + v * l) * 1//R((q + 1))),
  S(1; exponent=(v * k + u * l + u * m) * 1//R((q + 1))) +
  S(1; exponent=(v * l + u * k + u * m) * 1//R((q + 1))) +
  S(1; exponent=(v * m + u * k + u * l) * 1//R((q + 1))),
  S(1; exponent=(v * k - u * l) * 1//R((q + 1))),
  S(0)] [
  q * (q^2 - q + 1) * S(1; exponent=(2 * u * k + v * k) * 1//R((q + 1))),
  q * S(1; exponent=(2 * u * k + v * k) * 1//R((q + 1))),
  S(0),
  (q - 1) * S(1; exponent=(u * k + v * k + u * l) * 1//R((q + 1))) +
  q * S(1; exponent=(2 * u * k + v * l) * 1//R((q + 1))),
  -S(1; exponent=(u * k + v * k + u * l) * 1//R((q + 1))),
  -S(1; exponent=(v * k + u * l + u * m) * 1//R((q + 1))) -
  S(1; exponent=(v * l + u * k + u * m) * 1//R((q + 1))) -
  S(1; exponent=(v * m + u * k + u * l) * 1//R((q + 1))),
  S(1; exponent=(v * k - u * l) * 1//R((q + 1))),
  S(0)] [
  (q - 1) * (q^2 - q + 1) * S(1; exponent=(u * k + v * k + w * k) * 1//R((q + 1))),
  (2 * q - 1) * S(1; exponent=(u * k + v * k + w * k) * 1//R((q + 1))),
  -S(1; exponent=(u * k + v * k + w * k) * 1//R((q + 1))),
  (q - 1) * (
    S(1; exponent=(u * k + v * k + w * l) * 1//R((q + 1))) +
    S(1; exponent=(w * k + u * k + v * l) * 1//R((q + 1))) +
    S(1; exponent=(w * k + v * k + u * l) * 1//R((q + 1)))
  ),
  -S(1; exponent=(u * k + v * k + w * l) * 1//R((q + 1))) -
  S(1; exponent=(w * k + u * k + v * l) * 1//R((q + 1))) -
  S(1; exponent=(w * k + v * k + u * l) * 1//R((q + 1))),
  -S(1; exponent=(u * k + v * l + w * m) * 1//R((q + 1))) -
  S(1; exponent=(u * k + v * m + w * l) * 1//R((q + 1))) -
  S(1; exponent=(v * k + u * l + w * m) * 1//R((q + 1))) -
  S(1; exponent=(v * k + w * l + u * m) * 1//R((q + 1))) -
  S(1; exponent=(w * k + u * l + v * m) * 1//R((q + 1))) -
  S(1; exponent=(w * k + v * l + u * m) * 1//R((q + 1))),
  S(0),
  S(0)] [
  (q + 1) * (q^2 - q + 1) * S(1; exponent=(u * k + v * k) * 1//R((q + 1))),
  S(1; exponent=(u * k + v * k) * 1//R((q + 1))),
  S(1; exponent=(u * k + v * k) * 1//R((q + 1))),
  (q + 1) * S(1; exponent=(u * k + v * l) * 1//R((q + 1))),
  S(1; exponent=(u * k + v * l) * 1//R((q + 1))),
  S(0),
  S(1; exponent=(v * k) * 1//R((q + 1))) * (
    S(1; exponent=(u * l) * 1//R((q^2 - 1))) +
    S(1; exponent=(-q * u * l) * 1//R((q^2 - 1)))
  ),
  S(0)] [
  (q + 1)^2 * (q - 1) * S(1; exponent=(u * k) * 1//R((q + 1))),
  -(q + 1) * S(1; exponent=(u * k) * 1//R((q + 1))),
  -S(1; exponent=(u * k) * 1//R((q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(u * k) * 1//R((q^3 + 1))) -
  S(1; exponent=(-u * k * q) * 1//R((q^3 + 1))) -
  S(1; exponent=(q^2 * u * k) * 1//R((q^3 + 1)))]]
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
    (q - 1) * (q + 1) * (q^2 - q + 1),
    q * (q + 1)^2 * (q - 1) * (q^2 - q + 1),
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
    q * (q - 1),
    q^3,
    (q^2 - q + 1),
    q * (q^2 - q + 1),
    (q - 1) * (q^2 - q + 1),
    (q + 1) * (q^2 - q + 1),
    (q + 1)^2 * (q - 1),
  ])

classsums = [
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    nesum(tt, k, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    tt1 = evaluate(tt, [l], [k])
    ss4 = nesum(tt, l, 0, q)
    ss5 = ss4 - tt1
    ss5 = nesum(ss5, k, 0, q)
    ss5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    tt1 = evaluate(tt, [l], [k])
    ss4 = nesum(tt, l, 0, q)
    ss5 = ss4 - tt1
    ss5 = nesum(ss5, k, 0, q)
    ss5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss6a = nesum(tt, k, 0, q)
    ss6b = nesum(ss6a, l, 0, q)
    ss6 = nesum(ss6b, m, 0, q)
    tt1 = evaluate(tt, [l], [k])
    ss7a = nesum(tt1, k, 0, q)
    ss7 = nesum(ss7a, m, 0, q)
    tt2 = evaluate(tt, [m], [l])
    ss8a = nesum(tt2, k, 0, q)
    ss8 = nesum(ss8a, l, 0, q)
    tt3 = evaluate(tt, [m], [k])
    ss9a = nesum(tt3, k, 0, q)
    ss9 = nesum(ss9a, l, 0, q)
    tt4a = evaluate(tt, [l], [k])
    tt4 = evaluate(tt4a, [m], [k])
    ss10 = nesum(tt4, k, 0, q)
    1//6 * ss6 - 1//6 * ss7 - 1//6 * ss8 - 1//6 * ss9 + 1//3 * ss10
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, l, 0, q^2 - 2)
    tt1 = evaluate(tt, [l], [(q - 1) * l])
    ss8 = nesum(tt1, l, 0, q)
    tt1 = ss7 - ss8
    ss9 = nesum(tt1, k, 0, q)
    1//2 * ss9
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss8 = nesum(tt, k, 0, q^3)
    tt1 = evaluate(tt, [k], [(q^2 - q + 1) * k])
    ss9 = nesum(tt1, k, 0, q)
    1//3 * ss8 - 1//3 * ss9
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
    nesum(tt, u, 0, q)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    tt1 = evaluate(tt, [v], [u])
    ss4 = nesum(tt, v, 0, q)
    ss5 = ss4 - tt1
    ss5 = nesum(ss5, u, 0, q)
    ss5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    tt1 = evaluate(tt, [v], [u])
    ss4 = nesum(tt, v, 0, q)
    ss5 = ss4 - tt1
    ss5 = nesum(ss5, u, 0, q)
    ss5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss6a = nesum(tt, u, 0, q)
    ss6b = nesum(ss6a, v, 0, q)
    ss6 = nesum(ss6b, w, 0, q)
    tt1 = evaluate(tt, [v], [u])
    ss7a = nesum(tt1, u, 0, q)
    ss7 = nesum(ss7a, w, 0, q)
    tt2 = evaluate(tt, [w], [v])
    ss8a = nesum(tt2, u, 0, q)
    ss8 = nesum(ss8a, v, 0, q)
    tt3 = evaluate(tt, [w], [u])
    ss9a = nesum(tt3, u, 0, q)
    ss9 = nesum(ss9a, v, 0, q)
    tt4a = evaluate(tt, [v], [u])
    tt4 = evaluate(tt4a, [w], [u])
    ss10 = nesum(tt4, u, 0, q)
    1//6 * ss6 - 1//6 * ss7 - 1//6 * ss8 - 1//6 * ss9 + 1//3 * ss10
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss7 = nesum(tt, u, 0, q^2 - 2)
    tt1 = evaluate(tt, [u], [(q - 1) * u])
    ss8 = nesum(tt1, u, 0, q)
    tt1 = ss7 - ss8
    ss9 = nesum(tt1, v, 0, q)
    1//2 * ss9
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    ss8 = nesum(tt, u, 0, q^3)
    tt1 = evaluate(tt, [u], [(q^2 - q + 1) * u])
    ss9 = nesum(tt1, u, 0, q)
    1//3 * ss8 - 1//3 * ss9
  end,
]

classparams = [
  Parameters([Parameter(k, q + 1)]),
  Parameters([Parameter(k, q + 1)]),
  Parameters([Parameter(k, q + 1)]),
  Parameters([Parameter(k, q + 1), Parameter(l, q + 1)], [((k - l) * 1//(q + 1))]),
  Parameters([Parameter(k, q + 1), Parameter(l, q + 1)], [((k - l) * 1//(q + 1))]),
  Parameters(
    [Parameter(k, q + 1), Parameter(l, q + 1), Parameter(m, q + 1)],
    [((k - l) * 1//(q + 1)), ((k - m) * 1//(q + 1)), ((l - m) * 1//(q + 1))],
  ),
  Parameters([Parameter(k, q + 1), Parameter(l, q^2 - 1)], [((l) * 1//(q - 1))]),
  Parameters([Parameter(k, q^3 + 1)], [((k) * 1//(q^2 - q + 1))]),
]

charparams = [
  Parameters([Parameter(u, q + 1)]),
  Parameters([Parameter(u, q + 1)]),
  Parameters([Parameter(u, q + 1)]),
  Parameters([Parameter(u, q + 1), Parameter(v, q + 1)], [((u - v) * 1//(q + 1))]),
  Parameters([Parameter(u, q + 1), Parameter(v, q + 1)], [((u - v) * 1//(q + 1))]),
  Parameters(
    [Parameter(u, q + 1), Parameter(v, q + 1), Parameter(w, q + 1)],
    [((u - v) * 1//(q + 1)), ((u - w) * 1//(q + 1)), ((v - w) * 1//(q + 1))],
  ),
  Parameters([Parameter(v, q + 1), Parameter(u, q^2 - 1)], [((u) * 1//(q - 1))]),
  Parameters([Parameter(u, q^3 + 1)], [((u) * 1//(q^2 - q + 1))]),
]

classparamindex = var_index.([k, l, m])
charparamindex = var_index.([u, v, w])

information = raw"""The generic character table of $\mathrm{GU}_3(q)$.

- CHEVIE-name of the table: `GU3`

- The table was first computed in: [Enn63](@cite).

- See also: [Enn62](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

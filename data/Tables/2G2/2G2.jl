using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q0 = generic_cyclotomic_ring(; congruence=ZZ.((-1, 4)))
R = base_ring(S)
i, j, k, l, _... = params(
  S,
  [
    "i",
    "j",
    "k",
    "l",
    "i1",
    "j1",
    "k1",
    "l1",
    "i2",
    "j2",
    "k2",
    "l2",
    "i3",
    "j3",
    "k3",
    "l3",
    "it1",
    "jt1",
    "kt1",
    "lt1",
    "it2",
    "jt2",
    "kt2",
    "lt2",
  ],
)
sqrt3 = S(Dict(1//R(12) => R(1), -1//R(12) => R(1)))

order =
  27 * q0^6 * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1) *
  (3 * q0^2 - 1)
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
  S(1),
  S(1),
  S(1),
  S(1),
  S(1)] [
  (1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0)) * S(1),
  (-1//2 * (3 * q0^2 + q0)) * S(1),
  1//2 * (-q0 + sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  1//2 * (-q0 - sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  (q0) * S(1),
  -q0 * 1//2 * (1 + sqrt3 * S(1; exponent=1//R((4)))),
  -q0 * 1//2 * (1 - sqrt3 * S(1; exponent=1//R((4)))),
  (-1//2 * (3 * q0^2 - 1)) * S(1),
  1//2 * (1 - sqrt3 * q0 * S(1; exponent=1//R((4)))),
  1//2 * (1 + sqrt3 * q0 * S(1; exponent=1//R((4)))),
  S(0),
  -S(1),
  S(1),
  S(0)] [
  (1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 - 3 * q0)) * S(1),
  (1//2 * (3 * q0^2 - q0)) * S(1),
  1//2 * (-q0 + sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  1//2 * (-q0 - sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  (q0) * S(1),
  -q0 * 1//2 * (1 + sqrt3 * S(1; exponent=1//R((4)))),
  -q0 * 1//2 * (1 - sqrt3 * S(1; exponent=1//R((4)))),
  (1//2 * (3 * q0^2 - 1)) * S(1),
  -1//2 * (1 - sqrt3 * q0 * S(1; exponent=1//R((4)))),
  -1//2 * (1 + sqrt3 * q0 * S(1; exponent=1//R((4)))),
  S(0),
  S(0),
  -S(1),
  S(1)] [
  (1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0)) * S(1),
  (-1//2 * (3 * q0^2 + q0)) * S(1),
  1//2 * (-q0 - sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  1//2 * (-q0 + sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  (q0) * S(1),
  -q0 * 1//2 * (1 - sqrt3 * S(1; exponent=1//R((4)))),
  -q0 * 1//2 * (1 + sqrt3 * S(1; exponent=1//R((4)))),
  (-1//2 * (3 * q0^2 - 1)) * S(1),
  1//2 * (1 + sqrt3 * q0 * S(1; exponent=1//R((4)))),
  1//2 * (1 - sqrt3 * q0 * S(1; exponent=1//R((4)))),
  S(0),
  -S(1),
  S(1),
  S(0)] [
  (1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 - 3 * q0)) * S(1),
  (1//2 * (3 * q0^2 - q0)) * S(1),
  1//2 * (-q0 - sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  1//2 * (-q0 + sqrt3 * q0^2 * S(1; exponent=1//R((4)))),
  (q0) * S(1),
  -q0 * 1//2 * (1 - sqrt3 * S(1; exponent=1//R((4)))),
  -q0 * 1//2 * (1 + sqrt3 * S(1; exponent=1//R((4)))),
  (1//2 * (3 * q0^2 - 1)) * S(1),
  -1//2 * (1 + sqrt3 * q0 * S(1; exponent=1//R((4)))),
  -1//2 * (1 - sqrt3 * q0 * S(1; exponent=1//R((4)))),
  S(0),
  S(0),
  -S(1),
  S(1)] [
  (q0 * (9 * q0^4 - 1)) * S(1),
  (-q0) * S(1),
  -q0 + sqrt3 * q0^2 * S(1; exponent=1//R((4))),
  -q0 - sqrt3 * q0^2 * S(1; exponent=1//R((4))),
  (-q0) * S(1),
  q0 * 1//2 * (1 + sqrt3 * S(1; exponent=1//R((4)))),
  q0 * 1//2 * (1 - sqrt3 * S(1; exponent=1//R((4)))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1),
  S(0),
  S(1)] [
  (q0 * (9 * q0^4 - 1)) * S(1),
  (-q0) * S(1),
  -q0 - sqrt3 * q0^2 * S(1; exponent=1//R((4))),
  -q0 + sqrt3 * q0^2 * S(1; exponent=1//R((4))),
  (-q0) * S(1),
  q0 * 1//2 * (1 - sqrt3 * S(1; exponent=1//R((4)))),
  q0 * 1//2 * (1 + sqrt3 * S(1; exponent=1//R((4)))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1),
  S(0),
  S(1)] [
  (27 * q0^6) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (3 * q0^2) * S(1),
  S(0),
  S(0),
  S(1),
  -S(1),
  -S(1),
  -S(1)] [
  ((3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1 + 3 * q0)) * S(1),
  (1 - 3 * q0^2) * S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  -S(1),
  -S(1),
  -S(1),
  S(1; exponent=i * 1//R((2))),
  S(0),
  S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
  S(1; exponent=(i + j) * 1//R((2))),
  S(0)] [
  (3 * q0^2 * (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1 + 3 * q0)) * S(1),
  (3 * q0^2) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (-3 * q0^2) * S(1),
  S(0),
  S(0),
  S(1; exponent=i * 1//R((2))),
  S(0),
  -(
    S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
    S(1; exponent=(i + j) * 1//R((2)))
  ),
  S(0)] [
  ((3 * q0^2 + 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0)) * S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  (3 * q0^2 + 1) * S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=(i * k) * 1//R((3 * q0^2 - 1))) +
  S(1; exponent=(-i * k) * 1//R((3 * q0^2 - 1))),
  S(0),
  S(0),
  S(0)] [
  ((3 * q0^2 - 1) * (3 * q0^2 + 3 * q0 + 1) * (3 * q0^2 + 1)) * S(1),
  (-3 * q0^2 - 1 - 3 * q0) * S(1),
  (-3 * q0 - 1) * S(1),
  (-3 * q0 - 1) * S(1),
  -S(1),
  -S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  -(
    S(1; exponent=(i * k) * 1//R((3 * q0^2 - 3 * q0 + 1))) +
    S(1; exponent=((3 * q0 - 1) * i * k) * 1//R((3 * q0^2 - 3 * q0 + 1))) +
    S(1; exponent=((3 * q0 - 2) * i * k) * 1//R((3 * q0^2 - 3 * q0 + 1))) +
    S(1; exponent=(-i * k) * 1//R((3 * q0^2 - 3 * q0 + 1))) +
    S(1; exponent=((-3 * q0 + 1) * i * k) * 1//R((3 * q0^2 - 3 * q0 + 1))) +
    S(1; exponent=((-3 * q0 + 2) * i * k) * 1//R((3 * q0^2 - 3 * q0 + 1)))
  ),
  S(0),
  S(0)] [
  ((3 * q0^2 - 1) * (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1 + 3 * q0)) * S(1),
  (2 * 3 * q0^2 - 1) * S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  (
    S(1; exponent=k * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=l * 1//R((2)))
  ) * (3 * q0^2 - 1),
  -(
    S(1; exponent=k * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=l * 1//R((2)))
  ),
  -(
    S(1; exponent=k * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=l * 1//R((2)))
  ),
  S(0),
  S(0),
  -(
    S(
      1;
      exponent=(2 * i * k + 1//2 * j * l * 3 * q0^2 + 1//2 * j * l) * 1//R((3 * q0^2 + 1)),
    ) +
    S(
      1;
      exponent=(
        i * k * 3 * q0 + i * k + 1//2 * k * j * 3 * q0^2 + 1//2 * k * j +
        1//2 * l * i * 3 * q0^2 + 1//2 * l * i
      ) * 1//R((3 * q0^2 + 1)),
    ) +
    S(
      1;
      exponent=(
        i * k * 3 * q0 - i * k + 1//2 * k * j * 3 * q0^2 + 1//2 * k * j +
        1//2 * l * i * 3 * q0^2 + 1//2 * l * i + 1//2 * j * l * 3 * q0^2 + 1//2 * j * l
      ) * 1//R((3 * q0^2 + 1)),
    ) +
    S(
      1;
      exponent=(-2 * i * k + 1//2 * j * l * 3 * q0^2 + 1//2 * j * l) * 1//R((3 * q0^2 + 1)),
    ) +
    S(
      1;
      exponent=(
        -i * k * 3 * q0 - i * k + 1//2 * k * j * 3 * q0^2 + 1//2 * k * j +
        1//2 * l * i * 3 * q0^2 + 1//2 * l * i
      ) * 1//R((3 * q0^2 + 1)),
    ) +
    S(
      1;
      exponent=(
        i * k - i * k * 3 * q0 + 1//2 * k * j * 3 * q0^2 + 1//2 * k * j +
        1//2 * l * i * 3 * q0^2 + 1//2 * l * i + 1//2 * j * l * 3 * q0^2 + 1//2 * j * l
      ) * 1//R((3 * q0^2 + 1)),
    )
  ),
  S(0)] [
  ((3 * q0^2 - 1) * (3 * q0^2 - 3 * q0 + 1) * (3 * q0^2 + 1)) * S(1),
  (-3 * q0^2 - 1 + 3 * q0) * S(1),
  (3 * q0 - 1) * S(1),
  (3 * q0 - 1) * S(1),
  -S(1),
  -S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  -(
    S(1; exponent=(i * k) * 1//R((3 * q0^2 + 3 * q0 + 1))) +
    S(1; exponent=((3 * q0 + 2) * i * k) * 1//R((3 * q0^2 + 3 * q0 + 1))) +
    S(1; exponent=((3 * q0 + 1) * i * k) * 1//R((3 * q0^2 + 3 * q0 + 1))) +
    S(1; exponent=(-i * k) * 1//R((3 * q0^2 + 3 * q0 + 1))) +
    S(1; exponent=((-3 * q0 - 2) * i * k) * 1//R((3 * q0^2 + 3 * q0 + 1))) +
    S(1; exponent=((-3 * q0 - 1) * i * k) * 1//R((3 * q0^2 + 3 * q0 + 1)))
  )]]
classinfo = [
  [[1, 0], ["^2G_2", "1"], "1"],
  [[1, 1], ["^2G_2", "X"], "X"],
  [[1, 2], ["^2G_2", "T"], "T"],
  [[1, 3], ["^2G_2", "T^{-1}"], "T^{-1}"],
  [[1, 4], ["^2G_2", "Y"], "Y"],
  [[1, 5], ["^2G_2", "YT"], "YT"],
  [[1, 6], ["^2G_2", "YT^{-1}"], "YT^{-1}"],
  [[2, 0], ["A_1", "1"], "J"],
  [[2, 1], ["A_1", "T"], "JT"],
  [[2, 2], ["A_1", "T^{-1}"], "JT^{-1}"],
  [[3, 0], ["A_0", "1"], "R^aandJR^a"],
  [[4, 0], ["A_0", "1"], "V"],
  [[5, 0], ["A_0", "1"], "S^aandJS^a"],
  [[6, 0], ["A_0", "1"], "W"]]
classlength =
  R.([
    1,
    (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1),
    1//2 * 3 * q0^2 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) *
    (3 * q0^2 + 1),
    1//2 * 3 * q0^2 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) *
    (3 * q0^2 + 1),
    1//3 * 9 * q0^4 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) *
    (3 * q0^2 + 1),
    1//3 * 9 * q0^4 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) *
    (3 * q0^2 + 1),
    1//3 * 9 * q0^4 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) *
    (3 * q0^2 + 1),
    9 * q0^4 * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0),
    1//2 * 9 * q0^4 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) *
    (3 * q0^2 + 1),
    1//2 * 9 * q0^4 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) *
    (3 * q0^2 + 1),
    27 * q0^6 * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1),
    27 * q0^6 * (3 * q0^2 - 1) * (3 * q0^2 + 1) * (3 * q0^2 + 1 + 3 * q0),
    27 * q0^6 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0),
    27 * q0^6 * (3 * q0^2 - 1) * (3 * q0^2 + 1) * (3 * q0^2 + 1 - 3 * q0)])
charinfo = [
  [[1, 0], ["^2G_2", 0], "xi_1,one"],
  [[1, 1], ["^2G_2", 1], "xi_5"],
  [[1, 2], ["^2G_2", 2], "xi_6"],
  [[1, 3], ["^2G_2", 3], "xi_7"],
  [[1, 4], ["^2G_2", 4], "xi_8"],
  [[1, 5], ["^2G_2", 5], "xi_9"],
  [[1, 6], ["^2G_2", 6], "xi_{10}"],
  [[1, 7], ["^2G_2", 7], "xi_3,St"],
  [[2, 0], ["A_1", [2]], "xi_2"],
  [[2, 1], ["A_1", [1, 1]], "xi_4"],
  [[3, 0], ["A_0", [1]], "eta_randeta_r'"],
  [[4, 0], ["A_0", [1]], "eta_i^-"],
  [[5, 0], ["A_0", [1]], "eta_tandeta_t'"],
  [[4, 0], ["A_0", [1]], "eta_i^+"]]
chardegree =
  R.([
    1,
    1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0),
    1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 - 3 * q0),
    1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 + 3 * q0),
    1//6 * 3 * q0 * (3 * q0^2 - 1) * (3 * q0^2 + 1 - 3 * q0),
    q0 * (9 * q0^4 - 1),
    q0 * (9 * q0^4 - 1),
    27 * q0^6,
    (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1 + 3 * q0),
    3 * q0^2 * (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1 + 3 * q0),
    (3 * q0^2 + 1) * (3 * q0^2 + 1 + 3 * q0) * (3 * q0^2 + 1 - 3 * q0),
    (3 * q0^2 - 1) * (3 * q0^2 + 3 * q0 + 1) * (3 * q0^2 + 1),
    (3 * q0^2 - 1) * (3 * q0^2 + 1 - 3 * q0) * (3 * q0^2 + 1 + 3 * q0),
    (3 * q0^2 - 1) * (3 * q0^2 - 3 * q0 + 1) * (3 * q0^2 + 1)])

classsums = [
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [0])
    s2 = evaluate(tt, [i], [(3 * q0^2 - 1) * 1//2])
    s3 = nesum(tt, i, 0, 3 * q0^2 - 2)
    1//2 * s3 - 1//2 * s2 - 1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, 3 * q0^2 - 3 * q0)
    1//6 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [i], [(3 * q0^2 + 1) * 1//4])
    s2 = nesum(tt, i, 1, (3 * q0^2 - 1) * 1//2)
    s2 = 1//6 * s2 - 1//6 * s1
    s1 = evaluate(s2, [j], [0])
    s2 = evaluate(s2, [j], [1])
    s1 + s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, 3 * q0^2 + 3 * q0)
    1//6 * s1
  end,
]

charsums = [
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [k], [0])
    s2 = evaluate(tt, [k], [(3 * q0^2 - 1) * 1//2])
    s3 = nesum(tt, k, 0, 3 * q0^2 - 2)
    1//2 * s3 - 1//2 * s2 - 1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, 3 * q0^2 - 3 * q0)
    1//6 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = evaluate(tt, [k], [(3 * q0^2 + 1) * 1//4])
    s2 = nesum(tt, k, 1, (3 * q0^2 - 1) * 1//2)
    s2 = 1//6 * s2 - 1//6 * s1
    s1 = evaluate(s2, [l], [0])
    s2 = evaluate(s2, [l], [1])
    s1 + s2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, 3 * q0^2 + 3 * q0)
    1//6 * s1
  end,
]

classparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(i, 3 * q0^2 - 1)], [((i) * 1//((3 * q0^2 - 1) * 1//2))]),
  Parameters([Parameter(i, 3 * q0^2 - 3 * q0 + 1)], [((i) * 1//(3 * q0^2 - 3 * q0 + 1))]),
  Parameters(
    [Parameter(i, (3 * q0^2 + 1) * 1//2), Parameter(j, R(2))],
    [((i) * 1//((3 * q0^2 + 1) * 1//4))],
  ),
  Parameters([Parameter(i, 3 * q0^2 + 3 * q0 + 1)], [((i) * 1//(3 * q0^2 - 3 * q0 + 1))]),
]

charparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(k, 3 * q0^2 - 1)], [((k) * 1//((3 * q0^2 - 1) * 1//2))]),
  Parameters([Parameter(k, 3 * q0^2 - 3 * q0 + 1)], [((k) * 1//(3 * q0^2 - 3 * q0 + 1))]),
  Parameters(
    [Parameter(k, (3 * q0^2 + 1) * 1//2), Parameter(l, R(2))],
    [((k) * 1//((3 * q0^2 + 1) * 1//4))],
  ),
  Parameters([Parameter(k, 3 * q0^2 + 3 * q0 + 1)], [((k) * 1//(3 * q0^2 - 3 * q0 + 1))]),
]

classparamindex = var_index.([i, j])
charparamindex = var_index.([k, l])

information = raw"""- Information about the generic character table of the Ree groups
  $^2\mathrm{G}_2(q)$. The possible values for $q$ are given by
  $q^2 = 3^{2m+1}$ with m a non negative integer. So
  $q = \sqrt{3}q_0$ where $q_0 = 3^m$.

- CHEVIE-name of the table: `ree`

- Most of the table was determined in [War66](@cite).

- The values of the irreducible Deligne-Lusztig characters were
  computed by F.Luebeck.

- The names of class types and character types used in the above
  cited article can be recovered as fourths components of the 
  information given by `PrintInfoClass` and `PrintInfoChar`.
  These names are also used as names for the unipotent parts of
  the classes.
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

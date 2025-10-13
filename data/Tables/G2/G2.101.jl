using GenericCharacterTables
import GenericCharacterTables
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using GenericCharacterTablesscar
S, E, q = generic_cyclotomic_ring(; congruence=ZZ.((1, 4)))
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

order = q^6 * (q^2 - 1)^2 * (q^4 + q^2 + 1)
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
  S(1),
  S(1)] [
  (q * (q + 1)^2 * (q^2 + q + 1) * 1//6) * S(1),
  (q * (q + 1) * (2 * q + 1) * 1//6) * S(1),
  (q * (q + 1) * (2 * q + 1) * 1//6) * S(1),
  (q * (3 * q + 1) * 1//6) * S(1),
  (q * (q + 1) * 1//6) * S(1),
  (-q * (q - 1) * 1//6) * S(1),
  (2 * q * 1//3) * S(1),
  (-q * 1//3) * S(1),
  (-q * 1//3) * S(1),
  ((q + 1)^2 * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  (-(q - 1) * 1//2) * S(1),
  (q + 1) * S(1),
  S(1),
  (q + 1) * S(1),
  S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (2) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1)] [
  (q * (q + 1) * (q^3 + 1) * 1//2) * S(1),
  (q * (q + 1) * 1//2) * S(1),
  (q * (q + 1) * 1//2) * S(1),
  (q * (q + 1) * 1//2) * S(1),
  (-q * (q - 1) * 1//2) * S(1),
  (q * (q + 1) * 1//2) * S(1),
  S(0),
  S(0),
  S(0),
  ((q + 1)^2 * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  (-(q - 1) * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  (q + 1) * S(1),
  S(1),
  (q + 1) * S(1),
  S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (2) * S(1),
  S(0),
  S(0),
  S(0),
  -S(1),
  S(0)] [
  (q * (q^4 + q^2 + 1) * 1//3) * S(1),
  (-q * (q^2 - 1) * 1//3) * S(1),
  (q * (2 * q^2 + 1) * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q * (q + 1) * 1//3) * S(1),
  (-q * (q - 1) * 1//3) * S(1),
  (-2 * q * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q) * S(1),
  (0) * S(1),
  (q) * S(1),
  S(0),
  S(0),
  (q) * S(1),
  S(0),
  S(1),
  S(1),
  (q) * S(1),
  S(0),
  -S(1),
  -S(1),
  S(1),
  S(1),
  -S(1),
  -S(1),
  S(0),
  S(0)] [
  (q * (q^4 + q^2 + 1) * 1//3) * S(1),
  (q * (2 * q^2 + 1) * 1//3) * S(1),
  (-q * (q^2 - 1) * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q * (q + 1) * 1//3) * S(1),
  (-q * (q - 1) * 1//3) * S(1),
  (-2 * q * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q) * S(1),
  (q) * S(1),
  S(0),
  S(0),
  S(0),
  S(1),
  S(1),
  (q) * S(1),
  S(0),
  -S(1),
  -S(1),
  (q) * S(1),
  S(0),
  S(1),
  -S(1),
  S(1),
  -S(1),
  S(0),
  S(0)] [
  (q * (q - 1)^2 * (q^2 - q + 1) * 1//6) * S(1),
  (q * (q - 1) * (2 * q - 1) * 1//6) * S(1),
  (q * (q - 1) * (2 * q - 1) * 1//6) * S(1),
  (-q * (3 * q - 1) * 1//6) * S(1),
  (q * (q + 1) * 1//6) * S(1),
  (-q * (q - 1) * 1//6) * S(1),
  (2 * q * 1//3) * S(1),
  (-q * 1//3) * S(1),
  (-q * 1//3) * S(1),
  (-(q - 1)^2 * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  (-(q + 1) * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (q - 1) * S(1),
  -S(1),
  (q - 1) * S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  (-2) * S(1),
  S(1),
  S(0)] [
  (q * (q - 1) * (q^3 - 1) * 1//2) * S(1),
  (-q * (q - 1) * 1//2) * S(1),
  (-q * (q - 1) * 1//2) * S(1),
  (-q * (q - 1) * 1//2) * S(1),
  (-q * (q - 1) * 1//2) * S(1),
  (q * (q + 1) * 1//2) * S(1),
  S(0),
  S(0),
  S(0),
  (-(q - 1)^2 * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  (-(q + 1) * 1//2) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (q - 1) * S(1),
  -S(1),
  (q - 1) * S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  (-2) * S(1),
  S(0),
  S(1)] [
  (q * (q^2 - 1)^2 * 1//3) * S(1),
  (-q * (q^2 - 1) * 1//3) * S(1),
  (-q * (q^2 - 1) * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q * (q + 1) * 1//3) * S(1),
  (-q * (q - 1) * 1//3) * S(1),
  (q * 1//3) * S(1),
  q * 1//3 + q * S(1; exponent=1//R((3))),
  q * 1//3 + q * S(1; exponent=2 * 1//R((3))),
  (0) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1),
  S(1)] [
  (q * (q^2 - 1)^2 * 1//3) * S(1),
  (-q * (q^2 - 1) * 1//3) * S(1),
  (-q * (q^2 - 1) * 1//3) * S(1),
  (q * 1//3) * S(1),
  (q * (q + 1) * 1//3) * S(1),
  (-q * (q - 1) * 1//3) * S(1),
  (q * 1//3) * S(1),
  q * 1//3 + q * S(1; exponent=2 * 1//R((3))),
  q * 1//3 + q * S(1; exponent=1//R((3))),
  (0) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1),
  S(1)] [
  (q^6) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (q^2) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (q) * S(1),
  S(0),
  (q) * S(1),
  S(0),
  (-q) * S(1),
  S(0),
  (-q) * S(1),
  S(0),
  S(1),
  -S(1),
  -S(1),
  S(1),
  S(1),
  S(1)] [
  (q^4 + q^2 + 1) * S(1),
  (q^2 + 1) * S(1),
  (q^2 + 1) * S(1),
  (q^2 + 1) * S(1),
  (1) * S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  (1 + 2 * q) * S(1),
  (1 + q) * S(1),
  (1 + q) * S(1),
  S(1),
  S(1),
  1 + (q + 1) * S(1; exponent=i * 1//R((2))),
  1 + S(1; exponent=i * 1//R((2))),
  1 + (q + 1) * S(1; exponent=i * 1//R((2))),
  1 + S(1; exponent=i * 1//R((2))),
  1 - (q - 1) * S(1; exponent=i * 1//R((2))),
  1 + S(1; exponent=i * 1//R((2))),
  1 - (q - 1) * S(1; exponent=i * 1//R((2))),
  1 + S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
  S(1; exponent=(i + j) * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
  S(1; exponent=(i + j) * 1//R((2))),
  S(0),
  S(0)] [
  (q * (q^4 + q^2 + 1)) * S(1),
  (q * (q^2 + 1)) * S(1),
  (q) * S(1),
  (q) * S(1),
  (q) * S(1),
  (q) * S(1),
  S(0),
  S(0),
  S(0),
  (q + q^2 + 1) * S(1),
  (q + 1) * S(1),
  S(1),
  S(1),
  S(1),
  1 + (q + 1) * S(1; exponent=i * 1//R((2))),
  1 + S(1; exponent=i * 1//R((2))),
  q + (q + 1) * S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  -1 + (q - 1) * S(1; exponent=i * 1//R((2))),
  -1 - S(1; exponent=i * 1//R((2))),
  q + (q - 1) * S(1; exponent=i * 1//R((2))),
  -S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
  S(1; exponent=(i + j) * 1//R((2))),
  -S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  -S(1; exponent=i * 1//R((2))) - S(1; exponent=j * 1//R((2))) -
  S(1; exponent=(i + j) * 1//R((2))),
  S(0),
  S(0)] [
  (q * (q^4 + q^2 + 1)) * S(1),
  (q) * S(1),
  (q * (q^2 + 1)) * S(1),
  (q) * S(1),
  (q) * S(1),
  (q) * S(1),
  S(0),
  S(0),
  S(0),
  (q + q^2 + 1) * S(1),
  S(1),
  (q + 1) * S(1),
  S(1),
  S(1),
  q + (q + 1) * S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  1 + (q + 1) * S(1; exponent=i * 1//R((2))),
  1 + S(1; exponent=i * 1//R((2))),
  q + (q - 1) * S(1; exponent=i * 1//R((2))),
  -S(1; exponent=i * 1//R((2))),
  -1 + (q - 1) * S(1; exponent=i * 1//R((2))),
  -1 - S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
  S(1; exponent=(i + j) * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  -S(1; exponent=i * 1//R((2))),
  -S(1; exponent=i * 1//R((2))) - S(1; exponent=j * 1//R((2))) -
  S(1; exponent=(i + j) * 1//R((2))),
  S(0),
  S(0)] [
  (q^2 * (q^4 + q^2 + 1)) * S(1),
  (q^2) * S(1),
  (q^2) * S(1),
  (q^2) * S(1),
  (0) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (q^2 + 2 * q) * S(1),
  (q) * S(1),
  (q) * S(1),
  S(0),
  S(0),
  q + (q + 1) * S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  q + (q + 1) * S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  -q - (q - 1) * S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  -q - (q - 1) * S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
  S(1; exponent=(i + j) * 1//R((2))),
  -S(1; exponent=i * 1//R((2))),
  -S(1; exponent=i * 1//R((2))),
  S(1; exponent=i * 1//R((2))) + S(1; exponent=j * 1//R((2))) +
  S(1; exponent=(i + j) * 1//R((2))),
  S(0),
  S(0)] [
  ((q^2 + q + 1) * (q^3 + 1)) * S(1),
  (q^2 + q + 1) * S(1),
  ((q + 1) * (q^2 + 1)) * S(1),
  (q^2 + q + 1) * S(1),
  (q + 1) * S(1),
  (q + 1) * S(1),
  S(1),
  S(1),
  S(1),
  (q + 1) + (q + 1)^2 * S(1; exponent=k * 1//R((2))),
  1 + (q + 1) * S(1; exponent=k * 1//R((2))),
  q + 1 + (q + 1) * S(1; exponent=k * 1//R((2))),
  1 + S(1; exponent=k * 1//R((2))),
  1 + S(1; exponent=k * 1//R((2))),
  (q + 1) * (
    1 + S(1; exponent=(3 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-3 * i * k) * 1//R((q - 1)))
  ),
  1 + S(1; exponent=(3 * i * k) * 1//R((q - 1))) +
  S(1; exponent=(-3 * i * k) * 1//R((q - 1))),
  (q + 1) *
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) + (
    S(1; exponent=(2 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q - 1)))
  ),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) + (
    S(1; exponent=(2 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q - 1)))
  ),
  (q + 1) * S(1),
  S(1),
  S(0),
  S(0),
  (
    S(1; exponent=((i - j) * k) * 1//R((q - 1))) +
    S(1; exponent=((j - i) * k) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=((i + 2 * j) * k) * 1//R((q - 1))) +
    S(1; exponent=(-(i + 2 * j) * k) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=((j + 2 * i) * k) * 1//R((q - 1))) +
    S(1; exponent=(-(j + 2 * i) * k) * 1//R((q - 1)))
  ),
  S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1))),
  S(0),
  S(0),
  S(0),
  S(0)] [
  (q * (q^2 + q + 1) * (q^3 + 1)) * S(1),
  (q * (q^2 + q + 1)) * S(1),
  ((q + 1) * q) * S(1),
  ((q + 1) * q) * S(1),
  (q) * S(1),
  (q) * S(1),
  S(0),
  S(0),
  S(0),
  q * (q + 1) + (q + 1)^2 * S(1; exponent=k * 1//R((2))),
  q + (q + 1) * S(1; exponent=k * 1//R((2))),
  (q + 1) * S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  (q + 1) * (
    1 + S(1; exponent=(3 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-3 * i * k) * 1//R((q - 1)))
  ),
  1 + S(1; exponent=(3 * i * k) * 1//R((q - 1))) +
  S(1; exponent=(-3 * i * k) * 1//R((q - 1))),
  (q + 1) *
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) +
  q * (
    S(1; exponent=(2 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q - 1)))
  ),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  (-(q + 1)) * S(1),
  -S(1),
  S(0),
  S(0),
  (
    S(1; exponent=((i - j) * k) * 1//R((q - 1))) +
    S(1; exponent=((j - i) * k) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=((i + 2 * j) * k) * 1//R((q - 1))) +
    S(1; exponent=(-(i + 2 * j) * k) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=((j + 2 * i) * k) * 1//R((q - 1))) +
    S(1; exponent=(-(j + 2 * i) * k) * 1//R((q - 1)))
  ),
  -(S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  S(0),
  S(0),
  S(0),
  S(0)] [
  ((q^2 + q + 1) * (q^3 + 1)) * S(1),
  ((q + 1) * (q^2 + 1)) * S(1),
  (q^2 + q + 1) * S(1),
  (q^2 + q + 1) * S(1),
  (q + 1) * S(1),
  (q + 1) * S(1),
  S(1),
  S(1),
  S(1),
  (q + 1) + (q + 1)^2 * S(1; exponent=k * 1//R((2))),
  q + 1 + (q + 1) * S(1; exponent=k * 1//R((2))),
  1 + (q + 1) * S(1; exponent=k * 1//R((2))),
  1 + S(1; exponent=k * 1//R((2))),
  1 + S(1; exponent=k * 1//R((2))),
  (q + 1) *
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) + (
    S(1; exponent=(2 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q - 1)))
  ),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) + (
    S(1; exponent=(2 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q - 1)))
  ),
  (q + 1) *
  (1 + S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  1 + S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1))),
  S(0),
  S(0),
  (q + 1) * S(1),
  S(1),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) +
  (S(1; exponent=(j * k) * 1//R((q - 1))) + S(1; exponent=(-j * k) * 1//R((q - 1)))) +
  (
    S(1; exponent=((j + i) * k) * 1//R((q - 1))) +
    S(1; exponent=(-(j + i) * k) * 1//R((q - 1)))
  ),
  S(0),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  S(0),
  S(0),
  S(0)] [
  (q * (q^2 + q + 1) * (q^3 + 1)) * S(1),
  ((q + 1) * q) * S(1),
  (q * (q^2 + q + 1)) * S(1),
  ((q + 1) * q) * S(1),
  (q) * S(1),
  (q) * S(1),
  S(0),
  S(0),
  S(0),
  q * (q + 1) + (q + 1)^2 * S(1; exponent=k * 1//R((2))),
  (q + 1) * S(1; exponent=k * 1//R((2))),
  q + (q + 1) * S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  (q + 1) *
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) +
  q * (
    S(1; exponent=(2 * i * k) * 1//R((q - 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q - 1)))
  ),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  (q + 1) *
  (1 + S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  1 + S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1))),
  S(0),
  S(0),
  (-(q + 1)) * S(1),
  -S(1),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) +
  (S(1; exponent=(j * k) * 1//R((q - 1))) + S(1; exponent=(-j * k) * 1//R((q - 1)))) +
  (
    S(1; exponent=((j + i) * k) * 1//R((q - 1))) +
    S(1; exponent=(-(j + i) * k) * 1//R((q - 1)))
  ),
  S(0),
  -(S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  S(0),
  S(0),
  S(0)] [
  ((q^2 - q + 1) * (q^3 - 1)) * S(1),
  ((q - 1) * (q^2 + 1)) * S(1),
  (-(q^2 - q + 1)) * S(1),
  (-(q^2 - q + 1)) * S(1),
  (q - 1) * S(1),
  (q - 1) * S(1),
  -S(1),
  -S(1),
  -S(1),
  (q - 1) - (q - 1)^2 * S(1; exponent=k * 1//R((2))),
  q - 1 + (q - 1) * S(1; exponent=k * 1//R((2))),
  -1 + (q - 1) * S(1; exponent=k * 1//R((2))),
  -1 - S(1; exponent=k * 1//R((2))),
  -1 - S(1; exponent=k * 1//R((2))),
  S(0),
  S(0),
  (q - 1) * S(1),
  -S(1),
  (q - 1) *
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) - (
    S(1; exponent=(2 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q + 1)))
  ),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) - (
    S(1; exponent=(2 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q + 1)))
  ),
  (q - 1) *
  (1 + S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  -(1 + S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  S(0),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  S(0),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) -
  (S(1; exponent=(j * k) * 1//R((q + 1))) + S(1; exponent=(-j * k) * 1//R((q + 1)))) - (
    S(1; exponent=((j + i) * k) * 1//R((q + 1))) +
    S(1; exponent=(-(j + i) * k) * 1//R((q + 1)))
  ),
  S(0),
  S(0)] [
  (q * (q^2 - q + 1) * (q^3 - 1)) * S(1),
  ((q - 1) * q) * S(1),
  (-q * (q^2 - q + 1)) * S(1),
  ((q - 1) * q) * S(1),
  (-q) * S(1),
  (-q) * S(1),
  S(0),
  S(0),
  S(0),
  q * (q - 1) + (q - 1)^2 * S(1; exponent=k * 1//R((2))),
  -(q - 1) * S(1; exponent=k * 1//R((2))),
  -q - (q - 1) * S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(0),
  S(0),
  ((q - 1)) * S(1),
  -S(1),
  -(q - 1) *
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) -
  q * (
    S(1; exponent=(2 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q + 1)))
  ),
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  -(q - 1) *
  (1 + S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  1 + S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1))),
  S(0),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  S(0),
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) +
  (S(1; exponent=(j * k) * 1//R((q + 1))) + S(1; exponent=(-j * k) * 1//R((q + 1)))) +
  (
    S(1; exponent=((j + i) * k) * 1//R((q + 1))) +
    S(1; exponent=(-(j + i) * k) * 1//R((q + 1)))
  ),
  S(0),
  S(0)] [
  ((q^2 - q + 1) * (q^3 - 1)) * S(1),
  (-(q^2 - q + 1)) * S(1),
  ((q - 1) * (q^2 + 1)) * S(1),
  (-(q^2 - q + 1)) * S(1),
  (q - 1) * S(1),
  (q - 1) * S(1),
  -S(1),
  -S(1),
  -S(1),
  (q - 1) - (q - 1)^2 * S(1; exponent=k * 1//R((2))),
  -1 + (q - 1) * S(1; exponent=k * 1//R((2))),
  q - 1 + (q - 1) * S(1; exponent=k * 1//R((2))),
  -1 - S(1; exponent=k * 1//R((2))),
  -1 - S(1; exponent=k * 1//R((2))),
  (q - 1) * S(1),
  -S(1),
  S(0),
  S(0),
  (q - 1) * (
    1 + S(1; exponent=(3 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-3 * i * k) * 1//R((q + 1)))
  ),
  -1 - S(1; exponent=(3 * i * k) * 1//R((q + 1))) -
  S(1; exponent=(-3 * i * k) * 1//R((q + 1))),
  (q - 1) *
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) - (
    S(1; exponent=(2 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q + 1)))
  ),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) - (
    S(1; exponent=(2 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q + 1)))
  ),
  S(0),
  S(0),
  -S(1; exponent=(i * k) * 1//R((q + 1))) - S(1; exponent=(-i * k) * 1//R((q + 1))),
  -(
    S(1; exponent=((i - j) * k) * 1//R((q + 1))) +
    S(1; exponent=((j - i) * k) * 1//R((q + 1)))
  ) - (
    S(1; exponent=((i + 2 * j) * k) * 1//R((q + 1))) +
    S(1; exponent=(-(i + 2 * j) * k) * 1//R((q + 1)))
  ) - (
    S(1; exponent=((j + 2 * i) * k) * 1//R((q + 1))) +
    S(1; exponent=(-(j + 2 * i) * k) * 1//R((q + 1)))
  ),
  S(0),
  S(0)] [
  (q * (q^2 - q + 1) * (q^3 - 1)) * S(1),
  (-q * (q^2 - q + 1)) * S(1),
  ((q - 1) * q) * S(1),
  ((q - 1) * q) * S(1),
  (-q) * S(1),
  (-q) * S(1),
  S(0),
  S(0),
  S(0),
  q * (q - 1) + (q - 1)^2 * S(1; exponent=k * 1//R((2))),
  -q - (q - 1) * S(1; exponent=k * 1//R((2))),
  -(q - 1) * S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  ((q - 1)) * S(1),
  -S(1),
  S(0),
  S(0),
  -(q - 1) * (
    1 + S(1; exponent=(3 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-3 * i * k) * 1//R((q + 1)))
  ),
  1 + S(1; exponent=(3 * i * k) * 1//R((q + 1))) +
  S(1; exponent=(-3 * i * k) * 1//R((q + 1))),
  -(q - 1) *
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) -
  q * (
    S(1; exponent=(2 * i * k) * 1//R((q + 1))) +
    S(1; exponent=(-2 * i * k) * 1//R((q + 1)))
  ),
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  S(0),
  S(0),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  (
    S(1; exponent=((i - j) * k) * 1//R((q + 1))) +
    S(1; exponent=((j - i) * k) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=((i + 2 * j) * k) * 1//R((q + 1))) +
    S(1; exponent=(-(i + 2 * j) * k) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=((j + 2 * i) * k) * 1//R((q + 1))) +
    S(1; exponent=(-(j + 2 * i) * k) * 1//R((q + 1)))
  ),
  S(0),
  S(0)] [
  ((q + 1) * (q^2 + q + 1) * (q^3 + 1)) * S(1),
  ((q + 1) * (q^2 + q + 1)) * S(1),
  ((q + 1) * (q^2 + q + 1)) * S(1),
  (2 * q^2 + 2 * q + 1) * S(1),
  (2 * q + 1) * S(1),
  (2 * q + 1) * S(1),
  S(1),
  S(1),
  S(1),
  (q + 1)^2 * (
    S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
    S(1; exponent=(k + l) * 1//R((2)))
  ),
  (q + 1) * (
    S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
    S(1; exponent=(k + l) * 1//R((2)))
  ),
  (q + 1) * (
    S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
    S(1; exponent=(k + l) * 1//R((2)))
  ),
  S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
  S(1; exponent=(k + l) * 1//R((2))),
  S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
  S(1; exponent=(k + l) * 1//R((2))),
  (q + 1) * (
    (
      S(1; exponent=(i * (k + l)) * 1//R((q - 1))) +
      S(1; exponent=(-i * (k + l)) * 1//R((q - 1)))
    ) +
    (
      S(1; exponent=(i * (k - 2 * l)) * 1//R((q - 1))) +
      S(1; exponent=(-i * (k - 2 * l)) * 1//R((q - 1)))
    ) +
    (
      S(1; exponent=(i * (l - 2 * k)) * 1//R((q - 1))) +
      S(1; exponent=(-i * (l - 2 * k)) * 1//R((q - 1)))
    )
  ),
  (
    S(1; exponent=(i * (k + l)) * 1//R((q - 1))) +
    S(1; exponent=(-i * (k + l)) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=(i * (k - 2 * l)) * 1//R((q - 1))) +
    S(1; exponent=(-i * (k - 2 * l)) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=(i * (l - 2 * k)) * 1//R((q - 1))) +
    S(1; exponent=(-i * (l - 2 * k)) * 1//R((q - 1)))
  ),
  (q + 1) * (
    (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) +
    (S(1; exponent=(i * l) * 1//R((q - 1))) + S(1; exponent=(-i * l) * 1//R((q - 1)))) +
    (
      S(1; exponent=(i * (k - l)) * 1//R((q - 1))) +
      S(1; exponent=(-i * (k - l)) * 1//R((q - 1)))
    )
  ),
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))) +
  (S(1; exponent=(i * l) * 1//R((q - 1))) + S(1; exponent=(-i * l) * 1//R((q - 1)))) +
  (
    S(1; exponent=(i * (k - l)) * 1//R((q - 1))) +
    S(1; exponent=(-i * (k - l)) * 1//R((q - 1)))
  ),
  S(0),
  S(0),
  S(0),
  S(0),
  (
    S(1; exponent=(i * k + j * l) * 1//R((q - 1))) +
    S(1; exponent=(-(i * k + j * l)) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=(i * l + j * k) * 1//R((q - 1))) +
    S(1; exponent=(-(i * l + j * k)) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=(i * (k - l) - j * l) * 1//R((q - 1))) +
    S(1; exponent=(-(i * (k - l) - j * l)) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=(i * l - j * (k - l)) * 1//R((q - 1))) +
    S(1; exponent=(-(i * l - j * (k - l))) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=(i * (k - l) + j * k) * 1//R((q - 1))) +
    S(1; exponent=(-(i * (k - l) + j * k)) * 1//R((q - 1)))
  ) +
  (
    S(1; exponent=(i * k + j * (k - l)) * 1//R((q - 1))) +
    S(1; exponent=(-(i * k + j * (k - l))) * 1//R((q - 1)))
  ),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0)] [
  ((q - 1) * (q^2 - q + 1) * (q^3 - 1)) * S(1),
  (-(q - 1) * (q^2 - q + 1)) * S(1),
  (-(q - 1) * (q^2 - q + 1)) * S(1),
  (2 * q^2 - 2 * q + 1) * S(1),
  (-2 * q + 1) * S(1),
  (-2 * q + 1) * S(1),
  S(1),
  S(1),
  S(1),
  (q - 1)^2 * (
    S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
    S(1; exponent=(k + l) * 1//R((2)))
  ),
  -(q - 1) * (
    S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
    S(1; exponent=(k + l) * 1//R((2)))
  ),
  -(q - 1) * (
    S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
    S(1; exponent=(k + l) * 1//R((2)))
  ),
  S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
  S(1; exponent=(k + l) * 1//R((2))),
  S(1; exponent=k * 1//R((2))) + S(1; exponent=l * 1//R((2))) +
  S(1; exponent=(k + l) * 1//R((2))),
  S(0),
  S(0),
  S(0),
  S(0),
  -(q - 1) * (
    (
      S(1; exponent=(i * (k + l)) * 1//R((q + 1))) +
      S(1; exponent=(-i * (k + l)) * 1//R((q + 1)))
    ) +
    (
      S(1; exponent=(i * (k - 2 * l)) * 1//R((q + 1))) +
      S(1; exponent=(-i * (k - 2 * l)) * 1//R((q + 1)))
    ) +
    (
      S(1; exponent=(i * (l - 2 * k)) * 1//R((q + 1))) +
      S(1; exponent=(-i * (l - 2 * k)) * 1//R((q + 1)))
    )
  ),
  (
    S(1; exponent=(i * (k + l)) * 1//R((q + 1))) +
    S(1; exponent=(-i * (k + l)) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=(i * (k - 2 * l)) * 1//R((q + 1))) +
    S(1; exponent=(-i * (k - 2 * l)) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=(i * (l - 2 * k)) * 1//R((q + 1))) +
    S(1; exponent=(-i * (l - 2 * k)) * 1//R((q + 1)))
  ),
  -(q - 1) * (
    (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) +
    (S(1; exponent=(i * l) * 1//R((q + 1))) + S(1; exponent=(-i * l) * 1//R((q + 1)))) +
    (
      S(1; exponent=(i * (k - l)) * 1//R((q + 1))) +
      S(1; exponent=(-i * (k - l)) * 1//R((q + 1)))
    )
  ),
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))) +
  (S(1; exponent=(i * l) * 1//R((q + 1))) + S(1; exponent=(-i * l) * 1//R((q + 1)))) +
  (
    S(1; exponent=(i * (k - l)) * 1//R((q + 1))) +
    S(1; exponent=(-i * (k - l)) * 1//R((q + 1)))
  ),
  S(0),
  S(0),
  S(0),
  (
    S(1; exponent=(i * k + j * l) * 1//R((q + 1))) +
    S(1; exponent=(-(i * k + j * l)) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=(i * l + j * k) * 1//R((q + 1))) +
    S(1; exponent=(-(i * l + j * k)) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=(i * (k - l) - j * l) * 1//R((q + 1))) +
    S(1; exponent=(-(i * (k - l) - j * l)) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=(i * l - j * (k - l)) * 1//R((q + 1))) +
    S(1; exponent=(-(i * l - j * (k - l))) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=(i * (k - l) + j * k) * 1//R((q + 1))) +
    S(1; exponent=(-(i * (k - l) + j * k)) * 1//R((q + 1)))
  ) +
  (
    S(1; exponent=(i * k + j * (k - l)) * 1//R((q + 1))) +
    S(1; exponent=(-(i * k + j * (k - l))) * 1//R((q + 1)))
  ),
  S(0),
  S(0)] [
  (q^6 - 1) * S(1),
  ((q^3 - 1)) * S(1),
  (-(q^3 + 1)) * S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  (q^2 - 1) * S(1; exponent=k * 1//R((2))),
  (q - 1) * S(1; exponent=k * 1//R((2))),
  -(q + 1) * S(1; exponent=k * 1//R((2))),
  -S(1; exponent=k * 1//R((2))),
  -S(1; exponent=k * 1//R((2))),
  S(0),
  S(0),
  (q - 1) *
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  -(S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  -(q + 1) *
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  S(0),
  S(0),
  S(0),
  -(
    S(1; exponent=(i * k) * 1//R((q^2 - 1))) + S(1; exponent=(-i * k) * 1//R((q^2 - 1))) +
    S(1; exponent=(q * i * k) * 1//R((q^2 - 1))) +
    S(1; exponent=(-q * i * k) * 1//R((q^2 - 1)))
  ),
  S(0),
  S(0),
  S(0),
  S(0)] [
  (q^6 - 1) * S(1),
  (-(q^3 + 1)) * S(1),
  ((q^3 - 1)) * S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  -S(1),
  (q^2 - 1) * S(1; exponent=k * 1//R((2))),
  -(q + 1) * S(1; exponent=k * 1//R((2))),
  (q - 1) * S(1; exponent=k * 1//R((2))),
  -S(1; exponent=k * 1//R((2))),
  -S(1; exponent=k * 1//R((2))),
  (q - 1) *
  (S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  -(S(1; exponent=(i * k) * 1//R((q - 1))) + S(1; exponent=(-i * k) * 1//R((q - 1)))),
  S(0),
  S(0),
  S(0),
  S(0),
  -(q + 1) *
  (S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  -(S(1; exponent=(i * k) * 1//R((q + 1))) + S(1; exponent=(-i * k) * 1//R((q + 1)))),
  S(0),
  S(0),
  -(
    S(1; exponent=(i * k) * 1//R((q^2 - 1))) + S(1; exponent=(-i * k) * 1//R((q^2 - 1))) +
    S(1; exponent=(q * i * k) * 1//R((q^2 - 1))) +
    S(1; exponent=(-q * i * k) * 1//R((q^2 - 1)))
  ),
  S(0),
  S(0),
  S(0)] [
  ((q - 1) * (q^2 - 1) * (q^3 + 1)) * S(1),
  ((q - 1) * (q^2 - 1)) * S(1),
  ((q - 1) * (q^2 - 1)) * S(1),
  (-(q^2 + q - 1)) * S(1),
  (-(q - 1)) * S(1),
  (-(q - 1)) * S(1),
  S(1),
  S(1),
  S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(i * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-i * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(q * i * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-q * i * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(q * q * i * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-q * q * i * k) * 1//R((q^2 + q + 1))),
  S(0)] [
  ((q + 1) * (q^2 - 1) * (q^3 - 1)) * S(1),
  (-(q + 1) * (q^2 - 1)) * S(1),
  (-(q + 1) * (q^2 - 1)) * S(1),
  (-(q^2 - q - 1)) * S(1),
  ((q + 1)) * S(1),
  ((q + 1)) * S(1),
  S(1),
  S(1),
  S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(i * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-i * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(q * i * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-q * i * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(q * q * i * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-q * q * i * k) * 1//R((q^2 - q + 1)))]]
classinfo = Vector{Any}[
  [[1, 0], ["G_2", "u_0"], "A_{1}"],
  [[1, 1], ["G_2", "u_1"], "A_{2}"],
  [[1, 2], ["G_2", "u_2"], "A_{31}"],
  [[1, 3], ["G_2", "u_3"], "A_{32}"],
  [[1, 4], ["G_2", "u_4"], "A_{41}"],
  [[1, 5], ["G_2", "u_5"], "A_{42}"],
  [[1, 6], ["G_2", "u_6"], "A_{51}"],
  [[1, 7], ["G_2", "u_7"], "A_{52}"],
  [[1, 8], ["G_2", "u_8"], "A_{53}"],
  [[2, 0], ["A_1+\\tildeA_1", "u_0"], "B_1"],
  [[2, 1], ["A_1+\\tildeA_1", "u_1"], "B_2"],
  [[2, 2], ["A_1+\\tildeA_1", "u_2"], "B_3"],
  [[2, 3], ["A_1+\\tildeA_1", "u_3"], "B_4"],
  [[2, 4], ["A_1+\\tildeA_1", "u_4"], "B_5"],
  [[5, 0], ["A_1", [1, 1]], "C_{11}(i)"],
  [[5, 1], ["A_1", [2]], "C_{12}(i)"],
  [[4, 0], ["\\tildeA_1", [1, 1]], "C_{21}(i)"],
  [[4, 1], ["\\tildeA_1", [2]], "C_{22}(i)"],
  [[6, 0], ["\\tildeA_1", [1, 1]], "D_{11}(i)"],
  [[6, 1], ["\\tildeA_1", [2]], "D_{12}(i)"],
  [[7, 0], ["A_1", [1, 1]], "D_{21}(i)"],
  [[7, 1], ["A_1", [2]], "D_{22}(i)"],
  [[8, 0], ["A_0", [1]], "E_{1}(i)"],
  [[9, 0], ["A_0", [1]], "E_{2}(i,j)"],
  [[10, 0], ["A_0", [1]], "E_{3}(i)"],
  [[11, 0], ["A_0", [1]], "E_{4}(i,j)"],
  [[12, 0], ["A_0", [1]], "E_{5}(i)"],
  [[13, 0], ["A_0", [1]], "E_{6}(i)"]]
classlength =
  R.([
    1,
    q^6 - 1,
    q^6 - 1,
    (q^2 - 1) * (q^6 - 1),
    q^2 * (q^2 - 1) * (q^6 - 1) * 1//2,
    q^2 * (q^2 - 1) * (q^6 - 1) * 1//2,
    q^4 * (q^2 - 1) * (q^6 - 1) * 1//3,
    q^4 * (q^2 - 1) * (q^6 - 1) * 1//3,
    q^4 * (q^2 - 1) * (q^6 - 1) * 1//3,
    q^4 * (q^4 + q^2 + 1),
    q^4 * (q^6 - 1),
    q^4 * (q^6 - 1),
    q^4 * (q^2 - 1) * (q^6 - 1) * 1//2,
    q^4 * (q^2 - 1) * (q^6 - 1) * 1//2,
    q^5 * (q + 1) * (q^4 + q^2 + 1),
    q^5 * (q + 1) * (q^2 - 1) * (q^4 + q^2 + 1),
    q^5 * (q + 1) * (q^4 + q^2 + 1),
    q^5 * (q + 1) * (q^2 - 1) * (q^4 + q^2 + 1),
    q^5 * (q - 1) * (q^4 + q^2 + 1),
    q^5 * (q - 1) * (q^2 - 1) * (q^4 + q^2 + 1),
    q^5 * (q - 1) * (q^4 + q^2 + 1),
    q^5 * (q - 1) * (q^2 - 1) * (q^4 + q^2 + 1),
    q^6 * (q + 1)^2 * (q^4 + q^2 + 1),
    q^6 * (q^2 - 1) * (q^4 + q^2 + 1),
    q^6 * (q^2 - 1) * (q^4 + q^2 + 1),
    q^6 * (q - 1)^2 * (q^4 + q^2 + 1),
    q^6 * (q^2 - 1)^2 * (q^2 - q + 1),
    q^6 * (q^2 - 1)^2 * (q^2 + q + 1)])
charinfo = Vector{Any}[
  [[1, 0], ["G_2", "\\phi_{1,0}"], "X_{11}", "\\vartheta_0"],
  [[1, 1], ["G_2", "\\phi_{2,1}"], "X_{16}", "\\vartheta_1"],
  [[1, 2], ["G_2", "\\phi_{2,2}"], "X_{15}", "\\vartheta_2"],
  [[1, 3], ["G_2", "\\phi_{1,3}'"], "X_{13}", "\\vartheta_3"],
  [[1, 4], ["G_2", "\\phi_{1,3}''"], "X_{14}", "\\vartheta_4"],
  [[1, 5], ["G_2", "G_2[1]"], "X_{18}", "\\vartheta_{10}"],
  [[1, 6], ["G_2", "G_2[-1]"], "X_{17}", "\\vartheta_{11}"],
  [[1, 7], ["G_2", "G_2[\\theta]"], "X_{19}(1)", "\\vartheta_{12}(1)"],
  [[1, 8], ["G_2", "G_2[\\theta^2]"], "X_{19}(2)", "\\vartheta_{12}(-1)"],
  [[1, 9], ["G_2", "\\phi_{1,6}"], "X_{12}", "\\vartheta_5"],
  [[2, 0], ["A_1+\\tildeA_1", [[2], [2]]], "X_{22}", "\\vartheta_6"],
  [[2, 1], ["A_1+\\tildeA_1", [[2], [1, 1]]], "X_{23}", "\\vartheta_8"],
  [[2, 2], ["A_1+\\tildeA_1", [[1, 1], [2]]], "X_{24}", "\\vartheta_9"],
  [[2, 3], ["A_1+\\tildeA_1", [[1, 1], [1, 1]]], "X_{21}", "\\vartheta_7"],
  [[5, 0], ["A_1", [2]], "X_{1a}'", "\\chi_1(k)"],
  [[5, 1], ["A_1", [1, 1]], "X_{1a}", "\\chi_2(k)"],
  [[4, 0], ["\\tildeA_1", [2]], "X_{1b}'", "\\chi_3(k)"],
  [[4, 1], ["\\tildeA_1", [1, 1]], "X_{1b}", "\\chi_4(k)"],
  [[7, 0], ["A_1", [2]], "X_{2a}'", "\\chi_7(k)"],
  [[7, 1], ["A_1", [1, 1]], "X_{2a}", "\\chi_8(k)"],
  [[6, 0], ["\\tildeA_1", [2]], "X_{2b}'", "\\chi_5(k)"],
  [[6, 1], ["\\tildeA_1", [1, 1]], "X_{2b}", "\\chi_6(k)"],
  [[8, 0], ["A_0", [1]], "X_{1}", "\\chi_9(k,l)"],
  [[9, 0], ["A_0", [1]], "X_{2}", "\\chi_{12}(k,l)"],
  [[11, 0], ["A_0", [1]], "X_{a}", "\\chi_{10}(k)"],
  [[10, 0], ["A_0", [1]], "X_{b}", "\\chi_{11}(k)"],
  [[12, 0], ["A_0", [1]], "X_{3}", "\\chi_{13}(k)"],
  [[13, 0], ["A_0", [1]], "X_{6}", "\\chi_{14}(k)"]]
chardegree =
  R.([
    1,
    q * (q + 1)^2 * (q^2 + q + 1) * 1//6,
    q * (q + 1) * (q^3 + 1) * 1//2,
    q * (q^4 + q^2 + 1) * 1//3,
    q * (q^4 + q^2 + 1) * 1//3,
    q * (q - 1)^2 * (q^2 - q + 1) * 1//6,
    q * (q - 1) * (q^3 - 1) * 1//2,
    q * (q^2 - 1)^2 * 1//3,
    q * (q^2 - 1)^2 * 1//3,
    q^6,
    q^4 + q^2 + 1,
    q * (q^4 + q^2 + 1),
    q * (q^4 + q^2 + 1),
    q^2 * (q^4 + q^2 + 1),
    (q^2 + q + 1) * (q^3 + 1),
    q * (q^2 + q + 1) * (q^3 + 1),
    (q^2 + q + 1) * (q^3 + 1),
    q * (q^2 + q + 1) * (q^3 + 1),
    (q^2 - q + 1) * (q^3 - 1),
    q * (q^2 - q + 1) * (q^3 - 1),
    (q^2 - q + 1) * (q^3 - 1),
    q * (q^2 - q + 1) * (q^3 - 1),
    (q + 1) * (q^2 + q + 1) * (q^3 + 1),
    (q - 1) * (q^2 - q + 1) * (q^3 - 1),
    q^6 - 1,
    q^6 - 1,
    (q - 1) * (q^2 - 1) * (q^3 + 1),
    (q + 1) * (q^2 - 1) * (q^3 - 1)])

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
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, (q - 2))
    tt1 = evaluate(tt, [i], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, (q - 2))
    tt1 = evaluate(tt, [i], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, (q - 2))
    tt1 = evaluate(tt, [i], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, (q - 2))
    tt1 = evaluate(tt, [i], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q)
    tt1 = evaluate(tt, [i], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q)
    tt1 = evaluate(tt, [i], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q)
    tt1 = evaluate(tt, [i], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q)
    tt1 = evaluate(tt, [i], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q - 2)
    s2 = nesum(s1, j, 1, q - 2)
    tt1 = evaluate(tt, [i], [j])
    s3 = nesum(tt1, j, 1, q - 2)
    tt1 = evaluate(tt, [j], [-2 * i])
    s4 = nesum(tt1, i, 1, q - 2)
    tt1 = evaluate(tt, [i], [-j])
    s5 = nesum(tt1, j, 1, q - 2)
    s6 = evaluate(tt, [i, j], R.([(q - 1) * 1//2, (q - 1) * 1//2]))
    s7 = evaluate(tt, [i, j], R.([(q - 1) * 1//2, 0]))
    1//12 * s2 - 1//12 * s3 - 1//6 * s4 - 1//12 * s5 + 1//12 * s6 + 1//6 * s7
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q^2 - 1)
    tt1 = evaluate(tt, [i], [(q - 1) * i])
    s2 = nesum(tt1, i, 1, q + 1)
    tt1 = evaluate(tt, [i], [(q + 1) * i])
    s3 = nesum(tt1, i, 1, q - 1)
    s4 = evaluate(tt, [i], [(q^2 - 1) * 1//2])
    s5 = evaluate(tt, [i], [(q^2 - 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * s4 + 1//4 * s5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q^2 - 1)
    tt1 = evaluate(tt, [i], [(q - 1) * i])
    s2 = nesum(tt1, i, 1, q + 1)
    tt1 = evaluate(tt, [i], [(q + 1) * i])
    s3 = nesum(tt1, i, 1, q - 1)
    s4 = evaluate(tt, [i], [(q^2 - 1) * 1//2])
    s5 = evaluate(tt, [i], [(q^2 - 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * s4 + 1//4 * s5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q)
    s2 = nesum(s1, j, 1, q)
    tt1 = evaluate(tt, [i], [j])
    s3 = nesum(tt1, j, 1, q)
    tt1 = evaluate(tt, [j], [-2 * i])
    s4 = nesum(tt1, i, 1, q)
    tt1 = evaluate(tt, [i], [-j])
    s5 = nesum(tt1, j, 1, q)
    s6 = evaluate(tt, [i, j], R.([(q + 1) * 1//2, (q + 1) * 1//2]))
    s7 = evaluate(tt, [i, j], R.([(q + 1) * 1//2, 0]))
    1//12 * s2 - 1//12 * s3 - 1//6 * s4 - 1//12 * s5 + 1//12 * s6 + 1//6 * s7
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q^2 + q)
    1//6 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, i, 1, q^2 - q)
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
  identity,
  identity,
  identity,
  identity,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, (q - 2))
    tt1 = evaluate(tt, [k], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, (q - 2))
    tt1 = evaluate(tt, [k], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, (q - 2))
    tt1 = evaluate(tt, [k], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, (q - 2))
    tt1 = evaluate(tt, [k], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q)
    tt1 = evaluate(tt, [k], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q)
    tt1 = evaluate(tt, [k], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q)
    tt1 = evaluate(tt, [k], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q)
    tt1 = evaluate(tt, [k], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q - 2)
    s2 = nesum(s1, l, 1, q - 2)
    tt1 = evaluate(tt, [k], [l])
    s3 = nesum(tt1, l, 1, q - 2)
    tt1 = evaluate(tt, [l], [2 * k])
    s4 = nesum(tt1, k, 1, q - 2)
    tt1 = evaluate(tt, [k], [-l])
    s5 = nesum(tt1, l, 1, q - 2)
    s6 = evaluate(tt, [k, l], R.([(q - 1) * 1//2, (q - 1) * 1//2]))
    s7 = evaluate(tt, [k, l], R.([(q - 1) * 1//2, 0]))
    1//12 * s2 - 1//12 * s3 - 1//6 * s4 - 1//12 * s5 + 1//12 * s6 + 1//6 * s7
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q)
    s2 = nesum(s1, l, 1, q)
    tt1 = evaluate(tt, [k], [l])
    s3 = nesum(tt1, l, 1, q)
    tt1 = evaluate(tt, [l], [2 * k])
    s4 = nesum(tt1, k, 1, q)
    tt1 = evaluate(tt, [k], [-l])
    s5 = nesum(tt1, l, 1, q)
    s6 = evaluate(tt, [k, l], R.([(q + 1) * 1//2, (q + 1) * 1//2]))
    s7 = evaluate(tt, [k, l], R.([(q + 1) * 1//2, 0]))
    1//12 * s2 - 1//12 * s3 - 1//6 * s4 - 1//12 * s5 + 1//12 * s6 + 1//6 * s7
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 - 1)
    tt1 = evaluate(tt, [k], [(q - 1) * k])
    s2 = nesum(tt1, k, 1, q + 1)
    tt1 = evaluate(tt, [k], [(q + 1) * k])
    s3 = nesum(tt1, k, 1, q - 1)
    s4 = evaluate(tt, [k], [(q^2 - 1) * 1//2])
    s5 = evaluate(tt, [k], [(q^2 - 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * s4 + 1//4 * s5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 - 1)
    tt1 = evaluate(tt, [k], [(q - 1) * k])
    s2 = nesum(tt1, k, 1, q + 1)
    tt1 = evaluate(tt, [k], [(q + 1) * k])
    s3 = nesum(tt1, k, 1, q - 1)
    s4 = evaluate(tt, [k], [(q^2 - 1) * 1//2])
    s5 = evaluate(tt, [k], [(q^2 - 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * s4 + 1//4 * s5
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 + q)
    1//6 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 - q)
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
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(i, q - 1)], [((i) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(i, q - 1)], [((i) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(i, q - 1)], [((i) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(i, q - 1)], [((i) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(i, q + 1)], [((i) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(i, q + 1)], [((i) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(i, q + 1)], [((i) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(i, q + 1)], [((i) * 1//((q + 1) * 1//2))]),
  Parameters(
    [Parameter(i, q - 1), Parameter(j, q - 1)],
    [
      ((i) * 1//(q - 1)),
      ((j) * 1//(q - 1)),
      ((i - j) * 1//(q - 1)),
      ((i + j) * 1//(q - 1)),
      ((2 * i + j) * 1//(q - 1)),
      ((i + 2 * j) * 1//(q - 1)),
    ],
  ),
  Parameters([Parameter(i, q^2 - 1)], [((i) * 1//(q - 1)), ((i) * 1//(q + 1))]),
  Parameters([Parameter(i, q^2 - 1)], [((i) * 1//(q - 1)), ((i) * 1//(q + 1))]),
  Parameters(
    [Parameter(i, q + 1), Parameter(j, q + 1)],
    [
      ((i) * 1//(q + 1)),
      ((j) * 1//(q + 1)),
      ((i - j) * 1//(q + 1)),
      ((i + j) * 1//(q + 1)),
      ((2 * i + j) * 1//(q + 1)),
      ((i + 2 * j) * 1//(q + 1)),
    ],
  ),
  Parameters([Parameter(i, q^2 + q + 1)], [((i) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(i, q^2 - q + 1)], [((i) * 1//(q^2 - q + 1))]),
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
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
  Parameters(
    [Parameter(k, q - 1), Parameter(l, q - 1)],
    [
      ((k) * 1//(q - 1)),
      ((l) * 1//(q - 1)),
      ((k - l) * 1//(q - 1)),
      ((k + l) * 1//(q - 1)),
      ((2 * k - l) * 1//(q - 1)),
      ((k - 2 * l) * 1//(q - 1)),
    ],
  ),
  Parameters(
    [Parameter(k, q + 1), Parameter(l, q + 1)],
    [
      ((k) * 1//(q + 1)),
      ((l) * 1//(q + 1)),
      ((k - l) * 1//(q + 1)),
      ((k + l) * 1//(q + 1)),
      ((2 * k - l) * 1//(q + 1)),
      ((k - 2 * l) * 1//(q + 1)),
    ],
  ),
  Parameters([Parameter(k, q^2 - 1)], [((k) * 1//(q - 1)), ((k) * 1//(q + 1))]),
  Parameters([Parameter(k, q^2 - 1)], [((k) * 1//(q - 1)), ((k) * 1//(q + 1))]),
  Parameters([Parameter(k, q^2 + q + 1)], [((k) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(k, q^2 - q + 1)], [((k) * 1//(q^2 - q + 1))]),
]

classparamindex = var_index.([i, j])
charparamindex = var_index.([k, l])

information = raw"""The generic character table of $\mathrm{G}_2(q)$,
   $q$ a power of $3$, congruent to $1$ modulo $4$.

- The table was first computed in [Eno76](@cite).

- See also: [CR74](@cite), [Hi90](@cite).

- Enomoto's notation for the irreducible characters is given in
  the fourth component of the character information list.

- An equivalent to Chang's and Ree's notation for the irreducible
  characters is given in the third component of the character
  information list.

- Enomoto's notation for the conjugacy classes is given in the
  third component of the class information list.

- Example:
  ```jldoctest
  julia> t = generic_character_table("G2.101");

  julia> info(t[6])
  4-element Vector{Any}:
   [1, 5]
   ["G_2", "G_2[1]"]
   "X_{18}"
   "\\vartheta_{10}"
  ```

- Explanation of example:
  Character type six of `G2.101` is called $\vartheta_{10}$ by Enomoto
  and corresponds to $X_{18}$ in Chang--Ree.
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

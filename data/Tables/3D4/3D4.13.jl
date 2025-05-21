using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring(; congruence=ZZ.((-1, 4)))
R = base_ring(S)
a, b, k, l, _... = params(
  S,
  [
    "a",
    "b",
    "k",
    "l",
    "a1",
    "b1",
    "k1",
    "l1",
    "a2",
    "b2",
    "k2",
    "l2",
    "a3",
    "b3",
    "k3",
    "l3",
    "at1",
    "bt1",
    "kt1",
    "lt1",
    "at2",
    "bt2",
    "kt2",
    "lt2",
  ],
)

order = q^12 * (q^8 + q^4 + 1) * (q^6 - 1) * (q^2 - 1)
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
  S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  S(1)] [
  (q^5 - q^3 + q) * S(1),
  (-q^3 + q) * S(1),
  (q) * S(1),
  (q^2 + q) * S(1),
  (-q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  (q) * S(1),
  S(0),
  (q) * S(1),
  S(0),
  S(0),
  S(1),
  S(1),
  (q^2 + q - 1) * S(1),
  (q - 1) * S(1),
  -S(1),
  (q) * S(1),
  S(0),
  S(1),
  -S(1),
  -S(1),
  -S(1),
  (-q^2 + q + 1) * S(1),
  (q + 1) * S(1),
  S(1),
  (q) * S(1),
  S(0),
  S(1),
  (-2) * S(1),
  (2) * S(1),
  S(0),
  -S(1)] [
  (q^3 * (q + 1)^2 * (q^4 - q^2 + 1) * 1//2) * S(1),
  (q^3 * (-q^3 + 2 * q + 1) * 1//2) * S(1),
  (q^3 * (q + 1) * 1//2) * S(1),
  S(0),
  (q^3) * S(1),
  S(0),
  S(0),
  ((q^4 + q^3 + q + 1) * 1//2) * S(1),
  ((q^3 + 1) * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  ((-q^2 + 1) * 1//2) * S(1),
  ((1 + q^2) * 1//2) * S(1),
  (q^3 + 1) * S(1),
  S(1),
  (q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  (q + 1) * S(1),
  S(1),
  (2) * S(1),
  S(0),
  S(0),
  S(0),
  (q^3 + q^2 - q - 1) * S(1),
  (-q - 1) * S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  -S(1),
  (-3) * S(1),
  S(0),
  S(0)] [
  (q^3 * (q^3 + 1)^2 * 1//2) * S(1),
  (q^3 * (q^3 + 1) * 1//2) * S(1),
  (q^3 * (q + 1) * 1//2) * S(1),
  (q^3) * S(1),
  S(0),
  S(0),
  S(0),
  ((q^4 + q^3 + q + 1) * 1//2) * S(1),
  ((q^3 + 1) * 1//2) * S(1),
  ((q + 1) * 1//2) * S(1),
  ((q^2 + 1) * 1//2) * S(1),
  ((1 - q^2) * 1//2) * S(1),
  (q^3 + 1) * S(1),
  S(1),
  (q^3 + 1) * S(1),
  S(1),
  S(1),
  (q + 1) * S(1),
  S(1),
  (2) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (2) * S(1),
  S(0),
  -S(1),
  S(0)] [
  (q^3 * (q^3 - 1)^2 * 1//2) * S(1),
  (q^3 * (-q^3 + 1) * 1//2) * S(1),
  (q^3 * (-q + 1) * 1//2) * S(1),
  S(0),
  (q^3) * S(1),
  S(0),
  S(0),
  ((-q^4 + q^3 + q - 1) * 1//2) * S(1),
  ((q^3 - 1) * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  ((q^2 - 1) * 1//2) * S(1),
  ((-1 - q^2) * 1//2) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (q^3 - 1) * S(1),
  -S(1),
  S(0),
  (q^3 - 1) * S(1),
  -S(1),
  -S(1),
  (q - 1) * S(1),
  -S(1),
  S(0),
  S(0),
  (-2) * S(1),
  S(1),
  (-2) * S(1)] [
  (q^3 * (q - 1)^2 * (q^4 - q^2 + 1) * 1//2) * S(1),
  (q^3 * (q^3 - 2 * q + 1) * 1//2) * S(1),
  (q^3 * (-q + 1) * 1//2) * S(1),
  (q^3) * S(1),
  S(0),
  S(0),
  S(0),
  ((-q^4 + q^3 + q - 1) * 1//2) * S(1),
  ((q^3 - 1) * 1//2) * S(1),
  ((q - 1) * 1//2) * S(1),
  ((-q^2 - 1) * 1//2) * S(1),
  ((q^2 - 1) * 1//2) * S(1),
  S(0),
  S(0),
  (q^3 - q^2 - q + 1) * S(1),
  (-q + 1) * S(1),
  S(1),
  S(0),
  S(0),
  S(0),
  (q^3 - 1) * S(1),
  -S(1),
  S(0),
  (-q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  (q - 1) * S(1),
  -S(1),
  S(0),
  (3) * S(1),
  S(1),
  S(0),
  (-2) * S(1)] [
  (q^11 - q^9 + q^7) * S(1),
  (q^7) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (q^3) * S(1),
  (q^3) * S(1),
  S(0),
  S(0),
  S(0),
  (q^3) * S(1),
  S(0),
  (-q^3 + q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  S(1),
  S(1),
  S(1),
  (q^3) * S(1),
  S(0),
  S(1),
  (-q^3 - q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  -S(1),
  -S(1),
  -S(1),
  (-2) * S(1),
  (2) * S(1),
  S(0),
  -S(1)] [
  (q^12) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (q^4) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (q^3) * S(1),
  S(0),
  (q^3) * S(1),
  S(0),
  S(0),
  (q) * S(1),
  S(0),
  S(1),
  (-q^3) * S(1),
  S(0),
  -S(1),
  (-q^3) * S(1),
  S(0),
  S(0),
  (-q) * S(1),
  S(0),
  -S(1),
  S(1),
  S(1),
  S(1),
  S(1)] [
  (q^8 + q^4 + 1) * S(1),
  (q^4 + 1) * S(1),
  (q^4 + 1) * S(1),
  S(1),
  S(1),
  S(1),
  S(1),
  (-q^3 - q + 1) * S(1),
  (-q^3 + 1) * S(1),
  (-q + 1) * S(1),
  S(1),
  S(1),
  q^3 * S(1; exponent=a * 1//R((2))) + 1 + S(1; exponent=a * 1//R((2))),
  1 + S(1; exponent=a * 1//R((2))),
  (q^2 + q + 1) * S(1),
  (q + 1) * S(1),
  S(1),
  q * S(1; exponent=a * 1//R((2))) + 1 + S(1; exponent=a * 1//R((2))),
  1 + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))) + S(1; exponent=b * 1//R((2))) +
  S(1; exponent=(a + b) * 1//R((2))),
  1 - q^3 * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  1 + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  (q^2 - q + 1) * S(1),
  (-q + 1) * S(1),
  S(1),
  1 - q * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  1 + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  S(0),
  S(0),
  S(0),
  S(1; exponent=a * 1//R((2))) + S(1; exponent=b * 1//R((2))) +
  S(1; exponent=(a + b) * 1//R((2)))] [
  (q^9 + q^5 + q) * S(1),
  (q) * S(1),
  (q^3 + q) * S(1),
  (q^3 + q^2 + q) * S(1),
  (q^3 - q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  (-q^4 + q - 1) * S(1),
  -S(1),
  (q - 1) * S(1),
  -S(1),
  -S(1),
  q^3 * S(1; exponent=a * 1//R((2))) + 1 + S(1; exponent=a * 1//R((2))),
  1 + S(1; exponent=a * 1//R((2))),
  (q^3 + q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  q + q * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))) + S(1; exponent=b * 1//R((2))) +
  S(1; exponent=(a + b) * 1//R((2))),
  -1 + q^3 * S(1; exponent=a * 1//R((2))) - S(1; exponent=a * 1//R((2))),
  -1 - S(1; exponent=a * 1//R((2))),
  -S(1; exponent=a * 1//R((2))),
  (q^3 - q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  q + q * S(1; exponent=a * 1//R((2))) - S(1; exponent=a * 1//R((2))),
  -S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=a * 1//R((2))) - S(1; exponent=b * 1//R((2))) -
  S(1; exponent=(a + b) * 1//R((2)))] [
  (q^11 + q^7 + q^3) * S(1),
  (q^7 + q^3) * S(1),
  (q^3) * S(1),
  (q^3) * S(1),
  (q^3) * S(1),
  S(0),
  S(0),
  (-q^4 + q^3 - 1) * S(1),
  (q^3 - 1) * S(1),
  -S(1),
  -S(1),
  -S(1),
  q^3 + q^3 * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  (q^2 + q + 1) * S(1),
  (q + 1) * S(1),
  S(1),
  q * S(1; exponent=a * 1//R((2))) + 1 + S(1; exponent=a * 1//R((2))),
  1 + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))) + S(1; exponent=b * 1//R((2))) +
  S(1; exponent=(a + b) * 1//R((2))),
  q^3 + q^3 * S(1; exponent=a * 1//R((2))) - S(1; exponent=a * 1//R((2))),
  -S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  (-1 - q^2 + q) * S(1),
  (q - 1) * S(1),
  -S(1),
  -1 + q * S(1; exponent=a * 1//R((2))) - S(1; exponent=a * 1//R((2))),
  -1 - S(1; exponent=a * 1//R((2))),
  -S(1; exponent=a * 1//R((2))),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=a * 1//R((2))) - S(1; exponent=b * 1//R((2))) -
  S(1; exponent=(a + b) * 1//R((2)))] [
  (q^12 + q^8 + q^4) * S(1),
  (q^4) * S(1),
  (q^4) * S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  (q^4 - q^3 - q) * S(1),
  (-q^3) * S(1),
  (-q) * S(1),
  S(0),
  S(0),
  q^3 + q^3 * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  (q^3 + q^2 + q) * S(1),
  (q) * S(1),
  S(0),
  q + q * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))) + S(1; exponent=b * 1//R((2))) +
  S(1; exponent=(a + b) * 1//R((2))),
  -q^3 - q^3 * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  -S(1; exponent=a * 1//R((2))),
  (-q^3 + q^2 - q) * S(1),
  (-q) * S(1),
  S(0),
  -q - q * S(1; exponent=a * 1//R((2))) + S(1; exponent=a * 1//R((2))),
  S(1; exponent=a * 1//R((2))),
  -S(1; exponent=a * 1//R((2))),
  S(0),
  S(0),
  S(0),
  S(1; exponent=a * 1//R((2))) + S(1; exponent=b * 1//R((2))) +
  S(1; exponent=(a + b) * 1//R((2)))] [
  ((q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1)) * S(1),
  (q^4 + q + 1) * S(1),
  ((q^2 - q + 1) * (q + 1)^2) * S(1),
  ((q + 1) * (q^2 + 1)) * S(1),
  (q^3 - q^2 + q + 1) * S(1),
  (q + 1) * S(1),
  S(1),
  (q + 1) * (S(1; exponent=k * 1//R((2))) * q^3 + 1 + S(1; exponent=k * 1//R((2)))),
  S(1; exponent=k * 1//R((2))) * q^3 + 1 + S(1; exponent=k * 1//R((2))),
  (1 + S(1; exponent=k * 1//R((2)))) * (q + 1),
  1 + S(1; exponent=k * 1//R((2))),
  1 + S(1; exponent=k * 1//R((2))),
  S(1; exponent=(2 * a * k) * 1//R((q - 1))) +
  S(1; exponent=(-a * k) * 1//R((q - 1))) * q^3 +
  S(1; exponent=(-a * k) * 1//R((q - 1))) + q^3 * S(1; exponent=(a * k) * 1//R((q - 1))) +
  S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-2 * a * k) * 1//R((q - 1))),
  S(1; exponent=(2 * a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1))) +
  S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-2 * a * k) * 1//R((q - 1))),
  ((q + 1) * (q^2 + q + 1)) * S(1),
  (2 * q + 1) * S(1),
  S(1),
  (1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1)))) *
  (q + 1),
  1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1))),
  S(1; exponent=(b * k) * 1//R((q - 1))) + S(1; exponent=(-b * k) * 1//R((q - 1))) +
  S(1; exponent=((a - b) * k) * 1//R((q - 1))) +
  S(1; exponent=(-(a - b) * k) * 1//R((q - 1))) +
  S(1; exponent=(-(a - 2 * b) * k) * 1//R((q - 1))) +
  S(1; exponent=((a - 2 * b) * k) * 1//R((q - 1))),
  S(0),
  S(0),
  S(0),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1),
  (q + 1) * S(1),
  S(1),
  S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1))),
  S(0),
  S(0),
  S(0),
  S(0)] [
  (q^3 * (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1)) * S(1),
  (q^3 * (q^4 + q + 1)) * S(1),
  (q^3 * (q + 1)) * S(1),
  (q^3) * S(1),
  (q^3) * S(1),
  S(0),
  S(0),
  (q + 1) * (S(1; exponent=k * 1//R((2))) * q^3 + q^3 + S(1; exponent=k * 1//R((2)))),
  S(1; exponent=k * 1//R((2))) * q^3 + q^3 + S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))) * (q + 1),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=(2 * a * k) * 1//R((q - 1))) * q^3 +
  S(1; exponent=(-a * k) * 1//R((q - 1))) * q^3 +
  S(1; exponent=(-a * k) * 1//R((q - 1))) + q^3 * S(1; exponent=(a * k) * 1//R((q - 1))) +
  S(1; exponent=(a * k) * 1//R((q - 1))) +
  S(1; exponent=(-2 * a * k) * 1//R((q - 1))) * q^3,
  S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1))),
  ((q + 1) * (q^2 + q + 1)) * S(1),
  (2 * q + 1) * S(1),
  S(1),
  (1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1)))) *
  (q + 1),
  1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1))),
  S(1; exponent=(b * k) * 1//R((q - 1))) + S(1; exponent=(-b * k) * 1//R((q - 1))) +
  S(1; exponent=((a - b) * k) * 1//R((q - 1))) +
  S(1; exponent=(-(a - b) * k) * 1//R((q - 1))) +
  S(1; exponent=(-(a - 2 * b) * k) * 1//R((q - 1))) +
  S(1; exponent=((a - 2 * b) * k) * 1//R((q - 1))),
  S(0),
  S(0),
  S(0),
  (-(q + 1) * (q^2 - q + 1)) * S(1),
  -S(1),
  -S(1),
  (-q - 1) * S(1),
  -S(1),
  -S(1; exponent=(a * k) * 1//R((q - 1))) - S(1; exponent=(-a * k) * 1//R((q - 1))),
  S(0),
  S(0),
  S(0),
  S(0)] [
  ((q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2) * S(1),
  ((q + 1) * (q^2 - q + 1) * (q^3 - q + 1)) * S(1),
  (q^3 - q + 1) * S(1),
  (2 * q^3 - q^2 - q + 1) * S(1),
  (q^2 - q + 1) * S(1),
  (-q + 1) * S(1),
  S(1),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1),
  S(1),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q^3 -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q^2 -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q^3 -
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q^2 -
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-(2 * q + 1) * a * k) * 1//R((q^2 + q + 1))),
  S(1; exponent=(-(2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))),
  S(1; exponent=(-(2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))),
  S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1))),
  S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1))),
  S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1))),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1; exponent=(-(q + 1) * a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((q + 1) * a * k) * 1//R((q^2 + q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-b * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(b * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-k * (a * q + a - b * q)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-k * (a * q + b * q + b)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(k * (a * q + a - b * q)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(k * (a * q + b * q + b)) * 1//R((q^2 + q + 1))),
  S(0),
  S(0),
  S(0)] [
  (q * (q^4 - q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2) * S(1),
  (q * (q + 1) * (q^2 - q + 1) * (q^3 - q^2 + 1)) * S(1),
  (q * (q + 1) * (q^2 - q + 1)) * S(1),
  (-q * (q^2 - q - 1)) * S(1),
  (q * (q^2 - q + 1)) * S(1),
  (q) * S(1),
  S(0),
  ((q^2 - q + 1) * (q + 1)^2) * S(1),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  (q + 1) * S(1),
  S(1),
  S(1),
  (2 * (q + 1) * (q^2 - q + 1)) * S(1),
  (2) * S(1),
  -(q + 1) * (
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q^2 +
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q^2 -
    S(1; exponent=(-(2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) * q -
    S(1; exponent=((2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) * q -
    2 * S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q -
    2 * S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1)))
  ),
  S(1; exponent=(-(2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=((2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q -
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))),
  -S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))),
  (
    S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1)))
  ) * (q + 1),
  S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1))),
  2 * S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
  2 * S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-b * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(b * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-k * (a * q + a - b * q)) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-k * (a * q + b * q + b)) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(k * (a * q + a - b * q)) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(k * (a * q + b * q + b)) * 1//R((q^2 + q + 1))),
  S(0),
  S(0),
  S(0)] [
  (q^3 * (q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2) * S(1),
  (-q^3 * (q - 1) * (q + 1) * (q^2 - q + 1)) * S(1),
  (q^3) * S(1),
  (2 * q^3) * S(1),
  S(0),
  S(0),
  S(0),
  (q * (q + 1) * (q^2 - q + 1)) * S(1),
  S(0),
  (q) * S(1),
  S(0),
  S(0),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q^3 -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q^2 -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q^3 -
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q^2 -
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) * q +
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-(2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) * q^3 +
  S(1; exponent=((2 * q + 1) * a * k) * 1//R((q^2 + q + 1))) * q^3,
  -(
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ) * (q - 1),
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))),
  q * (
    S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1)))
  ),
  S(0),
  S(1; exponent=(-a * k * q) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k * q) * 1//R((q^2 + q + 1))),
  (-(q + 1) * (q^2 - q + 1)) * S(1),
  -S(1),
  -S(1; exponent=(-(q + 1) * a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=((q + 1) * a * k) * 1//R((q^2 + q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-b * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(b * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-k * (a * q + a - b * q)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-k * (a * q + b * q + b)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(k * (a * q + a - b * q)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(k * (a * q + b * q + b)) * 1//R((q^2 + q + 1))),
  S(0),
  S(0),
  S(0)] [
  ((q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2) * S(1),
  ((q + 1) * (q^2 - q + 1) * (q^4 + 1)) * S(1),
  (q^4 + q^3 + 1) * S(1),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1),
  (q + 1) * (q^2 - q + 1) *
  (S(1; exponent=k * 1//R((2))) * q + 1 + S(1; exponent=k * 1//R((2)))),
  (q + 1) * (q^2 - q + 1) * (1 + S(1; exponent=k * 1//R((2)))),
  S(1; exponent=k * 1//R((2))) * q + 1 + S(1; exponent=k * 1//R((2))),
  1 + S(1; exponent=k * 1//R((2))),
  1 + S(1; exponent=k * 1//R((2))),
  (q + 1) * (q^2 - q + 1) *
  (1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1)))),
  1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1))),
  (q^2 + q + 1) * (
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ),
  (
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ) * (q + 1),
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))),
  q * S(1; exponent=(a * k) * 1//R((q^3 - 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 - 1))) * q +
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))) +
  S(1; exponent=(a * (q + 1) * k * q) * 1//R((q^3 - 1))) +
  S(1; exponent=(-a * (q + 1) * k * q) * 1//R((q^3 - 1))),
  S(1; exponent=(a * (q + 1) * k * q) * 1//R((q^3 - 1))) +
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))) +
  S(1; exponent=(-a * (q + 1) * k * q) * 1//R((q^3 - 1))),
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))) +
  S(1; exponent=((-a + b * q^2 + b * q + b) * k) * 1//R((q^3 - 1))) +
  S(1; exponent=(k * (-b * q^2 - b * q - b + a * q^2 + a * q)) * 1//R((q^3 - 1))) +
  S(1; exponent=(-k * (-b * q^2 - b * q - b + a * q^2 + a * q)) * 1//R((q^3 - 1))) +
  S(1; exponent=(-(-a + b * q^2 + b * q + b) * k) * 1//R((q^3 - 1))),
  ((q + 1) * (q^2 - q + 1)) * S(1),
  S(1),
  S(1; exponent=(-a * k * q) * 1//R((q^3 - 1))) +
  S(1; exponent=(a * k * q) * 1//R((q^3 - 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0)] [
  (q * (q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2) * S(1),
  (q * (q + 1) * (q^2 - q + 1)) * S(1),
  (q * (q^3 + 1 + q^2)) * S(1),
  (q * (q^2 + q + 1)) * S(1),
  (q * (q^2 - q + 1)) * S(1),
  (q) * S(1),
  S(0),
  (q + 1) * (q^2 - q + 1) *
  (q + S(1; exponent=k * 1//R((2))) * q + S(1; exponent=k * 1//R((2)))),
  (q + 1) * (q^2 - q + 1) * S(1; exponent=k * 1//R((2))),
  q + S(1; exponent=k * 1//R((2))) * q + S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  (q + 1) * (q^2 - q + 1) *
  (1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1)))),
  1 + S(1; exponent=(a * k) * 1//R((q - 1))) + S(1; exponent=(-a * k) * 1//R((q - 1))),
  q * (q^2 + q + 1) *
  (
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ),
  q * (
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ),
  S(0),
  q * S(1; exponent=(a * k) * 1//R((q^3 - 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 - 1))) * q +
  q * S(1; exponent=(a * (q + 1) * k * q) * 1//R((q^3 - 1))) +
  S(1; exponent=(-a * (q + 1) * k * q) * 1//R((q^3 - 1))) * q +
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))),
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))),
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))) +
  S(1; exponent=((-a + b * q^2 + b * q + b) * k) * 1//R((q^3 - 1))) +
  S(1; exponent=(k * (-b * q^2 - b * q - b + a * q^2 + a * q)) * 1//R((q^3 - 1))) +
  S(1; exponent=(-k * (-b * q^2 - b * q - b + a * q^2 + a * q)) * 1//R((q^3 - 1))) +
  S(1; exponent=(-(-a + b * q^2 + b * q + b) * k) * 1//R((q^3 - 1))),
  (-(q + 1) * (q^2 - q + 1)) * S(1),
  -S(1),
  -S(1; exponent=(-a * k * q) * 1//R((q^3 - 1))) -
  S(1; exponent=(a * k * q) * 1//R((q^3 - 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0)] [
  ((q^2 + q + 1) * (q^4 - q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2) * S(1),
  ((q + 1) * (q^2 - q + 1) * (q^4 + q + 1)) * S(1),
  ((q + 1) * (2 * q^3 + 1)) * S(1),
  (2 * q^3 + q^2 + q + 1) * S(1),
  ((2 * q + 1) * (q^2 - q + 1)) * S(1),
  (q + 1) * S(1),
  S(1),
  (q + 1) * (q^3 + 1) *
  (
    S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=(k) * 1//R((2)))
  ),
  (q^3 + 1) * (
    S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=(k) * 1//R((2)))
  ),
  (q + 1) * (
    S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=(k) * 1//R((2)))
  ),
  S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
  S(1; exponent=(k) * 1//R((2))),
  S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
  S(1; exponent=(k) * 1//R((2))),
  (q^3 + 1) * (
    S(1; exponent=(a * l) * 1//R((q - 1))) + S(1; exponent=(-a * l) * 1//R((q - 1))) +
    S(1; exponent=(a * k + a * l) * 1//R((q - 1))) +
    S(1; exponent=(a * k + 2 * a * l) * 1//R((q - 1))) +
    S(1; exponent=(-a * k - a * l) * 1//R((q - 1))) +
    S(1; exponent=(-a * k - 2 * a * l) * 1//R((q - 1)))
  ),
  S(1; exponent=(a * l) * 1//R((q - 1))) + S(1; exponent=(-a * l) * 1//R((q - 1))) +
  S(1; exponent=(a * k + a * l) * 1//R((q - 1))) +
  S(1; exponent=(a * k + 2 * a * l) * 1//R((q - 1))) +
  S(1; exponent=(-a * k - a * l) * 1//R((q - 1))) +
  S(1; exponent=(-a * k - 2 * a * l) * 1//R((q - 1))),
  (q + 1) * (q^2 + q + 1) *
  (
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ),
  (2 * q + 1) * (
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ),
  S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))),
  (q + 1) * (
    S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))) +
    S(1; exponent=(a * k) * 1//R((q^3 - 1))) * S(1; exponent=(a * l) * 1//R((q - 1))) +
    S(1; exponent=(-a * k) * 1//R((q^3 - 1))) * S(1; exponent=(-a * l) * 1//R((q - 1))) +
    S(1; exponent=((a * q^2 + a * q) * k) * 1//R((q^3 - 1))) *
    S(1; exponent=(a * l) * 1//R((q - 1))) +
    S(1; exponent=((-a * q^2 - a * q) * k) * 1//R((q^3 - 1))) *
    S(1; exponent=(-a * l) * 1//R((q - 1)))
  ),
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1))) +
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) * S(1; exponent=(a * l) * 1//R((q - 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 - 1))) * S(1; exponent=(-a * l) * 1//R((q - 1))) +
  S(1; exponent=((a * q^2 + a * q) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=(a * l) * 1//R((q - 1))) +
  S(1; exponent=((-a * q^2 - a * q) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=(-a * l) * 1//R((q - 1))),
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) * S(1; exponent=(b * l) * 1//R((q - 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 - 1))) * S(1; exponent=(-b * l) * 1//R((q - 1))) +
  S(1; exponent=(a * k) * 1//R((q^3 - 1))) * S(1; exponent=((a - b) * l) * 1//R((q - 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 - 1))) *
  S(1; exponent=((-a + b) * l) * 1//R((q - 1))) +
  S(1; exponent=((-a + b * q^2 + b * q + b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=(b * l) * 1//R((q - 1))) +
  S(1; exponent=((-a + b * q^2 + b * q + b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=((-a + 2 * b) * l) * 1//R((q - 1))) +
  S(1; exponent=(((a - b) * q^2 + (a - b) * q - b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=((a - b) * l) * 1//R((q - 1))) +
  S(1; exponent=(((a - b) * q^2 + (a - b) * q - b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=((a - 2 * b) * l) * 1//R((q - 1))) +
  S(1; exponent=(((-a + b) * q^2 + (-a + b) * q + b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=((-a + 2 * b) * l) * 1//R((q - 1))) +
  S(1; exponent=(((-a + b) * q^2 + (-a + b) * q + b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=((-a + b) * l) * 1//R((q - 1))) +
  S(1; exponent=((a - b * q^2 - b * q - b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=((a - 2 * b) * l) * 1//R((q - 1))) +
  S(1; exponent=((a - b * q^2 - b * q - b) * k) * 1//R((q^3 - 1))) *
  S(1; exponent=(-b * l) * 1//R((q - 1))),
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
  S(0)] [
  ((q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1)) * S(1),
  (-q^4 + q - 1) * S(1),
  (-(q^2 + q + 1) * (q - 1)^2) * S(1),
  (q^2 + q - 1 + q^3) * S(1),
  ((q - 1) * (q^2 + 1)) * S(1),
  (q - 1) * S(1),
  -S(1),
  -(q - 1) * (S(1; exponent=k * 1//R((2))) * q^3 - 1 - S(1; exponent=k * 1//R((2)))),
  S(1; exponent=k * 1//R((2))) * q^3 - 1 - S(1; exponent=k * 1//R((2))),
  (1 + S(1; exponent=k * 1//R((2)))) * (q - 1),
  -1 - S(1; exponent=k * 1//R((2))),
  -1 - S(1; exponent=k * 1//R((2))),
  S(0),
  S(0),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  -S(1),
  (q - 1) * S(1),
  -S(1),
  S(0),
  q^3 * S(1; exponent=(-a * k) * 1//R((q + 1))) - S(1; exponent=(-a * k) * 1//R((q + 1))) - S(1; exponent=(2 * a * k) * 1//R((q + 1))) +
  q^3 * S(1; exponent=(a * k) * 1//R((q + 1))) - S(1; exponent=(a * k) * 1//R((q + 1))) -
  S(1; exponent=(-2 * a * k) * 1//R((q + 1))),
  -S(1; exponent=(-a * k) * 1//R((q + 1))) - S(1; exponent=(2 * a * k) * 1//R((q + 1))) -
  S(1; exponent=(a * k) * 1//R((q + 1))) - S(1; exponent=(-2 * a * k) * 1//R((q + 1))),
  -S(1; exponent=(a * k) * 1//R((q + 1))) - S(1; exponent=(-a * k) * 1//R((q + 1))),
  ((q - 1) * (q^2 - q + 1)) * S(1),
  (2 * q - 1) * S(1),
  -S(1),
  (1 + S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1)))) *
  (q - 1),
  -1 - S(1; exponent=(a * k) * 1//R((q + 1))) - S(1; exponent=(-a * k) * 1//R((q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(b * k) * 1//R((q + 1))) - S(1; exponent=(-b * k) * 1//R((q + 1))) -
  S(1; exponent=((a - b) * k) * 1//R((q + 1))) -
  S(1; exponent=(-(a - b) * k) * 1//R((q + 1))) -
  S(1; exponent=(-(a - 2 * b) * k) * 1//R((q + 1))) -
  S(1; exponent=((a - 2 * b) * k) * 1//R((q + 1)))] [
  (q^3 * (q - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1)) * S(1),
  (-q^3 * (q^4 - q + 1)) * S(1),
  (q^3 * (q - 1)) * S(1),
  (-q^3) * S(1),
  (-q^3) * S(1),
  S(0),
  S(0),
  (q - 1) * (S(1; exponent=k * 1//R((2))) * q^3 + q^3 - S(1; exponent=k * 1//R((2)))),
  -q^3 - S(1; exponent=k * 1//R((2))) * q^3 + S(1; exponent=k * 1//R((2))),
  -(q - 1) * S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(0),
  S(0),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  -S(1),
  (q - 1) * S(1),
  -S(1),
  S(0),
  -q^3 * S(1; exponent=(-a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1))) -
  q^3 * S(1; exponent=(2 * a * k) * 1//R((q + 1))) -
  q^3 * S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(a * k) * 1//R((q + 1))) -
  q^3 * S(1; exponent=(-2 * a * k) * 1//R((q + 1))),
  S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1))),
  -S(1; exponent=(a * k) * 1//R((q + 1))) - S(1; exponent=(-a * k) * 1//R((q + 1))),
  (-(q - 1) * (q^2 - q + 1)) * S(1),
  (-2 * q + 1) * S(1),
  S(1),
  -(1 + S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1)))) * (q - 1),
  1 + S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(b * k) * 1//R((q + 1))) + S(1; exponent=(-b * k) * 1//R((q + 1))) +
  S(1; exponent=((a - b) * k) * 1//R((q + 1))) +
  S(1; exponent=(-(a - b) * k) * 1//R((q + 1))) +
  S(1; exponent=(-(a - 2 * b) * k) * 1//R((q + 1))) +
  S(1; exponent=((a - 2 * b) * k) * 1//R((q + 1)))] [
  ((q^4 - q^2 + 1) * (q^2 - q + 1)^2 * (q + 1) * (q^2 + q + 1) * (q - 1)) * S(1),
  (-q^7 - q^3 + q - 1) * S(1),
  (q - 1) * S(1),
  (q^2 + q - 1) * S(1),
  (-q^2 + q - 1) * S(1),
  (q - 1) * S(1),
  -S(1),
  (q^3 + 1) * (q - 1) * S(1; exponent=k * 1//R((2))),
  -(q^3 + 1) * S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))) * (q - 1),
  -S(1; exponent=k * 1//R((2))),
  -S(1; exponent=k * 1//R((2))),
  S(0),
  S(0),
  (q^3 - 1) * (
    S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 + q + 1)))
  ),
  -S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))),
  -S(1; exponent=(a * k) * 1//R((q^2 + q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 + q + 1))),
  (q - 1) *
  (S(1; exponent=(a * k) * 1//R((q^3 - 1))) + S(1; exponent=(-a * k) * 1//R((q^3 - 1)))),
  -S(1; exponent=(a * k) * 1//R((q^3 - 1))) - S(1; exponent=(-a * k) * 1//R((q^3 - 1))),
  S(0),
  -(q^3 + 1) *
  (S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1)))),
  -S(1; exponent=(a * k) * 1//R((q + 1))) - S(1; exponent=(-a * k) * 1//R((q + 1))),
  -S(1; exponent=(a * k) * 1//R(((q + 1) * (q^3 - 1)))) -
  S(1; exponent=(-a * k) * 1//R(((q + 1) * (q^3 - 1)))) -
  S(1; exponent=(a * k * q^3) * 1//R(((q + 1) * (q^3 - 1)))) -
  S(1; exponent=(-a * k * q^3) * 1//R(((q + 1) * (q^3 - 1)))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0)] [
  ((q - 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2) * S(1),
  (-(q - 1) * (q^2 + q + 1) * (q^3 - q - 1)) * S(1),
  (q^3 - q - 1) * S(1),
  (-q^2 - q - 1) * S(1),
  (2 * q^3 + q^2 - q - 1) * S(1),
  (-q - 1) * S(1),
  -S(1),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  -S(1),
  -S(1),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  S(0),
  -S(1; exponent=(-a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q^3 +
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q^2 -
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q -
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q^3 +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q^2 -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))),
  -S(1; exponent=(-a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q -
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))),
  -S(1; exponent=(-a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))),
  -S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1))),
  -S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1))),
  -S(1; exponent=((q - 1) * a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-(q - 1) * a * k) * 1//R((q^2 - q + 1))),
  S(0),
  -S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-b * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(b * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(k * (-a - b * q + a * q)) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(k * (-b + b * q + a * q)) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-k * (-a - b * q + a * q)) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-k * (-b + b * q + a * q)) * 1//R((q^2 - q + 1))),
  S(0),
  -S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1)))] [
  (q * (q^4 - q^2 + 1) * (q - 1)^2 * (q^2 + q + 1)^2) * S(1),
  (q * (q - 1) * (q^2 + q + 1) * (q^3 + q^2 - 1)) * S(1),
  (-q * (q - 1) * (q^2 + q + 1)) * S(1),
  (q * (q^2 + q + 1)) * S(1),
  (-q * (q^2 + q - 1)) * S(1),
  (q) * S(1),
  S(0),
  (-(q^2 + q + 1) * (q - 1)^2) * S(1),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  (q - 1) * S(1),
  -S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (2 * (q - 1) * (q^2 + q + 1)) * S(1),
  (-2) * S(1),
  S(0),
  -(q - 1) * (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q^2 +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q^2 +
    q * S(1; exponent=(a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) +
    q * S(1; exponent=(-a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) +
    2 * S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q +
    2 * S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q +
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ),
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q +
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
  q * S(1; exponent=(a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) +
  q * S(1; exponent=(-a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))),
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))),
  (
    S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1)))
  ) * (q - 1),
  -S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1))),
  S(0),
  S(0),
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-b * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(b * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(k * (-a - b * q + a * q)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(k * (-b + b * q + a * q)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-k * (-a - b * q + a * q)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-k * (-b + b * q + a * q)) * 1//R((q^2 - q + 1))),
  S(0),
  -2 * S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) -
  2 * S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1)))] [
  (q^3 * (q - 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2) * S(1),
  (q^3 * (q - 1) * (q + 1) * (q^2 + q + 1)) * S(1),
  (-q^3) * S(1),
  S(0),
  (-2 * q^3) * S(1),
  S(0),
  S(0),
  (q * (q - 1) * (q^2 + q + 1)) * S(1),
  S(0),
  (-q) * S(1),
  S(0),
  S(0),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (-(q - 1) * (q^2 + q + 1)) * S(1),
  S(1),
  S(0),
  -S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q^2 +
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q^3 +
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) * q -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q^2 +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q^3 +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) * q -
  S(1; exponent=(a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) * q^3 -
  S(1; exponent=(-a * (2 * q - 1) * k) * 1//R((q^2 - q + 1))) * q^3,
  (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ) * (q + 1),
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))),
  -q * (
    S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1)))
  ),
  S(0),
  -S(1; exponent=((q - 1) * a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-(q - 1) * a * k) * 1//R((q^2 - q + 1))),
  S(0),
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-b * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(b * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(k * (-a - b * q + a * q)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(k * (-b + b * q + a * q)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-k * (-a - b * q + a * q)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-k * (-b + b * q + a * q)) * 1//R((q^2 - q + 1))),
  S(0),
  S(1; exponent=(-a * k * q) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * k * q) * 1//R((q^2 - q + 1)))] [
  ((q - 1) * (q^2 - q + 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2) * S(1),
  ((q - 1) * (q^2 + q + 1) * (q^4 + 1)) * S(1),
  (-1 - q^4 + q^3) * S(1),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  -S(1),
  -(q - 1) * (q^2 + q + 1) *
  (S(1; exponent=k * 1//R((2))) * q - S(1; exponent=k * 1//R((2))) - 1),
  (q - 1) * (q^2 + q + 1) * (1 + S(1; exponent=k * 1//R((2)))),
  S(1; exponent=k * 1//R((2))) * q - S(1; exponent=k * 1//R((2))) - 1,
  -1 - S(1; exponent=k * 1//R((2))),
  -1 - S(1; exponent=k * 1//R((2))),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (q - 1) * (q^2 + q + 1) *
  (1 + S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1)))),
  -1 - S(1; exponent=(a * k) * 1//R((q + 1))) - S(1; exponent=(-a * k) * 1//R((q + 1))),
  S(0),
  -(q^2 - q + 1) * (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ),
  (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ) * (q - 1),
  -S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))),
  -S(1; exponent=(-a * (q - 1) * q * k) * 1//R((q^3 + 1))) -
  S(1; exponent=(a * (q - 1) * q * k) * 1//R((q^3 + 1))) +
  q * S(1; exponent=(a * k) * 1//R((q^3 + 1))) +
  q * S(1; exponent=(-a * k) * 1//R((q^3 + 1))) -
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) - S(1; exponent=(-a * k) * 1//R((q^3 + 1))),
  -S(1; exponent=(a * (q - 1) * q * k) * 1//R((q^3 + 1))) -
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) - S(1; exponent=(-a * k) * 1//R((q^3 + 1))) -
  S(1; exponent=(-a * (q - 1) * q * k) * 1//R((q^3 + 1))),
  -S(1; exponent=(a * k * q) * 1//R((q^3 + 1))) -
  S(1; exponent=(-a * k * q) * 1//R((q^3 + 1))),
  S(0),
  S(0),
  S(0),
  -S(1; exponent=(a * k) * 1//R((q^3 + 1))) - S(1; exponent=(-a * k) * 1//R((q^3 + 1))) -
  S(1; exponent=((-a + b * q^2 - b * q + b) * k) * 1//R((q^3 + 1))) -
  S(1; exponent=(k * (b * q - b * q^2 - a * q - b + a * q^2)) * 1//R((q^3 + 1))) -
  S(1; exponent=(-k * (b * q - b * q^2 - a * q - b + a * q^2)) * 1//R((q^3 + 1))) -
  S(1; exponent=(-(-a + b * q^2 - b * q + b) * k) * 1//R((q^3 + 1)))] [
  (q * (q - 1) * (q^2 - q + 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2) * S(1),
  (q * (q - 1) * (q^2 + q + 1)) * S(1),
  (q * (-1 + q^3 - q^2)) * S(1),
  (-q * (q^2 + q + 1)) * S(1),
  (-q * (q^2 - q + 1)) * S(1),
  (-q) * S(1),
  S(0),
  (q - 1) * (q^2 + q + 1) *
  (S(1; exponent=k * 1//R((2))) * q + q - S(1; exponent=k * 1//R((2)))),
  -(q - 1) * (q^2 + q + 1) * S(1; exponent=k * 1//R((2))),
  -q - S(1; exponent=k * 1//R((2))) * q + S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  S(1; exponent=k * 1//R((2))),
  ((q - 1) * (q^2 + q + 1)) * S(1),
  -S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  -(q - 1) * (q^2 + q + 1) *
  (1 + S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1)))),
  1 + S(1; exponent=(a * k) * 1//R((q + 1))) + S(1; exponent=(-a * k) * 1//R((q + 1))),
  S(0),
  -q * (q^2 - q + 1) *
  (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ),
  -q * (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ),
  S(0),
  -q * S(1; exponent=(-a * (q - 1) * q * k) * 1//R((q^3 + 1))) -
  q * S(1; exponent=(a * (q - 1) * q * k) * 1//R((q^3 + 1))) -
  q * S(1; exponent=(a * k) * 1//R((q^3 + 1))) -
  q * S(1; exponent=(-a * k) * 1//R((q^3 + 1))) +
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) + S(1; exponent=(-a * k) * 1//R((q^3 + 1))),
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) + S(1; exponent=(-a * k) * 1//R((q^3 + 1))),
  -S(1; exponent=(a * k * q) * 1//R((q^3 + 1))) -
  S(1; exponent=(-a * k * q) * 1//R((q^3 + 1))),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) + S(1; exponent=(-a * k) * 1//R((q^3 + 1))) +
  S(1; exponent=((-a + b * q^2 - b * q + b) * k) * 1//R((q^3 + 1))) +
  S(1; exponent=(k * (a * q^2 - b * q^2 - a * q + b * q - b)) * 1//R((q^3 + 1))) +
  S(1; exponent=(-k * (a * q^2 - b * q^2 - a * q + b * q - b)) * 1//R((q^3 + 1))) +
  S(1; exponent=(-(-a + b * q^2 - b * q + b) * k) * 1//R((q^3 + 1)))] [
  ((q^4 - q^2 + 1) * (q^2 + q + 1)^2 * (q - 1) * (q^2 - q + 1) * (q + 1)) * S(1),
  (q^7 + q^3 - q - 1) * S(1),
  (-q - 1) * S(1),
  (-q^2 - q - 1) * S(1),
  (q^2 - q - 1) * S(1),
  (-q - 1) * S(1),
  -S(1),
  S(1; exponent=k * 1//R((2))) * (q^3 - 1) * (q + 1),
  S(1; exponent=k * 1//R((2))) * (q^3 - 1),
  -S(1; exponent=k * 1//R((2))) * (q + 1),
  -S(1; exponent=k * 1//R((2))),
  -S(1; exponent=k * 1//R((2))),
  (q^3 - 1) *
  (S(1; exponent=(k * a) * 1//R((q - 1))) + S(1; exponent=(-k * a) * 1//R((q - 1)))),
  -S(1; exponent=(k * a) * 1//R((q - 1))) - S(1; exponent=(-k * a) * 1//R((q - 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  -(q^3 + 1) * (
    S(1; exponent=(k * a) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-k * a) * 1//R((q^2 - q + 1)))
  ),
  -S(1; exponent=(k * a) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-k * a) * 1//R((q^2 - q + 1))),
  -S(1; exponent=(k * a) * 1//R((q^2 - q + 1))) -
  S(1; exponent=(-k * a) * 1//R((q^2 - q + 1))),
  -(q + 1) *
  (S(1; exponent=(k * a) * 1//R((q^3 + 1))) + S(1; exponent=(-k * a) * 1//R((q^3 + 1)))),
  -S(1; exponent=(k * a) * 1//R((q^3 + 1))) - S(1; exponent=(-k * a) * 1//R((q^3 + 1))),
  -S(1; exponent=(k * a) * 1//R(((q - 1) * (q^3 + 1)))) -
  S(1; exponent=(-k * a) * 1//R(((q - 1) * (q^3 + 1)))) -
  S(1; exponent=(k * a * q^3) * 1//R(((q - 1) * (q^3 + 1)))) -
  S(1; exponent=(-k * a * q^3) * 1//R(((q - 1) * (q^3 + 1)))),
  S(0),
  S(0),
  S(0),
  S(0)] [
  ((q - 1)^2 * (q + 1)^2 * (q^2 - q + 1)^2 * (q^4 - q^2 + 1)) * S(1),
  (-(q - 1) * (q + 1) * (q^2 - q + 1) * (2 * q^3 - q^2 - q + 1)) * S(1),
  (-(q + 1) * (q - 1)^3) * S(1),
  (5 * q^3 - 2 * q^2 - 2 * q + 1) * S(1),
  (-(q - 1) * (q^2 - q + 1)) * S(1),
  (-2 * q + 1) * S(1),
  S(1),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  (q - 1)^2 * (q + 1) *
  (
    S(1; exponent=(a * (k + l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * (k + l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (k - l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (l - k)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (k + (2 * q + 1) * l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * ((-2 * q - 1) * k + l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * ((2 * q + 1) * k - l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (-k + (-2 * q - 1) * l)) * 1//R((q^2 + q + 1)))
  ),
  -(q - 1) * (
    S(1; exponent=(a * (k + l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(-a * (k + l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (k - l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (l - k)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (k + (2 * q + 1) * l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * ((-2 * q - 1) * k + l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * ((2 * q + 1) * k - l)) * 1//R((q^2 + q + 1))) +
    S(1; exponent=(a * (-k + (-2 * q - 1) * l)) * 1//R((q^2 + q + 1)))
  ),
  S(1; exponent=(a * (k + l)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * (k + l)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * (k - l)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * (l - k)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * (k + (2 * q + 1) * l)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * ((-2 * q - 1) * k + l)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * ((2 * q + 1) * k - l)) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * (-k + (-2 * q - 1) * l)) * 1//R((q^2 + q + 1))),
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
  S(1; exponent=(a * k + b * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k - b * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-b * k + a * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(b * k - a * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k + ((a + b) * q + b) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(a * k + (-(a - b) * q - a) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((-(a - b) * q - a) * k + b * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((-(a + b) * q - b) * k + b * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((-(a + b) * q - b) * k + a * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(b * k + ((a + b) * q + b) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((-(a - b) * q - a) * k - a * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(b * k + ((a - b) * q + a) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-b * k + ((-a + b) * q - a) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(((a - b) * q + a) * k + a * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-b * k + (-(a + b) * q - b) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(((a + b) * q + b) * k - a * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(((a + b) * q + b) * k - b * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(((a - b) * q + a) * k - b * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k + ((a - b) * q + a) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(-a * k + (-(a + b) * q - b) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(((a + b) * q + b) * k + ((-a + b) * q - a) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((-(a - b) * q - a) * k + (-(a + b) * q - b) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=(((a - b) * q + a) * k + ((a + b) * q + b) * l) * 1//R((q^2 + q + 1))) +
  S(1; exponent=((-(a + b) * q - b) * k + ((a - b) * q + a) * l) * 1//R((q^2 + q + 1))),
  S(0),
  S(0),
  S(0)] [
  ((q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^4 - q^2 + 1)) * S(1),
  ((q - 1) * (q + 1) * (q^2 + q + 1) * (2 * q^3 + q^2 - q - 1)) * S(1),
  (-(q - 1) * (q + 1)^3) * S(1),
  ((q + 1) * (q^2 + q + 1)) * S(1),
  (-5 * q^3 - 2 * q^2 + 2 * q + 1) * S(1),
  (2 * q + 1) * S(1),
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
  -(q - 1) * (q + 1)^2 *
  (
    S(1; exponent=(a * (k + l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * (k + l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (k - l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (l - k)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (k + (-2 * q + 1) * l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * ((2 * q - 1) * k + l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * ((-2 * q + 1) * k - l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (-k + (2 * q - 1) * l)) * 1//R((q^2 - q + 1)))
  ),
  (q + 1) * (
    S(1; exponent=(a * (k + l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * (k + l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (k - l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (l - k)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (k + (-2 * q + 1) * l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * ((2 * q - 1) * k + l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * ((-2 * q + 1) * k - l)) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(a * (-k + (2 * q - 1) * l)) * 1//R((q^2 - q + 1)))
  ),
  S(1; exponent=(a * (k + l)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * (k + l)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * (k - l)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * (l - k)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * (k + (-2 * q + 1) * l)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * ((2 * q - 1) * k + l)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * ((-2 * q + 1) * k - l)) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * (-k + (2 * q - 1) * l)) * 1//R((q^2 - q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(a * k + b * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k - b * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-b * k + a * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(b * k - a * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * k + ((-a - b) * q + b) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(a * k + ((a - b) * q - a) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((a - b) * q - a) * k + b * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((a + b) * q - b) * k + b * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((a + b) * q - b) * k + a * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(b * k + ((-a - b) * q + b) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((a - b) * q - a) * k - a * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(b * k + ((-a + b) * q + a) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-b * k + ((a - b) * q - a) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((-a + b) * q + a) * k + a * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-b * k + ((a + b) * q - b) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((-a - b) * q + b) * k - a * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((-a - b) * q + b) * k - b * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((-a + b) * q + a) * k - b * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k + ((-a + b) * q + a) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k + ((a + b) * q - b) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((a - b) * q - a) * k + ((a + b) * q - b) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((-a - b) * q + b) * k + ((a - b) * q - a) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((-a + b) * q + a) * k + ((-a - b) * q + b) * l) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(((a + b) * q - b) * k + ((-a + b) * q + a) * l) * 1//R((q^2 - q + 1))),
  S(0),
  S(0)] [
  ((q + 1)^2 * (q - 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1)^2) * S(1),
  (-q^6 + 1) * S(1),
  (-q^4 + 1) * S(1),
  (-q^3 + 1) * S(1),
  (q^3 + 1) * S(1),
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
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(a * k) * 1//R((q^4 - q^2 + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^4 - q^2 + 1))) +
  S(1; exponent=(a * k * q^3) * 1//R((q^4 - q^2 + 1))) +
  S(1; exponent=(-a * k * q^3) * 1//R((q^4 - q^2 + 1))),
  S(0)] [
  ((q^2 - q + 1) * (q^4 - q^2 + 1) * (q - 1)^2 * (q^2 + q + 1)^2) * S(1),
  (-(q - 1) * (q^2 + q + 1) * (q^4 - q + 1)) * S(1),
  ((q - 1) * (2 * q^3 - 1)) * S(1),
  (-(2 * q - 1) * (q^2 + q + 1)) * S(1),
  (-2 * q^3 + q^2 - q + 1) * S(1),
  (-q + 1) * S(1),
  S(1),
  (q - 1) * (q^3 - 1) *
  (
    S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=(k) * 1//R((2)))
  ),
  (-q^3 + 1) * (
    S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=(k) * 1//R((2)))
  ),
  (-q + 1) * (
    S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
    S(1; exponent=(k) * 1//R((2)))
  ),
  S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
  S(1; exponent=(k) * 1//R((2))),
  S(1; exponent=(l) * 1//R((2))) + S(1; exponent=(k + l) * 1//R((2))) +
  S(1; exponent=(k) * 1//R((2))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  S(0),
  -(q^3 - 1) * (
    S(1; exponent=(a * l) * 1//R((q + 1))) + S(1; exponent=(-a * l) * 1//R((q + 1))) +
    S(1; exponent=(a * k + a * l) * 1//R((q + 1))) +
    S(1; exponent=(a * k + 2 * a * l) * 1//R((q + 1))) +
    S(1; exponent=(-a * k - a * l) * 1//R((q + 1))) +
    S(1; exponent=(-a * k - 2 * a * l) * 1//R((q + 1)))
  ),
  S(1; exponent=(a * l) * 1//R((q + 1))) + S(1; exponent=(-a * l) * 1//R((q + 1))) +
  S(1; exponent=(a * k + a * l) * 1//R((q + 1))) +
  S(1; exponent=(a * k + 2 * a * l) * 1//R((q + 1))) +
  S(1; exponent=(-a * k - a * l) * 1//R((q + 1))) +
  S(1; exponent=(-a * k - 2 * a * l) * 1//R((q + 1))),
  S(0),
  -(q - 1) * (q^2 - q + 1) *
  (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ),
  (-2 * q + 1) * (
    S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^2 - q + 1)))
  ),
  S(1; exponent=(a * k) * 1//R((q^2 - q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^2 - q + 1))),
  -(q - 1) * (
    S(1; exponent=(a * k) * 1//R((q^3 + 1))) + S(1; exponent=(-a * k) * 1//R((q^3 + 1))) +
    S(1; exponent=(a * k) * 1//R((q^3 + 1))) * S(1; exponent=(a * l) * 1//R((q + 1))) +
    S(1; exponent=(-a * k) * 1//R((q^3 + 1))) * S(1; exponent=(-a * l) * 1//R((q + 1))) +
    S(1; exponent=(a * (q^2 - q) * k) * 1//R((q^3 + 1))) *
    S(1; exponent=(a * l) * 1//R((q + 1))) +
    S(1; exponent=(-a * (q^2 - q) * k) * 1//R((q^3 + 1))) *
    S(1; exponent=(-a * l) * 1//R((q + 1)))
  ),
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) + S(1; exponent=(-a * k) * 1//R((q^3 + 1))) +
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) * S(1; exponent=(a * l) * 1//R((q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 + 1))) * S(1; exponent=(-a * l) * 1//R((q + 1))) +
  S(1; exponent=(a * (q^2 - q) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=(a * l) * 1//R((q + 1))) +
  S(1; exponent=(-a * (q^2 - q) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=(-a * l) * 1//R((q + 1))),
  S(0),
  S(0),
  S(0),
  S(0),
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) * S(1; exponent=(b * l) * 1//R((q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 + 1))) * S(1; exponent=(-b * l) * 1//R((q + 1))) +
  S(1; exponent=(a * k) * 1//R((q^3 + 1))) * S(1; exponent=((a - b) * l) * 1//R((q + 1))) +
  S(1; exponent=(-a * k) * 1//R((q^3 + 1))) *
  S(1; exponent=((-a + b) * l) * 1//R((q + 1))) +
  S(1; exponent=((-a + b * q^2 - b * q + b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=(b * l) * 1//R((q + 1))) +
  S(1; exponent=((-a + b * q^2 - b * q + b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=((-a + 2 * b) * l) * 1//R((q + 1))) +
  S(1; exponent=(((a - b) * q^2 + (-a + b) * q - b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=((a - b) * l) * 1//R((q + 1))) +
  S(1; exponent=(((a - b) * q^2 + (-a + b) * q - b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=((a - 2 * b) * l) * 1//R((q + 1))) +
  S(1; exponent=(((-a + b) * q^2 + (a - b) * q + b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=((-a + 2 * b) * l) * 1//R((q + 1))) +
  S(1; exponent=(((-a + b) * q^2 + (a - b) * q + b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=((-a + b) * l) * 1//R((q + 1))) +
  S(1; exponent=((a - b * q^2 + b * q - b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=((a - 2 * b) * l) * 1//R((q + 1))) +
  S(1; exponent=((a - b * q^2 + b * q - b) * k) * 1//R((q^3 + 1))) *
  S(1; exponent=(-b * l) * 1//R((q + 1)))]]
classinfo = Vector{Any}[
  [[1, 0], ["^3D_4", "u_0"]],
  [[1, 1], ["^3D_4", "u_1"]],
  [[1, 2], ["^3D_4", "u_2"]],
  [[1, 3], ["^3D_4", "u_3"]],
  [[1, 4], ["^3D_4", "u_4"]],
  [[1, 5], ["^3D_4", "u_5"]],
  [[1, 6], ["^3D_4", "u_6"]],
  [[2, 0], ["A_1+A_1", "u_0"]],
  [[2, 1], ["A_1+A_1", "u_1"]],
  [[2, 2], ["A_1+A_1", "u_2"]],
  [[2, 3], ["A_1+A_1", "u_3"]],
  [[2, 4], ["A_1+A_1", "u_4"]],
  [[3, 0], ["A_1", [1, 1]]],
  [[3, 1], ["A_1", [2]]],
  [[4, 0], ["A_2", [1, 1, 1]]],
  [[4, 1], ["A_2", [2, 1]]],
  [[4, 2], ["A_2", [3]]],
  [[5, 0], ["A_1", [1, 1]]],
  [[5, 1], ["A_1", [2]]],
  [[6, 0], ["A_0", [1]]],
  [[7, 0], ["A_1", [1, 1]]],
  [[7, 1], ["A_1", [2]]],
  [[8, 0], ["A_0", [1]]],
  [[9, 0], ["A_2", [1, 1, 1]]],
  [[9, 1], ["A_2", [2, 1]]],
  [[9, 2], ["A_2", [3]]],
  [[10, 0], ["A_1", [1, 1]]],
  [[10, 1], ["A_1", [2]]],
  [[11, 0], ["A_0", [1]]],
  [[12, 0], ["A_0", [1]]],
  [[13, 0], ["A_0", [1]]],
  [[14, 0], ["A_0", [1]]],
  [[15, 0], ["A_0", [1]]]]
classlength =
  R.([
    1,
    (q^2 - 1) * (q^8 + q^4 + 1),
    q^2 * (q^6 - 1) * (q^8 + q^4 + 1),
    q^4 * (q^8 + q^4 + 1) * (q^2 - 1)^2 * (q^2 - q + 1) * 1//2,
    q^4 * (q^8 + q^4 + 1) * (q^2 - 1)^2 * (q^2 + q + 1) * 1//2,
    q^6 * (q^2 - 1) * (q^6 - 1) * (q^8 + q^4 + 1),
    q^8 * (q^2 - 1) * (q^6 - 1) * (q^8 + q^4 + 1),
    q^8 * (q^8 + q^4 + 1),
    q^8 * (q^2 - 1) * (q^8 + q^4 + 1),
    q^8 * (q^6 - 1) * (q^8 + q^4 + 1),
    q^8 * (q^2 - 1) * (q^6 - 1) * (q^8 + q^4 + 1) * 1//2,
    q^8 * (q^2 - 1) * (q^6 - 1) * (q^8 + q^4 + 1) * 1//2,
    q^9 * (q + 1) * (q^8 + q^4 + 1),
    q^9 * (q + 1) * (q^6 - 1) * (q^8 + q^4 + 1),
    q^9 * (q^3 + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1),
    q^9 * (q^2 - 1) * (q^3 + 1) * (q^8 + q^4 + 1),
    q^10 * (q^2 - 1) * (q - 1) * (q^3 + 1) * (q^8 + q^4 + 1),
    q^11 * (q^3 + 1) * (q^8 + q^4 + 1),
    q^11 * (q^3 + 1) * (q^2 - 1) * (q^8 + q^4 + 1),
    q^12 * (q + 1) * (q^3 + 1) * (q^8 + q^4 + 1),
    q^9 * (q - 1) * (q^8 + q^4 + 1),
    q^9 * (q - 1) * (q^6 - 1) * (q^8 + q^4 + 1),
    q^12 * (q - 1) * (q^3 + 1) * (q^8 + q^4 + 1),
    q^9 * (q^3 - 1) * (q^2 + q + 1) * (q^4 - q^2 + 1),
    q^9 * (q^2 - 1) * (q^3 - 1) * (q^8 + q^4 + 1),
    q^10 * (q^2 - 1) * (q^3 - 1) * (q + 1) * (q^8 + q^4 + 1),
    q^11 * (q^3 - 1) * (q^8 + q^4 + 1),
    q^11 * (q^2 - 1) * (q^3 - 1) * (q^8 + q^4 + 1),
    q^12 * (q + 1) * (q^3 - 1) * (q^8 + q^4 + 1),
    q^12 * (q^2 - 1) * (q - 1) * (q^3 + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1),
    q^12 * (q^2 - 1) * (q + 1) * (q^3 - 1) * (q^2 + q + 1) * (q^4 - q^2 + 1),
    q^12 * (q^2 - 1) * (q^6 - 1) * (q^4 + q^2 + 1),
    q^12 * (q - 1) * (q^3 - 1) * (q^8 + q^4 + 1)])
charinfo = Vector{Any}[
  [[1, 0], ["^3D_4", "\\phi_{1,0}"]],
  [[1, 1], ["^3D_4", "\\phi_{1,3}'"]],
  [[1, 2], ["^3D_4", "\\phi_{2,2}"]],
  [[1, 3], ["^3D_4", "\\phi_{2,1}"]],
  [[1, 4], ["^3D_4", "^3D_4[-1]"]],
  [[1, 5], ["^3D_4", "^3D_4[1]"]],
  [[1, 6], ["^3D_4", "\\phi_{1,3}''"]],
  [[1, 7], ["^3D_4", "\\phi_{1,6}"]],
  [[2, 0], ["A_1+A_1", [[2], [2]]]],
  [[2, 1], ["A_1+A_1", [[2], [1, 1]]]],
  [[2, 2], ["A_1+A_1", [[1, 1], [2]]]],
  [[2, 3], ["A_1+A_1", [[1, 1], [1, 1]]]],
  [[3, 0], ["A_1", [2]]],
  [[3, 1], ["A_1", [1, 1]]],
  [[4, 0], ["A_2", [3]]],
  [[4, 1], ["A_2", [2, 1]]],
  [[4, 2], ["A_2", [1, 1, 1]]],
  [[5, 0], ["A_1", [2]]],
  [[5, 1], ["A_1", [1, 1]]],
  [[6, 0], ["A_0", [1]]],
  [[7, 0], ["A_1", [2]]],
  [[7, 1], ["A_1", [1, 1]]],
  [[8, 0], ["A_0", [1]]],
  [[9, 0], ["A_2", [3]]],
  [[9, 1], ["A_2", [2, 1]]],
  [[9, 2], ["A_2", [1, 1, 1]]],
  [[10, 0], ["A_1", [2]]],
  [[10, 1], ["A_1", [1, 1]]],
  [[11, 0], ["A_0", [1]]],
  [[12, 0], ["A_0", [1]]],
  [[13, 0], ["A_0", [1]]],
  [[14, 0], ["A_0", [1]]],
  [[15, 0], ["A_0", [1]]]]
chardegree =
  R.([
    1,
    q^5 - q^3 + q,
    q^3 * (q + 1)^2 * (q^4 - q^2 + 1) * 1//2,
    q^3 * (q^3 + 1)^2 * 1//2,
    q^3 * (q^3 - 1)^2 * 1//2,
    q^3 * (q - 1)^2 * (q^4 - q^2 + 1) * 1//2,
    q^11 - q^9 + q^7,
    q^12,
    q^8 + q^4 + 1,
    q^9 + q^5 + q,
    q^11 + q^7 + q^3,
    q^12 + q^8 + q^4,
    (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1),
    q^3 * (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1),
    (q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2,
    q * (q^4 - q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
    q^3 * (q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2,
    (q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2,
    q * (q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2,
    (q^2 + q + 1) * (q^4 - q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
    (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1),
    q^3 * (q - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1),
    (q^4 - q^2 + 1) * (q^2 - q + 1)^2 * (q + 1) * (q^2 + q + 1) * (q - 1),
    (q - 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2,
    q * (q^4 - q^2 + 1) * (q - 1)^2 * (q^2 + q + 1)^2,
    q^3 * (q - 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2,
    (q - 1) * (q^2 - q + 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2,
    q * (q - 1) * (q^2 - q + 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2,
    (q^4 - q^2 + 1) * (q^2 + q + 1)^2 * (q - 1) * (q^2 - q + 1) * (q + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1)^2 * (q^4 - q^2 + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^4 - q^2 + 1),
    (q + 1)^2 * (q - 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1)^2,
    (q^2 - q + 1) * (q^4 - q^2 + 1) * (q - 1)^2 * (q^2 + q + 1)^2])

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
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, (q - 2))
    tt1 = evaluate(tt, [a], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, (q - 2))
    tt1 = evaluate(tt, [a], [(q - 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q^2 + q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q^2 + q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q^2 + q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^3 - 2)
    tt1 = evaluate(tt, [a], [(q - 1) * a])
    s2 = nesum(tt1, a, 0, q^2 + q)
    s3 = evaluate(tt, [a], [(q^3 - 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^3 - 2)
    tt1 = evaluate(tt, [a], [(q - 1) * a])
    s2 = nesum(tt1, a, 0, q^2 + q)
    s3 = evaluate(tt, [a], [(q^3 - 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^3 - 2)
    s2 = nesum(s1, b, 1, q - 2)
    tt1 = evaluate(tt, [a, b], R.([(q^2 + q + 1) * a, 2 * a]))
    s3 = nesum(tt1, a, 0, q - 2)
    tt1 = evaluate(tt, [a, b], R.([2 * a, a]))
    s4 = nesum(tt1, a, 0, q^3 - 2)
    tt1 = evaluate(tt, [b], [a])
    s5 = nesum(tt1, a, 0, q^3 - 2)
    tt1 = evaluate(tt, [a, b], R.([(q - 1) * a, 0]))
    s6 = nesum(tt1, a, 0, q^2 + q)
    tt1 = evaluate(tt, [a, b], R.([(q^3 - 1) * 1//2, 0]))
    tt2 = evaluate(tt, [a, b], R.([(q^3 - 1), 0]))
    1//12 * s2 - 1//4 * s3 - 1//12 * s4 - 1//12 * s5 + 1//6 * s6 + 1//4 * tt1 + 1//4 * tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q)
    tt1 = evaluate(tt, [a], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q)
    tt1 = evaluate(tt, [a], [(q + 1) * 1//2])
    1//2 * s1 - 1//2 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^4 + q^3 - q - 2)
    tt1 = evaluate(tt, [a], [(q + 1) * a])
    s2 = nesum(tt1, a, 0, q^3 - 2)
    tt1 = evaluate(tt, [a], [(q^3 - 1) * a])
    s3 = nesum(tt1, a, 0, q)
    tt1 = evaluate(tt, [a], [(q^3 - 1) * (q + 1) * 1//2])
    tt2 = evaluate(tt, [a], [(q^3 - 1) * (q + 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * tt1 + 1//4 * tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q^2 - q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q^2 - q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q^2 - q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^3)
    tt1 = evaluate(tt, [a], [(q + 1) * a])
    s2 = nesum(tt1, a, 0, q^2 - q)
    s3 = evaluate(tt, [a], [(q^3 + 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^3)
    tt1 = evaluate(tt, [a], [(q + 1) * a])
    s2 = nesum(tt1, a, 0, q^2 - q)
    s3 = evaluate(tt, [a], [(q^3 + 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^4 - q^3 + q - 2)
    tt1 = evaluate(tt, [a], [(q - 1) * a])
    s2 = nesum(tt1, a, 0, q^3)
    tt1 = evaluate(tt, [a], [(q^3 + 1) * a])
    s3 = nesum(tt1, a, 0, q - 2)
    tt1 = evaluate(tt, [a], [(q^3 + 1) * (q - 1) * 1//2])
    tt2 = evaluate(tt, [a], [(q^3 + 1) * (q - 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * tt1 + 1//4 * tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^2 + q)
    s2 = nesum(s1, b, 0, q^2 + q)
    tt1 = evaluate(tt, [b], [a])
    s3 = nesum(tt1, a, 0, q^2 + q)
    tt1 = evaluate(tt, [a, b], R.([0, 0]))
    1//24 * s2 - 1//6 * s3 + 1//8 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^2 - q)
    s2 = nesum(s1, b, 0, q^2 - q)
    tt1 = evaluate(tt, [b], [a])
    s3 = nesum(tt1, a, 0, q^2 - q)
    tt1 = evaluate(tt, [a, b], R.([0, 0]))
    1//24 * s2 - 1//6 * s3 + 1//8 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 1, q^4 - q^2)
    1//4 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, a, 0, q^3)
    s2 = nesum(s1, b, 1, q)
    tt1 = evaluate(tt, [a, b], R.([(q^2 - q + 1) * a, 2 * a]))
    s3 = nesum(tt1, a, 0, q)
    tt1 = evaluate(tt, [a, b], R.([2 * a, a]))
    s4 = nesum(tt1, a, 0, q^3)
    tt1 = evaluate(tt, [b], [a])
    s5 = nesum(tt1, a, 0, q^3)
    tt1 = evaluate(tt, [a, b], R.([(q + 1) * a, 0]))
    s6 = nesum(tt1, a, 0, q^2 - q)
    tt1 = evaluate(tt, [a, b], R.([(q^3 + 1) * 1//2, 0]))
    tt2 = evaluate(tt, [a, b], R.([(q^3 + 1), 0]))
    1//12 * s2 - 1//4 * s3 - 1//12 * s4 - 1//12 * s5 + 1//6 * s6 + 1//4 * tt1 + 1//4 * tt2
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
    s1 = nesum(tt, k, 1, q^2 + q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 + q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 + q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^3 - 2)
    tt1 = evaluate(tt, [k], [(q - 1) * k])
    s2 = nesum(tt1, k, 0, q^2 + q)
    s3 = evaluate(tt, [k], [(q^3 - 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^3 - 2)
    tt1 = evaluate(tt, [k], [(q - 1) * k])
    s2 = nesum(tt1, k, 0, q^2 + q)
    s3 = evaluate(tt, [k], [(q^3 - 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^3 - 2)
    s2 = nesum(s1, l, 0, q - 2)
    tt1 = evaluate(tt, [l], [0])
    s3 = nesum(tt1, k, 0, q^3 - 2)
    tt1 = evaluate(tt, [k, l], R.([(q - 1) * k, 0]))
    s4 = nesum(tt1, k, 0, q^2 + q)
    tt1 = evaluate(tt, [k], [0])
    s5 = nesum(tt1, l, 1, q - 2)
    tt1 = evaluate(tt, [k, l], R.([(q^3 - 1) * 1//2, 0]))
    1//12 * s2 - 1//4 * s3 + 1//6 * s4 - 1//4 * s5 + 1//4 * tt1
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
    s1 = nesum(tt, k, 0, q^4 + q^3 - q - 2)
    tt1 = evaluate(tt, [k], [(q + 1) * k])
    s2 = nesum(tt1, k, 0, q^3 - 2)
    tt1 = evaluate(tt, [k], [(q^3 - 1) * k])
    s3 = nesum(tt1, k, 0, q)
    tt1 = evaluate(tt, [k], [(q^3 - 1) * (q + 1) * 1//2])
    tt2 = evaluate(tt, [k], [(q^3 - 1) * (q + 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * tt1 + 1//4 * tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 - q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 - q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^2 - q)
    1//2 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^3)
    tt1 = evaluate(tt, [k], [(q + 1) * k])
    s2 = nesum(tt1, k, 0, q^2 - q)
    s3 = evaluate(tt, [k], [(q^3 + 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^3)
    tt1 = evaluate(tt, [k], [(q + 1) * k])
    s2 = nesum(tt1, k, 0, q^2 - q)
    s3 = evaluate(tt, [k], [(q^3 + 1) * 1//2])
    1//2 * s1 - 1//2 * s2 - 1//2 * s3
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^4 - q^3 + q - 2)
    tt1 = evaluate(tt, [k], [(q - 1) * k])
    s2 = nesum(tt1, k, 0, q^3)
    tt1 = evaluate(tt, [k], [(q^3 + 1) * k])
    s3 = nesum(tt1, k, 0, q - 2)
    tt1 = evaluate(tt, [k], [(q^3 + 1) * (q - 1) * 1//2])
    tt2 = evaluate(tt, [k], [(q^3 + 1) * (q - 1)])
    1//4 * s1 - 1//4 * s2 - 1//4 * s3 + 1//4 * tt1 + 1//4 * tt2
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^2 + q)
    s2 = nesum(s1, l, 0, q^2 + q)
    tt1 = evaluate(tt, [l], [0])
    s3 = nesum(tt1, k, 0, q^2 + q)
    tt1 = evaluate(tt, [k, l], R.([0, 0]))
    1//24 * s2 - 1//6 * s3 + 1//8 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 0, q^2 - q)
    s2 = nesum(s1, l, 0, q^2 - q)
    tt1 = evaluate(tt, [l], [0])
    s3 = nesum(tt1, k, 0, q^2 - q)
    tt1 = evaluate(tt, [k, l], R.([0, 0]))
    1//24 * s2 - 1//6 * s3 + 1//8 * tt1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^4 - q^2)
    1//4 * s1
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    s1 = nesum(tt, k, 1, q^3)
    s2 = nesum(s1, l, 1, q)
    tt1 = evaluate(tt, [l], [0])
    s3 = nesum(tt1, k, 1, q^3)
    tt1 = evaluate(tt, [k, l], R.([(q + 1) * k, 0]))
    s4 = nesum(tt1, k, 1, q^2 - q)
    tt1 = evaluate(tt, [k], [0])
    s5 = nesum(tt1, l, 1, q)
    tt1 = evaluate(tt, [k, l], R.([(q^3 + 1) * 1//2, 0]))
    1//12 * s2 - 1//6 * s3 + 1//6 * s4 - 1//6 * s5 + 1//4 * tt1
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
  Parameters([Parameter(a, q - 1)], [((a) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(a, q - 1)], [((a) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(a, q^2 + q + 1)], [((a) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(a, q^2 + q + 1)], [((a) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(a, q^2 + q + 1)], [((a) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(a, q^3 - 1)], [((a) * 1//(q - 1)), ((a) * 1//((q^3 - 1) * 1//2))]),
  Parameters([Parameter(a, q^3 - 1)], [((a) * 1//(q - 1)), ((a) * 1//((q^3 - 1) * 1//2))]),
  Parameters([Parameter(a, q^3 - 1), Parameter(b, q - 1)]),
  Parameters([Parameter(a, q + 1)], [((a) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(a, q + 1)], [((a) * 1//((q + 1) * 1//2))]),
  Parameters(
    [Parameter(a, (q^3 - 1) * (q + 1))],
    [((a) * 1//(q + 1)), ((a) * 1//(q^3 - 1)), ((a) * 1//((q^3 - 1) * (q + 1) * 1//2))],
  ),
  Parameters([Parameter(a, q^2 - q + 1)], [((a) * 1//(q^2 - q + 1))]),
  Parameters([Parameter(a, q^2 - q + 1)], [((a) * 1//(q^2 - q + 1))]),
  Parameters([Parameter(a, q^2 - q + 1)], [((a) * 1//(q^2 - q + 1))]),
  Parameters([Parameter(a, q^3 + 1)], [((a) * 1//(q + 1)), ((a) * 1//((q^3 + 1) * 1//2))]),
  Parameters([Parameter(a, q^3 + 1)], [((a) * 1//(q + 1)), ((a) * 1//((q^3 + 1) * 1//2))]),
  Parameters(
    [Parameter(a, (q^3 + 1) * (q - 1))],
    [((a) * 1//(q - 1)), ((a) * 1//(q^3 + 1)), ((a) * 1//((q^3 + 1) * (q - 1) * 1//2))],
  ),
  Parameters([Parameter(a, q^2 + q + 1), Parameter(b, q^2 + q + 1)]),
  Parameters([Parameter(a, q^2 - q + 1), Parameter(b, q^2 - q + 1)]),
  Parameters([Parameter(a, q^4 - q^2 + 1)], [((a) * 1//(q^4 - q^2 + 1))]),
  Parameters([Parameter(a, q^3 + 1), Parameter(b, q + 1)]),
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
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q - 1)], [((k) * 1//((q - 1) * 1//2))]),
  Parameters([Parameter(k, q^2 + q + 1)], [((k) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(k, q^2 + q + 1)], [((k) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(k, q^2 + q + 1)], [((k) * 1//(q^2 + q + 1))]),
  Parameters([Parameter(k, q^3 - 1)], [((k) * 1//(q - 1)), ((k) * 1//((q^3 - 1) * 1//2))]),
  Parameters([Parameter(k, q^3 - 1)], [((k) * 1//(q - 1)), ((k) * 1//((q^3 - 1) * 1//2))]),
  Parameters([Parameter(k, q^3 - 1), Parameter(l, q - 1)]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
  Parameters([Parameter(k, q + 1)], [((k) * 1//((q + 1) * 1//2))]),
  Parameters(
    [Parameter(k, (q^3 - 1) * (q + 1))],
    [((k) * 1//(q + 1)), ((k) * 1//(q^3 - 1)), ((k) * 1//((q^3 - 1) * (q + 1) * 1//2))],
  ),
  Parameters([Parameter(k, q^2 - q + 1)], [((k) * 1//(q^2 - q + 1))]),
  Parameters([Parameter(k, q^2 - q + 1)], [((k) * 1//(q^2 - q + 1))]),
  Parameters([Parameter(k, q^2 - q + 1)], [((k) * 1//(q^2 - q + 1))]),
  Parameters([Parameter(k, q^3 + 1)], [((k) * 1//(q + 1)), ((k) * 1//((q^3 + 1) * 1//2))]),
  Parameters([Parameter(k, q^3 + 1)], [((k) * 1//(q + 1)), ((k) * 1//((q^3 + 1) * 1//2))]),
  Parameters(
    [Parameter(k, (q^3 + 1) * (q - 1))],
    [((k) * 1//(q - 1)), ((k) * 1//(q^3 + 1)), ((k) * 1//((q^3 + 1) * (q - 1) * 1//2))],
  ),
  Parameters([Parameter(k, q^2 + q + 1), Parameter(l, q^2 + q + 1)]),
  Parameters([Parameter(k, q^2 - q + 1), Parameter(l, q^2 - q + 1)]),
  Parameters([Parameter(k, q^4 - q^2 + 1)], [((k) * 1//(q^4 - q^2 + 1))]),
  Parameters([Parameter(k, q^3 + 1), Parameter(l, q + 1)]),
]

classparamindex = var_index.([a, b])
charparamindex = var_index.([k, l])

information = raw"""The generic character table of $^3\mathrm{D}_4(q)$,
  $p>2$, congruent to $3$ modulo $4$.



- The table was first computed in [DM87](@cite).
"""

CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

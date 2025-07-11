using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
K, sqrt2 = quadratic_field(2)
R, q = polynomial_ring(K, "q")

order = q^24 * (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1)
table = [[
  (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
  (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
  (q^2 + 1) * (q^8 + q^6 + q^4 + 1),
  (q^4 + 1) * (2 * q^4 + q^2 + 1),
  (q^4 + 1) * (2 * q^4 + q^2 + 1),
  q^4 + q^2 + 1,
  3 * q^4 + q^2 + 1,
  6 * q^4 + q^2 + 1,
  2 * q^4 + q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  -(q^2 - 1) * (q^2 + 1) * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
  -(q^2 - 1) * (q^2 + 1) * (q^4 + 1) * (q^4 - q^2 + 1),
  (q^10 + q^4 - q^2 + 1),
  -(q^2 - 1) * (q^4 + 1),
  -(q^2 - 1) * (q^4 + 1),
  q^4 - q^2 + 1,
  q^4 - q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  -(q^2 - 1) * (q^2 + 1)^2 * (q^2 + sqrt2 * q + 1) * (q^4 + 1) * (q^4 - q^2 + 1) *
  (q^8 - q^4 + 1),
  (q^2 + sqrt2 * q + 1) * (sqrt2 * q^11 - q^10 + q^6 - q^4 + 1),
  -(q^2 - 1) * (q^2 + 1) * (q^6 + q^2 + sqrt2 * q + 1),
  q^6 - q^4 - sqrt2 * q^3 + q^2 + sqrt2 * q + 1,
  q^6 - q^4 - sqrt2 * q^3 + q^2 + sqrt2 * q + 1,
  -q^4 + q^2 + sqrt2 * q + 1,
  -q^4 - sqrt2 * q^3 + q^2 + sqrt2 * q + 1,
  -2 * sqrt2 * q^3 + q^2 + sqrt2 * q + 1,
  q^2 + sqrt2 * q + 1,
  (q^2 + 1) * (sqrt2 * q + 1),
  q^2 + sqrt2 * q + 1,
  q^2 + sqrt2 * q + 1,
  q^2 + sqrt2 * q + 1,
  sqrt2 * q + 1,
  sqrt2 * q + 1,
  R(1),
  R(1),
  R(1),
  R(1)] [
  -(q^2 - 1) * (q^2 + 1)^2 * (q^2 - sqrt2 * q + 1) * (q^4 + 1) * (q^4 - q^2 + 1) *
  (q^8 - q^4 + 1),
  (q^2 - sqrt2 * q + 1) * (-sqrt2 * q^11 - q^10 + q^6 - q^4 + 1),
  -(q^2 - 1) * (q^2 + 1) * (q^6 + q^2 - sqrt2 * q + 1),
  q^6 - q^4 + sqrt2 * q^3 + q^2 - sqrt2 * q + 1,
  q^6 - q^4 + sqrt2 * q^3 + q^2 - sqrt2 * q + 1,
  -q^4 + q^2 - sqrt2 * q + 1,
  -q^4 + sqrt2 * q^3 + q^2 - sqrt2 * q + 1,
  2 * sqrt2 * q^3 + q^2 - sqrt2 * q + 1,
  q^2 - sqrt2 * q + 1,
  (q^2 + 1) * (-sqrt2 * q + 1),
  q^2 - sqrt2 * q + 1,
  q^2 - sqrt2 * q + 1,
  q^2 - sqrt2 * q + 1,
  -sqrt2 * q + 1,
  -sqrt2 * q + 1,
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
  (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 - q^2 + 1),
  (q^2 - 1) * (q^2 + 1) * (-q^6 + q^2 - 1),
  2 * q^8 - q^6 - q^4 - q^2 + 1,
  2 * q^8 - q^6 - q^4 - q^2 + 1,
  2 * q^6 - q^4 - q^2 + 1,
  -q^4 - q^2 + 1,
  -2 * q^4 - q^2 + 1,
  -2 * q^4 - q^2 + 1,
  -2 * q^4 - q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q^2 - 1)^2 * (q^2 + 1)^2 * (q^2 + sqrt2 * q + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
  (q^2 + sqrt2 * q + 1) * (q^2 - 1) *
  (
    -2 * sqrt2 * q^9 - 3 * q^8 - sqrt2 * q^7 + q^6 + 2 * q^5 * sqrt2 + 2 * q^4 - q^2 -
    sqrt2 * q - 1
  ),
  (3 * q^6 + 4 * q^5 * sqrt2 + 4 * q^4 - 3 * q^2 - 2 * sqrt2 * q - 1) * (q^2 - 1) *
  (q^2 + 1),
  (2 * q^4 + 2 * sqrt2 * q^3 - q^2 - sqrt2 * q - 1) * (q^2 + sqrt2 * q + 1) * (q^2 - 1),
  (2 * q^4 + 2 * sqrt2 * q^3 - q^2 - sqrt2 * q - 1) * (q^2 + sqrt2 * q + 1) * (q^2 - 1),
  -2 * q^6 - 4 * sqrt2 * q^5 - 5 * q^4 + 3 * q^2 + 2 * sqrt2 * q + 1,
  -4 * sqrt2 * q^5 - 9 * q^4 - 2 * sqrt2 * q^3 + 3 * q^2 + 2 * sqrt2 * q + 1,
  -10 * q^4 - 4 * sqrt2 * q^3 + 3 * q^2 + 2 * sqrt2 * q + 1,
  -2 * q^4 + 3 * q^2 + 2 * sqrt2 * q + 1,
  (q^2 + 1) * (2 * q^2 + 2 * sqrt2 * q + 1),
  3 * q^2 + 2 * sqrt2 * q + 1,
  3 * q^2 + 2 * sqrt2 * q + 1,
  3 * q^2 + 2 * sqrt2 * q + 1,
  2 * sqrt2 * q + 1,
  2 * sqrt2 * q + 1,
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q^2 - 1)^2 * (q^2 + 1)^2 * (q^2 - sqrt2 * q + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
  (q^2 - sqrt2 * q + 1) * (q^2 - 1) *
  (
    2 * sqrt2 * q^9 - 3 * q^8 + sqrt2 * q^7 + q^6 - 2 * q^5 * sqrt2 + 2 * q^4 - q^2 +
    sqrt2 * q - 1
  ),
  (3 * q^6 - 4 * q^5 * sqrt2 + 4 * q^4 - 3 * q^2 + 2 * sqrt2 * q - 1) * (q^2 - 1) *
  (q^2 + 1),
  (2 * q^4 - 2 * sqrt2 * q^3 - q^2 + sqrt2 * q - 1) * (q^2 - sqrt2 * q + 1) * (q^2 - 1),
  (2 * q^4 - 2 * sqrt2 * q^3 - q^2 + sqrt2 * q - 1) * (q^2 - sqrt2 * q + 1) * (q^2 - 1),
  -2 * q^6 + 4 * sqrt2 * q^5 - 5 * q^4 + 3 * q^2 - 2 * sqrt2 * q + 1,
  4 * sqrt2 * q^5 - 9 * q^4 + 2 * sqrt2 * q^3 + 3 * q^2 - 2 * sqrt2 * q + 1,
  -10 * q^4 + 4 * sqrt2 * q^3 + 3 * q^2 - 2 * sqrt2 * q + 1,
  -2 * q^4 + 3 * q^2 - 2 * sqrt2 * q + 1,
  (q^2 + 1) * (2 * q^2 - 2 * sqrt2 * q + 1),
  3 * q^2 - 2 * sqrt2 * q + 1,
  3 * q^2 - 2 * sqrt2 * q + 1,
  3 * q^2 - 2 * sqrt2 * q + 1,
  -2 * sqrt2 * q + 1,
  -2 * sqrt2 * q + 1,
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q^2 - 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
  (q^2 - 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
  -(q^2 - 1) * (3 * q^8 - 3 * q^6 + 3 * q^4 - 2 * q^2 + 1),
  (q^2 - 1) * (q^4 + 1) * (2 * q^2 - 1),
  (q^2 - 1) * (q^4 + 1) * (2 * q^2 - 1),
  -4 * q^6 + 5 * q^4 - 3 * q^2 + 1,
  3 * q^4 - 3 * q^2 + 1,
  -2 * q^4 - 3 * q^2 + 1,
  (q^2 - 1) * (2 * q^2 - 1),
  4 * q^4 - 3 * q^2 + 1,
  -3 * q^2 + 1,
  -3 * q^2 + 1,
  -3 * q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^8 - q^4 + 1),
  (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1),
  -(q^2 - 1) * (q^2 + 1),
  -(q^2 - 1) * (q^2 + 1) * (q^4 + 1),
  -(q^2 - 1) * (q^2 + 1) * (q^4 + 1),
  -q^6 - q^4 + 1,
  R(1),
  q^4 + 1,
  -(q^2 - 1) * (q^2 + 1),
  -2 * q^4 + 1,
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q^2 + 1)^2 * (q^2 - 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) *
  (q^4 + sqrt2 * q^3 + q^2 + sqrt2 * q + 1),
  -1//2 * (q^2 - 1) * (q^4 + 1) *
  (2 * q^7 + q^6 * sqrt2 + sqrt2 * q^4 + 2 * q^3 + sqrt2 * q^2 + 2 * q + sqrt2) * sqrt2,
  (q^2 + 1) * (q^2 - 1) * (-sqrt2 * q^5 - 2 * q^4 - sqrt2 * q - 1),
  -(q^2 + sqrt2 * q + 1)^2 * (q^2 - 1) * (q^2 - sqrt2 * q + 1),
  -(q^2 + sqrt2 * q + 1)^2 * (q^2 - 1) * (q^2 - sqrt2 * q + 1),
  q^6 + q^5 * sqrt2 + q^4 + sqrt2 * q + 1,
  sqrt2 * q^5 - sqrt2 * q^3 + sqrt2 * q + 1,
  -q^4 - 2 * sqrt2 * q^3 + sqrt2 * q + 1,
  q^4 + sqrt2 * q + 1,
  2 * q^4 + sqrt2 * q + sqrt2 * q^3 + 1,
  sqrt2 * q + 1,
  sqrt2 * q + 1,
  sqrt2 * q + 1,
  sqrt2 * q + 1,
  sqrt2 * q + 1,
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q^2 + 1)^2 * (q^2 - 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) *
  (q^4 - sqrt2 * q^3 + q^2 - sqrt2 * q + 1),
  1//2 * (q^2 - 1) * (q^4 + 1) *
  (2 * q^7 - q^6 * sqrt2 - sqrt2 * q^4 + 2 * q^3 - sqrt2 * q^2 + 2 * q - sqrt2) * sqrt2,
  (q^2 + 1) * (q^2 - 1) * (sqrt2 * q^5 - 2 * q^4 + sqrt2 * q - 1),
  -(q^2 - sqrt2 * q + 1)^2 * (q^2 - 1) * (q^2 + sqrt2 * q + 1),
  -(q^2 - sqrt2 * q + 1)^2 * (q^2 - 1) * (q^2 + sqrt2 * q + 1),
  q^6 - q^5 * sqrt2 + q^4 - sqrt2 * q + 1,
  -sqrt2 * q^5 + sqrt2 * q^3 - sqrt2 * q + 1,
  -q^4 + 2 * sqrt2 * q^3 - sqrt2 * q + 1,
  q^4 - sqrt2 * q + 1,
  2 * q^4 - sqrt2 * q - sqrt2 * q^3 + 1,
  -sqrt2 * q + 1,
  -sqrt2 * q + 1,
  -sqrt2 * q + 1,
  -sqrt2 * q + 1,
  -sqrt2 * q + 1,
  R(1),
  R(1),
  R(1),
  R(1)]]
classinfo = Vector{Any}[
  ["u_0"],
  ["u_1"],
  ["u_2"],
  ["u_3"],
  ["u_4"],
  ["u_5"],
  ["u_6"],
  ["u_7"],
  ["u_8"],
  ["u_9"],
  ["u_{10}"],
  ["u_{11}"],
  ["u_{12}"],
  ["u_{13}"],
  ["u_{14}"],
  ["u_{15}"],
  ["u_{16}"],
  ["u_{17}"],
  ["u_{18}"]]
classlength =
  R.([
    1,
    (q^2 - 1) * (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
    (q^2 - 1) * (q^2 + 1) * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^4,
    (q^2 - 1) * (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^10 * 1//2,
    (q^2 - 1) * (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^10 * 1//2,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^8,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^10,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^12 *
    1//6,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^12 *
    1//2,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^12 *
    1//3,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^16 *
    1//2,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^16 *
    1//4,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^16 *
    1//4,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^18 *
    1//2,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^18 *
    1//2,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^20 *
    1//4,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^20 *
    1//4,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^20 *
    1//4,
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1) * q^20 *
    1//4])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  ["T_1"],
  ["T_2"],
  ["T_3"],
  ["T_4"],
  ["T_5"],
  ["T_6"],
  ["T_7"],
  ["T_8"],
  ["T_9"],
  ["T_{10}"],
  ["T_{11}"],
]
chardegree =
  R.([
    (q^2 + 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
    -(q^2 - 1) * (q^2 + 1) * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
    -(q^2 - 1) * (q^2 + 1)^2 * (q^2 + sqrt2 * q + 1) * (q^4 + 1) * (q^4 - q^2 + 1) *
    (q^8 - q^4 + 1),
    -(q^2 - 1) * (q^2 + 1)^2 * (q^2 - sqrt2 * q + 1) * (q^4 + 1) * (q^4 - q^2 + 1) *
    (q^8 - q^4 + 1),
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^2 + sqrt2 * q + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^2 - sqrt2 * q + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
    (q^2 - 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) * (q^8 - q^4 + 1),
    (q^2 - 1)^2 * (q^2 + 1)^2 * (q^4 + 1)^2 * (q^8 - q^4 + 1),
    (q^2 + 1)^2 * (q^2 - 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) *
    (q^4 + sqrt2 * q^3 + q^2 + sqrt2 * q + 1),
    (q^2 + 1)^2 * (q^2 - 1)^2 * (q^4 + 1)^2 * (q^4 - q^2 + 1) *
    (q^4 - sqrt2 * q^3 + q^2 - sqrt2 * q + 1)])

information = raw"""The Green functions of $^2\mathrm{F}_4(q^2)$.

- The Green functions can easily be obtained from a knowledge of the unipotent
  characters; these were first computed in [Mal90](@cite).

"""

SimpleCharTable(
  order,
  permutedims(table),
  classinfo,
  classlength,
  classtypeorder,
  charinfo,
  chardegree,
  R,
  information,
  splitext(basename(@__FILE__))[1],
)

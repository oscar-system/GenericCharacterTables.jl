using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^9 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1)
table = QQPolyRingElem[[
  (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1),
  (q + 1)^3 * (2 * q^2 + 1),
  (q + 1) * (3 * q^3 + 3 * q^2 + 2 * q + 1),
  (q + 1) * (3 * q^2 + 2 * q + 1),
  4 * q^2 + 3 * q + 1,
  (q + 1) * (2 * q + 1),
  (q + 1) * (2 * q + 1),
  (q + 1) * (2 * q + 1),
  3 * q + 1,
  R(1),
  R(1)] [
  -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q + 1)^2 * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1)^2 * (2 * q^2 + 1),
  -q^4 + 2 * q^3 + q^2 + q + 1,
  (q + 1) * (q^2 + 1),
  -(q - 1) * (2 * q + 1),
  q + 1,
  2 * q^2 + q + 1,
  2 * q^2 + q + 1,
  q + 1,
  R(1),
  R(1)] [
  -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1),
  (q + 1) * (q^2 + 1),
  -(q + 1) * (q^3 - q^2 - 1),
  -q^3 + q^2 + q + 1,
  2 * q^2 + q + 1,
  q + 1,
  q + 1,
  q + 1,
  q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q - 1)^2 * (q^2 + q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1) * (2 * q^2 + 1),
  -q^4 - 2 * q^3 + q^2 - q + 1,
  -(q - 1) * (q^2 + 1),
  -q + 1,
  -(q + 1) * (2 * q - 1),
  2 * q^2 - q + 1,
  2 * q^2 - q + 1,
  -q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 + 1),
  -(q - 1) * (q^3 + q^2 + 1),
  q^3 + q^2 - q + 1,
  -q + 1,
  2 * q^2 - q + 1,
  -q + 1,
  -q + 1,
  -q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^3 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1)^3 * (q^2 - q + 1),
  -(q - 1) * (q + 1)^2,
  (q + 1) * (q^3 - q^2 + 1),
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (2 * q + 1),
  q + 1,
  q + 1,
  q + 1,
  q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  -(q - 1) * (q + 1)^2 * (q^2 - q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  q^2 + 1,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1)] [
  -(q - 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q - 1)^2 * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1)^3 * (2 * q^2 + 1),
  (q - 1) * (3 * q^3 - 3 * q^2 + 2 * q - 1),
  -(q - 1) * (3 * q^2 - 2 * q + 1),
  (q - 1) * (2 * q - 1),
  4 * q^2 - 3 * q + 1,
  (q - 1) * (2 * q - 1),
  (q - 1) * (2 * q - 1),
  -3 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1)^3 * (q + 1) * (q^2 + q + 1),
  (q + 1) * (q - 1)^2,
  (q - 1) * (q^3 + q^2 - 1),
  (q + 1) * (q - 1)^2,
  -q + 1,
  -(q + 1) * (2 * q - 1),
  -q + 1,
  -q + 1,
  -q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  (q - 1)^2 * (q + 1) * (q^2 + q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  q^2 + 1,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
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
]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + q + 1),
    (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1) * (q^2 + 1),
    (q + 1)^2 * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1),
    q^2 * (q + 1)^2 * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1),
    1//2 * (q - 1)^2 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * q^3,
    1//2 * (q - 1)^3 * (q + 1)^2 * (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * q^3,
    1//2 * q^4 * (q + 1)^2 * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1),
    1//2 * q^4 * (q + 1)^2 * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1),
    q^4 * (q - 1)^3 * (q + 1)^3 * (q^2 - q + 1) * (q^2 + q + 1) * (q^2 + 1),
    1//2 * q^6 * (q - 1)^3 * (q + 1)^3 * (q^2 - q + 1) * (q^2 + q + 1) * (q^2 + 1),
    1//2 * q^6 * (q - 1)^3 * (q + 1)^3 * (q^2 - q + 1) * (q^2 + q + 1) * (q^2 + 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  [[[1, 1, 1], []]],
  [[[1, 1], [1]]],
  [[[2, 1], []]],
  [[[1], [1, 1]]],
  [[[2], [1]]],
  [[[1], [2]]],
  [[[3], []]],
  [[[], [1, 1, 1]]],
  [[[], [2, 1]]],
  [[[], [3]]]]
chardegree =
  R.([
    (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1)^3 * (q^2 + q + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1)])

information = raw"""- Information about the Green functions of $Sp_6(2^n)$.

- CHEVIE-name of the table: ``C3p2green``

- The table was published in:
  {\sc G. Malle}, Green functions for groups of types E_6 and F_4 in
  characteristic 2, {\em Comm. Algebra} {\bf21} (1993), 747--798.

- The unipotent classes were determined in:
  {\sc K. Shinoda}, The conjugacy classes of Chevalley groups of type,
  $(F_4)$ over finite fields of characteristic 2, {\em J. Fac Sci
  Univ. Tokyo} {\bf21} (1974), 133--159.

- The notation for the unipotent classes is taken from that paper.
"""

TABLE = SimpleCharTable(
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

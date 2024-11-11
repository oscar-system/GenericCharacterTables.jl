using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = 3 * q^12 * (q - 1)^4 * (q + 1)^4 * (q^2 + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1)
table = QQPolyRingElem[[
  (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  (q + 1) * (q^2 + q + 1),
  (q + 1) * (2 * q + 1),
  4 * q + 1,
  q + 1,
  2 * q + 1,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  (q + 1) * (q^2 - q + 1),
  -q + 1,
  -2 * q + 1,
  q + 1,
  R(1),
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 + q + 1),
  q + 1,
  2 * q + 1,
  -q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1),
  (q - 1)^2 * (q + 1),
  -(q - 1) * (q + 1),
  q + 1,
  -2 * q + 1,
  -q + 1,
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1),
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1),
  -q + 1,
  2 * q + 1,
  q + 1,
  R(1)] [
  (q - 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 - q + 1),
  (q - 1) * (2 * q - 1),
  -4 * q + 1,
  -q + 1,
  -2 * q + 1,
  R(1)]]
classinfo = Vector{Any}[["u_1"], ["u_2"], ["u_3"], ["u_4"], ["u_5"], ["u_6"], ["u_7"]]
classlength =
  R.([
    1,
    q^6 - 1,
    q^8 - q^2,
    1//6 * q^2 * (q^2 - 1) * (q^6 - 1),
    1//3 * q^2 * (q^2 - 1) * (q^6 - 1),
    1//2 * q^2 * (q^2 - 1) * (q^6 - 1),
    q^4 * (q^2 - 1) * (q^6 - 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[["\\emptyset"], ["2A_1"], ["A_1"], ["\\tildeA_1"], ["A_2"], ["G_2"]]
chardegree =
  R.([
    (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1),
    (q - 1)^2 * (q^2 + q + 1) * (q^2 - q + 1)])

information = raw"""- Information about the Green functions of $O_8^+(3^n):3$.

- CHEVIE-name of the table: ``D4e3green``

- The table was first computed in:
  {\sc G. Malle}, Generalized Deligne-Lusztig characters,
    {\em J. Algebra \bf159} (1993), 64--97.
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

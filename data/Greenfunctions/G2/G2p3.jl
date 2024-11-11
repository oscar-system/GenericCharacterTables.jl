using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^6 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1)
table = QQPolyRingElem[[
  (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  (q + 1) * (q^2 + q + 1),
  (q + 1) * (q^2 + q + 1),
  2 * q^2 + 2 * q + 1,
  2 * q + 1,
  2 * q + 1,
  R(1),
  R(1),
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 + q + 1),
  (q + 1) * (q^2 - q + 1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  (q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 + q + 1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1),
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1)^2,
  -q^2 + q + 1,
  q + 1,
  q + 1,
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1),
  (q - 1)^2 * (q + 1),
  (q - 1)^2 * (q + 1),
  -q^2 - q + 1,
  -q + 1,
  -q + 1,
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 - q + 1),
  2 * q^2 - 2 * q + 1,
  -2 * q + 1,
  -2 * q + 1,
  R(1),
  R(1),
  R(1)]]
classinfo = Vector{Any}[
  ["A_{1}"],
  ["A_{2}"],
  ["A_{31}"],
  ["A_{32}"],
  ["A_{41}"],
  ["A_{42}"],
  ["A_{51}"],
  ["A_{52}"],
  ["A_{53}"],
]
classlength =
  R.([
    1,
    (q^2 - q + 1) * (q^2 + q + 1) * (q + 1) * (q - 1),
    (q^2 - q + 1) * (q^2 + q + 1) * (q + 1) * (q - 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    1//2 * q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    1//2 * q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    1//3 * q^4 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    1//3 * q^4 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    1//3 * q^4 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  ["\\emptyset"], ["\\tildeA_1"], ["A_1"], ["G_2"], ["A_2"], ["A_1+\\tildeA_1"]
]
chardegree =
  R.([
    (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1),
    (q - 1)^2 * (q^2 + q + 1) * (q^2 - q + 1)])

information = raw"""- Information about the Green functions of $G_2(3^n)$.

- CHEVIE-name of the table: ``G2p3green``

- The table was first computed in:
  {\sc H. Enomoto}, The characters of the finite Chevalley groups $G_2(q)$,
    $q=3^f$, {\em Japann J. Math. \bf2} (1976), 191--248.

  The notation for the unipotent classes is taken from that paper.
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

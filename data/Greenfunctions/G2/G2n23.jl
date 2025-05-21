using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^6 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1)
table = QQPolyRingElem[[
  (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  (q + 1) * (q^2 + q + 1),
  (q + 1) * (2 * q + 1),
  4 * q + 1,
  2 * q + 1,
  q + 1,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 + q + 1),
  q + 1,
  2 * q + 1,
  R(1),
  -q + 1,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  (q + 1) * (q^2 - q + 1),
  -q + 1,
  -2 * q + 1,
  R(1),
  q + 1,
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1),
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1),
  -q + 1,
  q + 1,
  2 * q + 1,
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1),
  (q - 1)^2 * (q + 1),
  -(q - 1) * (q + 1),
  q + 1,
  -q + 1,
  -2 * q + 1,
  R(1)] [
  (q - 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 - q + 1),
  (q - 1) * (2 * q - 1),
  -4 * q + 1,
  -2 * q + 1,
  -q + 1,
  R(1)]]
classinfo = Vector{Any}[["u_0"], ["u_1"], ["u_2"], ["u_3"], ["u_4"], ["u_5"], ["u_6"]]
classlength =
  R.([
    1,
    (q^2 - q + 1) * (q^2 + q + 1) * (q + 1) * (q - 1),
    (q^2 - q + 1) * (q^2 + q + 1) * (q + 1) * (q - 1) * q^2,
    1//6 * q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    1//2 * q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    1//3 * q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    q^4 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
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

information = raw"""The Green functions of $\mathrm{G}_2(q)$, $p>3$.

- The table was first computed in [CR74](@cite).

  The notation for the unipotent classes is taken from that paper.
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

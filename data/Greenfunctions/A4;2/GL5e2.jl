using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^10 * (q - 1)^5 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^4 + q^3 + q^2 + q + 1)
table = QQPolyRingElem[[
  (q + 1)^2 * (q^2 + 1),
  (q + 1)^2,
  (q + 1)^2,
  (q + 1)^2,
  2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  (q^2 + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  -(q - 1) * (q + 1),
  (q^2 + 1),
  (q^2 + 1),
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q^2 + 1),
  (q - 1)^2,
  (q - 1)^2,
  (q - 1)^2,
  -2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1)]]
classinfo = Vector{Any}[["u_1"], ["u_2"], ["u_3"], ["u_4"], ["u_5"], ["u_6"], ["u_7"]]
classlength =
  R.([
    1,
    q^4 - 1,
    1//2 * (q^4 - 1),
    1//2 * (q^4 - 1),
    (q^2 - 1) * (q^4 - 1),
    1//2 * q^2 * (q^2 - 1) * (q^4 - 1),
    1//2 * q^2 * (q^2 - 1) * (q^4 - 1),
  ])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[[[1, 1], []], [[2], []], [[1], [1]], [[], [1, 1]], [[], [2]]]
chardegree =
  R.([
    (q + 1)^2 * (q^2 + 1),
    -(q - 1) * (q + 1) * (q^2 + 1),
    -(q - 1) * (q + 1) * (q^2 + 1),
    (q - 1)^2 * (q^2 + 1),
    (q - 1)^2 * (q + 1)^2,
  ])

information = raw"""- Information about the Green functions of $GL_5(2^n):2$.

- CHEVIE-name of the table: ``GL5e2green``

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

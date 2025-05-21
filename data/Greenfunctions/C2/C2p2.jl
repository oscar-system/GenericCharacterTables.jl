using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^4 * (q - 1)^2 * (q + 1)^2 * (q^2 + 1)
table = QQPolyRingElem[[
  (q + 1)^2 * (q^2 + 1),
  (q + 1)^2,
  (q + 1)^2,
  2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  -(q - 1) * (q + 1),
  (q^2 + 1),
  R(1),
  R(1),
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  (q^2 + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q^2 + 1),
  (q - 1)^2,
  (q - 1)^2,
  -2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1)]]
classinfo = Vector{Any}[["A1"], ["A2"], ["A31"], ["A32"], ["A41"], ["A42"]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 + 1),
    (q - 1) * (q + 1) * (q^2 + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
    1//2 * q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
    1//2 * q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  [[[1, 1], []]], [[[1], [1]]], [[[2], []]], [[[], [1, 1]]], [[[], [2]]]
]
chardegree =
  R.([
    (q + 1)^2 * (q^2 + 1),
    -(q - 1) * (q + 1) * (q^2 + 1),
    -(q - 1) * (q + 1) * (q^2 + 1),
    (q - 1)^2 * (q^2 + 1),
    (q - 1)^2 * (q + 1)^2,
  ])

information = raw"""The Green functions of $\mathrm{Sp}_4(q)$, q even.

- CHEVIE-name of the table: `C2p2green`

- The table was first computed in [Eno72](@cite).

- The names of the unipotent classes are taken from this paper.
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

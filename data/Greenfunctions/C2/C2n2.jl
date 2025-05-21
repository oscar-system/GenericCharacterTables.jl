using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^4 * (q - 1)^3 * (q + 1)^2 * (q^2 + 1)
table = QQPolyRingElem[[
  (1 + q)^2 * (1 + q^2),
  (1 + q)^2,
  1 + 3 * q,
  1 + q,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  1 + q^2,
  1 - q,
  1 + q,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  1 - q^2,
  1 + q,
  1 - q,
  R(1)] [
  (q - 1)^2 * (q^2 + 1),
  (q - 1)^2,
  1 - q,
  1 - 3 * q,
  R(1)] [
  (q - 1)^2 * (q + 1)^2,
  1 - q^2,
  1 - q,
  1 + q,
  R(1)]]
classinfo = Vector{Any}[["A0"], ["A1"], ["A21"], ["A22"], ["A3"]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 + 1),
    1//2 * q * (q - 1) * (q + 1)^2 * (q^2 + 1),
    1//2 * q * (q - 1)^2 * (q + 1) * (q^2 + 1),
    q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + 1)])
classtypeorder = R.([1, 1, 1, 1, 1])
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

information = raw"""The Green functions of $\mathrm{CSp}_4(q)$, $q$ odd.

- CHEVIE-name of the table: `C2n2green`

- The generic character table of $\mathrm{CSp}_4(q)$, $q$ odd, and hence its Green 
  functions were computed in [Shi82](@cite).

- They can also be read off the table of $\mathrm{Sp}_4(q)$, $q$ odd, computed in [Sri68](@cite).

- See also: [LS90](@cite).

- The names of the unipotent classes are taken from the article of Shinoda.
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

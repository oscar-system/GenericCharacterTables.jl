using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^3 * (q - 1) * (q^2 - q + 1) * (q + 1)^3
table = QQPolyRingElem[[
  q^3,
  R(0),
  R(0),
  q,
  R(0),
  R(-1),
  R(1),
  R(-1)] [
  (q - 1) * q,
  -q,
  R(0),
  -q + 1,
  R(1),
  R(2),
  R(0),
  R(-1)] [
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)]]
classinfo = Vector{Any}[
  ["^2A_2(q)", q + 1, [[1, 1, 1]]],
  ["^2A_2(q)", q + 1, [[2, 1]]],
  ["^2A_2(q)", q + 1, [[3]]],
  ["A_1(q)", (q + 1)^2, [[1, 1]]],
  ["A_1(q)", (q + 1)^2, [[2]]],
  ["\\emptyset", (q + 1)^3, [[[1]], 1]],
  ["\\emptyset", (q - 1) * (q + 1)^2, [[[1]], 1]],
  ["\\emptyset", (q + 1) * (q^2 - q + 1), [[[1]], 1]]]
classlength =
  R.([
    1,
    q^4 - q^3 + q - 1,
    q^6 - q^4 + q^3 - q,
    (q^2 - q + 1) * q^2,
    (q^2 - 1) * (q^2 - q + 1) * q^2,
    (q - 1) * (q^2 - q + 1) * q^3,
    (q + 1) * (q^2 - q + 1) * q^3,
    (q - 1) * (q + 1)^2 * q^3])
classtypeorder =
  R.([
    q + 1,
    q + 1,
    q + 1,
    q^2 + q,
    q^2 + q,
    1//6 * q^3 - 1//6 * q,
    1//2 * q^3 - 3//2 * q - 1,
    1//3 * q^3 - 1//3 * q,
  ])
charinfo = Vector{Any}[[[1, 1, 1]], [[2, 1]], [[3]]]
chardegree = R.([q^3, (q - 1) * q, 1])

information = raw"""- Information about the tables of unipotent characters for $\mathrm{GU}_3(q)$.

- CHEVIE-name of the table: `uniGU3`

- This table is computed with general programs written by F.Luebeck.
  They compute the Deligne-Lusztig characters R_T^G(1) and find the
  unipotent characters as linear combinations of them.
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

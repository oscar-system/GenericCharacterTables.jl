using GenericCharacterTables
import GenericCharacterTablesSimpleCharTable
using GenericCharacterTablesscar
R, q = polynomial_ring(QQ, "q")

order = (q - 1)^3 * (q^2 + q + 1) * q^3 * (q + 1)
table = QQPolyRingElem[[
  (q + 1) * (q^2 + q + 1),
  2 * q + 1,
  R(1)] [
  -(q - 1) * (q^2 + q + 1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1),
  1 - q,
  R(1)]]
classinfo = Vector{Any}[[[[1, 1, 1]]], [[[2, 1]]], [[[3]]]]
classlength =
  R.([1, (q - 1) * (q^2 + q + 1) * (q + 1), (q - 1)^2 * (q^2 + q + 1) * q * (q + 1)])
classtypeorder = R.([1, 1, 1])
charinfo = Vector{Any}[[[1, 1, 1]], [[2, 1]], [[3]]]
chardegree = R.([(q + 1) * (q^2 + q + 1), -(q - 1) * (q^2 + q + 1), (q - 1)^2 * (q + 1)])

information = raw"""The Green functions of $\mathrm{GL}_3(q)$.

- These Green functions were introduced in: [Gre55](@cite).

- See also: [Ste51](@cite).

- This CHEVIE-table is computed by an algorithm from [LS78](@cite).
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

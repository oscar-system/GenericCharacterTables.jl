using GenericCharacterTables
import GenericCharacterTablesSimpleCharTable
using GenericCharacterTablesscar
R, q = polynomial_ring(QQ, "q")

order = (q - 1)^2 * (q + 1) * q
table = QQPolyRingElem[[
  q + 1,
  R(1)] [
  1 - q,
  R(1)]]
classinfo = Vector{Any}[[[[1, 1]]], [[[2]]]]
classlength = R.([1, (q - 1) * (q + 1)])
classtypeorder = R.([1, 1])
charinfo = Vector{Any}[[[1, 1]], [[2]]]
chardegree = R.([q + 1, 1 - q])

information = raw"""The Green functions of $\mathrm{GL}_2(q)$.

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

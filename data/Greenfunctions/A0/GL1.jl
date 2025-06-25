using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q - 1
table = QQPolyRingElem[R(1)]
classinfo = Vector{Any}[[[[1]]]]
classlength = R.([1])
classtypeorder = R.([1])
charinfo = Vector{Any}[[[1]]]
chardegree = R.([1])

information = raw"""The Green functions of $\mathrm{GL}_1(q)$.

- These Green functions were introduced in: [Gre55](@cite).

- See also: [Ste51](@cite).

- This CHEVIE-table is computed by an algorithm from [LS78](@cite).
"""

SimpleCharTable(
  order,
  reshape(table, 1, 1),
  classinfo,
  classlength,
  classtypeorder,
  charinfo,
  chardegree,
  R,
  information,
  splitext(basename(@__FILE__))[1],
)

using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
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

information = raw"""- Information about the tables of Green functions for $\mathrm{GL}_3(q)$.

- CHEVIE-name of the table: `GL3green`

- These Green functions were introduced in: [Gre55](@cite).

- See also: [Ste51](@cite).

- This CHEVIE-table is computed by an algorithm from [LS78](@cite).

- The program which generates the files with the Green functions 
  of $\mathrm{GL}_n(q)$ and $\mathrm{GU}_n(q)$ is part of the CHEVIE-system. You 
  can reproduce them with the CHEVIE commands: 
  > GreenFunctionsA(n,filename);
  > GreenFunctions2A(n,filename);
  (see the corresponding help)
  These programs are written by U. Porsch and F. Luebeck.
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

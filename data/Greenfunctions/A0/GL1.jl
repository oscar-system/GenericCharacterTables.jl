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

information = raw"""- Information about the tables of Green functions for $\mathrm{GL}_1(q)$.

- CHEVIE-name of the table: `GL1green`

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

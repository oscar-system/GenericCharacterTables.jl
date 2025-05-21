using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = (q + 1)^3 * (q^2 - q + 1) * q^3 * (q - 1)
table = QQPolyRingElem[[
  -(q - 1) * (q^2 - q + 1),
  -2 * q + 1,
  R(1)] [
  (q + 1) * (q^2 - q + 1),
  R(1),
  R(1)] [
  -(q + 1)^2 * (q - 1),
  q + 1,
  R(1)]]
classinfo = Vector{Any}[[[[1, 1, 1]]], [[[2, 1]]], [[[3]]]]
classlength =
  R.([1, (q + 1) * (q^2 - q + 1) * (q - 1), (q - 1) * q * (q^2 - q + 1) * (q + 1)^2])
classtypeorder = R.([1, 1, 1])
charinfo = Vector{Any}[[[1, 1, 1]], [[2, 1]], [[3]]]
chardegree = R.([-(q - 1) * (q^2 - q + 1), (q + 1) * (q^2 - q + 1), -(q + 1)^2 * (q - 1)])

information = raw"""The Green functions of $\mathrm{GU}_3(q)$.

- By a theorem of Hotta, Springer and Kawanaka we can get the Green
  functions of the unitary group $\mathrm{GU}_3(q^2)$ from those of $\mathrm{GL}_3(q)$
  by substituting $q$ by $-q$. This is proved in [HS77](@cite) and [Kaw85](@cite).

- See also: [DM87*1](@cite).

- For the computation of the Green functions for $\mathrm{GL}_n(q)$ see for example:
  > GreenFunTab(GL2);
  > PrintInfoTab(GL2green);
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

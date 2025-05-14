using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = (q + 1)^5 * (q^4 - q^3 + q^2 - q + 1) * q^10 * (q - 1)^2 * (q^2 + 1) * (q^2 - q + 1)
table = QQPolyRingElem[[
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2,
  (q - 1) * (q^2 - q + 1) * (4 * q^3 - 3 * q^2 + 2 * q - 1),
  (q - 1) * (5 * q^3 - 6 * q^2 + 3 * q - 1),
  -(q - 1) * (6 * q^2 - 3 * q + 1),
  5 * q^2 - 4 * q + 1,
  -4 * q + 1,
  R(1)] [
  -(q + 1) * (q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
  -(q^2 - q + 1) * (2 * q^4 + q^3 - q^2 + q - 1),
  -(q - 1) * (q^3 + 2 * q^2 - q + 1),
  3 * q^2 - 2 * q + 1,
  (q - 1)^2,
  -2 * q + 1,
  R(1)] [
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^2 - q + 1) * (q^2 + 1),
  q^4 + q^3 + q^2 + 1,
  (q + 1) * (2 * q^2 - q + 1),
  q^2 + 1,
  R(1),
  R(1)] [
  (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
  (q + 1) * (q - 1) * (q^4 + q^3 - q^2 + q - 1),
  -(q - 1) * (q + 1) * (q^2 - q + 1),
  -q + 1,
  -q^2 - q + 1,
  -q + 1,
  R(1)] [
  -(q - 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  (q^4 - q^3 + q^2 - q + 1) * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + q + 1),
  q + 1,
  q^2 + q + 1,
  q + 1,
  R(1)] [
  -(q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^3 - q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1)] [
  (q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1)]]
classinfo = Vector{Any}[
  [[[1, 1, 1, 1, 1]]],
  [[[2, 1, 1, 1]]],
  [[[2, 2, 1]]],
  [[[3, 1, 1]]],
  [[[3, 2]]],
  [[[4, 1]]],
  [[[5]]],
]
classlength =
  R.([
    1,
    (q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q - 1) * (q^2 + 1),
    (q + 1)^2 * (q^4 - q^3 + q^2 - q + 1) * q * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
    (q + 1)^2 * (q^4 - q^3 + q^2 - q + 1) * q^3 * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
    (q + 1)^3 * (q^4 - q^3 + q^2 - q + 1) * q^3 * (q - 1)^2 * (q^2 + 1) * (q^2 - q + 1),
    (q + 1)^3 * (q^4 - q^3 + q^2 - q + 1) * q^5 * (q - 1)^2 * (q^2 + 1) * (q^2 - q + 1),
    (q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * q^6 * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^4])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  [[1, 1, 1, 1, 1]], [[2, 1, 1, 1]], [[2, 2, 1]], [[3, 1, 1]], [[3, 2]], [[4, 1]], [[5]]
]
chardegree =
  R.([
    (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2,
    -(q + 1) * (q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^2,
    (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
    -(q - 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
    -(q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
    (q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^4])

information = raw"""- Information about the tables of Green functions for $\mathrm{GU}_5(q)$.

- CHEVIE-name of the table: `GU5green`

- By a theorem of Hotta, Springer and Kawanaka we can get the Green
  functions of the unitary group $\mathrm{GU}_5(q^2)$ from those of $\mathrm{GL}_5(q)$
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

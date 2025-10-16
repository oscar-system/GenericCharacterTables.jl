using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = (q + 1)^4 * (q - 1)^2 * (q^2 + 1) * q^6 * (q^2 - q + 1)
table = QQPolyRingElem[[
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2,
  -(q - 1) * (3 * q^2 - 2 * q + 1),
  (q - 1) * (2 * q - 1),
  -3 * q + 1,
  R(1)] [
  -(q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
  q^3 + q^2 - q + 1,
  -q + 1,
  -q + 1,
  R(1)] [
  (q^2 + 1) * (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1),
  2 * q^2 + q + 1,
  q + 1,
  R(1)] [
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1)] [
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1)]]
classinfo = Vector{Any}[[[[1, 1, 1, 1]]], [[[2, 1, 1]]], [[[2, 2]]], [[[3, 1]]], [[[4]]]]
classlength =
  R.([
    1,
    (q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
    (q + 1)^2 * (q - 1) * (q^2 + 1) * q * (q^2 - q + 1),
    (q^2 + 1) * (q - 1)^2 * (q + 1)^2 * q^2 * (q^2 - q + 1),
    (q^2 - q + 1) * q^3 * (q^2 + 1) * (q - 1)^2 * (q + 1)^3])
classtypeorder = R.([1, 1, 1, 1, 1])
charinfo = Vector{Any}[[[1, 1, 1, 1]], [[2, 1, 1]], [[2, 2]], [[3, 1]], [[4]]]
chardegree =
  R.([
    (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2,
    -(q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
    (q^2 + 1) * (q^2 - q + 1) * (q + 1)^2,
    (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
    -(q - 1) * (q^2 - q + 1) * (q + 1)^3])

information = raw"""The Green functions of $\mathrm{GU}_4(q)$.

- By a theorem of Hotta, Springer and Kawanaka we can get the Green
  functions of the unitary group $\mathrm{GU}_4(q^2)$ from those of $\mathrm{GL}_4(q)$
  by substituting $q$ by $-q$. This is proved in [HS77](@cite) and [Kaw85](@cite).

- See also: [DM87*1](@cite).
"""

TABLE = SimpleCharTable(
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

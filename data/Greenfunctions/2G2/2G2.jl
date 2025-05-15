using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
K, sqrt3 = quadratic_field(3)
R, q = polynomial_ring(K, "q")

order = q^6 * (q^2 - 1) * (q^2 + 1) * (q^4 - q^2 + 1)
table = [[
  (q^2 + 1) * (q^4 - q^2 + 1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  -(q^2 - 1) * (q^4 - q^2 + 1),
  -2 * q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  -(q^4 - 1) * (q^2 - sqrt3 * q + 1),
  q^2 - sqrt3 * q + 1,
  -sqrt3 * q + 1,
  -sqrt3 * q + 1,
  R(1),
  R(1),
  R(1)] [
  -(q^4 - 1) * (q^2 + sqrt3 * q + 1),
  q^2 + sqrt3 * q + 1,
  sqrt3 * q + 1,
  sqrt3 * q + 1,
  R(1),
  R(1),
  R(1)]]
classinfo = Vector{Any}[[], [], [], [], [], [], []]
classlength =
  R.([
    1,
    (q^2 - 1) * (q^2 + 1) * (q^4 - q^2 + 1),
    1//2 * q^2 * (q^2 - 1) * (q^2 + 1) * (q^4 - q^2 + 1),
    1//2 * q^2 * (q^2 - 1) * (q^2 + 1) * (q^4 - q^2 + 1),
    1//3 * q^4 * (q^2 - 1) * (q^2 + 1) * (q^4 - q^2 + 1),
    1//3 * q^4 * (q^2 - 1) * (q^2 + 1) * (q^4 - q^2 + 1),
    1//3 * q^4 * (q^2 - 1) * (q^2 + 1) * (q^4 - q^2 + 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[["T_1"], ["T_2"], ["T_3"], ["T_4"]]
chardegree =
  R.([
    (q^2 + 1) * (q^4 - q^2 + 1),
    -(q^2 - 1) * (q^4 - q^2 + 1),
    -(q^4 - 1) * (q^2 - sqrt3 * q + 1),
    -(q^4 - 1) * (q^2 + sqrt3 * q + 1),
  ])

information = raw"""- Information about the Green functions of $^2\mathrm{G}_2(q^2)$.

- CHEVIE-name of the table: `2G2green`

- The table was first computed in [War66](@cite).
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

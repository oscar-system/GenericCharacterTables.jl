using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
K, sqrt2 = quadratic_field(2)
R, q = polynomial_ring(K, "q")

order = q^4 * (q^2 - 1) * (q^4 + 1)
table = [[
  q^4 + 1,
  R(1),
  R(1),
  R(1)] [
  -(q^2 - 1) * (q^2 - sqrt2 * q + 1),
  -sqrt2 * q + 1,
  R(1),
  R(1)] [
  -(q^2 - 1) * (q^2 + sqrt2 * q + 1),
  sqrt2 * q + 1,
  R(1),
  R(1)]]
classinfo = Vector{Any}[[], [], [], []]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^4 + 1),
    1//2 * q^2 * (q - 1) * (q + 1) * (q^4 + 1),
    1//2 * q^2 * (q - 1) * (q + 1) * (q^4 + 1),
  ])
classtypeorder = R.([1, 1, 1, 1])
charinfo = Vector{Any}[["T_1"], ["T_2"], ["T_3"]]
chardegree =
  R.([q^4 + 1, -(q^2 - 1) * (q^2 - sqrt2 * q + 1), -(q^2 - 1) * (q^2 + sqrt2 * q + 1)])

information = raw"""The Green functions of $^2\mathrm{B}_2(q^2)$.

- The table was first computed in [Suz62](@cite).
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

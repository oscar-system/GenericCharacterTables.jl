using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^4 * (q - 1)^3 * (q + 1)^2 * (q^2 + 1)
table = QQPolyRingElem[[
  (1 + q)^2 * (1 + q^2),
  (1 + q)^2,
  1 + 3 * q,
  1 + q,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  1 + q^2,
  1 - q,
  1 + q,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1),
  1 - q^2,
  1 + q,
  1 - q,
  R(1)] [
  (q - 1)^2 * (q^2 + 1),
  (q - 1)^2,
  1 - q,
  1 - 3 * q,
  R(1)] [
  (q - 1)^2 * (q + 1)^2,
  1 - q^2,
  1 - q,
  1 + q,
  R(1)]]
classinfo = Vector{Any}[["A0"], ["A1"], ["A21"], ["A22"], ["A3"]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 + 1),
    1//2 * q * (q - 1) * (q + 1)^2 * (q^2 + 1),
    1//2 * q * (q - 1)^2 * (q + 1) * (q^2 + 1),
    q^2 * (q - 1)^2 * (q + 1)^2 * (q^2 + 1)])
classtypeorder = R.([1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  [[[1, 1], []]], [[[1], [1]]], [[[2], []]], [[[], [1, 1]]], [[[], [2]]]
]
chardegree =
  R.([
    (q + 1)^2 * (q^2 + 1),
    -(q - 1) * (q + 1) * (q^2 + 1),
    -(q - 1) * (q + 1) * (q^2 + 1),
    (q - 1)^2 * (q^2 + 1),
    (q - 1)^2 * (q + 1)^2,
  ])

information = raw"""- Information about the tables of Green functions for CSp_4(q), q odd.

- CHEVIE-name of the table: C2n2green

- The generic character table of CSp_4(q), q odd, and hence its Green 
  functions were computed in:
  {\sc K.~Shinoda}, The Characters of the Finite Conformal Symplectic
  Group CSp(4,q), {\em Comm. Alg.} {\bf 10(13)} (1982), 1369--1419.

- They can also be read off the table of Sp_4(q), q odd, computed in:
  {\sc B.~Srinivasan}, The characters of the finite symplectic group
  $Sp(4,q)$, {\em Trans. Amer. Math. Soc.} {\bf 131} (1968), 488--525.

- See also:
  {\sc L.~Lambe and B.~Srinivasan}, A computation of Green functions for
  some classical groups, {\em Comm. Alg.} {\bf 18(10)} (1990), 3507--3545.

- The names of the unipotent classes are taken from the article of Shinoda.
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

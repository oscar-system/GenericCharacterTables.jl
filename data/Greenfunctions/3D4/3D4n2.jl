using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^12 * (q^8 + q^4 + 1) * (q^6 - 1) * (q^2 - 1)
table = QQPolyRingElem[[
  (q^2 + q + 1) * (q^4 - q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
  (q + 1) * (q^2 - q + 1) * (q^4 + q + 1),
  (q + 1) * (2 * q^3 + 1),
  2 * q^3 + q^2 + q + 1,
  (2 * q + 1) * (q^2 - q + 1),
  q + 1,
  R(1)] [
  -(q^4 - q^2 + 1) * (q^2 - q + 1)^2 * (q + 1) * (q^2 + q + 1) * (q - 1),
  q^7 + q^3 - q + 1,
  -q + 1,
  -q^2 - q + 1,
  q^2 - q + 1,
  -q + 1,
  R(1)] [
  -(q^4 - q^2 + 1) * (q^2 + q + 1)^2 * (q - 1) * (q^2 - q + 1) * (q + 1),
  -q^7 - q^3 + q + 1,
  q + 1,
  q^2 + q + 1,
  -q^2 + q + 1,
  q + 1,
  R(1)] [
  (q^4 - q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 - q + 1) * (2 * q^3 - q^2 - q + 1),
  -(q + 1) * (q - 1)^3,
  5 * q^3 - 2 * q^2 - 2 * q + 1,
  -(q - 1) * (q^2 - q + 1),
  -2 * q + 1,
  R(1)] [
  (q^4 - q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (2 * q^3 + q^2 - q - 1),
  -(q - 1) * (q + 1)^3,
  (q + 1) * (q^2 + q + 1),
  -5 * q^3 - 2 * q^2 + 2 * q + 1,
  2 * q + 1,
  R(1)] [
  (q + 1)^2 * (q - 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^2 + 1),
  -(q - 1) * (q^2 + q + 1),
  (q + 1) * (q^2 - q + 1),
  R(1),
  R(1)] [
  (q^2 - q + 1) * (q^4 - q^2 + 1) * (q - 1)^2 * (q^2 + q + 1)^2,
  -(q - 1) * (q^2 + q + 1) * (q^4 - q + 1),
  (q - 1) * (2 * q^3 - 1),
  -(2 * q - 1) * (q^2 + q + 1),
  -2 * q^3 + q^2 - q + 1,
  -q + 1,
  R(1)]]
classinfo = Vector{Any}[
  ["\\emptyset"], ["A1"], ["3A1"], ["A2'"], ["A2''"], ["D4(a1)"], ["D4"]
]
classlength =
  R.([
    1,
    (q^2 - 1) * (q^8 + q^4 + 1),
    q^2 * (q^6 - 1) * (q^8 + q^4 + 1),
    q^4 * (q^8 + q^4 + 1) * (q^2 - 1)^2 * (q^2 - q + 1) * 1//2,
    q^4 * (q^8 + q^4 + 1) * (q^2 - 1)^2 * (q^2 + q + 1) * 1//2,
    q^6 * (q^2 - 1) * (q^6 - 1) * (q^8 + q^4 + 1),
    q^8 * (q^2 - 1) * (q^6 - 1) * (q^8 + q^4 + 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  ["~A_2"], ["~A_2+A_1"], ["C_3"], ["~A_2+A_2"], ["F_4(a_1)"], ["F_4"], ["C_3+A_1"]
]
chardegree =
  R.([
    (q^2 + q + 1) * (q^4 - q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
    -(q^4 - q^2 + 1) * (q^2 - q + 1)^2 * (q + 1) * (q^2 + q + 1) * (q - 1),
    -(q^4 - q^2 + 1) * (q^2 + q + 1)^2 * (q - 1) * (q^2 - q + 1) * (q + 1),
    (q^4 - q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1)^2,
    (q^4 - q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2,
    (q + 1)^2 * (q - 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1)^2,
    (q^2 - q + 1) * (q^4 - q^2 + 1) * (q - 1)^2 * (q^2 + q + 1)^2])

information = raw"""- Information about the Green functions of $^3D_4(q)$, $p>2$.

- CHEVIE-name of the table: ``3D4n2green``

- The table was first computed in:
  {\sc N. Spaltenstein}, Caract``eres unipotents de $^3D_4(F_q)$,
    {\em Comment. Math. Helvetici \bf57} (1982), 676--691.
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

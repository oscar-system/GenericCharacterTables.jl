using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^6 * (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^4
table = QQPolyRingElem[[
  q^6,
  R(0),
  R(0),
  R(0),
  R(0),
  -q^3,
  R(0),
  R(0),
  q^2,
  R(0),
  R(0),
  R(0),
  q^2,
  R(0),
  -q,
  R(0),
  q,
  R(0),
  R(1),
  R(-1),
  R(1),
  R(1),
  R(-1)] [
  (q^2 - q + 1) * q^3,
  q^3,
  R(0),
  R(0),
  R(0),
  q * (q^2 - q + 1),
  q,
  R(0),
  -q * (q - 2),
  q,
  q,
  R(0),
  q^2,
  R(0),
  2 * q - 1,
  R(-1),
  R(1),
  R(1),
  R(-3),
  R(1),
  R(1),
  R(0),
  R(-1)] [
  q^2 * (q^2 + 1),
  q^2,
  q^2,
  R(0),
  R(0),
  (q - 1) * q,
  -q,
  R(0),
  q^2 + 1,
  R(1),
  R(1),
  R(1),
  q^2 + 1,
  R(1),
  -q + 1,
  R(1),
  q + 1,
  R(1),
  R(2),
  R(0),
  R(2),
  R(-1),
  R(0)] [
  q * (q^2 - q + 1),
  -(q - 1) * q,
  q,
  q,
  R(0),
  -q^2 + q - 1,
  q - 1,
  R(-1),
  2 * q - 1,
  q - 1,
  q - 1,
  R(-1),
  R(1),
  R(1),
  q - 2,
  R(-2),
  q,
  R(0),
  R(-3),
  R(-1),
  R(1),
  R(0),
  R(1)] [
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1),
  R(1)]]
classinfo = Vector{Any}[
  ["^2A_3(q)", q + 1, [[1, 1, 1, 1]]],
  ["^2A_3(q)", q + 1, [[2, 1, 1]]],
  ["^2A_3(q)", q + 1, [[2, 2]]],
  ["^2A_3(q)", q + 1, [[3, 1]]],
  ["^2A_3(q)", q + 1, [[4]]],
  ["^2A_2(q)", (q + 1)^2, [[1, 1, 1]]],
  ["^2A_2(q)", (q + 1)^2, [[2, 1]]],
  ["^2A_2(q)", (q + 1)^2, [[3]]],
  ["A_1(q)+A_1(q)", (q + 1)^2, [[1, 1], [1, 1]]],
  ["A_1(q)+A_1(q)", (q + 1)^2, [[1, 1], [2]]],
  ["A_1(q)+A_1(q)", (q + 1)^2, [[2], [1, 1]]],
  ["A_1(q)+A_1(q)", (q + 1)^2, [[2], [2]]],
  ["A_1(q^2)", (q - 1) * (q + 1), [[1, 1]]],
  ["A_1(q^2)", (q - 1) * (q + 1), [[2]]],
  ["A_1(q)", (q + 1)^3, [[1, 1]]],
  ["A_1(q)", (q + 1)^3, [[2]]],
  ["A_1(q)", (q - 1) * (q + 1)^2, [[1, 1]]],
  ["A_1(q)", (q - 1) * (q + 1)^2, [[2]]],
  ["\\emptyset", (q + 1)^4, [[[1]], 1]],
  ["\\emptyset", (q - 1) * (q + 1)^3, [[[1]], 1]],
  ["\\emptyset", (q - 1)^2 * (q + 1)^2, [[[1]], 1]],
  ["\\emptyset", (q^2 - q + 1) * (q + 1)^2, [[[1]], 1]],
  ["\\emptyset", (q - 1) * (q + 1) * (q^2 + 1), [[[1]], 1]]]
classlength =
  R.([
    1,
    q^6 - q^5 + q^4 - q^2 + q - 1,
    q^8 + q^5 - q^4 - q,
    q^10 - q^9 + q^7 - 2 * q^6 + q^5 - q^3 + q^2,
    q^12 - q^10 + q^9 - q^8 - q^7 + q^6 - q^5 + q^3,
    (q - 1) * (q^2 + 1) * q^3,
    (q^4 - q^3 + q - 1) * (q - 1) * (q^2 + 1) * q^3,
    (q^6 - q^4 + q^3 - q) * (q - 1) * (q^2 + 1) * q^3,
    (q^2 + 1) * (q^2 - q + 1) * q^4,
    (q^2 - 1) * (q^2 + 1) * (q^2 - q + 1) * q^4,
    (q^2 - 1) * (q^2 + 1) * (q^2 - q + 1) * q^4,
    (q^4 - 2 * q^2 + 1) * (q^2 + 1) * (q^2 - q + 1) * q^4,
    (q^2 - q + 1) * (q + 1)^2 * q^4,
    (q^4 - 1) * (q^2 - q + 1) * (q + 1)^2 * q^4,
    (q - 1) * (q^2 + 1) * (q^2 - q + 1) * q^5,
    (q^2 - 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1) * q^5,
    (q + 1) * (q^2 + 1) * (q^2 - q + 1) * q^5,
    (q^2 - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1) * q^5,
    (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * q^6,
    (q - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1) * q^6,
    (q^2 + 1) * (q^2 - q + 1) * (q + 1)^2 * q^6,
    (q^2 + 1) * (q - 1)^2 * (q + 1)^2 * q^6,
    (q - 1) * (q^2 - q + 1) * (q + 1)^3 * q^6])
classtypeorder =
  R.([
    q + 1,
    q + 1,
    q + 1,
    q + 1,
    q + 1,
    q^2 + q,
    q^2 + q,
    q^2 + q,
    1//2 * q^2 + 1//2 * q,
    1//2 * q^2 + 1//2 * q,
    1//2 * q^2 + 1//2 * q,
    1//2 * q^2 + 1//2 * q,
    1//2 * q^2 - 1//2 * q - 1,
    1//2 * q^2 - 1//2 * q - 1,
    1//2 * q^3 - 1//2 * q,
    1//2 * q^3 - 1//2 * q,
    1//2 * q^3 - 3//2 * q - 1,
    1//2 * q^3 - 3//2 * q - 1,
    1//24 * q^4 - 1//12 * q^3 - 1//24 * q^2 + 1//12 * q,
    1//4 * q^4 - 3//4 * q^2 - 1//2 * q,
    1//8 * q^4 - 1//4 * q^3 - 5//8 * q^2 + 3//4 * q + 1,
    1//3 * q^4 + 1//3 * q^3 - 1//3 * q^2 - 1//3 * q,
    1//4 * q^4 - 1//4 * q^2])
charinfo = Vector{Any}[[[1, 1, 1, 1]], [[2, 1, 1]], [[2, 2]], [[3, 1]], [[4]]]
chardegree = R.([q^6, (q^2 - q + 1) * q^3, q^2 * (q^2 + 1), q * (q^2 - q + 1), 1])

information = raw"""- Information about the tables of unipotent characters for GU_4(q).

- CHEVIE-name of the table: uniGU4

- This table is computed with general programs written by F.Luebeck.
  They compute the Deligne-Lusztig characters R_T^G(1) and find the
  unipotent characters as linear combinations of them.
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

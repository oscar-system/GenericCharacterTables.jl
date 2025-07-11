using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^9 * (q - 1)^4 * (q + 1)^3 * (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1)
table = QQPolyRingElem[[
  (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1),
  (q + 1) * (5 * q^3 + 4 * q^2 + 2 * q + 1),
  (q^2 + q + 1) * (q + 1)^2,
  (q + 1) * (3 * q^2 + 2 * q + 1),
  (q + 1) * (3 * q + 1),
  (q + 1) * (2 * q + 1),
  4 * q + 1,
  2 * q + 1,
  R(1)] [
  -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q + 1)^2 * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1) * (3 * q^3 + 2 * q^2 + 2 * q + 1),
  (q + 1) * (q^3 + 2 * q^2 + 1),
  (q + 1) * (q^2 + 1),
  -(q - 1) * (q + 1),
  2 * q^2 + q + 1,
  R(1),
  2 * q + 1,
  R(1)] [
  -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1),
  -(q + 1) * (q^3 - 2 * q^2 - 1),
  -(q + 1) * (q - 1) * (q^2 + q + 1),
  -q^3 + q^2 + q + 1,
  (q + 1)^2,
  q + 1,
  2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q - 1)^2 * (q^2 + q + 1) * (q^2 + 1),
  (q - 1) * (q^3 - 2 * q^2 - 1),
  -(q + 1) * (3 * q^3 - 2 * q^2 + 2 * q - 1),
  -(q - 1) * (q^2 + 1),
  -(q - 1) * (q + 1),
  2 * q^2 - q + 1,
  R(1),
  -2 * q + 1,
  R(1)] [
  (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1),
  -(q + 1) * (q - 1) * (q^2 - q + 1),
  -(q - 1) * (q^3 + 2 * q^2 + 1),
  q^3 + q^2 - q + 1,
  (q - 1)^2,
  -q + 1,
  -2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^3 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1)^3 * (q^2 - q + 1),
  (q + 1) * (q - 1) * (q^2 - q - 1),
  (q^2 - q + 1) * (q + 1)^2,
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1),
  q + 1,
  R(1),
  2 * q + 1,
  R(1)] [
  (q - 1)^2 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  -(q - 1) * (q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1),
  q + 1,
  -(q - 1) * (q + 1),
  q + 1,
  -q + 1,
  R(1)] [
  -(q - 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
  (q - 1)^2 * (q^2 + 1) * (q^2 - q + 1),
  (q^2 - q + 1) * (q - 1)^2,
  (q - 1) * (5 * q^3 - 4 * q^2 + 2 * q - 1),
  -(q - 1) * (3 * q^2 - 2 * q + 1),
  (3 * q - 1) * (q - 1),
  (q - 1) * (2 * q - 1),
  -4 * q + 1,
  -2 * q + 1,
  R(1)] [
  -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1)^3 * (q + 1) * (q^2 + q + 1),
  (q^2 + q + 1) * (q - 1)^2,
  (q + 1) * (q - 1) * (q^2 + q - 1),
  (q + 1) * (q - 1)^2,
  -(q - 1) * (q + 1),
  -q + 1,
  R(1),
  -2 * q + 1,
  R(1)] [
  -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + 1),
  -(q - 1) * (q + 1),
  -q + 1,
  -(q - 1) * (q + 1),
  -q + 1,
  q + 1,
  R(1)]]
classinfo = Vector{Any}[
  ["[1,1,1,1,1,1]"],
  ["[2,1,1,1,1]"],
  ["[2,2,1,1]"],
  ["[2,2,1,1]"],
  ["[2,2,2]"],
  ["[4,1,1]"],
  ["[3,3]"],
  ["[4,2]"],
  ["[4,2]'"],
  ["[6]"]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + q + 1),
    1//2 * q * (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q + 1)^2 * (q^2 + 1),
    1//2 * q * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^2 * (q^2 + 1),
    q^2 * (q + 1)^2 * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1),
    q^4 * (q + 1)^2 * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1),
    q^4 * (q + 1)^2 * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1),
    1//2 * q^4 * (q - 1)^3 * (q + 1)^3 * (q^2 - q + 1) * (q^2 + q + 1) * (q^2 + 1),
    1//2 * q^4 * (q - 1)^3 * (q + 1)^3 * (q^2 - q + 1) * (q^2 + q + 1) * (q^2 + 1),
    q^6 * (q - 1)^3 * (q + 1)^3 * (q^2 - q + 1) * (q^2 + q + 1) * (q^2 + 1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  [[[1, 1, 1], []]],
  [[[1, 1], [1]]],
  [[[2, 1], []]],
  [[[1], [1, 1]]],
  [[[2], [1]]],
  [[[1], [2]]],
  [[[3], []]],
  [[[], [1, 1, 1]]],
  [[[], [2, 1]]],
  [[[], [3]]]]
chardegree =
  R.([
    (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1)^3 * (q^2 + q + 1) * (q^2 - q + 1),
    (q - 1)^2 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1),
    -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
    -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1)])

information = raw"""The Green functions of $\mathrm{CSp}_6(q)$, $q$ odd.

- These Green functions are computed in [LS90](@cite).
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

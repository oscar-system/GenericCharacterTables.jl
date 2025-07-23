using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^28 - q^26 - q^22 + q^18 + q^14 - q^12
table = QQPolyRingElem[[
  q^12 + 2 * q^11 + 3 * q^10 + 4 * q^9 + 5 * q^8 + 6 * q^7 + 6 * q^6 + 6 * q^5 + 5 * q^4 +
  4 * q^3 + 3 * q^2 + 2 * q + 1,
  2 * q^7 + 3 * q^6 + 4 * q^5 + 5 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q + 1,
  3 * q^6 + 4 * q^5 + 5 * q^4 + 6 * q^3 + 3 * q^2 + 2 * q + 1,
  2 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q + 1,
  4 * q^3 + 5 * q^2 + 2 * q + 1,
  4 * q^3 + q^2 + 2 * q + 1,
  3 * q^2 + 2 * q + 1,
  2 * q + 1,
  q^0] [
  q^12 - 2 * q^11 + 3 * q^10 - 4 * q^9 + 5 * q^8 - 6 * q^7 + 6 * q^6 - 6 * q^5 + 5 * q^4 -
  4 * q^3 + 3 * q^2 - 2 * q + 1,
  -2 * q^7 + 3 * q^6 - 4 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1,
  3 * q^6 - 4 * q^5 + 5 * q^4 - 6 * q^3 + 3 * q^2 - 2 * q + 1,
  2 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1,
  -4 * q^3 + q^2 - 2 * q + 1,
  -4 * q^3 + 5 * q^2 - 2 * q + 1,
  3 * q^2 - 2 * q + 1,
  -2 * q + 1,
  q^0] [
  -q^12 - 2 * q^11 - q^10 - q^8 - 2 * q^7 + 2 * q^5 + q^4 + q^2 + 2 * q + 1,
  -2 * q^7 - 3 * q^6 + q^4 + q^2 + 2 * q + 1,
  -q^6 + 3 * q^4 + 2 * q^3 + q^2 + 2 * q + 1,
  q^2 + 2 * q + 1,
  2 * q^3 + 3 * q^2 + 2 * q + 1,
  -2 * q^3 - q^2 + 2 * q + 1,
  q^2 + 2 * q + 1,
  2 * q + 1,
  q^0] [
  -q^12 - q^10 - q^8 + q^4 + q^2 + 1,
  q^6 + q^4 + q^2 + 1,
  -q^6 - q^4 + q^2 + 1,
  q^2 + 1,
  -2 * q^3 + q^2 + 1,
  2 * q^3 + q^2 + 1,
  q^2 + 1,
  q^0,
  q^0] [
  -q^12 + 2 * q^11 - q^10 - q^8 + 2 * q^7 - 2 * q^5 + q^4 + q^2 - 2 * q + 1,
  2 * q^7 - 3 * q^6 + q^4 + q^2 - 2 * q + 1,
  -q^6 + 3 * q^4 - 2 * q^3 + q^2 - 2 * q + 1,
  q^2 - 2 * q + 1,
  2 * q^3 - q^2 - 2 * q + 1,
  -2 * q^3 + 3 * q^2 - 2 * q + 1,
  q^2 - 2 * q + 1,
  -2 * q + 1,
  q^0] [
  q^12 - q^10 + q^8 - 2 * q^6 + q^4 - q^2 + 1,
  -q^6 + q^4 - q^2 + 1,
  -q^6 + q^4 - q^2 + 1,
  2 * q^4 - q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  q^0,
  q^0] [
  q^12 + q^11 - q^9 - q^8 - q^4 - q^3 + q + 1,
  q^7 - q^5 - q^4 - q^3 + q + 1,
  -q^5 - q^4 + q + 1,
  -q^4 - q^3 + q + 1,
  -q^3 + q^2 + q + 1,
  -q^3 - q^2 + q + 1,
  q + 1,
  q + 1,
  q^0] [
  q^12 - q^11 + q^9 - q^8 - q^4 + q^3 - q + 1,
  -q^7 + q^5 - q^4 + q^3 - q + 1,
  q^5 - q^4 - q + 1,
  -q^4 + q^3 - q + 1,
  q^3 - q^2 - q + 1,
  q^3 + q^2 - q + 1,
  -q + 1,
  -q + 1,
  q^0] [
  -q^12 + q^10 + q^8 - q^4 - q^2 + 1,
  q^6 - q^4 - q^2 + 1,
  q^6 - q^4 - q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  -q^2 + 1,
  q^0,
  q^0]]
classinfo = Vector{Any}[
  [[1, 1, 1, 1, 1, 1, 1, 1]],
  [[2, 2, 1, 1, 1, 1]],
  [[3, 1, 1, 1, 1, 1]],
  [[3, 2, 2, 1]],
  [[[3, 3, 1, 1]], 1],
  [[[3, 3, 1, 1]], 2],
  [[5, 1, 1, 1]],
  [[5, 3]],
  [[7, 1]]]
classlength =
  R.([
    q^0,
    q^10 + q^6 - q^4 - 1,
    q^12 + q^8 - q^6 - q^2,
    q^16 - q^10 - q^8 + q^2,
    (1//2) * q^18 + (-1//2) * q^12 + (-1//2) * q^10 + (1//2) * q^4,
    (1//2) * q^18 + (-1//2) * q^12 + (-1//2) * q^10 + (1//2) * q^4,
    q^20 - q^14 - q^12 + q^6,
    q^22 - q^20 - q^16 + q^12 + q^8 - q^6,
    q^24 - q^22 - q^18 + q^14 + q^10 - q^8])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[ # TODO
  [["D", 0], [[1, 1, 1], [1]]],
  [["D", 0], [[1], [1, 1, 1]]],
  [["D", 0], [[1, 1], [2]]],
  [["D", 0], [[2, 1], [1]]],
  [["D", 0], [[], [2, 1, 1]]],
  [["D", 0], [[2], [2]]],
  [["D", 0], [[1], [3]]],
  [["D", 0], [[3], [1]]],
  [["D", 0], [[], [4]]]]

chardegree = R.([0, 0, 0, 0, 0, 0, 0, 0, 0])

information = raw"""The Green functions of $\mathrm{O}_8^-(q)$ with odd $q$.

- This table of generalized Green functions is computed by F. Lübeck
  using Lusztig's algorithm.`,`
- The occuring Levi subgroups have the following relative (twisted)
  Weyl groups: $L$ of type $D_0$ and $N(L)/L$ of type ${}^2D_4$.
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

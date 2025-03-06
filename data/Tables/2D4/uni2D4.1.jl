using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = q^12 * (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^4 * (q + 1)^4
table = QQPolyRingElem[[
  q^12,
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  q^4,
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  q^4,
  R(0),
  R(0),
  q^6,
  R(0),
  R(0),
  R(0),
  R(0),
  q^6,
  R(0),
  R(0),
  R(0),
  R(0),
  q^3,
  R(0),
  R(0),
  R(0),
  -q^3,
  R(0),
  R(0),
  R(0),
  q^3,
  R(0),
  R(0),
  -q^3,
  R(0),
  R(0),
  q^2,
  R(0),
  R(0),
  R(0),
  -q^2,
  R(0),
  R(0),
  R(0),
  q^2,
  R(0),
  -q^2,
  R(0),
  q^2,
  R(0),
  q,
  R(0),
  -q,
  R(0),
  -q,
  R(0),
  q,
  R(0),
  R(1),
  R(1),
  R(-1),
  R(-1),
  R(-1),
  R(1),
  R(1),
  R(1),
  R(-1)] [
  q^7 * (q^4 + 1),
  q^7,
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  2 * q^3,
  R(0),
  q^3,
  R(0),
  q^3,
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  -q^3 * (q^3 - q^2 - q - 1),
  q^3,
  R(0),
  R(0),
  R(0),
  q^3 * (q^3 + q^2 - q + 1),
  q^3,
  R(0),
  R(0),
  R(0),
  q^2 * (q + 1),
  q^2,
  R(0),
  R(0),
  q^2 * (q - 1),
  -q^2,
  R(0),
  R(0),
  q * (q + 1),
  q,
  R(0),
  -q * (q - 1),
  q,
  R(0),
  2 * q,
  q,
  q,
  R(0),
  -2 * q,
  -q,
  -q,
  R(0),
  2 * q^2,
  R(0),
  R(0),
  R(0),
  -2 * q^2,
  R(0),
  q + 1,
  R(1),
  -q - 1,
  R(-1),
  q - 1,
  R(-1),
  -q + 1,
  R(1),
  R(2),
  R(-2),
  R(-2),
  R(0),
  R(2),
  R(0),
  R(1),
  R(-1),
  R(0)] [
  q^6 * (q^2 - q + 1) * (q^2 + q + 1),
  q^6,
  q^6,
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  q^2 * (q^2 + 2),
  q^2,
  q^2,
  R(0),
  q^2,
  R(0),
  q^2,
  R(0),
  R(0),
  -q^4,
  R(0),
  R(0),
  q^2 * (q^2 - q + 1) * (q^2 + q + 1),
  q^2,
  q^2,
  R(0),
  R(0),
  q^2 * (q^2 - q + 1) * (q^2 + q + 1),
  q^2,
  q^2,
  R(0),
  R(0),
  q * (q^2 + q + 1),
  q^2,
  q,
  R(0),
  -q * (q^2 - q + 1),
  q^2,
  -q,
  R(0),
  q * (q^2 + q + 1),
  q,
  R(0),
  -q * (q^2 - q + 1),
  -q,
  R(0),
  2 * q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(-1),
  R(-1),
  R(-1),
  R(-1),
  2 * q^2 + 1,
  R(1),
  R(-1),
  R(-1),
  2 * q^2 + 1,
  R(1),
  2 * q + 1,
  R(1),
  R(-1),
  R(-1),
  -2 * q + 1,
  R(1),
  R(-1),
  R(-1),
  R(3),
  R(3),
  R(-1),
  R(-1),
  R(-1),
  R(-1),
  R(0),
  R(0),
  R(1)] [
  1//2 * q^3 * (q^2 + q + 1) * (q^4 + 1),
  1//2 * q^3 * (q + 1) * (q^2 + 1),
  1//2 * q^3 * (q^2 + 1),
  1//2 * q^3 * (q + 1),
  R(0),
  q^3,
  R(0),
  R(0),
  R(0),
  1//2 * q^4 + 1//2 + q^3 + q,
  1//2 + q - 1//2 * q^2,
  1//2 * (q + 1) * (q^2 + 1),
  1//2 * q + 1//2,
  1//2 * (q + 1) * (q^2 + 1),
  1//2 * q + 1//2,
  1//2 + 1//2 * q^2,
  -1//2 * (q - 1) * (q + 1),
  1//2 + 1//2 * q^2,
  1//2 * q^4 + 1//2,
  -1//2 * (q - 1) * (q + 1),
  1//2 + 1//2 * q^2,
  q * (q^2 + q + 1),
  q * (q + 1),
  q,
  q,
  R(0),
  q^2 * (1 + q^3 + q),
  q^2 * (q + 1),
  q^2,
  R(0),
  R(0),
  q^3 + q^2 + 1,
  q^2 + 1,
  R(1),
  R(1),
  q,
  R(0),
  q,
  R(0),
  q^2 + q + 1,
  q + 1,
  R(1),
  q^3,
  R(0),
  R(0),
  2 * q + 1,
  q + 1,
  q + 1,
  R(1),
  -q^2,
  R(0),
  R(0),
  R(0),
  2 * q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(-1),
  R(-1),
  q + 2,
  R(2),
  -q,
  R(0),
  q,
  R(0),
  q,
  R(0),
  R(3),
  R(-1),
  R(-1),
  R(1),
  R(-1),
  R(1),
  R(-1),
  R(0),
  R(0)] [
  1//2 * q^3 * (q^2 - q + 1) * (q^4 + 1),
  -1//2 * q^3 * (q - 1) * (q^2 + 1),
  1//2 * q^3 * (q^2 + 1),
  -1//2 * q^3 * (q - 1),
  q^3,
  R(0),
  R(0),
  R(0),
  R(0),
  -1//2 * q^4 - 1//2 + q^3 + q,
  -1//2 + q + 1//2 * q^2,
  1//2 * (q - 1) * (q^2 + 1),
  1//2 * q - 1//2,
  1//2 * (q - 1) * (q^2 + 1),
  1//2 * q - 1//2,
  -1//2 - 1//2 * q^2,
  -1//2 - 1//2 * q^2,
  1//2 * (q - 1) * (q + 1),
  -1//2 * q^4 - 1//2,
  -1//2 - 1//2 * q^2,
  1//2 * (q - 1) * (q + 1),
  q^2 * (-1 + q^3 + q),
  q^2 * (q - 1),
  -q^2,
  R(0),
  R(0),
  q * (q^2 - q + 1),
  -q * (q - 1),
  q,
  q,
  R(0),
  q,
  R(0),
  q,
  R(0),
  q^3 - q^2 - 1,
  -q^2 - 1,
  R(-1),
  R(-1),
  q^3,
  R(0),
  R(0),
  -q^2 + q - 1,
  q - 1,
  R(-1),
  -1 + 2 * q,
  q - 1,
  q - 1,
  R(-1),
  q^2,
  R(0),
  R(0),
  R(0),
  R(1),
  R(1),
  R(-1),
  R(-1),
  -2 * q^2 - 1,
  R(-1),
  q,
  R(0),
  q,
  R(0),
  q - 2,
  R(-2),
  -q,
  R(0),
  R(1),
  R(-3),
  R(1),
  R(-1),
  R(1),
  R(-1),
  R(0),
  R(1),
  R(0)] [
  1//2 * q^3 * (q^2 + q + 1) * (q^4 + 1),
  -1//2 * q^3 * (q^3 - q^2 - q - 1),
  1//2 * q^3 * (q + 1)^2,
  1//2 * q^3 * (q + 1),
  q^3,
  R(0),
  R(0),
  R(0),
  R(0),
  1//2 * q^4 + 1//2 + q^3 + q,
  1//2 * (q + 1)^2,
  1//2 + 1//2 * q^3 + 1//2 * q - 1//2 * q^2,
  1//2 * q + 1//2,
  1//2 + 1//2 * q^3 + 1//2 * q - 1//2 * q^2,
  1//2 * q + 1//2,
  -1//2 * (q - 1) * (q + 1),
  1//2 + 1//2 * q^2,
  -1//2 * (q - 1) * (q + 1),
  1//2 * q^4 + 1//2,
  1//2 + 1//2 * q^2,
  -1//2 * (q - 1) * (q + 1),
  q^3 * (q^2 + q + 1),
  q^3,
  R(0),
  R(0),
  R(0),
  q * (q^3 + q^2 + 1),
  q,
  q * (q + 1),
  q,
  R(0),
  1 + q^3 + q,
  R(1),
  q + 1,
  R(1),
  -q^2,
  -q^2,
  R(0),
  R(0),
  q * (q^2 + q + 1),
  q,
  R(0),
  R(-1),
  R(-1),
  R(-1),
  q * (q + 2),
  q,
  q,
  R(0),
  R(1),
  R(1),
  R(1),
  R(1),
  q^2 + 2,
  R(2),
  -q^2,
  R(0),
  -q^2,
  R(0),
  2 * q + 1,
  R(1),
  R(1),
  R(1),
  R(-1),
  R(-1),
  R(1),
  R(1),
  R(3),
  R(-1),
  R(1),
  R(-1),
  R(1),
  R(1),
  R(-1),
  R(0),
  R(0)] [
  1//2 * q^3 * (q^2 - q + 1) * (q^4 + 1),
  1//2 * q^3 * (q^3 + q^2 - q + 1),
  1//2 * q^3 * (q - 1)^2,
  -1//2 * q^3 * (q - 1),
  R(0),
  q^3,
  R(0),
  R(0),
  R(0),
  -1//2 * q^4 - 1//2 + q^3 + q,
  -1//2 * (q - 1)^2,
  -1//2 + 1//2 * q^3 + 1//2 * q + 1//2 * q^2,
  1//2 * q - 1//2,
  -1//2 + 1//2 * q^3 + 1//2 * q + 1//2 * q^2,
  1//2 * q - 1//2,
  1//2 * (q - 1) * (q + 1),
  1//2 * (q - 1) * (q + 1),
  -1//2 - 1//2 * q^2,
  -1//2 * q^4 - 1//2,
  1//2 * (q - 1) * (q + 1),
  -1//2 - 1//2 * q^2,
  -q * (q^3 - q^2 - 1),
  q,
  -q * (q - 1),
  q,
  R(0),
  q^3 * (q^2 - q + 1),
  q^3,
  R(0),
  R(0),
  R(0),
  q^2,
  q^2,
  R(0),
  R(0),
  -1 + q^3 + q,
  R(-1),
  q - 1,
  R(-1),
  R(1),
  R(1),
  R(1),
  q * (q^2 - q + 1),
  q,
  R(0),
  -q * (q - 2),
  q,
  q,
  R(0),
  R(-1),
  R(-1),
  R(-1),
  R(-1),
  q^2,
  R(0),
  q^2,
  R(0),
  -q^2 - 2,
  R(-2),
  R(1),
  R(1),
  R(-1),
  R(-1),
  -1 + 2 * q,
  R(-1),
  R(-1),
  R(-1),
  R(1),
  R(-3),
  R(-1),
  R(1),
  R(-1),
  R(-1),
  R(0),
  R(1),
  R(0)] [
  q^2 * (q^2 - q + 1) * (q^2 + q + 1),
  q^2 * (q^2 + 1),
  q^2 * (q^2 + 1),
  q^2,
  q^2,
  q^2,
  q^2,
  R(0),
  R(0),
  2 * q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  R(1),
  q^2 + 1,
  R(1),
  q^2 + 1,
  R(1),
  R(1),
  R(-1),
  R(-1),
  R(-1),
  (q^2 - q + 1) * (q^2 + q + 1),
  q^2 + 1,
  q^2 + 1,
  R(1),
  R(1),
  (q^2 - q + 1) * (q^2 + q + 1),
  q^2 + 1,
  q^2 + 1,
  R(1),
  R(1),
  q^2 + q + 1,
  q^2 + 1,
  q + 1,
  R(1),
  q^2 - q + 1,
  q^2 + 1,
  -q + 1,
  R(1),
  q^2 + q + 1,
  q + 1,
  R(1),
  q^2 - q + 1,
  -q + 1,
  R(1),
  q^2 + 2,
  R(2),
  R(2),
  R(2),
  q^2,
  R(0),
  R(0),
  R(0),
  q^2 + 2,
  R(2),
  q^2,
  R(0),
  q^2 + 2,
  R(2),
  q + 2,
  R(2),
  q,
  R(0),
  -q + 2,
  R(2),
  -q,
  R(0),
  R(3),
  R(3),
  R(1),
  R(1),
  R(1),
  R(-1),
  R(0),
  R(0),
  R(-1)] [
  q * (q^4 + 1),
  q,
  q * (q^2 + 1),
  q,
  q * (q + 1),
  -q * (q - 1),
  q,
  q,
  R(0),
  2 * q,
  2 * q,
  q,
  q,
  q,
  q,
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  R(0),
  q^3 + q^2 + q - 1,
  q^2 + q - 1,
  q - 1,
  q - 1,
  R(-1),
  q^3 - q^2 + q + 1,
  -q^2 + q + 1,
  q + 1,
  q + 1,
  R(1),
  q + 1,
  R(1),
  q + 1,
  R(1),
  q - 1,
  R(-1),
  q - 1,
  R(-1),
  q * (q + 1),
  q,
  R(0),
  -q * (q - 1),
  q,
  R(0),
  2 * q,
  q,
  q,
  R(0),
  2 * q,
  q,
  q,
  R(0),
  R(2),
  R(2),
  R(0),
  R(0),
  R(-2),
  R(-2),
  q + 1,
  R(1),
  q + 1,
  R(1),
  q - 1,
  R(-1),
  q - 1,
  R(-1),
  R(2),
  R(-2),
  R(2),
  R(0),
  R(-2),
  R(0),
  R(1),
  R(-1),
  R(0)] [
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
  ["^2D_4(q)", (q - 1) * (q + 1), [[1, 1, 1, 1, 1, 1, 1, 1]]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[2, 2, 1, 1, 1, 1]]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[3, 1, 1, 1, 1, 1]]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[3, 2, 2, 1]]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[[3, 3, 1, 1]], 1]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[[3, 3, 1, 1]], 2]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[5, 1, 1, 1]]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[5, 3]]],
  ["^2D_4(q)", (q - 1) * (q + 1), [[7, 1]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[1, 1], [1, 1], [1, 1]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[1, 1], [1, 1], [2]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[1, 1], [2], [1, 1]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[1, 1], [2], [2]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[2], [1, 1], [1, 1]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[2], [1, 1], [2]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[2], [2], [1, 1]]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[[2], [2], [2]], 1]],
  ["A_1(q)+A_1(q)+A_1(q^2)", (q - 1) * (q + 1), [[[2], [2], [2]], 2]],
  ["A_1(q^4)", (q - 1) * (q + 1), [[1, 1]]],
  ["A_1(q^4)", (q - 1) * (q + 1), [[[2]], 1]],
  ["A_1(q^4)", (q - 1) * (q + 1), [[[2]], 2]],
  ["A_3(q)", (q - 1) * (q + 1)^2, [[1, 1, 1, 1]]],
  ["A_3(q)", (q - 1) * (q + 1)^2, [[2, 1, 1]]],
  ["A_3(q)", (q - 1) * (q + 1)^2, [[2, 2]]],
  ["A_3(q)", (q - 1) * (q + 1)^2, [[3, 1]]],
  ["A_3(q)", (q - 1) * (q + 1)^2, [[4]]],
  ["^2A_3(q)", (q + 1) * (q - 1)^2, [[1, 1, 1, 1]]],
  ["^2A_3(q)", (q + 1) * (q - 1)^2, [[2, 1, 1]]],
  ["^2A_3(q)", (q + 1) * (q - 1)^2, [[2, 2]]],
  ["^2A_3(q)", (q + 1) * (q - 1)^2, [[3, 1]]],
  ["^2A_3(q)", (q + 1) * (q - 1)^2, [[4]]],
  ["A_1(q^2)+A_1(q)", (q + 1) * (q - 1)^2, [[1, 1], [1, 1]]],
  ["A_1(q^2)+A_1(q)", (q + 1) * (q - 1)^2, [[1, 1], [2]]],
  ["A_1(q^2)+A_1(q)", (q + 1) * (q - 1)^2, [[2], [1, 1]]],
  ["A_1(q^2)+A_1(q)", (q + 1) * (q - 1)^2, [[2], [2]]],
  ["A_1(q^2)+A_1(q)", (q - 1) * (q + 1)^2, [[1, 1], [1, 1]]],
  ["A_1(q^2)+A_1(q)", (q - 1) * (q + 1)^2, [[1, 1], [2]]],
  ["A_1(q^2)+A_1(q)", (q - 1) * (q + 1)^2, [[2], [1, 1]]],
  ["A_1(q^2)+A_1(q)", (q - 1) * (q + 1)^2, [[2], [2]]],
  ["A_2(q)", (q - 1)^2 * (q + 1)^2, [[1, 1, 1]]],
  ["A_2(q)", (q - 1)^2 * (q + 1)^2, [[2, 1]]],
  ["A_2(q)", (q - 1)^2 * (q + 1)^2, [[3]]],
  ["^2A_2(q)", (q - 1)^2 * (q + 1)^2, [[1, 1, 1]]],
  ["^2A_2(q)", (q - 1)^2 * (q + 1)^2, [[2, 1]]],
  ["^2A_2(q)", (q - 1)^2 * (q + 1)^2, [[3]]],
  ["A_1(q)+A_1(q)", (q - 1)^2 * (q + 1)^2, [[1, 1], [1, 1]]],
  ["A_1(q)+A_1(q)", (q - 1)^2 * (q + 1)^2, [[1, 1], [2]]],
  ["A_1(q)+A_1(q)", (q - 1)^2 * (q + 1)^2, [[2], [1, 1]]],
  ["A_1(q)+A_1(q)", (q - 1)^2 * (q + 1)^2, [[2], [2]]],
  ["A_1(q)+A_1(q)", (q - 1) * (q + 1) * (q^2 + 1), [[1, 1], [1, 1]]],
  ["A_1(q)+A_1(q)", (q - 1) * (q + 1) * (q^2 + 1), [[1, 1], [2]]],
  ["A_1(q)+A_1(q)", (q - 1) * (q + 1) * (q^2 + 1), [[2], [1, 1]]],
  ["A_1(q)+A_1(q)", (q - 1) * (q + 1) * (q^2 + 1), [[2], [2]]],
  ["A_1(q^2)", (q + 1) * (q - 1)^3, [[1, 1]]],
  ["A_1(q^2)", (q + 1) * (q - 1)^3, [[2]]],
  ["A_1(q^2)", (q - 1)^2 * (q + 1)^2, [[1, 1]]],
  ["A_1(q^2)", (q - 1)^2 * (q + 1)^2, [[2]]],
  ["A_1(q^2)", (q - 1) * (q + 1)^3, [[1, 1]]],
  ["A_1(q^2)", (q - 1) * (q + 1)^3, [[2]]],
  ["A_1(q)", (q + 1)^2 * (q - 1)^3, [[1, 1]]],
  ["A_1(q)", (q + 1)^2 * (q - 1)^3, [[2]]],
  ["A_1(q)", (q + 1) * (q^2 + 1) * (q - 1)^2, [[1, 1]]],
  ["A_1(q)", (q + 1) * (q^2 + 1) * (q - 1)^2, [[2]]],
  ["A_1(q)", (q - 1)^2 * (q + 1)^3, [[1, 1]]],
  ["A_1(q)", (q - 1)^2 * (q + 1)^3, [[2]]],
  ["A_1(q)", (q - 1) * (q^2 + 1) * (q + 1)^2, [[1, 1]]],
  ["A_1(q)", (q - 1) * (q^2 + 1) * (q + 1)^2, [[2]]],
  ["\\emptyset", (q + 1)^2 * (q - 1)^4, [[[1]], 1]],
  ["\\emptyset", (q - 1)^2 * (q + 1)^4, [[[1]], 1]],
  ["\\emptyset", (q + 1) * (q^2 + 1) * (q - 1)^3, [[[1]], 1]],
  ["\\emptyset", (q - 1)^3 * (q + 1)^3, [[[1]], 1]],
  ["\\emptyset", (q - 1) * (q^2 + 1) * (q + 1)^3, [[[1]], 1]],
  ["\\emptyset", (q^2 + 1) * (q - 1)^2 * (q + 1)^2, [[[1]], 1]],
  ["\\emptyset", (q^2 - q + 1) * (q - 1)^2 * (q + 1)^2, [[[1]], 1]],
  ["\\emptyset", (q^2 + q + 1) * (q - 1)^2 * (q + 1)^2, [[[1]], 1]],
  ["\\emptyset", (q - 1) * (q + 1) * (q^4 + 1), [[[1]], 1]]]
classlength =
  R.([
    1,
    q^10 + q^6 - q^4 - 1,
    q^12 + q^8 - q^6 - q^2,
    q^16 - q^10 - q^8 + q^2,
    1//2 * q^18 - 1//2 * q^12 - 1//2 * q^10 + 1//2 * q^4,
    1//2 * q^18 - 1//2 * q^12 - 1//2 * q^10 + 1//2 * q^4,
    q^20 - q^14 - q^12 + q^6,
    q^22 - q^20 - q^16 + q^12 + q^8 - q^6,
    q^24 - q^22 - q^18 + q^14 + q^10 - q^8,
    (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (q^4 - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (q^2 - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (q^6 - q^4 - q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (q^2 - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (q^6 - q^4 - q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (q^4 - 2 * q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (1//2 * q^8 - q^6 + q^2 - 1//2) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (1//2 * q^8 - q^6 + q^2 - 1//2) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^8,
    (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q + 1)^2 * q^8,
    (1//2 * q^8 - 1//2) * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q + 1)^2 * q^8,
    (1//2 * q^8 - 1//2) * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q + 1)^2 * q^8,
    (q^2 - q + 1) * (q^4 + 1) * q^6,
    (q^6 + q^5 + q^4 - q^2 - q - 1) * (q^2 - q + 1) * (q^4 + 1) * q^6,
    (q^8 - q^5 - q^4 + q) * (q^2 - q + 1) * (q^4 + 1) * q^6,
    (q^10 + q^9 - q^7 - 2 * q^6 - q^5 + q^3 + q^2) * (q^2 - q + 1) * (q^4 + 1) * q^6,
    (q^12 - q^10 - q^9 - q^8 + q^7 + q^6 + q^5 - q^3) * (q^2 - q + 1) * (q^4 + 1) * q^6,
    (q^2 + q + 1) * (q^4 + 1) * q^6,
    (q^6 - q^5 + q^4 - q^2 + q - 1) * (q^2 + q + 1) * (q^4 + 1) * q^6,
    (q^8 + q^5 - q^4 - q) * (q^2 + q + 1) * (q^4 + 1) * q^6,
    (q^10 - q^9 + q^7 - 2 * q^6 + q^5 - q^3 + q^2) * (q^2 + q + 1) * (q^4 + 1) * q^6,
    (q^12 - q^10 + q^9 - q^8 - q^7 + q^6 - q^5 + q^3) * (q^2 + q + 1) * (q^4 + 1) * q^6,
    (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^9,
    (q^2 - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^9,
    (q^4 - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^9,
    (q^6 - q^4 - q^2 + 1) * (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * q^9,
    (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^9,
    (q^2 - 1) * (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^9,
    (q^4 - 1) * (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^9,
    (q^6 - q^4 - q^2 + 1) * (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^9,
    (q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^9,
    (q^4 + q^3 - q - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^9,
    (q^6 - q^4 - q^3 + q) * (q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^9,
    (q - 1) * (q^2 + q + 1) * (q^2 + 1) * (q^4 + 1) * q^9,
    (q^4 - q^3 + q - 1) * (q - 1) * (q^2 + q + 1) * (q^2 + 1) * (q^4 + 1) * q^9,
    (q^6 - q^4 + q^3 - q) * (q - 1) * (q^2 + q + 1) * (q^2 + 1) * (q^4 + 1) * q^9,
    (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^10,
    (q^2 - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^10,
    (q^2 - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^10,
    (q^4 - 2 * q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^10,
    (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^10,
    (q^2 - 1) * (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^10,
    (q^2 - 1) * (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^10,
    (q^4 - 2 * q^2 + 1) * (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) *
    q^10,
    (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2 * q^10,
    (q^4 - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2 * q^10,
    (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^10,
    (q^4 - 1) * (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^10,
    (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * q^10,
    (q^4 - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * q^10,
    (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^11,
    (q^2 - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^11,
    (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2 * q^11,
    (q^2 - 1) * (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2 * q^11,
    (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^11,
    (q^2 - 1) * (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 + 1) * q^11,
    (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * q^11,
    (q^2 - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * q^11,
    (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2 * q^12,
    (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * q^12,
    (q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^3 * q^12,
    (q - 1) * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * q^12,
    (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^3 * q^12,
    (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2 * q^12,
    (q^2 + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2 * q^12,
    (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2 * q^12,
    (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^3 * (q + 1)^3 * q^12])
classtypeorder =
  R.([
    q^2 - 1,
    q^2 - 1,
    q^2 - 1,
    q^2 - 1,
    q^2 - 1,
    q^2 - 1,
    q^2 - 1,
    q^2 - 1,
    q^2 - 1,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^2 - 1//2,
    1//2 * q^3 - 1//2 * q,
    1//2 * q^3 - 1//2 * q,
    1//2 * q^3 - 1//2 * q,
    1//2 * q^3 - 1//2 * q,
    1//2 * q^3 - 1//2 * q,
    1//2 * q^3 - q^2 - 1//2 * q + 1,
    1//2 * q^3 - q^2 - 1//2 * q + 1,
    1//2 * q^3 - q^2 - 1//2 * q + 1,
    1//2 * q^3 - q^2 - 1//2 * q + 1,
    1//2 * q^3 - q^2 - 1//2 * q + 1,
    1//2 * q^3 - 3//2 * q^2 - 1//2 * q + 3//2,
    1//2 * q^3 - 3//2 * q^2 - 1//2 * q + 3//2,
    1//2 * q^3 - 3//2 * q^2 - 1//2 * q + 3//2,
    1//2 * q^3 - 3//2 * q^2 - 1//2 * q + 3//2,
    1//2 * q^3 - 1//2 * q^2 - 1//2 * q + 1//2,
    1//2 * q^3 - 1//2 * q^2 - 1//2 * q + 1//2,
    1//2 * q^3 - 1//2 * q^2 - 1//2 * q + 1//2,
    1//2 * q^3 - 1//2 * q^2 - 1//2 * q + 1//2,
    1//2 * q^4 - 1//2 * q^3 - 3//2 * q^2 + 1//2 * q + 1,
    1//2 * q^4 - 1//2 * q^3 - 3//2 * q^2 + 1//2 * q + 1,
    1//2 * q^4 - 1//2 * q^3 - 3//2 * q^2 + 1//2 * q + 1,
    1//2 * q^4 - 1//2 * q^3 - 1//2 * q^2 + 1//2 * q,
    1//2 * q^4 - 1//2 * q^3 - 1//2 * q^2 + 1//2 * q,
    1//2 * q^4 - 1//2 * q^3 - 1//2 * q^2 + 1//2 * q,
    1//4 * q^4 - 1//2 * q^3 - 1//2 * q^2 + 1//2 * q + 1//4,
    1//4 * q^4 - 1//2 * q^3 - 1//2 * q^2 + 1//2 * q + 1//4,
    1//4 * q^4 - 1//2 * q^3 - 1//2 * q^2 + 1//2 * q + 1//4,
    1//4 * q^4 - 1//2 * q^3 - 1//2 * q^2 + 1//2 * q + 1//4,
    1//4 * q^4 - 1//2 * q^2 + 1//4,
    1//4 * q^4 - 1//2 * q^2 + 1//4,
    1//4 * q^4 - 1//2 * q^2 + 1//4,
    1//4 * q^4 - 1//2 * q^2 + 1//4,
    1//8 * q^4 - 3//4 * q^3 + q^2 + 3//4 * q - 9//8,
    1//8 * q^4 - 3//4 * q^3 + q^2 + 3//4 * q - 9//8,
    1//4 * q^4 - 1//2 * q^3 + 1//2 * q - 1//4,
    1//4 * q^4 - 1//2 * q^3 + 1//2 * q - 1//4,
    1//8 * q^4 - 1//4 * q^3 + 1//4 * q - 1//8,
    1//8 * q^4 - 1//4 * q^3 + 1//4 * q - 1//8,
    1//4 * q^5 - q^4 - 1//4 * q^3 + 13//4 * q^2 - 9//4,
    1//4 * q^5 - q^4 - 1//4 * q^3 + 13//4 * q^2 - 9//4,
    1//4 * q^5 - 1//2 * q^4 - 1//4 * q^3 + 3//4 * q^2 - 1//4,
    1//4 * q^5 - 1//2 * q^4 - 1//4 * q^3 + 3//4 * q^2 - 1//4,
    1//4 * q^5 - 1//2 * q^4 - 1//4 * q^3 + 3//4 * q^2 - 1//4,
    1//4 * q^5 - 1//2 * q^4 - 1//4 * q^3 + 3//4 * q^2 - 1//4,
    1//4 * q^5 - 1//4 * q^3 + 1//4 * q^2 - 1//4,
    1//4 * q^5 - 1//4 * q^3 + 1//4 * q^2 - 1//4,
    1//48 * q^6 - 1//6 * q^5 + 13//48 * q^4 + 7//12 * q^3 - 65//48 * q^2 - 5//12 * q +
    17//16,
    1//48 * q^6 - 1//12 * q^5 + 1//48 * q^4 + 1//6 * q^3 - 5//48 * q^2 - 1//12 * q + 1//16,
    1//16 * q^6 - 1//4 * q^5 + 3//16 * q^4 + 1//4 * q^3 - 5//16 * q^2 + 1//16,
    1//8 * q^6 - 1//4 * q^5 - 3//8 * q^4 + 3//4 * q^3 + 1//8 * q^2 - 1//2 * q + 1//8,
    1//16 * q^6 - 1//16 * q^4 - 1//16 * q^2 + 1//16,
    1//8 * q^6 - 1//4 * q^5 - 1//8 * q^4 + 1//4 * q^3 - 3//8 * q^2 + 3//8,
    1//6 * q^6 - 1//6 * q^5 - 1//3 * q^4 + 1//3 * q^3 + 1//6 * q^2 - 1//6 * q,
    1//6 * q^6 + 1//6 * q^5 - 1//3 * q^4 - 1//3 * q^3 + 1//6 * q^2 + 1//6 * q,
    1//4 * q^6 - 1//4 * q^4 - 1//4 * q^2 + 1//4])
charinfo = Vector{Any}[
  [[0, 1, 2, 3, 4], [1, 2, 3]],
  [[0, 1, 2, 3], [1, 3]],
  [[0, 1, 2, 4], [1, 2]],
  [[0, 1, 3], [2]],
  [[1, 2, 3], [0]],
  [[0, 2, 3], [1]],
  [[0, 1, 2], [3]],
  [[0, 1, 4], [1]],
  [[1, 3], []],
  [[0, 4], []]]
chardegree =
  R.([
    q^12,
    q^7 * (q^4 + 1),
    q^6 * (q^2 - q + 1) * (q^2 + q + 1),
    1//2 * q^3 * (q^2 + q + 1) * (q^4 + 1),
    1//2 * q^3 * (q^2 - q + 1) * (q^4 + 1),
    1//2 * q^3 * (q^2 + q + 1) * (q^4 + 1),
    1//2 * q^3 * (q^2 - q + 1) * (q^4 + 1),
    q^2 * (q^2 - q + 1) * (q^2 + q + 1),
    q * (q^4 + 1),
    1])

information = raw"""- Information about the generic table of unipotent characters of $CO_8^-(q)$,
  with odd q.

- CHEVIE-name of the table: ``uni2D4.1``

- This table was computed by F.Luebeck, most of it with general programs.
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

using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order =
  (q + 1)^8 * (q - 1)^4 * (q^2 + 1)^2 * (q^4 + 1) * q^28 *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
  (q^4 - q^3 + q^2 - q + 1)
table = QQPolyRingElem[[
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q - 1)^4,
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) *
  (7 * q^6 - 6 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1) * (q^2 - q + 1)^2 *
  (q - 1)^3,
  (q^2 - q + 1) * (q^2 + 1) *
  (
    20 * q^9 - 33 * q^8 + 39 * q^7 - 39 * q^6 + 33 * q^5 - 22 * q^4 + 13 * q^3 - 7 * q^2 +
    3 * q - 1
  ) * (q - 1)^3,
  -(q^2 - q + 1) *
  (
    28 * q^9 - 64 * q^8 + 88 * q^7 - 87 * q^6 + 68 * q^5 - 45 * q^4 + 24 * q^3 - 11 * q^2 + 4 * q - 1
  ) * (q - 1)^2,
  (q^2 - q + 1) * (q^2 + 1) *
  (14 * q^6 - 28 * q^5 + 28 * q^4 - 20 * q^3 + 10 * q^2 - 4 * q + 1) * (q - 1)^2,
  -(q^2 + 1) * (21 * q^5 - 15 * q^4 + 10 * q^3 - 6 * q^2 + 3 * q - 1) * (q^2 - q + 1) *
  (q^4 - q^3 + q^2 - q + 1) * (q - 1)^2,
  -(q - 1) * (q^2 - q + 1) *
  (
    64 * q^8 - 123 * q^7 + 135 * q^6 - 113 * q^5 + 69 * q^4 - 35 * q^3 + 15 * q^2 - 5 * q + 1
  ),
  -(q - 1) * (
    70 * q^8 - 174 * q^7 + 218 * q^6 - 183 * q^5 + 112 * q^4 - 55 * q^3 + 21 * q^2 - 6 * q + 1
  ),
  (56 * q^6 - 90 * q^5 + 73 * q^4 - 39 * q^3 + 16 * q^2 - 5 * q + 1) * (q - 1)^2,
  -(q - 1) * (42 * q^6 - 84 * q^5 + 78 * q^4 - 48 * q^3 + 21 * q^2 - 6 * q + 1),
  (q^2 - q + 1) * (q^2 + 1) * (35 * q^4 - 20 * q^3 + 10 * q^2 - 4 * q + 1) * (q - 1)^2,
  -(q - 1) * (90 * q^6 - 135 * q^5 + 112 * q^4 - 55 * q^3 + 21 * q^2 - 6 * q + 1),
  (q - 1) * (56 * q^5 - 78 * q^4 + 48 * q^3 - 21 * q^2 + 6 * q - 1),
  -(14 * q^3 - 10 * q^2 + 3 * q - 1) * (5 * q^2 - 4 * q + 1),
  (q - 1) * (14 * q^3 - 14 * q^2 + 6 * q - 1),
  (q - 1) * (q^2 - q + 1) * (35 * q^3 - 15 * q^2 + 5 * q - 1),
  64 * q^4 - 69 * q^3 + 27 * q^2 - 7 * q + 1,
  -28 * q^3 + 20 * q^2 - 7 * q + 1,
  -(q - 1) * (21 * q^2 - 6 * q + 1),
  20 * q^2 - 7 * q + 1,
  -7 * q + 1,
  R(1)] [
  -(q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q - 1)^3,
  (q^2 + q + 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (5 * q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 - q + 1)^2,
  -(q^2 - q + 1) * (q^2 + 1) *
  (
    10 * q^10 - 5 * q^9 + 4 * q^7 - 8 * q^6 + 11 * q^5 - 9 * q^4 + 6 * q^3 - 4 * q^2 +
    2 * q - 1
  ) * (q - 1)^2,
  (q - 1) * (q^2 - q + 1) *
  (
    10 * q^10 - 10 * q^9 + 15 * q^7 - 25 * q^6 + 25 * q^5 - 21 * q^4 + 13 * q^3 - 7 * q^2 + 3 * q - 1
  ),
  -(q^2 - q + 1) * (4 * q^6 + 2 * q^5 - 4 * q^4 + 6 * q^3 - 4 * q^2 + 2 * q - 1) *
  (q^2 + 1) * (q - 1)^2,
  (q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (3 * q^4 + 4 * q^3 - 1) *
  (q^2 + 1) * (3 * q^2 - 2 * q + 1),
  (q^2 - q + 1) * (
    16 * q^9 - 3 * q^8 - 24 * q^7 + 40 * q^6 - 46 * q^5 + 34 * q^4 - 20 * q^3 + 10 * q^2 -
    4 * q + 1
  ),
  (q - 1) * (
    10 * q^8 + 10 * q^7 - 30 * q^6 + 45 * q^5 - 36 * q^4 + 23 * q^3 - 11 * q^2 + 4 * q - 1
  ),
  -(q - 1) * (4 * q^7 + 14 * q^6 - 35 * q^5 + 36 * q^4 - 23 * q^3 + 11 * q^2 - 4 * q + 1),
  (q - 1) * (14 * q^5 - 22 * q^4 + 18 * q^3 - 11 * q^2 + 4 * q - 1),
  -(q - 1) * (q^2 + 1) * (q^2 - q + 1) *
  (5 * q^5 + 15 * q^4 - 10 * q^3 + 6 * q^2 - 3 * q + 1),
  35 * q^6 - 61 * q^5 + 59 * q^4 - 34 * q^3 + 15 * q^2 - 5 * q + 1,
  (q - 1) * (4 * q^5 - 22 * q^4 + 18 * q^3 - 11 * q^2 + 4 * q - 1),
  -10 * q^5 + 30 * q^4 - 29 * q^3 + 15 * q^2 - 5 * q + 1,
  (2 * q - 1) * (q - 1) * (2 * q^2 - 2 * q + 1),
  (q^2 - q + 1) * (5 * q^4 - 20 * q^3 + 10 * q^2 - 4 * q + 1),
  16 * q^4 - 29 * q^3 + 15 * q^2 - 5 * q + 1,
  -10 * q^3 + 10 * q^2 - 5 * q + 1,
  -9 * q^3 + 15 * q^2 - 5 * q + 1,
  10 * q^2 - 5 * q + 1,
  -5 * q + 1,
  R(1)] [
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2 * (q^2 + 1)^2 *
  (q^2 - q + 1)^2,
  -(q + 1) * (q - 1) * (q^2 + 1) * (3 * q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2,
  (q - 1) * (q^2 - q + 1) * (q^2 + 1) *
  (
    4 * q^11 + 3 * q^10 - 3 * q^9 + 2 * q^8 - 2 * q^7 + q^6 + 2 * q^5 - 3 * q^4 + 2 * q^3 - 2 * q^2 + q - 1
  ),
  -(q - 1) * (q^2 - q + 1) *
  (4 * q^10 + 4 * q^9 + 5 * q^7 + 3 * q^6 - q^5 + 5 * q^4 - 3 * q^3 + 3 * q^2 - q + 1),
  (q - 1) * (q^2 + 1) * (2 * q^7 + 2 * q^6 + 2 * q^3 - 2 * q^2 + q - 1) * (q^2 - q + 1),
  -(q + 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 + 6 * q^5 - 5 * q^4 + 4 * q^3 - 3 * q^2 + 2 * q - 1) * (q^2 + 1),
  -(q^2 - q + 1) * (9 * q^8 - 2 * q^7 + 6 * q^5 - 8 * q^4 + 6 * q^3 - 4 * q^2 + 2 * q - 1),
  -2 * q^9 - 4 * q^8 + 5 * q^6 - 15 * q^5 + 15 * q^4 - 12 * q^3 + 7 * q^2 - 3 * q + 1,
  (2 * q^5 + 5 * q^4 - 3 * q^3 + 4 * q^2 - q + 1) * (q - 1)^2,
  -(q - 1) * (2 * q^6 + 6 * q^4 - 4 * q^3 + 5 * q^2 - 2 * q + 1),
  -(q^2 - q + 1) * (q^2 + 1) *
  (5 * q^6 - 6 * q^5 - 5 * q^4 + 4 * q^3 - 3 * q^2 + 2 * q - 1),
  6 * q^7 - 3 * q^6 - 7 * q^5 + 15 * q^4 - 12 * q^3 + 7 * q^2 - 3 * q + 1,
  -2 * q^5 + 10 * q^4 - 9 * q^3 + 7 * q^2 - 3 * q + 1,
  -(q - 1) * (2 * q^4 - 4 * q^3 + 5 * q^2 - 2 * q + 1),
  (q - 1) * (2 * q^3 - 2 * q^2 + 2 * q - 1),
  -(q^2 - q + 1) * (5 * q^4 + 6 * q^3 - 4 * q^2 + 2 * q - 1),
  -9 * q^3 + 7 * q^2 - 3 * q + 1,
  -(2 * q - 1) * (2 * q^2 - q + 1),
  -q^3 + 7 * q^2 - 3 * q + 1,
  4 * q^2 - 3 * q + 1,
  -3 * q + 1,
  R(1)] [
  -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q + 1)^3,
  (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + q + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
  -(q + 1) * (q - 1) * (q^2 - q + 1) * (q^2 + 1) *
  (2 * q^10 + 3 * q^9 + 2 * q^8 + 2 * q^7 + 2 * q^6 + q^5 + 3 * q^4 + 2 * q^2 + 1),
  (q^2 - q + 1) * (
    2 * q^11 + 4 * q^10 + 2 * q^9 + 3 * q^8 + 4 * q^7 + 2 * q^6 + 2 * q^5 + 2 * q^4 +
    2 * q^2 + 1
  ),
  -(q - 1) * (q^2 - q + 1) * (q^2 + 1) *
  (2 * q^6 + 2 * q^5 + 2 * q^4 + 2 * q^3 + 2 * q^2 + q + 1),
  -(q - 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (3 * q^4 + 2 * q^2 + 1) *
  (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^2 - q + 1) * (q^7 + 3 * q^6 - 3 * q^5 + 5 * q^4 - 3 * q^3 + 3 * q^2 - q + 1),
  -(q - 1) * (q^2 - q + 1) * (2 * q^6 + 4 * q^5 + 4 * q^4 + 3 * q^3 + 3 * q^2 + q + 1),
  -(q + 1) * (q - 1) * (q^2 + 1) * (4 * q^4 - 2 * q^3 + 3 * q^2 - q + 1),
  (q^2 + 1) * (2 * q^4 + 2 * q^2 - q + 1),
  (q + 1) * (q^2 - q + 1) * (q^2 + 1) * (3 * q^5 + 3 * q^4 - 2 * q^3 + 2 * q^2 - q + 1),
  -q^6 + 3 * q^4 - 2 * q^3 + 3 * q^5 + 3 * q^2 - q + 1,
  (2 * q^2 + 1) * (2 * q^4 + q^3 + q^2 - q + 1),
  (2 * q^2 + 1) * (q^3 + q^2 - q + 1),
  -(q - 1) * (2 * q^2 + 1),
  -(q + 1) * (q - 1) * (q^2 - q + 1) * (3 * q^2 + 1),
  -q^3 + 3 * q^2 - q + 1,
  -(q - 1) * (2 * q^2 + 1),
  3 * q^3 + 3 * q^2 - q + 1,
  2 * q^2 - q + 1,
  1 - q,
  R(1)] [
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q + 1)^4,
  (q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 *
  (q + 1)^3,
  (q^2 - q + 1) *
  (4 * q^10 + 3 * q^9 + 4 * q^8 + 2 * q^7 + 4 * q^6 + q^5 + 3 * q^4 + 2 * q^2 + 1) *
  (q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^2 - q + 1) *
  (4 * q^8 + 4 * q^7 + 4 * q^6 + 3 * q^5 + 3 * q^4 + 2 * q^3 + 2 * q^2 + q + 1) *
  (q^2 + 1),
  (q^2 - q + 1) *
  (6 * q^8 + 8 * q^7 + 10 * q^6 + 8 * q^5 + 6 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q + 1) *
  (q^2 + 1),
  (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (3 * q^4 + 2 * q^2 + 1) * (q^2 - q + 1) *
  (q + 1)^3,
  (q^2 + 1) * (q^2 - q + 1) * (3 * q^4 + 2 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1) * (q^2 + q + 1) * (2 * q^4 + 2 * q^2 - q + 1),
  (2 * q^2 + q + 1) * (4 * q^4 - 3 * q^3 + 4 * q^2 - 2 * q + 1) * (q + 1)^2,
  (q + 1) * (6 * q^6 + 6 * q^4 + 3 * q^2 + 1),
  (q^2 + 1) * (q^2 - q + 1) * (3 * q^4 + 2 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (6 * q^6 + 3 * q^5 + 6 * q^4 + q^3 + 3 * q^2 + 1),
  (2 * q^2 + 1) * (4 * q^4 + q^3 + q^2 + q + 1),
  (q + 1) * (q^2 + 1) * (2 * q^2 + 1),
  6 * q^4 + 4 * q^3 + 4 * q^2 + q + 1,
  (q^2 - q + 1) * (3 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (3 * q^2 + 1),
  (q + 1) * (4 * q^2 + 1),
  (q + 1) * (3 * q^2 + 1),
  4 * q^2 + q + 1,
  q + 1,
  R(1)] [
  (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q^2 + 1)^2 * (q - 1)^4,
  -(q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (4 * q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^3,
  (q + 1) * (q^2 + 1) *
  (
    5 * q^10 - q^9 - 3 * q^8 + 6 * q^7 - 9 * q^6 + 11 * q^5 - 9 * q^4 + 6 * q^3 - 4 * q^2 + 2 * q - 1
  ) * (q - 1)^3,
  -(q + 1) * (q^2 - q + 1) *
  (q^8 + 4 * q^7 - 9 * q^6 + 9 * q^5 - 10 * q^4 + 7 * q^3 - 4 * q^2 + 2 * q - 1) *
  (q - 1)^2,
  -(q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^5 - 3 * q^4 + 5 * q^3 - 3 * q^2 + 2 * q - 1) *
  (q - 1)^2,
  -(q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (6 * q^7 + 9 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) * (q - 1)^2,
  -(q - 1) * (
    4 * q^10 + 8 * q^9 - 11 * q^8 + 4 * q^7 + 2 * q^6 - 13 * q^5 + 14 * q^4 - 10 * q^3 +
    6 * q^2 - 3 * q + 1
  ),
  (q - 1) *
  (5 * q^8 - 9 * q^7 + 7 * q^6 + 6 * q^5 - 10 * q^4 + 10 * q^3 - 6 * q^2 + 3 * q - 1),
  -(4 * q^5 + q^4 - 3 * q^3 + 3 * q^2 - q + 1) * (q - 1)^3,
  (q - 1) * (6 * q^6 - 3 * q^5 - 3 * q^4 + 6 * q^3 - 6 * q^2 + 3 * q - 1),
  (q^2 + 1) * (5 * q^6 + 5 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1) * (q - 1)^2,
  -(q - 1) * (10 * q^4 - 10 * q^3 + 6 * q^2 - 3 * q + 1),
  -(q - 1) * (4 * q^5 + 3 * q^4 - 6 * q^3 + 6 * q^2 - 3 * q + 1),
  5 * q^5 + 4 * q^4 - 12 * q^3 + 9 * q^2 - 4 * q + 1,
  -(q - 1) * (q^3 + 2 * q^2 - 3 * q + 1),
  (q - 1) * (5 * q^5 - 5 * q^4 + 10 * q^3 - 6 * q^2 + 3 * q - 1),
  (2 * q - 1) * (2 * q^3 - 5 * q^2 + 2 * q - 1),
  -q^3 + 5 * q^2 - 4 * q + 1,
  -(q - 1) * (6 * q^2 - 3 * q + 1),
  5 * q^2 - 4 * q + 1,
  -4 * q + 1,
  R(1)] [
  -(q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q + 1)^3 * (q - 1)^3,
  (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^3 + q^2 + 1) * (2 * q^4 - q^3 - q + 1) * (q + 1)^2 * (q - 1)^2,
  -(q + 1) * (q^2 + 1) *
  (q^10 + 3 * q^9 + q^8 + 2 * q^7 + q^6 + q^5 + 3 * q^4 + 2 * q^2 + 1) * (q - 1)^3,
  (q + 1) * (q - 1) * (q^2 - q + 1) *
  (q^9 + q^8 - q^7 - 2 * q^6 + q^5 - 3 * q^4 + 3 * q^3 - 2 * q^2 + q - 1),
  -(q + 1) * (q^2 + 1) * (q^5 + q^4 + q^3 - q^2 - 1) * (q^2 - q + 1) * (q - 1)^2,
  (q + 1) * (q - 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (3 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1),
  -2 * q^11 + 2 * q^10 + 4 * q^7 - q^5 + q^9 - 5 * q^8 - 3 * q^6 - 4 * q^3 + 4 * q^4 +
  3 * q^2 - 2 * q + 1,
  (q - 1) * (q^8 + q^7 + 3 * q^6 + 2 * q^3 - 2 * q^2 + q - 1),
  (q - 1) * (2 * q^7 + q^6 - q^5 + 2 * q^3 - 2 * q^2 + q - 1),
  -(q - 1) * (q^2 + 1) * (q^3 + q^2 - q + 1),
  (q + 1) * (q - 1) * (q^2 + 1) * (q^6 + q^5 - 5 * q^4 + 4 * q^3 - 3 * q^2 + 2 * q - 1),
  -4 * q^6 + 2 * q^5 - 4 * q^3 + 2 * q^4 + 3 * q^2 - 2 * q + 1,
  -(q - 1) * (2 * q^5 + q^4 + 2 * q^2 - q + 1),
  -q^5 - 2 * q^3 + 3 * q^2 - 2 * q + 1,
  (q - 1) * (q^3 + q - 1),
  -q^6 + 2 * q^5 - q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1,
  -2 * q^4 - 2 * q^3 + 3 * q^2 - 2 * q + 1,
  -q^3 + q^2 - 2 * q + 1,
  3 * q^2 - 2 * q + 1,
  (q - 1)^2,
  -2 * q + 1,
  R(1)] [
  (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 + 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  (q - 1) * (q^2 + 1) *
  (q^11 - q^8 + q^7 - 2 * q^6 + 2 * q^5 - 3 * q^4 + 2 * q^3 - 2 * q^2 + q - 1) *
  (q + 1)^2,
  -(q + 1) * (q - 1) * (q^2 - q + 1) *
  (q^9 + 3 * q^8 + 3 * q^7 + 2 * q^6 + q^5 + q^4 + q^3 + 2 * q^2 + q + 1),
  -(q + 1) * (q - 1) * (q^2 - q + 1) * (q^2 + 1) * (q^6 + q^2 + q + 1),
  (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (2 * q^7 - q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2,
  -(q + 1) * (q^8 - 2 * q^7 + q^5 - 2 * q^4 + 2 * q^3 - 2 * q^2 + q - 1),
  q^9 + 2 * q^8 - q^6 + q^2 + 1,
  -(q + 1) * (q - 1) * (q^5 + 2 * q^4 + 2 * q^2 + 1),
  -(q - 1) * (2 * q^6 + 3 * q^5 + 3 * q^4 + 2 * q^3 + 2 * q^2 + q + 1),
  (q^2 + 1) * (q^6 - 3 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1) * (q + 1)^2,
  (q + 1) * (2 * q^4 - 2 * q^3 + 2 * q^2 - q + 1),
  q^5 + q^4 + q^2 + 1,
  q^5 + q^2 + 1,
  -(q - 1) * (q^3 + 2 * q^2 + q + 1),
  (q + 1) * (q^5 + q^4 - 2 * q^3 + 2 * q^2 - q + 1),
  q^2 + 1,
  -q^3 + q^2 + 1,
  (q + 1) * (2 * q^2 - q + 1),
  q^2 + 1,
  R(1),
  R(1)] [
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q + 1)^4 * (q - 1)^4,
  -(q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + q + 1) * (q + 1)^3 * (q - 1)^3,
  -(q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^5 - q^3 + 1) * (q + 1)^2 * (q - 1)^3,
  -(q^2 + 1) * (q^3 - q^2 - 1) * (q^4 - q + 1) * (q + 1)^2 * (q - 1)^2,
  (q^2 + 1) * (2 * q^6 - q^5 + q^4 - 2 * q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^3,
  (q + 1) * (q - 1) * (2 * q^9 + 2 * q^8 - q^6 - q^5 - q^4 + 2 * q^3 - q^2 + q - 1),
  -(q + 1) * (q - 1) * (q^7 + 2 * q^6 - 2 * q^3 + q^2 - q + 1),
  -(q^6 + 3 * q^5 + 2 * q^4 - q^2 - q - 1) * (q - 1)^2,
  1 - q,
  (q^2 + 1) * (2 * q^4 - 2 * q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
  (q + 1) * (q - 1) * (2 * q^3 - q^2 + q - 1),
  -(q - 1) * (q + 1) * (q^4 - q^3 + q^2 - q + 1),
  -(q - 1) * (q^4 + 1),
  (q - 1) * (2 * q^3 + q^2 - 1),
  (q + 1) * (q - 1) * (q^2 + q - 1) * (2 * q^2 + 1),
  -(q + 1) * (2 * q^3 - 2 * q^2 + 2 * q - 1),
  -q^3 - q^2 - q + 1,
  1 - q,
  -q^2 - q + 1,
  1 - q,
  R(1)] [
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q - 1)^3 * (q + 1)^5,
  -(q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q^2 + 1)^2 * (q - 1)^3 *
  (q + 1)^4,
  -(q^2 + 1) * (q^2 + q + 1) * (q^7 - q^6 - q^4 + q^3 - q^2 + q - 1) * (q - 1)^2 *
  (q + 1)^3,
  (q - 1) * (q^10 + 2 * q^9 - q^6 + q^5 + q^3 - q^2 - 1) * (q + 1)^2,
  (2 * q^6 + q^5 + q^4 + q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^3,
  -(2 * q^9 - q^6 + q^5 - q^4 + 2 * q^3 - q^2 + q - 1) * (q + 1)^2,
  (q + 1) * (q - 1) * (q^7 - q^2 - q - 1),
  -(q + 1) * (q - 1) * (q^6 + q^5 + q^2 + q + 1),
  (q - 1) * (2 * q^5 + 2 * q^4 - 2 * q^2 - 2 * q - 1),
  -(q - 1) * (q^2 + 1) * (2 * q^4 - 2 * q^3 + q^2 - q + 1) * (q + 1)^3,
  (2 * q^4 - 2 * q^3 + q^2 - q + 1) * (q + 1)^2,
  (q - 1) * (q + 1) * (q^4 + q^3 - q^2 - q - 1),
  -(q + 1) * (q^4 + 2 * q^3 - 1),
  -(q + 1) * (q - 1) * (2 * q^2 + q + 1),
  (2 * q^4 - 2 * q^3 + q^2 - q + 1) * (q + 1)^2,
  -(q + 1) * (2 * q^3 - 1),
  -q^3 + q^2 + q + 1,
  q + 1,
  q^2 + q + 1,
  q + 1,
  R(1)] [
  -(q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^3 * (q - 1)^3,
  (3 * q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) *
  (q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2 * (q^2 - q + 1)^2,
  -(q + 1) * (q^2 - q + 1) *
  (
    2 * q^11 + 3 * q^10 - 3 * q^9 + 2 * q^8 - 2 * q^7 + q^6 + 2 * q^5 - 3 * q^4 + 2 * q^3 - 2 * q^2 + q - 1
  ) * (q - 1)^2,
  -(q + 1) * (q - 1) * (q^2 - q + 1) *
  (2 * q^9 - 4 * q^8 + 4 * q^7 - q^6 - 2 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1),
  (q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1) *
  (2 * q^6 - 2 * q^5 + 2 * q^3 - 2 * q^2 + 2 * q - 1),
  (q + 1) * (q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (3 * q^7 + 5 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1),
  (q + 1) * (q - 1) * (q^2 - q + 1) *
  (3 * q^6 + 2 * q^5 - 5 * q^4 + 4 * q^3 - 3 * q^2 + 2 * q - 1),
  -(q + 1) * (q^3 + q^2 - q + 1) * (4 * q^5 - 8 * q^4 + 8 * q^3 - 5 * q^2 + 3 * q - 1),
  (q + 1) * (4 * q^4 - 5 * q^3 + 4 * q^2 - 2 * q + 1) * (q - 1)^2,
  -(q + 1) * (q - 1) * (2 * q^2 - 2 * q + 1) * (2 * q^2 - q + 1),
  -(q - 1) * (q^7 + 3 * q^6 + 3 * q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1),
  -(q - 1) * (3 * q^5 - 3 * q^3 + 3 * q^2 - 2 * q + 1),
  4 * q^5 - 2 * q^4 - 3 * q^3 + 5 * q^2 - 3 * q + 1,
  (q - 1) * (4 * q^4 - 3 * q^2 + 2 * q - 1),
  -(q - 1) * (2 * q^3 - 2 * q + 1),
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2,
  -(q - 1) * (3 * q^2 - 2 * q + 1),
  2 * q^3 + 2 * q^2 - 3 * q + 1,
  -(q - 1) * (3 * q^2 - 2 * q + 1),
  (q - 1) * (2 * q - 1),
  -3 * q + 1,
  R(1)] [
  (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^3,
  (q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^4 - q^2 - 1) * (q + 1)^2,
  (q + 1) * (q^2 - q + 1) * (q^7 - q^6 + q^5 + q^4 - q^3 + q^2 - q + 1),
  -(q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
  (q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^4 - q^2 - 1) * (q + 1)^2,
  (q + 1) * (q^2 - q + 1) * (q^7 - q^6 + q^5 + q^4 - q^3 + q^2 - q + 1),
  -(q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
  -(q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
  (q + 1) * (2 * q^6 - 2 * q^5 + 2 * q^4 - 2 * q^3 + 3 * q^2 - 2 * q + 1),
  -(q + 1) * (q - 1) * (q^2 - q + 1) * (q^6 + 2 * q^5 + q^4 + q^2 + 1),
  -2 * q^7 - q^6 + q^5 - q^4 + q^2 - q + 1,
  q^3 + q^2 - q + 1,
  q^3 + q^2 - q + 1,
  1 - q,
  -(q + 1) * (q - 1) * (q^2 + 1) * (q^2 - q + 1),
  q^3 + q^2 - q + 1,
  1 - q,
  q^3 + q^2 - q + 1,
  1 - q,
  1 - q,
  R(1)] [
  -(q - 1) * (q^2 + q + 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^5,
  -(q - 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) *
  (q^2 - q + 1)^2 * (q + 1)^4,
  -(q^2 - q + 1) *
  (
    2 * q^11 - q^10 + q^9 - 2 * q^8 + 2 * q^7 - 3 * q^6 + 2 * q^5 - 3 * q^4 + 2 * q^3 -
    2 * q^2 + q - 1
  ) * (q + 1)^3,
  -(q^2 - q + 1) * (2 * q^9 - q^6 - q^4 - q^2 - 1) * (q + 1)^2,
  -(q + 1) * (q^2 - q + 1) * (q^2 + 1) * (2 * q^7 - 2 * q^5 - 2 * q^4 - q - 1),
  -(q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^4 - q^2 - 1) * (q + 1)^3,
  -(q^2 - q + 1) * (q^6 - q^4 - q^2 - 1) * (q + 1)^2,
  (q + 1) * (q^2 + q + 1) * (q^3 + q^2 - q + 1),
  (3 * q^4 - q^3 + 2 * q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (2 * q^4 + q^2 + 1),
  -(q^2 - q + 1) * (q^6 - q^4 - q^2 - 1) * (q + 1)^2,
  (q + 1) * (q^2 + q + 1) * (q^3 + q^2 - q + 1),
  q^3 + 2 * q^4 + q^2 + q + 1,
  (q + 1) * (q^2 + 1),
  2 * q^4 + 2 * q^3 + 2 * q^2 + q + 1,
  (q^2 - q + 1) * (q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1),
  (q + 1) * (2 * q^2 + 1),
  (q + 1) * (q^2 + 1),
  2 * q^2 + q + 1,
  q + 1,
  R(1)] [
  -(q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^3 * (q + 1)^5,
  (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q + 1)^4,
  (q^5 + q^4 + q^2 + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q + 1)^3,
  (q - 1) * (q^2 - q + 1) * (q^8 - q^6 - q^5 + q^3 - 1) * (q + 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q^5 + q^4 - q^3 - q^2 + 1) * (q^2 + 1) * (q + 1)^2,
  -(q - 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^2 + 1) * (q^4 - q + 1) * (q + 1)^2,
  -(q + 1) * (q^8 - q^7 - q^6 + q - 1),
  (q + 1) * (q^4 + q^3 + q^2 + q + 1) * (q - 1)^2,
  -(q - 1) * (q + 1) * (q^4 + 1),
  -(q - 1) * (q^7 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2,
  -(q - 1) * (q + 1),
  (q + 1) * (q^4 - q + 1),
  q^5 + 2 * q^4 - q^2 + 1,
  (q - 1) * (q^3 - q - 1),
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1),
  -q^3 - q^2 + 1,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1)] [
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^6,
  (q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^2 * (q^2 - q + 1)^2 *
  (q + 1)^5,
  -(q - 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^3,
  (q^2 - q + 1) * (2 * q^8 - 2 * q^6 + 2 * q^4 - q^2 + 1) * (q + 1)^2,
  -(q - 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^3,
  (2 * q^7 - 2 * q^5 + q^4 + q^3 - q + 1) * (q + 1)^2,
  -(q - 1) * (2 * q^4 + q^3 + 1) * (q + 1)^2,
  -(q - 1) * (2 * q^4 + 1) * (q + 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^3,
  -(q - 1) * (2 * q^4 + q^3 + 1) * (q + 1)^2,
  (q + 1) * (2 * q^4 - q^2 + 1),
  (q + 1) * (2 * q^4 - q^2 + 1),
  2 * q^4 + q + 1,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  q + 1,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1)] [
  (q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) * (q^2 + 1)^2 *
  (q^2 - q + 1)^2 * (q + 1)^4 * (q - 1)^4,
  -(q^2 + 1) * (q^2 + q + 1) * (2 * q^4 - q^3 - q + 1) * (q^3 + q^2 + 1) *
  (q^2 - q + 1)^2 * (q + 1)^3 * (q - 1)^3,
  (q^2 + 1) * (q^2 - q + 1) * (2 * q^6 - q^4 - q^2 - 1) * (q + 1)^2 * (q - 1)^3,
  (q^2 - q + 1) * (2 * q^7 + 2 * q^4 - 2 * q^3 + 2 * q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
  -(q^2 + 1) * (q^2 - q + 1) * (q^4 + q^3 - q^2 + q - 1) * (q + 1)^2 * (q - 1)^2,
  -(q^2 + 1) * (q^2 - q + 1) * (q^7 + 2 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) *
  (q + 1)^2 * (q - 1)^2,
  (q + 1) * (q - 1) * (q^2 - q + 1) * (q^7 + 2 * q^6 - 2 * q^5 + q^3 - q^2 + q - 1),
  (q + 1) * (q - 1) * (2 * q^2 + 1) * (2 * q^4 - q^3 - q^2 + 2 * q - 1),
  (q + 1) * (q^5 - q^4 - q^3 + 2 * q^2 - q + 1) * (q - 1)^2,
  -(q + 1) * (q - 1) * (2 * q^2 - q + 1) * (q^3 - q + 1),
  (q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2,
  (q + 1) * (q - 1) * (3 * q^3 - 3 * q^2 + 2 * q - 1),
  (q + 1) * (q^3 + 2 * q^2 - q + 1) * (q - 1)^2,
  -(q + 1) * (4 * q^3 - 5 * q^2 + 3 * q - 1),
  -(q + 1) * (q - 1)^3,
  -(q - 1) * (q^2 - q + 1),
  -q^4 + q^3 + 2 * q^2 - 2 * q + 1,
  2 * q^3 - 2 * q + 1,
  -(q - 1) * (q^2 - q + 1),
  -2 * q + 1,
  -2 * q + 1,
  R(1)] [
  -(q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) * (q^2 + 1)^2 *
  (q^2 - q + 1)^2 * (q - 1)^3 * (q + 1)^5,
  (q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 *
  (q^2 - q + 1)^2 * (q + 1)^4,
  (q^2 + 1) * (q^2 + q + 1) * (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^3,
  -(q - 1) * (q^2 + 1) * (q^2 - q + 1) * (q + 1)^2,
  (q^2 - q + 1) * (q^4 + q^3 + q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  -(q - 1) * (q^2 + 1) * (q^2 - q + 1) * (q^7 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  (q^2 - q + 1) * (q^7 - q^3 + q^2 - q + 1) * (q + 1)^2,
  -(q + 1) * (q - 1) * (q^3 + q^2 + 1),
  (q - 1) * (q^5 - q^4 + q^3 - 2 * q^2 + q - 1) * (q + 1)^2,
  -(q + 1) * (q - 1) * (q^4 + q^3 + q^2 + 1),
  -(q - 1) * (q^2 + 1) * (q^2 - q + 1) * (q + 1)^2,
  -(q + 1) * (q - 1) * (q^3 + q^2 + 1),
  -(q + 1) * (q - 1) * (q^4 + q^3 + q^2 + 1),
  (q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^2 + 1),
  (q + 1) * (q^2 - q + 1),
  q^4 + q^3 + 1,
  R(1),
  (q + 1) * (q^2 - q + 1),
  R(1),
  R(1),
  R(1)] [
  (q^2 - q + 1) * (q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^2 + 1)^2 * (q - 1)^4 * (q + 1)^6,
  (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q^2 + 1)^2 * (q - 1)^4 * (q + 1)^5,
  -(q^4 + 1) * (q^2 + 1)^2 * (q - 1)^3 * (q + 1)^4,
  -(q^2 - q + 1) * (q^6 + 2 * q^5 + q^4 - q^2 - q - 1) * (q - 1)^2 * (q + 1)^3,
  -(q^2 + 1) * (q^2 - q + 1) * (q^3 - q - 1) * (q - 1)^2 * (q + 1)^3,
  -(q^4 + 1) * (q^2 + 1)^2 * (q - 1)^3 * (q + 1)^4,
  (q - 1) * (q^7 - q^6 + q^5 + q^3 - q^2 + q - 1) * (q + 1)^3,
  (q^4 + q^3 + q^2 + q + 1) * (q + 1)^2 * (q - 1)^2,
  (q^4 + q^3 + q^2 + q + 1) * (q + 1)^2 * (q - 1)^2,
  (q + 1) * (q - 1) * (q^5 + q^4 + q^3 - q - 1),
  (q^2 + 1) * (q - 1)^2 * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  (q^2 + q + 1) * (q + 1)^2 * (q - 1)^2,
  -(q + 1) * (q^3 + q^2 - 1),
  -(q - 1) * (q + 1) * (q^2 + q + 1),
  -(q - 1) * (q + 1)^2,
  -(q + 1) * (q^3 + q^2 - 1),
  -q^3 + q + 1,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1)] [
  -(q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q - 1)^3 * (q + 1)^5,
  (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^7 + q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 - q + 1) * (q - 1)^2 * (q + 1)^4,
  (q^2 + 1) * (q^5 - q^3 + 1) * (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^3,
  -(q - 1) *
  (q^10 - 2 * q^8 + 4 * q^7 - 3 * q^6 + q^5 + 2 * q^4 - 3 * q^3 + 3 * q^2 - 2 * q + 1) *
  (q + 1)^2,
  (q^2 + 1) * (q^5 - q^4 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^3,
  -(q - 1) * (q^2 - q + 1) * (2 * q^5 - q^3 + q^2 - q + 1) * (q + 1)^2,
  (q^5 - q^3 + 2 * q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
  -(q + 1) * (q - 1) * (q^6 + q^5 - 2 * q^4 + q^2 - q + 1),
  (q + 1) * (2 * q^5 - 2 * q^4 + 2 * q^2 - 2 * q + 1),
  (q^2 - q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  (q + 1) * (q - 1) * (2 * q^4 - q^2 + q - 1),
  (q - 1) * (q + 1) * (q^4 - q^3 - q^2 + q - 1),
  -(q + 1) * (q - 1) * (q^3 + q^2 - q + 1),
  (q + 1) * (q - 1)^2,
  -(q - 1) * (q + 1) * (q^2 - q + 1),
  (q + 1) * (2 * q^2 - 2 * q + 1),
  (q + 1) * (q - 1)^2,
  1 - q,
  -q^2 - q + 1,
  1 - q,
  R(1)] [
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 + 1)^2 * (q + 1)^6,
  (q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * (q^2 + 1)^2 *
  (q + 1)^5,
  (q - 1) * (q^2 - q + 1) * (q^2 + 1) * (q^7 - q^6 - q^4 + q^3 - q^2 + q - 1) * (q + 1)^4,
  (q - 1) * (q^2 + 1) * (q^7 - q^6 - q^2 + q - 1) * (q + 1)^3,
  -(q - 1) * (q^2 + 1) * (q^6 + q^4 + q^3 + 1) * (q + 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^4,
  -(q - 1) * (q^2 + 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^2 + 1) * (q^4 + q^3 + 1) * (q + 1)^2,
  -(q^6 - q^5 - q^2 + q - 1) * (q + 1)^2,
  q + 1,
  -(q - 1) * (q^2 + 1) * (q^2 - q + 1) * (q + 1)^3,
  (q^2 - q + 1) * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^4 + q^3 + q^2 + q + 1),
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1),
  (q^2 - q + 1) * (q + 1)^2,
  q + 1,
  (q + 1) * (q^2 + 1),
  q + 1,
  q^2 + q + 1,
  q + 1,
  R(1)] [
  (q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
  (q - 1)^4 * (q + 1)^6,
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3 *
  (q + 1)^5,
  -(q^2 + 1) * (q^5 + q^4 + q^2 + 1) * (q^2 - q + 1) * (q - 1)^3 * (q + 1)^4,
  (q^2 - q + 1) * (q^5 + q^2 + 1) * (q - 1)^2 * (q + 1)^3,
  (q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^3,
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q^5 - q^3 + q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^5 - q^4 + q^2 - q + 1) * (q + 1)^2,
  (q^3 + q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^2,
  (q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^3,
  (q^3 + q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^3 - q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^3 - q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1)] [
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3 * (q + 1)^7,
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3 *
  (q + 1)^6,
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^5,
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^5,
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1)^2,
  q + 1,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  q + 1,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1)]]
classinfo = Vector{Any}[
  [[[1, 1, 1, 1, 1, 1, 1, 1]]],
  [[[2, 1, 1, 1, 1, 1, 1]]],
  [[[2, 2, 1, 1, 1, 1]]],
  [[[2, 2, 2, 1, 1]]],
  [[[2, 2, 2, 2]]],
  [[[3, 1, 1, 1, 1, 1]]],
  [[[3, 2, 1, 1, 1]]],
  [[[3, 2, 2, 1]]],
  [[[3, 3, 1, 1]]],
  [[[3, 3, 2]]],
  [[[4, 1, 1, 1, 1]]],
  [[[4, 2, 1, 1]]],
  [[[4, 2, 2]]],
  [[[4, 3, 1]]],
  [[[4, 4]]],
  [[[5, 1, 1, 1]]],
  [[[5, 2, 1]]],
  [[[5, 3]]],
  [[[6, 1, 1]]],
  [[[6, 2]]],
  [[[7, 1]]],
  [[[8]]]]
classlength =
  R.([
    1,
    (q + 1) * (q - 1) * (q^2 + 1) * (q^4 + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1),
    (q + 1)^2 * (q - 1) * (q^2 + 1) * (q^4 + 1) * q *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^3 * (q - 1)^2 * (q^2 + 1)^2 * (q^4 + 1) * q^3 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^4 * (q - 1)^2 * (q^2 + 1) * (q^4 + 1) * q^6 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^2 * (q - 1)^2 * (q^2 + 1) * (q^4 + 1) * q^6 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^2 + q + 1),
    (q + 1)^3 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^6 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^4 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^7 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^4 * (q - 1)^2 * (q^2 + 1)^2 * (q^4 + 1) * q^10 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^5 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^10 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^3 * (q - 1)^2 * (q^2 + 1) * (q^4 + 1) * q^11 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^4 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^11 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^5 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^12 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^5 * (q - 1)^4 * (q^2 + 1)^2 * (q^4 + 1) * q^13 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^6 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^15 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^4 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^15 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1) * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^5 * (q - 1)^4 * (q^2 + 1)^2 * (q^4 + 1) * q^15 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^6 * (q - 1)^4 * (q^2 + 1)^2 * (q^4 + 1) * q^16 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^5 * (q - 1)^3 * (q^2 + 1)^2 * (q^4 + 1) * q^18 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^6 * (q - 1)^4 * (q^2 + 1)^2 * (q^4 + 1) * q^18 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^6 * (q - 1)^4 * (q^2 + 1)^2 * (q^4 + 1) * q^20 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + q + 1) *
    (q^4 - q^3 + q^2 - q + 1),
    (q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^2 - q + 1)^2 *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^21 * (q^4 + 1) * (q^2 + 1)^2 * (q - 1)^4 *
    (q + 1)^7])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  [[1, 1, 1, 1, 1, 1, 1, 1]],
  [[2, 1, 1, 1, 1, 1, 1]],
  [[2, 2, 1, 1, 1, 1]],
  [[2, 2, 2, 1, 1]],
  [[2, 2, 2, 2]],
  [[3, 1, 1, 1, 1, 1]],
  [[3, 2, 1, 1, 1]],
  [[3, 2, 2, 1]],
  [[3, 3, 1, 1]],
  [[3, 3, 2]],
  [[4, 1, 1, 1, 1]],
  [[4, 2, 1, 1]],
  [[4, 2, 2]],
  [[4, 3, 1]],
  [[4, 4]],
  [[5, 1, 1, 1]],
  [[5, 2, 1]],
  [[5, 3]],
  [[6, 1, 1]],
  [[6, 2]],
  [[7, 1]],
  [[8]]]
chardegree =
  R.([
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q - 1)^4,
    -(q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q - 1)^3,
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2 * (q^2 + 1)^2 *
    (q^2 - q + 1)^2,
    -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q + 1)^3,
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q^2 + 1)^2 * (q + 1)^4,
    (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q^2 + 1)^2 * (q - 1)^4,
    -(q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q + 1)^3 * (q - 1)^3,
    (q^2 + q + 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 + 1)^2 * (q + 1)^4,
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q + 1)^4 * (q - 1)^4,
    -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q - 1)^3 * (q + 1)^5,
    -(q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^3 * (q - 1)^3,
    (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^4,
    -(q - 1) * (q^2 + q + 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^5,
    -(q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^3 * (q + 1)^5,
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^6,
    (q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) * (q^2 + 1)^2 *
    (q^2 - q + 1)^2 * (q + 1)^4 * (q - 1)^4,
    -(q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) * (q^2 + 1)^2 *
    (q^2 - q + 1)^2 * (q - 1)^3 * (q + 1)^5,
    (q^2 - q + 1) * (q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^2 + 1)^2 * (q - 1)^4 * (q + 1)^6,
    -(q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)^2 * (q - 1)^3 * (q + 1)^5,
    (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^4 + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q^2 + 1)^2 * (q + 1)^6,
    (q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q - 1)^4 * (q + 1)^6,
    -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
    (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3 * (q + 1)^7])

information = raw"""- Information about the tables of Green functions for GU_8(q^2).

- CHEVIE-name of the table: GU8green

- By a theorem of Hotta, Springer and Kawanaka we can get the Green
  functions of the unitary group GU_8(q^2) from those of GL_8(q) 
  by substituting q by -q. This is proved in:
  {\sc R.~Hotta and T.~A.~Springer}, A specialisation theorem for
  certain Weyl group representations, {\em Invent. Math.} 
  {\bf 41} (1977), 113--127.
  {\sc N.~Kawanaka}, Generalized Gelfand--Graev characters and
  Ennola duality, {\em Adv. Stud. Pure Math.} {\bf 6} (1985), 175--206.

- See also:
  {\sc F.~Digne and J.~Michel}, Foncteurs de Lusztig et caract\``{e}res
  des groupes lin\'{e}aires et unitaires sur un corps fini, 
  {\em J. of Alg.} {\bf 107} (1987), 217--255.

- For the computation of the Green functions for GL_n(q) see for example:
  > GreenFunTab(GL2);
  > PrintInfoTab(GL2green);
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

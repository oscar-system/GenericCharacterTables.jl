using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order =
  q^24 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
  (q^4 + 1) * (q^4 - q^2 + 1)
table = QQPolyRingElem[[
  (q + 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
  (1 + 2 * q^4) * (1 - q + q^2) * (1 + q + q^2) * (q^2 + 1)^2 * (q + 1)^4,
  6 * q^13 + 23 * q^12 + 50 * q^11 + 79 * q^10 + 96 * q^9 + 95 * q^8 + 78 * q^7 +
  56 * q^6 + 38 * q^5 + 25 * q^4 + 16 * q^3 + 9 * q^2 + 4 * q + 1,
  2 * q^13 + 7 * q^12 + 14 * q^11 + 23 * q^10 + 32 * q^9 + 39 * q^8 + 42 * q^7 +
  40 * q^6 + 34 * q^5 + 25 * q^4 + 16 * q^3 + 9 * q^2 + 4 * q + 1,
  9 * q^10 + 32 * q^9 + 52 * q^8 + 56 * q^7 + 48 * q^6 + 36 * q^5 + 25 * q^4 + 16 * q^3 +
  9 * q^2 + 4 * q + 1,
  (q + 1) * (1 + q + q^2) * (9 * q^6 + 7 * q^5 + 5 * q^4 + 5 * q^3 + 3 * q^2 + 2 * q + 1),
  (1 - q + q^2) * (7 * q^5 + 10 * q^4 + 9 * q^3 + 6 * q^2 + 3 * q + 1) * (q + 1)^2,
  (1 - q + q^2) * (1 + q + q^2) * (8 * q^3 + 5 * q^2 + 2 * q + 1) * (q + 1)^2,
  4 * q^7 + 15 * q^6 + 24 * q^5 + 23 * q^4 + 16 * q^3 + 9 * q^2 + 4 * q + 1,
  (q + 1) * (6 * q^5 + 14 * q^4 + 16 * q^3 + 8 * q^2 + 3 * q + 1),
  (13 * q^4 + 14 * q^3 + 6 * q^2 + 2 * q + 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1) * (5 * q^3 + 3 * q^2 + 3 * q + 1),
  (q + 1) * (2 * q + 1) * (10 * q^3 + 8 * q^2 + q + 1),
  (q + 1) * (2 * q + 1) * (6 * q^3 + 4 * q^2 + q + 1),
  54 * q^4 + 48 * q^3 + 15 * q^2 + 4 * q + 1,
  (2 * q + 1) * (q + 1) * (2 * q^2 + q + 1),
  (2 * q + 1) * (10 * q^3 + 7 * q^2 + 2 * q + 1),
  14 * q^4 + 16 * q^3 + 7 * q^2 + 4 * q + 1,
  (q + 1) * (6 * q^3 + 6 * q^2 + 3 * q + 1),
  (q + 1) * (8 * q^2 + 3 * q + 1),
  (q + 1) * (8 * q^2 + 3 * q + 1),
  11 * q^2 + 4 * q + 1,
  7 * q^2 + 4 * q + 1,
  6 * q + 1,
  2 * q + 1,
  R(1)] [
  (q - 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
  (1 + 2 * q^4) * (1 - q + q^2) * (1 + q + q^2) * (q^2 + 1)^2 * (q - 1)^4,
  -2 * q^13 + 7 * q^12 - 14 * q^11 + 23 * q^10 - 32 * q^9 + 39 * q^8 - 42 * q^7 + 40 * q^6 - 34 * q^5 + 25 * q^4 - 16 * q^3 + 9 * q^2 - 4 * q + 1,
  -6 * q^13 + 23 * q^12 - 50 * q^11 + 79 * q^10 - 96 * q^9 + 95 * q^8 - 78 * q^7 +
  56 * q^6 - 38 * q^5 + 25 * q^4 - 16 * q^3 + 9 * q^2 - 4 * q + 1,
  9 * q^10 - 32 * q^9 + 52 * q^8 - 56 * q^7 + 48 * q^6 - 36 * q^5 + 25 * q^4 - 16 * q^3 +
  9 * q^2 - 4 * q + 1,
  -(1 + q + q^2) * (7 * q^5 - 10 * q^4 + 9 * q^3 - 6 * q^2 + 3 * q - 1) * (q - 1)^2,
  -(q - 1) * (1 - q + q^2) * (9 * q^6 - 7 * q^5 + 5 * q^4 - 5 * q^3 + 3 * q^2 - 2 * q + 1),
  -(1 + q + q^2) * (1 - q + q^2) * (8 * q^3 - 5 * q^2 + 2 * q - 1) * (q - 1)^2,
  -4 * q^7 + 15 * q^6 - 24 * q^5 + 23 * q^4 - 16 * q^3 + 9 * q^2 - 4 * q + 1,
  (q - 1) * (6 * q^5 - 14 * q^4 + 16 * q^3 - 8 * q^2 + 3 * q - 1),
  (13 * q^4 - 14 * q^3 + 6 * q^2 - 2 * q + 1) * (q - 1)^2,
  (q - 1) * (q^2 + 1) * (5 * q^3 - 3 * q^2 + 3 * q - 1),
  -(-1 + 2 * q) * (q - 1) * (10 * q^3 - 8 * q^2 + q - 1),
  -(-1 + 2 * q) * (q - 1) * (6 * q^3 - 4 * q^2 + q - 1),
  (12 * q^4 - (8 + 8) * q^3 + 9 * q^2 - 4 * q + 1) + (9 * q^4 - 8 * q^3 + 2 * q^2) * 3 +
  (6 * q^4 - 4 * q^3) * 2 + q^4 * 3,
  (12 * q^4 - (8 + 8) * q^3 + 9 * q^2 - 4 * q + 1) - (9 * q^4 - 8 * q^3 + 2 * q^2) + q^4,
  (12 * q^4 - (8 + 8) * q^3 + 9 * q^2 - 4 * q + 1) + (9 * q^4 - 8 * q^3 + 2 * q^2) - q^4,
  (12 * q^4 - (8 + 8) * q^3 + 9 * q^2 - 4 * q + 1) - (9 * q^4 - 8 * q^3 + 2 * q^2) +
  (6 * q^4 - 4 * q^3) * 2 - q^4,
  (12 * q^4 - (8 + 8) * q^3 + 9 * q^2 - 4 * q + 1) - (6 * q^4 - 4 * q^3),
  -(q - 1) * (8 * q^2 - 3 * q + 1),
  -(q - 1) * (8 * q^2 - 3 * q + 1),
  11 * q^2 - 4 * q + 1,
  7 * q^2 - 4 * q + 1,
  -2 * q + 1,
  -6 * q + 1,
  R(1)] [
  (q - 1)^2 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (1 + 2 * q^4) * (1 - q + q^2) * (1 + q + q^2) * (q - 1)^2 * (q + 1)^2 * (q^2 + 1)^2,
  2 * q^13 - q^12 + 2 * q^11 - 5 * q^10 + 1 - 5 * q^8 + 2 * q^7 + 2 * q^5 + q^4 + q^2,
  -2 * q^13 - q^12 - 2 * q^11 - 5 * q^10 + 1 - 5 * q^8 - 2 * q^7 - 2 * q^5 + q^4 + q^2,
  q^10 + 1 - 4 * q^8 + q^4 + q^2,
  (q - 1) * (1 + q + q^2) * (q^6 - 3 * q^5 + q^4 - q^3 - q^2 - 1),
  -(q + 1) * (1 - q + q^2) * (q^6 + 3 * q^5 + q^4 + q^3 - q^2 - 1),
  -(q + 1) * (q - 1) * (1 + 3 * q^2) * (1 - q + q^2) * (1 + q + q^2),
  1 - q^6 - q^4 + q^2,
  -(q + 1) * (q - 1) * (2 * q^4 + 4 * q^2 + 1),
  5 * q^6 + 1 - q^4 + 3 * q^2,
  -(3 * q^2 - 1) * (q^2 + 1)^2,
  1 - 2 * q^4 + 5 * q^2,
  -(1 + 3 * q^2) * (2 * q^2 - 1),
  (-4 * q^4 + q^2 + 1) + (q^4 + 2 * q^2) * 3 + (-2 * q^4) * 2 + q^4 * 3,
  (-4 * q^4 + q^2 + 1) - (q^4 + 2 * q^2) + q^4,
  (-4 * q^4 + q^2 + 1) + (q^4 + 2 * q^2) - q^4,
  (-4 * q^4 + q^2 + 1) - (q^4 + 2 * q^2) + (-2 * q^4) * 2 - q^4,
  (-4 * q^4 + q^2 + 1) - (-2 * q^4),
  1 + 3 * q^2,
  1 + 3 * q^2,
  1 + 3 * q^2,
  -(q - 1) * (q + 1),
  2 * q + 1,
  -2 * q + 1,
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (1 + q^4),
  (1 + 2 * q^4) * (1 - q + q^2) * (1 + q + q^2) * (q - 1)^4 * (q + 1)^4,
  2 * q^13 - q^12 - 6 * q^11 - q^10 + 8 * q^9 + 7 * q^8 - 6 * q^7 - 8 * q^6 + 2 * q^5 +
  5 * q^4 + 1 - 3 * q^2,
  -2 * q^13 - q^12 + 6 * q^11 - q^10 - 8 * q^9 + 7 * q^8 + 6 * q^7 - 8 * q^6 - 2 * q^5 +
  5 * q^4 + 1 - 3 * q^2,
  -3 * q^10 + 1 + 8 * q^8 - 8 * q^6 + 5 * q^4 - 3 * q^2,
  (q + 1) * (1 + q + q^2) * (q^4 + q^3 - 2 * q^2 + 1) * (q - 1)^2,
  -(q - 1) * (1 - q + q^2) * (q^4 - q^3 - 2 * q^2 + 1) * (q + 1)^2,
  (1 - q + q^2) * (1 + q + q^2) * (q - 1)^2 * (q + 1)^2,
  1 - q^6 + 3 * q^4 - 3 * q^2,
  (q - 1) * (q + 1) * (2 * q^4 - 1),
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q + 1) * (q - 1) * (7 * q^4 - 4 * q^2 + 1),
  -(q + 1) * (q - 1) * (2 * q^2 + 1),
  (q - 1) * (q + 1) * (2 * q^2 - 1),
  (4 * q^4 - 3 * q^2 + 1) + (-3 * q^4 + 2 * q^2) * 3 + (2 * q^4) * 2 + q^4 * 3,
  (4 * q^4 - 3 * q^2 + 1) - (-3 * q^4 + 2 * q^2) + q^4,
  (4 * q^4 - 3 * q^2 + 1) + (-3 * q^4 + 2 * q^2) - q^4,
  (4 * q^4 - 3 * q^2 + 1) - (-3 * q^4 + 2 * q^2) + (2 * q^4) * 2 - q^4,
  (4 * q^4 - 3 * q^2 + 1) - (2 * q^4),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -5 * q^2 + 1,
  2 * q + 1,
  -2 * q + 1,
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
  -(q^2 + 1) * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (q - 1)^3 * (q + 1)^3,
  -3 * q^13 + 5 * q^12 + 2 * q^11 - 8 * q^10 + 6 * q^9 - q^8 - 6 * q^7 + 8 * q^6 - q^5 -
  5 * q^4 + 4 * q^3 + 1 - 2 * q,
  -q^13 + q^12 + 2 * q^11 - 4 * q^10 + 2 * q^9 + 3 * q^8 - 6 * q^7 + 4 * q^6 + q^5 -
  5 * q^4 + 4 * q^3 + 1 - 2 * q,
  1 + 2 * q^9 - 2 * q^8 - 4 * q^7 + 6 * q^6 - 5 * q^4 + 4 * q^3 - 2 * q,
  (q + 1) * (3 * q^6 - 2 * q^5 - q^4 + 2 * q^3 - q + 1) * (q - 1)^2,
  (1 - q + q^3) * (1 - q + q^2) * (q - 1)^2 * (q + 1)^2,
  (1 - q + q^2) * (2 * q^3 - q^2 - q + 1) * (q - 1)^2 * (q + 1)^2,
  -2 * q^7 + 3 * q^6 + 1 - 4 * q^4 + 4 * q^3 - 2 * q,
  (q + 1) * (3 * q^3 - q^2 - q + 1) * (q - 1)^2,
  (q + 1)^2 * (q - 1)^4,
  -(q + 1) * (q^2 + 1) * (q - 1)^3,
  -(q + 1) * (q - 1) * (4 * q^3 - q^2 - 2 * q + 1),
  -(q + 1) * (q - 1)^3,
  (-3 * q^4 + (2 + 2) * q^3 - 2 * q + 1) + (2 * q^3 - q^2) * 3 + (3 * q^4 - 2 * q^3) * 2 +
  q^4 * 3,
  (-3 * q^4 + (2 + 2) * q^3 - 2 * q + 1) - (2 * q^3 - q^2) + q^4,
  (-3 * q^4 + (2 + 2) * q^3 - 2 * q + 1) + (2 * q^3 - q^2) - q^4,
  (-3 * q^4 + (2 + 2) * q^3 - 2 * q + 1) - (2 * q^3 - q^2) + (3 * q^4 - 2 * q^3) * 2 - q^4,
  (-3 * q^4 + (2 + 2) * q^3 - 2 * q + 1) - (3 * q^4 - 2 * q^3),
  (q + 1) * (-1 + 2 * q) * (q - 1),
  (q + 1) * (-1 + 2 * q) * (q - 1),
  -q^2 - 2 * q + 1,
  (q - 1)^2,
  -3 * q + 1,
  -q + 1,
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (1 - q^2 + q^4) * (1 + q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
  -(q^2 + 1) * (1 - q^2 + q^4) * (1 + q + q^2)^2 * (q - 1)^3 * (q + 1)^3,
  q^13 + q^12 - 2 * q^11 - 4 * q^10 - 2 * q^9 + 3 * q^8 + 6 * q^7 + 4 * q^6 - q^5 -
  5 * q^4 - 4 * q^3 + 1 + 2 * q,
  3 * q^13 + 5 * q^12 - 2 * q^11 - 8 * q^10 - 6 * q^9 - q^8 + 6 * q^7 + 8 * q^6 + q^5 -
  5 * q^4 - 4 * q^3 + 1 + 2 * q,
  1 - 2 * q^9 - 2 * q^8 + 4 * q^7 + 6 * q^6 - 5 * q^4 - 4 * q^3 + 2 * q,
  -(1 + q + q^2) * (q^3 - q - 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (3 * q^6 + 2 * q^5 - q^4 - 2 * q^3 + q + 1) * (q + 1)^2,
  -(-1 - q + q^2 + 2 * q^3) * (1 + q + q^2) * (q - 1)^2 * (q + 1)^2,
  2 * q^7 + 3 * q^6 + 1 - 4 * q^4 - 4 * q^3 + 2 * q,
  (q - 1) * (3 * q^3 + q^2 - q - 1) * (q + 1)^2,
  (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 + 1) * (q + 1)^3,
  (q - 1) * (q + 1) * (4 * q^3 + q^2 - 2 * q - 1),
  -(q - 1) * (q + 1)^3,
  (-3 * q^4 - (2 + 2) * q^3 + 2 * q + 1) + (-2 * q^3 - q^2) * 3 +
  (3 * q^4 + 2 * q^3) * 2 + q^4 * 3,
  (-3 * q^4 - (2 + 2) * q^3 + 2 * q + 1) - (-2 * q^3 - q^2) + q^4,
  (-3 * q^4 - (2 + 2) * q^3 + 2 * q + 1) + (-2 * q^3 - q^2) - q^4,
  (-3 * q^4 - (2 + 2) * q^3 + 2 * q + 1) - (-2 * q^3 - q^2) + (3 * q^4 + 2 * q^3) * 2 - q^4,
  (-3 * q^4 - (2 + 2) * q^3 + 2 * q + 1) - (3 * q^4 + 2 * q^3),
  -(q + 1) * (q - 1) * (2 * q + 1),
  -(q + 1) * (q - 1) * (2 * q + 1),
  -q^2 + 2 * q + 1,
  (q + 1)^2,
  q + 1,
  3 * q + 1,
  R(1)] [
  (q - 1)^2 * (1 + q + q^2) * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (1 - q + q^2) * (1 + 2 * q^4) * (q - 1)^2 * (q^2 + 1)^2 * (q + 1)^4,
  1 - q^12 - q^11 - 2 * q^10 - 3 * q^9 - q^8 + 2 * q^6 + 2 * q^5 + q^4 + q^3 + q,
  2 * q^13 + q^12 - q^11 + 2 * q^10 - q^9 - 3 * q^8 + 1 - 2 * q^6 - 2 * q^5 + q^4 + q^3 + q,
  1 - q^9 - 2 * q^8 - q^7 + q^4 + q^3 + q,
  (q + 1) * (3 * q^6 + 4 * q^5 + 5 * q^4 + 5 * q^3 + 3 * q^2 + 2 * q + 1) * (q - 1)^2,
  (q - 1) * (-1 - q - q^2 - q^3 + q^4) * (1 - q + q^2) * (q + 1)^2,
  -(-1 + q - 2 * q^2 + q^3) * (1 + q + q^2) * (1 - q + q^2) * (q + 1)^2,
  q^7 + 1 - 3 * q^5 - q^4 + q^3 + q,
  -(q + 1) * (q^4 - q^3 - 2 * q^2 - 1),
  -(q - 1) * (2 * q^3 + 3 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (2 * q + 1) * (q^2 + 1) * (q - 1)^2,
  -(q + 1) * (q^4 - 2 * q^3 - 4 * q^2 - 1),
  -(q + 1) * (q - 1) * (3 * q^3 + q^2 + q + 1),
  (q^3 + q + 1) + (2 * q^3 + 2 * q^2) * 3 + (q^3) * 2 + q^4 * 3,
  (q^3 + q + 1) - (2 * q^3 + 2 * q^2) + q^4,
  (q^3 + q + 1) + (2 * q^3 + 2 * q^2) - q^4,
  (q^3 + q + 1) - (2 * q^3 + 2 * q^2) + (q^3) * 2 - q^4,
  (q^3 + q + 1) - (q^3),
  -(q - 1) * (q + 1)^2,
  (q + 1) * (2 * q^2 + 1),
  -q^2 + q + 1,
  1 + q + q^2,
  3 * q + 1,
  -q + 1,
  R(1)] [
  (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2) * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (1 + q + q^2) * (1 + 2 * q^4) * (q + 1)^2 * (q^2 + 1)^2 * (q - 1)^4,
  -2 * q^13 + q^12 + q^11 + 2 * q^10 + q^9 - 3 * q^8 + 1 - 2 * q^6 + 2 * q^5 + q^4 - q^3 -
  q,
  1 - q^12 + q^11 - 2 * q^10 + 3 * q^9 - q^8 + 2 * q^6 - 2 * q^5 + q^4 - q^3 - q,
  1 + q^9 - 2 * q^8 + q^7 + q^4 - q^3 - q,
  -(q + 1) * (-1 + q - q^2 + q^3 + q^4) * (1 + q + q^2) * (q - 1)^2,
  -(q - 1) * (3 * q^6 - 4 * q^5 + 5 * q^4 - 5 * q^3 + 3 * q^2 - 2 * q + 1) * (q + 1)^2,
  (1 + q + 2 * q^2 + q^3) * (1 + q + q^2) * (1 - q + q^2) * (q - 1)^2,
  -q^7 + 1 + 3 * q^5 - q^4 - q^3 - q,
  (q - 1) * (q^4 + q^3 - 2 * q^2 - 1),
  -(q + 1) * (2 * q^3 - 3 * q^2 - 1) * (q - 1)^2,
  (-1 + 2 * q) * (q - 1) * (q^2 + 1) * (q + 1)^2,
  (q - 1) * (q^4 + 2 * q^3 - 4 * q^2 - 1),
  (q - 1) * (q + 1) * (3 * q^3 - q^2 + q - 1),
  (-q^3 - q + 1) + (-2 * q^3 + 2 * q^2) * 3 + (-q^3) * 2 + q^4 * 3,
  (-q^3 - q + 1) - (-2 * q^3 + 2 * q^2) + q^4,
  (-q^3 - q + 1) + (-2 * q^3 + 2 * q^2) - q^4,
  (-q^3 - q + 1) - (-2 * q^3 + 2 * q^2) + (-q^3) * 2 - q^4,
  (-q^3 - q + 1) - (-q^3),
  (q + 1) * (q - 1)^2,
  -(q - 1) * (2 * q^2 + 1),
  -q^2 - q + 1,
  1 - q + q^2,
  q + 1,
  -3 * q + 1,
  R(1)] [
  (q - 1)^2 * (1 + q + q^2) * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  -(q - 1) * (1 - q^2 + q^4) * (1 + q + q^2) * (q^2 + 1) * (1 - q + q^2)^2 * (q + 1)^3,
  3 * q^13 + 2 * q^12 - q^11 + q^10 - 3 * q^9 - 4 * q^8 + 1 - q^6 - q^5 + q^4 + q^3 + q,
  -q^13 - 2 * q^12 - q^11 - q^10 - q^9 + 1 + q^6 + q^5 + q^4 + q^3 + q,
  1 - q^9 - 2 * q^8 - q^7 + q^4 + q^3 + q,
  (q + 1) * (1 + q + q^2) * (q^5 - q^4 + 2 * q^3 - q + 1),
  -(q - 1) * (1 - q + q^2) * (2 * q^4 + q^3 + q^2 + q + 1) * (q + 1)^2,
  (1 - q + q^2) * (2 * q^3 + 2 * q^2 + 2 * q + 1) * (q - 1)^2 * (q + 1)^2,
  q^7 + 1 + 2 * q^4 + q^3 + q,
  -(q + 1) * (q - 1) * (q^3 + q + 1),
  -(q - 1) * (2 * q^3 + 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1) * (2 * q^3 + 1),
  -(q + 1) * (q - 1) * (q^3 - q^2 + q + 1),
  -(q + 1) * (q - 1) * (3 * q^3 + q^2 + q + 1),
  (q^3 + q + 1) + (-q^3 - q^2) * 3 + (q^3) * 2 + q^4 * 3,
  (q^3 + q + 1) - (-q^3 - q^2) + q^4,
  (q^3 + q + 1) + (-q^3 - q^2) - q^4,
  (q^3 + q + 1) - (-q^3 - q^2) + (q^3) * 2 - q^4,
  (q^3 + q + 1) - (q^3),
  (q + 1) * (2 * q^2 + 1),
  -(q - 1) * (q + 1)^2,
  2 * q^2 + q + 1,
  -(2 * q + 1) * (q - 1),
  R(1),
  2 * q + 1,
  R(1)] [
  (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2) * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  -(q + 1) * (1 - q^2 + q^4) * (1 - q + q^2) * (q^2 + 1) * (1 + q + q^2)^2 * (q - 1)^3,
  q^13 - 2 * q^12 + q^11 - q^10 + q^9 + 1 + q^6 - q^5 + q^4 - q^3 - q,
  -3 * q^13 + 2 * q^12 + q^11 + q^10 + 3 * q^9 - 4 * q^8 + 1 - q^6 + q^5 + q^4 - q^3 - q,
  1 + q^9 - 2 * q^8 + q^7 + q^4 - q^3 - q,
  (q + 1) * (1 + q + q^2) * (2 * q^4 - q^3 + q^2 - q + 1) * (q - 1)^2,
  (q - 1) * (1 - q + q^2) * (q^5 + q^4 + 2 * q^3 - q - 1),
  -(1 + q + q^2) * (2 * q^3 - 2 * q^2 + 2 * q - 1) * (q - 1)^2 * (q + 1)^2,
  -q^7 + 1 + 2 * q^4 - q^3 - q,
  (q - 1) * (q + 1) * (q^3 + q - 1),
  -(q + 1) * (2 * q^3 - 1) * (q - 1)^2,
  (q - 1) * (q^2 + 1) * (2 * q^3 - 1),
  (q - 1) * (q + 1) * (q^3 + q^2 + q - 1),
  (q - 1) * (q + 1) * (3 * q^3 - q^2 + q - 1),
  (-q^3 - q + 1) + (q^3 - q^2) * 3 + (-q^3) * 2 + q^4 * 3,
  (-q^3 - q + 1) - (q^3 - q^2) + q^4,
  (-q^3 - q + 1) + (q^3 - q^2) - q^4,
  (-q^3 - q + 1) - (q^3 - q^2) + (-q^3) * 2 - q^4,
  (-q^3 - q + 1) - (-q^3),
  -(q - 1) * (2 * q^2 + 1),
  (q + 1) * (q - 1)^2,
  2 * q^2 - q + 1,
  -(q + 1) * (-1 + 2 * q),
  -2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
  -(q^2 + 1) * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (q - 1)^3 * (q + 1)^3,
  -q^13 - q^12 + 1 + 2 * q^10 + 2 * q^9 + q^8 - 2 * q^6 - q^5 - q^4,
  q^13 - q^12 + 1 + 2 * q^10 - 2 * q^9 + q^8 - 2 * q^6 + q^5 - q^4,
  1 + 2 * q^8 - 2 * q^6 - q^4,
  (q + 1) * (1 + q^2 + q^3 + q^4) * (1 + q + q^2) * (q - 1)^2,
  -(q - 1) * (1 + q^2 - q^3 + q^4) * (1 - q + q^2) * (q + 1)^2,
  (1 - q + q^2) * (1 + q + q^2) * (q - 1)^2 * (q + 1)^2,
  1 - q^6,
  -(q + 1) * (q - 1) * (1 + q^4),
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + 1)^2,
  (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + 1),
  (q^4 + 1) + (-q^2) * 3 + (-q^4) * 2 + q^4 * 3,
  (q^4 + 1) - (-q^2) + q^4,
  (q^4 + 1) + (-q^2) - q^4,
  (q^4 + 1) - (-q^2) + (-q^4) * 2 - q^4,
  (q^4 + 1) - (-q^4),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  q^2 + 1,
  -q + 1,
  q + 1,
  R(1)] [
  (q - 1)^2 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  -(q + 1) * (q - 1) * (q^4 + 1) * (1 - q + q^2) * (q^2 + 1) * (1 + q + q^2),
  1 - q^12 - q^10 - q^8 + q^4 + q^2,
  1 - q^12 - q^10 - q^8 + q^4 + q^2,
  q^10 + 1 + q^4 + q^2,
  -(q - 1) * (1 + q^3 + q^4) * (1 + q + q^2) * (q^2 + 1),
  (q + 1) * (q^2 + 1) * (1 - q + q^2) * (q^4 - q^3 + 1),
  -(q + 1) * (q - 1) * (1 - q + q^2) * (1 + q + q^2) * (q^2 + 1),
  1 + q^6 + q^4 + q^2,
  2 * q^6 + 1 + q^2,
  -(q - 1) * (q + 1) * (q^2 + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + 1)^2,
  -4 * q^4 + 1 + q^2,
  q^2 + 1,
  (q^2 + 1) + (-q^4) * 3 + (-2 * q^4) * 2 - q^4 * 3,
  (q^2 + 1) - (-q^4) - q^4,
  (q^2 + 1) + (-q^4) + q^4,
  (q^2 + 1) - (-q^4) + (-2 * q^4) * 2 + q^4,
  (q^2 + 1) - (-2 * q^4),
  q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (1 + q + q^2)^2 * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1) *
  (1 - q^2 + q^4) * (1 + q^4),
  -(q - 1) * (1 - q + q^2) * (1 + q + q^2) * (q^4 + 1) * (q + 1)^3,
  2 * q^13 + 3 * q^12 + 1 - 3 * q^10 - 4 * q^9 - 3 * q^8 - 2 * q^7 + 2 * q^5 + q^4 + q^2 +
  2 * q,
  2 * q^13 + 3 * q^12 + 1 + q^10 + 4 * q^9 + q^8 - 2 * q^7 + 2 * q^5 + q^4 + q^2 + 2 * q,
  q^10 + 1 - 4 * q^8 - 4 * q^7 + 2 * q^5 + q^4 + q^2 + 2 * q,
  -(q - 1) * (1 + q^3 + q^4) * (1 + q + q^2) * (q + 1)^2,
  (1 - q + q^2) * (q^4 - q^3 + 1) * (q + 1)^3,
  -(q - 1) * (1 - q + q^2) * (1 + q + q^2) * (q + 1)^3,
  -2 * q^7 - 3 * q^6 + 1 + q^4 + q^2 + 2 * q,
  -(q + 1) * (q - 1) * (2 * q^4 + 2 * q^3 + 2 * q^2 + 2 * q + 1),
  -(q^4 - 2 * q^3 - 1) * (q + 1)^2,
  -(q^4 - 2 * q^3 - 1) * (q + 1)^2,
  -(q + 1) * (2 * q^4 - 2 * q^3 - q - 1),
  (2 * q^3 + 1) * (q + 1)^2,
  (q^2 + 2 * q + 1) + (-q^4) * 3 + (2 * q^4 + 2 * q^3) * 2 - q^4 * 3,
  (q^2 + 2 * q + 1) - (-q^4) - q^4,
  (q^2 + 2 * q + 1) + (-q^4) + q^4,
  (q^2 + 2 * q + 1) - (-q^4) + (2 * q^4 + 2 * q^3) * 2 + q^4,
  (q^2 + 2 * q + 1) - (2 * q^4 + 2 * q^3),
  (q + 1)^2,
  (q + 1)^2,
  (q + 1)^2,
  (q + 1)^2,
  2 * q + 1,
  2 * q + 1,
  R(1)] [
  (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2)^2 * (q^2 + 1) *
  (1 - q^2 + q^4) * (1 + q^4),
  -(q + 1) * (1 - q + q^2) * (1 + q + q^2) * (q^4 + 1) * (q - 1)^3,
  -2 * q^13 + 3 * q^12 + 1 + q^10 - 4 * q^9 + q^8 + 2 * q^7 - 2 * q^5 + q^4 + q^2 - 2 * q,
  -2 * q^13 + 3 * q^12 + 1 - 3 * q^10 + 4 * q^9 - 3 * q^8 + 2 * q^7 - 2 * q^5 + q^4 + q^2 - 2 * q,
  q^10 + 1 - 4 * q^8 + 4 * q^7 - 2 * q^5 + q^4 + q^2 - 2 * q,
  -(1 + q^3 + q^4) * (1 + q + q^2) * (q - 1)^3,
  (q + 1) * (1 - q + q^2) * (q^4 - q^3 + 1) * (q - 1)^2,
  -(q + 1) * (1 - q + q^2) * (1 + q + q^2) * (q - 1)^3,
  2 * q^7 - 3 * q^6 + 1 + q^4 + q^2 - 2 * q,
  -(q + 1) * (q - 1) * (2 * q^4 - 2 * q^3 + 2 * q^2 - 2 * q + 1),
  -(q^4 + 2 * q^3 - 1) * (q - 1)^2,
  -(q^4 + 2 * q^3 - 1) * (q - 1)^2,
  (q - 1) * (2 * q^4 + 2 * q^3 + q - 1),
  -(2 * q^3 - 1) * (q - 1)^2,
  (q^2 - 2 * q + 1) + (-q^4) * 3 + (2 * q^4 - 2 * q^3) * 2 - q^4 * 3,
  (q^2 - 2 * q + 1) - (-q^4) - q^4,
  (q^2 - 2 * q + 1) + (-q^4) + q^4,
  (q^2 - 2 * q + 1) - (-q^4) + (2 * q^4 - 2 * q^3) * 2 + q^4,
  (q^2 - 2 * q + 1) - (2 * q^4 - 2 * q^3),
  (q - 1)^2,
  (q - 1)^2,
  (q - 1)^2,
  (q - 1)^2,
  -2 * q + 1,
  -2 * q + 1,
  R(1)] [
  (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1)^2 * (1 - q^2 + q^4),
  -(1 - q + q^2) * (1 + q + q^2) * (q^2 + 1) * (q - 1)^3 * (q + 1)^3,
  1 - q^12 + q^10 + q^8 - q^4 - q^2,
  1 - q^12 + q^10 + q^8 - q^4 - q^2,
  -q^10 + 1 + 2 * q^8 - q^4 - q^2,
  -(q + 1) * (-1 - q^3 + q^4) * (1 + q + q^2) * (q - 1)^2,
  (q - 1) * (-1 + q^3 + q^4) * (1 - q + q^2) * (q + 1)^2,
  (1 - q + q^2) * (1 + q + q^2) * (q - 1)^2 * (q + 1)^2,
  1 + q^6 - q^4 - q^2,
  -(q - 1) * (q + 1),
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  (-q^2 + 1) + (q^4) * 3 - q^4 * 3,
  (-q^2 + 1) - (q^4) - q^4,
  (-q^2 + 1) + (q^4) + q^4,
  (-q^2 + 1) - (q^4) + q^4,
  (-q^2 + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1)] [
  -(q - 1) * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  -(q - 1) * (1 + 2 * q^4) * (1 - q + q^2) * (1 + q + q^2) * (q^2 + 1)^2 * (q + 1)^3,
  -2 * q^13 - 3 * q^12 - 4 * q^11 - q^10 + 4 * q^9 + 9 * q^8 + 12 * q^7 + 10 * q^6 +
  8 * q^5 + 5 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q + 1,
  -2 * q^13 - 3 * q^12 - 4 * q^11 - 5 * q^10 - 4 * q^9 - 3 * q^8 + 1 + 2 * q^6 + 4 * q^5 +
  5 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q,
  -3 * q^10 - 4 * q^9 + 1 + 4 * q^7 + 6 * q^6 + 6 * q^5 + 5 * q^4 + 4 * q^3 + 3 * q^2 +
  2 * q,
  -(q - 1) * (1 + 2 * q + 3 * q^2 + 5 * q^3 + 5 * q^4 + 5 * q^5 + 5 * q^6) * (1 + q + q^2),
  -(q + 1) * (1 - q + q^2) * (3 * q^6 + q^5 - q^4 - 3 * q^3 - 3 * q^2 - 2 * q - 1),
  (1 + 3 * q^2) * (1 - q + q^2) * (1 + q + q^2) * (q + 1)^2,
  -2 * q^7 - 3 * q^6 + 1 + 3 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q,
  (q + 1) * (2 * q^4 + 4 * q^3 + 4 * q^2 + q + 1),
  -(q + 1) * (3 * q^5 - 3 * q^4 - 6 * q^3 - 4 * q^2 - q - 1),
  -(q - 1) * (q^2 + 1) * (3 * q^3 + 3 * q^2 + 3 * q + 1),
  (2 * q^3 + 6 * q^2 + 1) * (q + 1)^2,
  -(q + 1) * (2 * q^4 - 4 * q^3 - 2 * q^2 - q - 1),
  (4 * q^3 + 3 * q^2 + 2 * q + 1) + (3 * q^4 + 4 * q^3 + 2 * q^2) * 3 + (2 * q^3) * 2 +
  q^4 * 3,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) - (3 * q^4 + 4 * q^3 + 2 * q^2) + q^4,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) + (3 * q^4 + 4 * q^3 + 2 * q^2) - q^4,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) - (3 * q^4 + 4 * q^3 + 2 * q^2) + (2 * q^3) * 2 - q^4,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) - (2 * q^3),
  1 + 3 * q^2 + 2 * q,
  (q + 1) * (4 * q^2 + q + 1),
  1 + 3 * q^2 + 2 * q,
  1 + 3 * q^2 + 2 * q,
  4 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1) * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  -(q + 1) * (1 + 2 * q^4) * (1 - q + q^2) * (1 + q + q^2) * (q^2 + 1)^2 * (q - 1)^3,
  2 * q^13 - 3 * q^12 + 4 * q^11 - 5 * q^10 + 4 * q^9 - 3 * q^8 + 1 + 2 * q^6 - 4 * q^5 +
  5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q,
  2 * q^13 - 3 * q^12 + 4 * q^11 - q^10 - 4 * q^9 + 9 * q^8 - 12 * q^7 + 10 * q^6 -
  8 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1,
  -3 * q^10 + 4 * q^9 + 1 - 4 * q^7 + 6 * q^6 - 6 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 -
  2 * q,
  (q - 1) * (1 + q + q^2) * (3 * q^6 - q^5 - q^4 + 3 * q^3 - 3 * q^2 + 2 * q - 1),
  (q + 1) * (1 - q + q^2) * (5 * q^6 - 5 * q^5 + 5 * q^4 - 5 * q^3 + 3 * q^2 - 2 * q + 1),
  (1 + 3 * q^2) * (1 - q + q^2) * (1 + q + q^2) * (q - 1)^2,
  2 * q^7 - 3 * q^6 + 1 + 3 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q,
  -(q - 1) * (2 * q^4 - 4 * q^3 + 4 * q^2 - q + 1),
  -(q - 1) * (3 * q^5 + 3 * q^4 - 6 * q^3 + 4 * q^2 - q + 1),
  -(q + 1) * (q^2 + 1) * (3 * q^3 - 3 * q^2 + 3 * q - 1),
  -(2 * q^3 - 6 * q^2 - 1) * (q - 1)^2,
  (q - 1) * (2 * q^4 + 4 * q^3 - 2 * q^2 + q - 1),
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) + (3 * q^4 - 4 * q^3 + 2 * q^2) * 3 + (-2 * q^3) * 2 +
  q^4 * 3,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) - (3 * q^4 - 4 * q^3 + 2 * q^2) + q^4,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) + (3 * q^4 - 4 * q^3 + 2 * q^2) - q^4,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) - (3 * q^4 - 4 * q^3 + 2 * q^2) + (-2 * q^3) * 2 - q^4,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) - (-2 * q^3),
  1 + 3 * q^2 - 2 * q,
  -(q - 1) * (4 * q^2 - q + 1),
  1 + 3 * q^2 - 2 * q,
  1 + 3 * q^2 - 2 * q,
  R(1),
  -4 * q + 1,
  R(1)] [
  -(q - 1) * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (q^4 + 1) * (1 - q + q^2) * (q^2 + 1) * (1 + q + q^2) * (q + 1)^2,
  -4 * q^13 - 7 * q^12 - 10 * q^11 - 9 * q^10 - 4 * q^9 + q^8 + 6 * q^7 + 6 * q^6 +
  6 * q^5 + 5 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q + 1,
  1 + q^12 + 2 * q^11 + 3 * q^10 + 4 * q^9 + 5 * q^8 + 6 * q^7 + 6 * q^6 + 6 * q^5 +
  5 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q,
  -3 * q^10 - 4 * q^9 + 1 + 4 * q^7 + 6 * q^6 + 6 * q^5 + 5 * q^4 + 4 * q^3 + 3 * q^2 +
  2 * q,
  (1 + q + q^2) * (q^5 + 2 * q^4 - q^3 + 2 * q^2 - q + 1) * (q + 1)^2,
  -(-1 - q - 2 * q^2 - q^3 - 2 * q^4 + q^5) * (1 - q + q^2) * (q + 1)^2,
  -(q + 1) * (q - 1) * (1 + q + q^2) * (1 - q + q^2) * (4 * q^3 + 3 * q^2 + 2 * q + 1),
  2 * q^7 + 3 * q^6 + 4 * q^5 + 5 * q^4 + 4 * q^3 + 3 * q^2 + 2 * q + 1,
  -(q + 1) * (2 * q^4 - 2 * q^3 - 2 * q^2 - q - 1),
  (q + 1) * (3 * q^3 + q^2 + q + 1) * (q^2 + 1),
  (q + 1) * (3 * q^3 + q^2 + q + 1) * (q^2 + 1),
  -2 * q^5 - 4 * q^4 + 6 * q^3 + 3 * q^2 + 2 * q + 1,
  2 * q^5 + 4 * q^4 + 6 * q^3 + 3 * q^2 + 2 * q + 1,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) + (-3 * q^4) * 3 + (2 * q^3) * 2 - q^4 * 3,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) - (-3 * q^4) - q^4,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) + (-3 * q^4) + q^4,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) - (-3 * q^4) + (2 * q^3) * 2 + q^4,
  (4 * q^3 + 3 * q^2 + 2 * q + 1) - (2 * q^3),
  (q + 1) * (4 * q^2 + q + 1),
  1 + 3 * q^2 + 2 * q,
  5 * q^2 + 2 * q + 1,
  (q + 1)^2,
  2 * q + 1,
  2 * q + 1,
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1) * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (q^4 + 1) * (1 - q + q^2) * (q^2 + 1) * (1 + q + q^2) * (q - 1)^2,
  1 + q^12 - 2 * q^11 + 3 * q^10 - 4 * q^9 + 5 * q^8 - 6 * q^7 + 6 * q^6 - 6 * q^5 +
  5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q,
  4 * q^13 - 7 * q^12 + 10 * q^11 - 9 * q^10 + 4 * q^9 + q^8 - 6 * q^7 + 6 * q^6 - 6 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1,
  -3 * q^10 + 4 * q^9 + 1 - 4 * q^7 + 6 * q^6 - 6 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 -
  2 * q,
  (1 + q + q^2) * (q^5 + 2 * q^4 - q^3 + 2 * q^2 - q + 1) * (q - 1)^2,
  -(-1 - q - 2 * q^2 - q^3 - 2 * q^4 + q^5) * (1 - q + q^2) * (q - 1)^2,
  (q - 1) * (q + 1) * (1 + q + q^2) * (1 - q + q^2) * (4 * q^3 - 3 * q^2 + 2 * q - 1),
  -2 * q^7 + 3 * q^6 - 4 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1,
  (q - 1) * (2 * q^4 + 2 * q^3 - 2 * q^2 + q - 1),
  (q - 1) * (3 * q^3 - q^2 + q - 1) * (q^2 + 1),
  (q - 1) * (3 * q^3 - q^2 + q - 1) * (q^2 + 1),
  2 * q^5 - 4 * q^4 - 6 * q^3 + 3 * q^2 - 2 * q + 1,
  -2 * q^5 + 4 * q^4 - 6 * q^3 + 3 * q^2 - 2 * q + 1,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) + (-3 * q^4) * 3 + (-2 * q^3) * 2 - q^4 * 3,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) - (-3 * q^4) - q^4,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) + (-3 * q^4) + q^4,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) - (-3 * q^4) + (-2 * q^3) * 2 + q^4,
  (-4 * q^3 + 3 * q^2 - 2 * q + 1) - (-2 * q^3),
  -(q - 1) * (4 * q^2 - q + 1),
  1 + 3 * q^2 - 2 * q,
  5 * q^2 - 2 * q + 1,
  (q - 1)^2,
  -2 * q + 1,
  -2 * q + 1,
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1) *
  (1 - q^2 + q^4) * (1 + q^4),
  -(1 + 2 * q^4) * (1 - q + q^2) * (q^2 + 1) * (1 + q + q^2) * (q - 1)^3 * (q + 1)^3,
  1 + q^12 + q^10 - q^8 - 2 * q^7 - 2 * q^6 + 2 * q^5 + q^4 - q^2,
  1 + q^12 + q^10 - q^8 + 2 * q^7 - 2 * q^6 - 2 * q^5 + q^4 - q^2,
  q^10 + 1 - 2 * q^6 + q^4 - q^2,
  -(q + 1) * (-1 - q^3 + q^4) * (1 + q + q^2) * (q - 1)^2,
  (q - 1) * (-1 + q^3 + q^4) * (1 - q + q^2) * (q + 1)^2,
  -(q + 1) * (q - 1) * (1 - q + q^2) * (1 + q + q^2) * (q^2 + 1),
  1 + q^6 - q^4 - q^2,
  -(q + 1) * (q - 1) * (2 * q^2 + 1),
  (q - 1) * (q + 1) * (q^4 - 2 * q^2 - 1),
  (q - 1) * (q + 1) * (q^4 + 2 * q^2 - 1),
  1 - 2 * q^4 + 3 * q^2,
  -(q^2 + 1) * (2 * q^2 - 1),
  (-q^2 + 1) + (-q^4 + 2 * q^2) * 3 + q^4 * 3,
  (-q^2 + 1) - (-q^4 + 2 * q^2) + q^4,
  (-q^2 + 1) + (-q^4 + 2 * q^2) - q^4,
  (-q^2 + 1) - (-q^4 + 2 * q^2) - q^4,
  (-q^2 + 1),
  -(q - 1) * (q + 1),
  q^2 + 1,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  2 * q + 1,
  -2 * q + 1,
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1) *
  (1 - q^2 + q^4) * (1 + q^4),
  (1 - q + q^2) * (1 + q + q^2) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  -2 * q^13 + q^12 + 2 * q^11 + q^10 + 1 - q^8 - 2 * q^6 + q^4 - q^2,
  2 * q^13 + q^12 - 2 * q^11 + q^10 + 1 - q^8 - 2 * q^6 + q^4 - q^2,
  q^10 + 1 - 2 * q^6 + q^4 - q^2,
  (q - 1) * (1 + q + q^2) * (q^6 - q^5 - q^4 - q^3 + q^2 - 1),
  -(q + 1) * (-1 + q^2 + q^3 - q^4 + q^5 + q^6) * (1 - q + q^2),
  (1 - q + q^2) * (1 + q + q^2) * (q - 1)^2 * (q + 1)^2,
  1 - q^6 + q^4 - q^2,
  -(q - 1) * (q + 1),
  -(q + 1) * (q - 1) * (1 + q^4),
  -(q + 1) * (q - 1) * (1 + q^4),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  (-q^2 + 1) + (q^4) * 3 - q^4 * 3,
  (-q^2 + 1) - (q^4) - q^4,
  (-q^2 + 1) + (q^4) + q^4,
  (-q^2 + 1) - (q^4) + q^4,
  (-q^2 + 1),
  q^2 + 1,
  -(q - 1) * (q + 1),
  q^2 + 1,
  -3 * q^2 + 1,
  R(1),
  R(1),
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2) * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (1 - q^2 + q^4) * (1 - q + q^2) * (q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (1 + q + q^2)^2,
  -q^13 + 1 + q^11 + q^10 + q^9 - q^6 - q^5 - q^4 - q^3 + q,
  -q^13 + 1 + q^11 - q^10 - q^9 + q^6 + q^5 - q^4 - q^3 + q,
  1 + q^9 - q^7 - q^4 - q^3 + q,
  -(q + 1) * (q - 1) * (1 + q + q^2) * (1 + q^4),
  (q + 1) * (1 - q + q^2) * (2 * q^6 + q^5 - q^4 - 2 * q^3 + q + 1),
  (1 + q + q^2) * (q - 1)^2 * (q + 1)^2,
  -q^7 + 1 - q^3 + q,
  (q - 1) * (q + 1) * (q^3 - q - 1),
  -(q - 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1)^3,
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  (-q^3 + q + 1) + (-q^3 - q^2) * 3 + (q^3) * 2 + q^4 * 3,
  (-q^3 + q + 1) - (-q^3 - q^2) + q^4,
  (-q^3 + q + 1) + (-q^3 - q^2) - q^4,
  (-q^3 + q + 1) - (-q^3 - q^2) + (q^3) * 2 - q^4,
  (-q^3 + q + 1) - (q^3),
  q + 1,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1),
  2 * q + 1,
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2) * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (1 - q^2 + q^4) * (1 + q + q^2) * (q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (1 - q + q^2)^2,
  q^13 + 1 - q^11 - q^10 + q^9 + q^6 - q^5 - q^4 + q^3 - q,
  q^13 + 1 - q^11 + q^10 - q^9 - q^6 + q^5 - q^4 + q^3 - q,
  1 - q^9 + q^7 - q^4 + q^3 - q,
  -(q - 1) * (1 + q + q^2) * (2 * q^6 - q^5 - q^4 + 2 * q^3 - q + 1),
  -(q + 1) * (q - 1) * (1 - q + q^2) * (1 + q^4),
  (1 - q + q^2) * (q - 1)^2 * (q + 1)^2,
  q^7 + 1 + q^3 - q,
  -(q + 1) * (q - 1) * (1 - q + q^3),
  (q + 1) * (q - 1)^2,
  -(q - 1) * (q^2 + 1),
  -(q + 1)^2 * (q - 1)^3,
  (q + 1) * (q^2 + 1) * (q - 1)^2,
  (q^3 - q + 1) + (q^3 - q^2) * 3 + (-q^3) * 2 + q^4 * 3,
  (q^3 - q + 1) - (q^3 - q^2) + q^4,
  (q^3 - q + 1) + (q^3 - q^2) - q^4,
  (q^3 - q + 1) - (q^3 - q^2) + (-q^3) * 2 - q^4,
  (q^3 - q + 1) - (-q^3),
  -q + 1,
  (q + 1) * (q - 1)^2,
  -q + 1,
  -q + 1,
  -2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2) * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (q^4 + 1) * (1 - q + q^2) * (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  2 * q^13 - q^12 - q^11 + 1 - q^9 + q^8 - q^4 + q^3 - q,
  1 + q^12 - q^11 + q^9 - q^8 - q^4 + q^3 - q,
  1 - q^9 + q^7 - q^4 + q^3 - q,
  (q + 1) * (1 - q + q^2) * (q^4 + q^3 + q^2 + q + 1) * (q - 1)^2,
  -(q - 1) * (1 - q + q^2 - q^3 + q^4) * (1 - q + q^2) * (q + 1)^2,
  -(q + 1) * (q - 1) * (1 - q + q^3) * (1 - q + q^2) * (1 + q + q^2),
  -q^7 + 1 + q^5 - q^4 + q^3 - q,
  (q + 1) * (q^4 - q^3 + 2 * q^2 - 2 * q + 1),
  (q + 1) * (q^2 + 1) * (q - 1)^2,
  (q + 1) * (q^2 + 1) * (q - 1)^2,
  (q + 1) * (q^2 + 1) * (q - 1)^2,
  -(q - 1) * (1 + q^4),
  (q^3 - q + 1) + (-q^3) * 2 - q^4 * 3,
  (q^3 - q + 1) - q^4,
  (q^3 - q + 1) + q^4,
  (q^3 - q + 1) + (-q^3) * 2 + q^4,
  (q^3 - q + 1) - (-q^3),
  (q + 1) * (q - 1)^2,
  -q + 1,
  -q^2 - q + 1,
  1 - q + q^2,
  -q + 1,
  -q + 1,
  R(1)] [
  -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2) * (q^2 + 1)^2 *
  (1 - q^2 + q^4) * (1 + q^4),
  (q^4 + 1) * (q^2 + 1) * (1 + q + q^2) * (q - 1)^2 * (q + 1)^2,
  1 + q^12 + q^11 - q^9 - q^8 - q^4 - q^3 + q,
  -2 * q^13 - q^12 + q^11 + 1 + q^9 + q^8 - q^4 - q^3 + q,
  1 + q^9 - q^7 - q^4 - q^3 + q,
  (q + 1) * (1 + q + q^2) * (q^4 + q^3 + q^2 + q + 1) * (q - 1)^2,
  -(q - 1) * (1 - q + q^2 - q^3 + q^4) * (1 + q + q^2) * (q + 1)^2,
  (q - 1) * (q + 1) * (1 - q + q^2) * (1 + q + q^2) * (q^3 - q - 1),
  q^7 + 1 - q^5 - q^4 - q^3 + q,
  -(q - 1) * (q^4 + q^3 + 2 * q^2 + 2 * q + 1),
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  (q + 1) * (1 + q^4),
  (-q^3 + q + 1) + (q^3) * 2 - q^4 * 3,
  (-q^3 + q + 1) - q^4,
  (-q^3 + q + 1) + q^4,
  (-q^3 + q + 1) + (q^3) * 2 + q^4,
  (-q^3 + q + 1) - (q^3),
  -(q - 1) * (q + 1)^2,
  q + 1,
  -q^2 + q + 1,
  1 + q + q^2,
  q + 1,
  q + 1,
  R(1)]]
classinfo = Vector{Any}[
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
]
classlength =
  R.([
    1,
    (q^6 - 1) * (q^4 + 1) * (q^6 + 1),
    q^3 * (q^3 + 1) * (q^4 + 1) * (q^12 - 1) * 1//2,
    q^3 * (q^3 - 1) * (q^4 + 1) * (q^12 - 1) * 1//2,
    q^4 * (q^4 + q^2 + 1) * (q^8 - 1) * (q^12 - 1),
    q^7 * (q^3 + 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^7 * (q^3 - 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^10 * (q^8 - 1) * (q^12 - 1),
    q^8 * (q^6 - 1) * (q^8 - 1) * (q^12 - 1),
    q^10 * (q^6 - 1) * (q^8 - 1) * (q^12 - 1),
    q^12 * (q^4 + q^2 + 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^12 * (q^2 - 1) * (q^6 - 1) * (q^4 + 1) * (q^12 - 1) * 1//2,
    q^12 * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^12 * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^12 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//24,
    q^12 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//4,
    q^12 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//4,
    q^12 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//8,
    q^12 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//3,
    q^16 * (q^6 - 1) * (q^8 - 1) * (q^12 - 1),
    q^16 * (q^6 - 1) * (q^8 - 1) * (q^12 - 1),
    q^16 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^16 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^18 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^18 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1) * 1//2,
    q^20 * (q^2 - 1) * (q^6 - 1) * (q^8 - 1) * (q^12 - 1)])
classtypeorder =
  R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  ["\\emptyset"],
  ["4A_1"],
  ["2A_1"],
  ["D_4(a_1)"],
  ["A_2+\\tildeA_2"],
  ["F_4(a_1)"],
  ["\\tildeA_2"],
  ["C_3+A_1"],
  ["A_2"],
  ["D_4"],
  ["F_4"],
  ["A_1+\\tildeA_1"],
  ["B_2"],
  ["A_3+\\tildeA_1"],
  ["B_4"],
  ["\\tildeA_1"],
  ["2A_1+\\tildeA_1"],
  ["A_1"],
  ["3A_1"],
  ["B_2+A_1"],
  ["A_3"],
  ["B_3"],
  ["A_2+\\tildeA_1"],
  ["\\tildeA_2+A_1"],
  ["C_3"]]
chardegree =
  R.([
    (q + 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (q^2 + 1)^2 *
    (1 + q^4),
    (q - 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (q^2 + 1)^2 *
    (1 + q^4),
    (q - 1)^2 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^4 * (q + 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (1 + q^4),
    (q - 1)^4 * (q + 1)^4 * (1 - q^2 + q^4) * (1 - q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
    (q - 1)^4 * (q + 1)^4 * (1 - q^2 + q^4) * (1 + q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
    (q - 1)^2 * (1 + q + q^2) * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2) * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^2 * (1 + q + q^2) * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2) * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^4 * (q + 1)^4 * (1 - q + q^2)^2 * (1 + q + q^2)^2 * (q^2 + 1)^2 * (1 + q^4),
    (q - 1)^2 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^2 * (1 + q + q^2)^2 * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1) *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^2 * (1 - q + q^2)^2 * (q^2 + 1) *
    (1 - q^2 + q^4) * (1 + q^4),
    (q - 1)^4 * (1 + q + q^2)^2 * (q + 1)^4 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4),
    -(q - 1) * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1) * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1) * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1) * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1) *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1) *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2) * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2) * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2) * (q + 1)^3 * (1 - q + q^2)^2 * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4),
    -(q - 1)^3 * (1 + q + q^2)^2 * (q + 1)^3 * (1 - q + q^2) * (q^2 + 1)^2 *
    (1 - q^2 + q^4) * (1 + q^4)])

information = raw"""- Information about the Green functions of $F_4(q)$, $p>3$.

- CHEVIE-name of the table: ``F4n23green``

- The table was first computed in:
  {\sc T. Shoji}, On the Green polynomials of a Chevalley group of type $F_4$,
    {\em Comm. Algebra \bf10} (1982), 505--543.
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

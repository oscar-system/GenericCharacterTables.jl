using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order =
  2 * q^24 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
  (q^4 + 1) * (q^4 - q^2 + 1)
table = QQPolyRingElem[[
  (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
  (q^2 - q + 1) * (2 * q^4 + 1) * (q^2 + q + 1) * (q^2 + 1)^2 * (q + 1)^4,
  (q^2 + q + 1) * (q^2 + 1) *
  (6 * q^7 + 5 * q^6 + 5 * q^5 + 3 * q^4 + 2 * q^3 + q^2 + q + 1) * (q + 1)^2,
  (q^2 + q + 1) * (q^2 - q + 1) * (2 * q^4 + q^3 + q^2 + q + 1) * (q^2 + 1) * (q + 1)^3,
  (9 * q^8 + 14 * q^7 + 15 * q^6 + 12 * q^5 + 9 * q^4 + 6 * q^3 + 4 * q^2 + 2 * q + 1) *
  (q + 1)^2,
  (q^2 - q + 1) * (q^2 + q + 1) * (q^2 + 1)^2 * (q + 1)^4,
  (q + 1) *
  (8 * q^8 + 13 * q^7 + 15 * q^6 + 15 * q^5 + 13 * q^4 + 10 * q^3 + 6 * q^2 + 3 * q + 1),
  (4 * q^4 + 3 * q^3 + 3 * q^2 + q + 1) * (q + 1)^3,
  (q^2 + q + 1) * (8 * q^3 + 5 * q^2 + 2 * q + 1) * (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (6 * q^5 + 14 * q^4 + 16 * q^3 + 8 * q^2 + 3 * q + 1),
  (13 * q^4 + 14 * q^3 + 6 * q^2 + 2 * q + 1) * (q + 1)^2,
  (q + 1) * (5 * q^3 + 3 * q^2 + 3 * q + 1) * (q^2 + 1),
  (q + 1) * (2 * q + 1) * (10 * q^3 + 8 * q^2 + q + 1),
  (q + 1) * (2 * q + 1) * (6 * q^3 + 4 * q^2 + q + 1),
  54 * q^4 + 48 * q^3 + 15 * q^2 + 4 * q + 1,
  14 * q^4 + 16 * q^3 + 7 * q^2 + 4 * q + 1,
  (2 * q + 1) * (10 * q^3 + 7 * q^2 + 2 * q + 1),
  (q + 1) * (2 * q + 1) * (2 * q^2 + q + 1),
  (q + 1) * (6 * q^3 + 6 * q^2 + 3 * q + 1),
  (q + 1) * (8 * q^2 + 3 * q + 1),
  (q + 1) * (8 * q^2 + 3 * q + 1),
  (2 * q + 1) * (5 * q^2 + 2 * q + 1),
  (q + 1) * (6 * q^2 + 3 * q + 1),
  9 * q^2 + 4 * q + 1,
  6 * q + 1,
  2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1) * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 + q + 1) *
  (4 * q^7 + 3 * q^6 + 3 * q^5 + 3 * q^4 + 2 * q^3 + q^2 + q + 1),
  (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2,
  -(q + 1) *
  (3 * q^9 + q^8 - q^7 - 3 * q^6 - 3 * q^5 - 3 * q^4 - 2 * q^3 - 2 * q^2 - q - 1),
  (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) * (q + 1)^2,
  (3 * q^6 + 3 * q^4 + 2 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (2 * q^4 + q^3 + q^2 + q + 1) * (q^2 + 1),
  -(q - 1) * (q + 1) * (q^2 - q + 1) * (4 * q^3 + 3 * q^2 + 2 * q + 1) * (q^2 + q + 1),
  -(q + 1) * (2 * q^4 - 2 * q^3 - 2 * q^2 - q - 1),
  (q + 1) * (3 * q^3 + q^2 + q + 1) * (q^2 + 1),
  (q + 1) * (3 * q^3 + q^2 + q + 1) * (q^2 + 1),
  -4 * q^4 - 2 * q^5 + 6 * q^3 + 2 * q + 3 * q^2 + 1,
  2 * q^5 + 4 * q^4 + 6 * q^3 + 3 * q^2 + 2 * q + 1,
  -12 * q^4 + 8 * q^3 + 2 * q + 1 + 3 * q^2,
  (2 * q + 1) * (2 * q^3 + 3 * q^2 + 1),
  -2 * q^4 + 4 * q^3 + 2 * q + 1 + 3 * q^2,
  (2 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (2 * q^2 + q + 1),
  3 * q^2 + 2 * q + 1,
  3 * q^2 + 2 * q + 1,
  (2 * q + 1) * (3 * q^2 + 1),
  (q + 1) * (2 * q^2 + q + 1),
  3 * q^2 + 2 * q + 1,
  2 * q + 1,
  2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1) * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q - 1) * (q^2 + q + 1) * (2 * q^4 + 1) * (q^2 - q + 1) * (q^2 + 1)^2 * (q + 1)^3,
  -(q + 1) * (2 * q^6 - q^5 - 2 * q^4 - q^3 + q^2 - 1) * (q^2 + q + 1) * (q^2 + 1)^2,
  -(q - 1) * (q^2 + q + 1) * (q^2 + 1) * (2 * q^4 + q^3 + q^2 + q + 1) * (q^2 - q + 1) *
  (q + 1)^2,
  -(q + 1) *
  (3 * q^9 + q^8 - q^7 - 3 * q^6 - 3 * q^5 - 3 * q^4 - 2 * q^3 - 2 * q^2 - q - 1),
  -(q - 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1)^2 * (q + 1)^3,
  1 + 2 * q + 3 * q^2 + 3 * q^4 + 4 * q^3 + 2 * q^5 - 2 * q^7 - 4 * q^9 - 3 * q^8,
  -(2 * q^5 - q^4 - 2 * q^2 - 1) * (q + 1)^2,
  (3 * q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q + 1)^2,
  (q + 1) * (2 * q^4 + 4 * q^3 + 4 * q^2 + q + 1),
  -(q + 1) * (3 * q^5 - 3 * q^4 - 6 * q^3 - 4 * q^2 - q - 1),
  -(q - 1) * (3 * q^3 + 3 * q^2 + 3 * q + 1) * (q^2 + 1),
  (2 * q^3 + 6 * q^2 + 1) * (q + 1)^2,
  -(q + 1) * (2 * q^4 - 4 * q^3 - 2 * q^2 - q - 1),
  (q + 1) * (12 * q^3 + 8 * q^2 + q + 1),
  -4 * q^4 + 4 * q^3 + 2 * q + q^2 + 1,
  2 * q^4 + 8 * q^3 + 2 * q + 5 * q^2 + 1,
  -2 * q^4 + 2 * q + 1 + q^2,
  (q + 1) * (2 * q^2 + q + 1),
  (q + 1) * (4 * q^2 + q + 1),
  (q + 1) * (4 * q^2 + q + 1),
  3 * q^2 + 2 * q + 1,
  3 * q^2 + 2 * q + 1,
  3 * q^2 + 2 * q + 1,
  4 * q + 1,
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 - q + 1) * (2 * q^4 + 1) * (q^2 + q + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 + 1)^2,
  (q - 1) * (2 * q^6 - q^5 - 2 * q^4 - q^3 + q^2 - 1) * (q^2 + q + 1) * (q^2 + 1)^2,
  -(q + 1) * (2 * q^6 + q^5 - 2 * q^4 + q^3 + q^2 - 1) * (q^2 - q + 1) * (q^2 + 1)^2,
  (q - 1) * (q + 1) * (q^8 - 3 * q^6 - 3 * q^4 - 2 * q^2 - 1),
  (q^2 - q + 1) * (q^2 + q + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 + 1)^2,
  1 + q^2 - q^4 - 2 * q^6 - 3 * q^8,
  -(q - 1) * (q + 1) * (q^2 + 1)^2,
  -(q - 1) * (q + 1) * (q^2 - q + 1) * (3 * q^2 + 1) * (q^2 + q + 1),
  -(q - 1) * (q + 1) * (2 * q^4 + 4 * q^2 + 1),
  5 * q^6 - q^4 + 3 * q^2 + 1,
  -(3 * q^2 - 1) * (q^2 + 1)^2,
  -2 * q^4 + 5 * q^2 + 1,
  -(3 * q^2 + 1) * (2 * q^2 - 1),
  -2 * q^4 + 7 * q^2 + 1,
  -10 * q^4 - q^2 + 1,
  -(q - 1) * (q + 1) * (4 * q^2 + 1),
  -4 * q^4 + 1 - q^2,
  -(q - 1) * (q + 1) * (2 * q^2 + 1),
  3 * q^2 + 1,
  3 * q^2 + 1,
  (q + 1) * (2 * q^2 - q + 1),
  -(q - 1) * (2 * q^2 + q + 1),
  q^2 + 1,
  2 * q + 1,
  -2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1),
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1),
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1),
  (q^2 + 1) * (q^8 - q^6 + q^4 + 1),
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1),
  -(q^2 + 1) * (q^6 - q^4 - 1),
  (q^2 + 1) * (q^4 + 1),
  -(q - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1),
  q^2 + 1 + 2 * q^6,
  -(q - 1) * (q + 1) * (q^2 + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + 1)^2,
  -4 * q^4 + q^2 + 1,
  q^2 + 1,
  -10 * q^4 + 1 + q^2,
  -(q - 1) * (q + 1) * (2 * q^2 + 1),
  q^2 + 1,
  q^2 + 1,
  2 * q^4 + 1 + q^2,
  q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  q^2 + 1,
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^4 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (2 * q^4 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q^2 + 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 + q + 1) * (q^2 + 1) * (q^5 - q^4 + 2 * q^3 - q + 1) * (q + 1)^2,
  (q^2 + 1) * (2 * q^4 + q^3 + q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^3,
  -(q - 1) * (q^4 + q^3 + 1) * (q^2 + 1) * (q + 1)^2,
  (q^2 - q + 1) * (q - 1)^2 * (q^2 + 1)^2 * (q + 1)^4,
  (q - 1) * (q + 1) * (2 * q^7 - 2 * q^3 - q^2 - q - 1),
  (q - 1) * (q^3 - 2 * q^2 + q - 1) * (q + 1)^3,
  -(q^2 + q + 1) * (q^2 - q + 1) * (q^3 - 2 * q^2 + q - 1) * (q + 1)^2,
  -(q + 1) * (q^4 - q^3 - 2 * q^2 - 1),
  -(q - 1) * (2 * q^3 + 3 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (2 * q + 1) * (q^2 + 1) * (q - 1)^2,
  -(q + 1) * (q^4 - 2 * q^3 - 4 * q^2 - 1),
  -(q - 1) * (q + 1) * (3 * q^3 + q^2 + q + 1),
  (q + 1) * (3 * q^3 + 6 * q^2 + 1),
  -(q - 1) * (q^3 + 2 * q + 1),
  -q^4 + 1 + 3 * q^3 + q + 2 * q^2,
  (q - 1) * (q + 1) * (q^2 - q - 1),
  q + 1,
  (q + 1) * (2 * q^2 + 1),
  (q + 1) * (2 * q^2 + 1),
  -(q - 1) * (2 * q^2 + 2 * q + 1),
  q + 1,
  q + 1,
  3 * q + 1,
  -q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^4 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q - 1) * (q^2 + q + 1) * (q^2 + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2 * (q + 1)^3,
  (3 * q^7 + 2 * q^6 + 2 * q^5 + 3 * q^4 + 2 * q^3 + q^2 + q + 1) * (q^2 + 1) *
  (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^3 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^4 + q^3 + 1) * (q^2 + 1) * (q + 1)^2,
  (q^2 + q + 1) * (q^4 - q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
  -(q + 1) * (q^8 - q^7 - q^4 - q^3 - 1),
  (q + 1) * (q^4 + q + 1) * (q^2 - q + 1),
  (2 * q^3 + 2 * q^2 + 2 * q + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^3 + q + 1),
  -(q - 1) * (2 * q^3 + 1) * (q + 1)^2,
  (q + 1) * (2 * q^3 + 1) * (q^2 + 1),
  -(q - 1) * (q + 1) * (q^3 - q^2 + q + 1),
  -(q - 1) * (q + 1) * (3 * q^3 + q^2 + q + 1),
  (q + 1) * (3 * q^3 - 3 * q^2 + 1),
  -q^4 + 4 * q^3 + q^2 + q + 1,
  -(q - 1) * (q^3 + q^2 + 2 * q + 1),
  (q + 1) * (q^3 + q^2 + 1),
  q + 1,
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1)^2,
  (2 * q + 1) * (2 * q^2 - q + 1),
  q + 1,
  q + 1,
  R(1),
  2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^2 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^2 + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q + 1)^3,
  (q - 1) * (q^2 + q + 1) * (2 * q^8 - q^7 - q^4 - q^3 - 1) * (q + 1)^2,
  (1 + q - 2 * q^3 - q^4 + q^5 + 2 * q^6) * (q^2 - q + 1)^2 * (q + 1)^3,
  (q - 1) * (q^7 - q^6 - 2 * q^5 - 2 * q^4 - q^3 - q^2 - q - 1) * (q + 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q + 1)^3,
  -(q^6 - q^4 - 1) * (q + 1)^2,
  -(q - 1) * (2 * q^4 + q^3 + q^2 + q + 1) * (q + 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1) * (2 * q^4 + 2 * q^3 + 2 * q^2 + 2 * q + 1),
  -(q^4 - 2 * q^3 - 1) * (q + 1)^2,
  -(q^4 - 2 * q^3 - 1) * (q + 1)^2,
  -(q + 1) * (2 * q^4 - 2 * q^3 - q - 1),
  (2 * q^3 + 1) * (q + 1)^2,
  -(q^2 - 2 * q - 1) * (2 * q^2 + 1),
  6 * q^4 + 4 * q^3 + q^2 + 2 * q + 1,
  (q + 1)^2,
  (q + 1)^2,
  -(q - 1) * (q + 1) * (2 * q^2 + 2 * q + 1),
  (q + 1)^2,
  (q + 1)^2,
  (q + 1)^2,
  (q + 1)^2,
  (q + 1)^2,
  2 * q + 1,
  2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2,
  (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2,
  (q - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + 1) *
  (4 * q^7 - 3 * q^6 + 3 * q^5 - 3 * q^4 + 2 * q^3 - q^2 + q - 1),
  -(q - 1) *
  (3 * q^9 - q^8 - q^7 + 3 * q^6 - 3 * q^5 + 3 * q^4 - 2 * q^3 + 2 * q^2 - q + 1),
  (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2,
  (3 * q^6 + 3 * q^4 + 2 * q^2 + 1) * (q - 1)^2,
  -(q - 1) * (2 * q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
  (q - 1) * (q + 1) * (q^2 - q + 1) * (4 * q^3 - 3 * q^2 + 2 * q - 1) * (q^2 + q + 1),
  (q - 1) * (2 * q^4 + 2 * q^3 - 2 * q^2 + q - 1),
  (q - 1) * (3 * q^3 - q^2 + q - 1) * (q^2 + 1),
  (q - 1) * (3 * q^3 - q^2 + q - 1) * (q^2 + 1),
  -4 * q^4 + 2 * q^5 - 6 * q^3 + 3 * q^2 - 2 * q + 1,
  -2 * q^5 + 4 * q^4 - 6 * q^3 + 3 * q^2 - 2 * q + 1,
  -12 * q^4 - 8 * q^3 + 3 * q^2 - 2 * q + 1,
  (2 * q - 1) * (2 * q^3 - 3 * q^2 - 1),
  -2 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1,
  (2 * q^2 + 1) * (q - 1)^2,
  -(q - 1) * (2 * q^2 - q + 1),
  3 * q^2 - 2 * q + 1,
  3 * q^2 - 2 * q + 1,
  -(q - 1) * (2 * q^2 - q + 1),
  -(2 * q - 1) * (3 * q^2 + 1),
  3 * q^2 - 2 * q + 1,
  -2 * q + 1,
  -2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q + 1) * (q^2 + q + 1) * (2 * q^4 + 1) * (q^2 - q + 1) * (q^2 + 1)^2 * (q - 1)^3,
  (q + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (2 * q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) *
  (q - 1)^2,
  (q - 1) * (2 * q^6 + q^5 - 2 * q^4 + q^3 + q^2 - 1) * (q^2 - q + 1) * (q^2 + 1)^2,
  -(q - 1) *
  (3 * q^9 - q^8 - q^7 + 3 * q^6 - 3 * q^5 + 3 * q^4 - 2 * q^3 + 2 * q^2 - q + 1),
  -(q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^2 + 1)^2 * (q - 1)^3,
  1 - 2 * q + 3 * q^2 + 3 * q^4 - 4 * q^3 - 2 * q^5 - 3 * q^8 + 2 * q^7 + 4 * q^9,
  (2 * q^5 + q^4 + 2 * q^2 + 1) * (q - 1)^2,
  (3 * q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^2,
  -(q - 1) * (2 * q^4 - 4 * q^3 + 4 * q^2 - q + 1),
  -(q - 1) * (3 * q^5 + 3 * q^4 - 6 * q^3 + 4 * q^2 - q + 1),
  -(q + 1) * (3 * q^3 - 3 * q^2 + 3 * q - 1) * (q^2 + 1),
  -(2 * q^3 - 6 * q^2 - 1) * (q - 1)^2,
  (q - 1) * (2 * q^4 + 4 * q^3 - 2 * q^2 + q - 1),
  (q - 1) * (12 * q^3 - 8 * q^2 + q - 1),
  -4 * q^4 - 4 * q^3 + q^2 - 2 * q + 1,
  2 * q^4 - 8 * q^3 + 5 * q^2 - 2 * q + 1,
  -2 * q^4 + q^2 - 2 * q + 1,
  -(q - 1) * (2 * q^2 - q + 1),
  -(q - 1) * (4 * q^2 - q + 1),
  -(q - 1) * (4 * q^2 - q + 1),
  3 * q^2 - 2 * q + 1,
  3 * q^2 - 2 * q + 1,
  3 * q^2 - 2 * q + 1,
  R(1),
  -4 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^2 + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q^2 + q + 1) * (q^2 - q + 1) * (2 * q^4 + 1) * (q^2 + 1) * (q - 1)^3 * (q + 1)^3,
  (q + 1) * (q^5 - q^4 + 2 * q^3 - q + 1) * (q - 1)^2 * (q^2 + q + 1)^2,
  (q - 1) * (q^5 + q^4 + 2 * q^3 - q - 1) * (q + 1)^2 * (q^2 - q + 1)^2,
  (q^6 + 2 * q^4 + q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^3 * (q + 1)^3,
  (q - 1) * (q + 1) * (q^6 + q^4 - 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  -(q - 1) * (q + 1) * (q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1),
  -(q - 1) * (q + 1) * (2 * q^2 + 1),
  (q - 1) * (q + 1) * (q^4 - 2 * q^2 - 1),
  (q - 1) * (q + 1) * (q^4 + 2 * q^2 - 1),
  -2 * q^4 + 3 * q^2 + 1,
  -(q^2 + 1) * (2 * q^2 - 1),
  1 + 5 * q^2,
  1 - 3 * q^2,
  -(q - 1) * (q + 1) * (2 * q^2 + 1),
  (q - 1) * (q + 1) * (2 * q^2 - 1),
  -(q - 1) * (q + 1),
  q^2 + 1,
  q^2 + 1,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  2 * q + 1,
  -2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^2 + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q + 1) * (q^2 + q + 1) * (2 * q^8 - q^7 - q^4 - q^3 - 1) * (q - 1)^2,
  (q - 1) * (q^2 - q + 1) * (2 * q^8 + q^7 - q^4 + q^3 - 1) * (q + 1)^2,
  (q^6 + 2 * q^4 + q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  (q^2 - q + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  -q^2 + 1 - q^8 - 2 * q^6 + q^4,
  -(q - 1) * (q + 1) * (q^4 + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1) * (q^4 + 1),
  -(q - 1) * (q + 1) * (q^4 + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  2 * q^4 - q^2 + 1,
  -(q^2 + 1) * (2 * q^2 - 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  2 * q^3 - q^2 + 1,
  -2 * q^3 - q^2 + 1,
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  (q^2 + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q^2 - q + 1) * (1 + q - 2 * q^3 - q^4 + q^5 + 2 * q^6) * (q^2 + 1) *
  (q + 1)^2,
  (q - 1) * (q + 1) * (q^7 - q^2 - q - 1),
  (q^2 + 1) * (q^2 + q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + q + 1),
  (q - 1) * (q + 1) * (q^3 - q - 1) * (q^2 + 1),
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^3 - q - 1),
  -(q - 1) * (q^4 + q^3 + 2 * q^2 + 2 * q + 1),
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^4 + 1),
  -(q - 1) * (3 * q^3 + 2 * q^2 + 2 * q + 1),
  (q + 1)^2 * (q^2 - q + 1),
  q^4 + 1 - q^3 + q,
  -(q - 1) * (q + 1) * (q^2 + q + 1),
  -(q - 1) * (2 * q^2 + 2 * q + 1),
  q + 1,
  q + 1,
  -(q - 1) * (2 * q^2 + 2 * q + 1),
  q + 1,
  q + 1,
  q + 1,
  q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 - q + 1) * (q^2 + 1) * (q^4 - q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2,
  -(q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^3 - q - 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q^4 - q^3 + q^2 + 1) * (q^2 + 1) * (q^4 - q^2 + 1) * (q + 1)^2,
  (q - 1) * (q + 1) * (q^7 - q^2 - q - 1),
  -(q - 1) * (q + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1) * (q^2 + q + 1)^2,
  (q + 1) * (q^8 - q^7 + q^4 - q^3 + 1),
  -(q - 1) * (q^4 + q + 1) * (q^2 + q + 1),
  (q^2 + q + 1) * (q - 1)^2 * (q + 1)^2,
  (q - 1) * (q + 1) * (q^3 - q - 1),
  -(q - 1) * (q + 1)^2,
  (q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1)^3,
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  (q - 1) * (3 * q^3 + q^2 - 2 * q - 1),
  -q^4 + 2 * q^3 + q^2 + q + 1,
  -(q + 1) * (q^3 + q^2 - 1),
  q^4 + q^2 + q + 1,
  -(q - 1) * (2 * q^2 + 2 * q + 1),
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  q + 1,
  R(1),
  2 * q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  (q + 1) * (q^2 + q + 1) * (2 * q^6 - q^5 - q^4 + 2 * q^3 - q + 1) * (q^2 + 1) * (q - 1)^2,
  (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^7 + q^2 - q + 1),
  (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^3 - q + 1) * (q^2 + 1),
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^3 - q + 1),
  (q + 1) * (q^4 - q^3 + 2 * q^2 - 2 * q + 1),
  (q - 1)^2 * (q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1) * (q^2 + 1),
  (q - 1)^2 * (q + 1) * (q^2 + 1),
  -(q - 1) * (q^4 + 1),
  -(q + 1) * (3 * q^3 - 2 * q^2 + 2 * q - 1),
  (q^2 + q + 1) * (q - 1)^2,
  -q + q^4 + q^3 + 1,
  -(q - 1) * (q + 1) * (q^2 - q + 1),
  (q + 1) * (2 * q^2 - 2 * q + 1),
  -q + 1,
  -q + 1,
  -q + 1,
  (q + 1) * (2 * q^2 - 2 * q + 1),
  -q + 1,
  -q + 1,
  -q + 1,
  R(1),
  R(1)] [
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1) * (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1)^2,
  (q + 1) * (q^4 + q^3 + q^2 + 1) * (q^2 + 1) * (q^4 - q^2 + 1) * (q - 1)^2,
  (q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^3 - q + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^7 + q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^4 - q^2 + 1) * (q^2 - q + 1)^2,
  -(q - 1) * (q^8 + q^7 + q^4 + q^3 + 1),
  (q + 1) * (q^2 - q + 1) * (q^4 - q + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^3 - q + 1),
  (q - 1)^2 * (q + 1),
  -(q - 1) * (q^2 + 1),
  -(q - 1)^3 * (q + 1)^2,
  (q - 1)^2 * (q + 1) * (q^2 + 1),
  (q + 1) * (3 * q^3 - q^2 - 2 * q + 1),
  -q^4 - 2 * q^3 + q^2 - q + 1,
  -(q - 1) * (q^3 - q^2 + 1),
  q^4 + q^2 - q + 1,
  (q + 1) * (2 * q^2 - 2 * q + 1),
  (q - 1)^2 * (q + 1),
  (q - 1)^2 * (q + 1),
  -q + 1,
  -q + 1,
  -q + 1,
  -2 * q + 1,
  R(1),
  R(1),
  R(1)] [
  (q - 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
  (q - 1)^4 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1) * (2 * q^4 + 1),
  -(q - 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1) * (2 * q^4 - q^3 + q^2 - q + 1),
  -(q - 1)^2 * (q^2 + 1) * (q^2 - q + 1) *
  (6 * q^7 - 5 * q^6 + 5 * q^5 - 3 * q^4 + 2 * q^3 - q^2 + q - 1),
  (q - 1)^2 *
  (9 * q^8 - 14 * q^7 + 15 * q^6 - 12 * q^5 + 9 * q^4 - 6 * q^3 + 4 * q^2 - 2 * q + 1),
  (q - 1)^4 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1),
  -(q - 1) *
  (8 * q^8 - 13 * q^7 + 15 * q^6 - 15 * q^5 + 13 * q^4 - 10 * q^3 + 6 * q^2 - 3 * q + 1),
  -(q - 1)^3 * (4 * q^4 - 3 * q^3 + 3 * q^2 - q + 1),
  -(q - 1)^2 * (q^2 + q + 1) * (q^2 - q + 1) * (8 * q^3 - 5 * q^2 + 2 * q - 1),
  (q - 1) * (6 * q^5 - 14 * q^4 + 16 * q^3 - 8 * q^2 + 3 * q - 1),
  (q - 1)^2 * (13 * q^4 - 14 * q^3 + 6 * q^2 - 2 * q + 1),
  (q - 1) * (q^2 + 1) * (5 * q^3 - 3 * q^2 + 3 * q - 1),
  -(q - 1) * (2 * q - 1) * (10 * q^3 - 8 * q^2 + q - 1),
  -(q - 1) * (2 * q - 1) * (6 * q^3 - 4 * q^2 + q - 1),
  54 * q^4 - 48 * q^3 + 15 * q^2 - 4 * q + 1,
  14 * q^4 - 16 * q^3 + 7 * q^2 - 4 * q + 1,
  (2 * q - 1) * (10 * q^3 - 7 * q^2 + 2 * q - 1),
  (q - 1) * (2 * q - 1) * (2 * q^2 - q + 1),
  (q - 1) * (6 * q^3 - 6 * q^2 + 3 * q - 1),
  -(q - 1) * (8 * q^2 - 3 * q + 1),
  -(q - 1) * (8 * q^2 - 3 * q + 1),
  -(q - 1) * (6 * q^2 - 3 * q + 1),
  -(2 * q - 1) * (5 * q^2 - 2 * q + 1),
  9 * q^2 - 4 * q + 1,
  -2 * q + 1,
  -6 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
  -(q - 1)^3 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1)^2 * (q^4 - q^2 + 1),
  -(q - 1)^3 * (q + 1)^2 * (q^2 + 1) * (3 * q^6 - 2 * q^5 - q^4 + 2 * q^3 - q + 1),
  -(q - 1)^3 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1) * (q^3 - q + 1),
  (q - 1)^2 * (q + 1)^2 * (2 * q^5 - 2 * q^4 + 2 * q^2 - 2 * q + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1)^2 * (q^4 - q^2 + 1),
  (q - 1)^2 * (q + 1) * (2 * q^6 - q^5 - q^4 + 2 * q^3 - q + 1),
  -(q - 1) * (q + 1) * (q^2 - q + 1) * (2 * q^3 - q^2 - q + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 - q + 1) * (2 * q^3 - q^2 - q + 1),
  (q - 1)^2 * (q + 1) * (3 * q^3 - q^2 - q + 1),
  (q - 1)^4 * (q + 1)^2,
  -(q - 1)^3 * (q + 1) * (q^2 + 1),
  -(q - 1) * (q + 1) * (4 * q^3 - q^2 - 2 * q + 1),
  -(q - 1)^3 * (q + 1),
  (q + 1) * (6 * q^3 - 3 * q + 1),
  (q - 1) * (2 * q^3 + q - 1),
  -(q - 1) * (4 * q^3 - 2 * q^2 - q + 1),
  -(q - 1) * (q + 1) * (2 * q^2 - 2 * q + 1),
  -6 * q^4 + 6 * q^3 - 2 * q + 1,
  (q - 1) * (q + 1) * (2 * q - 1),
  (q - 1) * (q + 1) * (2 * q - 1),
  (q - 1) * (q^2 + q - 1),
  (q + 1) * (3 * q^2 - 3 * q + 1),
  -2 * q + 1,
  -3 * q + 1,
  -q + 1,
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1) * (q^2 - q + 1)^2 * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q - 1)^3 * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1),
  -(q - 1)^3 * (q^2 + q + 1)^2 * (2 * q^6 - q^5 - q^4 + 2 * q^3 - q + 1),
  -(q - 1)^2 * (q + 1) * (q^2 - q + 1) * (2 * q^8 + q^7 - q^4 + q^3 - 1),
  (q - 1)^2 * (q + 1) * (q^7 + q^6 - 2 * q^5 + 2 * q^4 - q^3 + q^2 - q + 1),
  -(q - 1)^3 * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q^4 + 1),
  -(q - 1)^2 * (q^6 - q^4 - 1),
  (q - 1)^2 * (q + 1) * (2 * q^4 - q^3 + q^2 - q + 1),
  -(q - 1)^3 * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (2 * q^4 - 2 * q^3 + 2 * q^2 - 2 * q + 1),
  -(q - 1)^2 * (q^4 + 2 * q^3 - 1),
  -(q - 1)^2 * (q^4 + 2 * q^3 - 1),
  (q - 1) * (2 * q^4 + 2 * q^3 + q - 1),
  -(q - 1)^2 * (2 * q^3 - 1),
  -(2 * q^2 + 1) * (q^2 + 2 * q - 1),
  6 * q^4 - 4 * q^3 + q^2 - 2 * q + 1,
  (q - 1)^2,
  (q - 1)^2,
  -(q - 1) * (q + 1) * (2 * q^2 - 2 * q + 1),
  (q - 1)^2,
  (q - 1)^2,
  (q - 1)^2,
  (q - 1)^2,
  (q - 1)^2,
  -2 * q + 1,
  -2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  -(q - 1)^3 * (q + 1) * (q^2 + q + 1)^2 * (q^2 + 1) * (q^2 - q + 1) * (q^4 - q^2 + 1),
  (q - 1)^3 * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^3 - q - 1),
  -(q - 1)^2 * (q + 1)^2 * (q^2 + 1) *
  (3 * q^7 - 2 * q^6 + 2 * q^5 - 3 * q^4 + 2 * q^3 - q^2 + q - 1),
  (q - 1)^2 * (q + 1) * (q^2 + 1) * (q^4 - q^3 + 1),
  (q - 1)^2 * (q^2 + q + 1)^2 * (q^2 - q + 1) * (q^4 - q^2 + 1),
  (q - 1) * (q^8 + q^7 - q^4 + q^3 - 1),
  -(q - 1) * (q^2 + q + 1) * (q^4 - q + 1),
  -(q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (2 * q^3 - 2 * q^2 + 2 * q - 1),
  (q - 1) * (q + 1) * (q^3 + q - 1),
  -(q - 1)^2 * (q + 1) * (2 * q^3 - 1),
  (q - 1) * (q^2 + 1) * (2 * q^3 - 1),
  (q - 1) * (q + 1) * (q^3 + q^2 + q - 1),
  (q - 1) * (q + 1) * (3 * q^3 - q^2 + q - 1),
  (q - 1) * (3 * q^3 + 3 * q^2 - 1),
  -q^4 - 4 * q^3 + q^2 - q + 1,
  -(q + 1) * (q^3 - q^2 + 2 * q - 1),
  (q - 1) * (q^3 - q^2 - 1),
  -q + 1,
  (q - 1)^2 * (q + 1),
  (q - 1)^2 * (q + 1),
  -q + 1,
  -(2 * q - 1) * (2 * q^2 + q + 1),
  -q + 1,
  -2 * q + 1,
  R(1),
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
  (q^4 - q^2 + 1),
  (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1)^2 * (2 * q^4 + 1),
  -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (2 * q^4 - q^3 + q^2 - q + 1),
  -(q - 1)^2 * (q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^5 + q^4 + 2 * q^3 - q - 1),
  (q - 1)^2 * (q + 1) * (q^2 + 1) * (q^4 - q^3 + 1),
  (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1)^2,
  -(q - 1) * (q + 1) * (2 * q^7 - 2 * q^3 + q^2 - q + 1),
  -(q - 1)^3 * (q + 1) * (q^3 + 2 * q^2 + q + 1),
  (q - 1)^2 * (q^2 + q + 1) * (q^2 - q + 1) * (q^3 + 2 * q^2 + q + 1),
  (q - 1) * (q^4 + q^3 - 2 * q^2 - 1),
  -(q - 1)^2 * (q + 1) * (2 * q^3 - 3 * q^2 - 1),
  (q - 1) * (q + 1)^2 * (q^2 + 1) * (2 * q - 1),
  (q - 1) * (q^4 + 2 * q^3 - 4 * q^2 - 1),
  (q - 1) * (q + 1) * (3 * q^3 - q^2 + q - 1),
  (q - 1) * (3 * q^3 - 6 * q^2 - 1),
  -(q + 1) * (q^3 + 2 * q - 1),
  -q^4 - 3 * q^3 + 2 * q^2 - q + 1,
  (q - 1) * (q + 1) * (q^2 + q - 1),
  -q + 1,
  -(q - 1) * (2 * q^2 + 1),
  -(q - 1) * (2 * q^2 + 1),
  -q + 1,
  (q + 1) * (2 * q^2 - 2 * q + 1),
  -q + 1,
  q + 1,
  -3 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
  (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1) * (q^2 - q + 1) * (2 * q^4 + 1),
  (q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (2 * q^6 - q^5 - 2 * q^4 - q^3 + q^2 - 1),
  -(q - 1)^2 * (q + 1)^3 * (q^2 - q + 1) * (2 * q^6 + q^5 - 2 * q^4 + q^3 + q^2 - 1),
  -(q - 1)^2 * (q + 1)^2 * (3 * q^6 - 2 * q^4 + q^2 - 1),
  (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1) * (q^2 - q + 1),
  (q - 1) * (q + 1) * (q^3 - q^2 + 1) * (q^3 + q^2 - 1),
  -(q - 1)^3 * (q + 1)^3,
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  (q - 1) * (q + 1) * (2 * q^4 - 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  -(q - 1) * (q + 1) * (7 * q^4 - 4 * q^2 + 1),
  -(q - 1) * (q + 1) * (2 * q^2 + 1),
  (q - 1) * (q + 1) * (2 * q^2 - 1),
  (q^2 + 1) * (2 * q^2 + 1),
  10 * q^4 - 5 * q^2 + 1,
  -(q - 1) * (q + 1),
  8 * q^4 - 5 * q^2 + 1,
  (q - 1) * (q + 1) * (2 * q^2 - 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  (q - 1)^2 * (2 * q + 1),
  -(q + 1)^2 * (2 * q - 1),
  1 - 3 * q^2,
  2 * q + 1,
  -2 * q + 1,
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 - q^2 + 1),
  -(q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^3 * (q + 1)^3,
  -(q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^3 * (q + 1)^3,
  -(q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^3 * (q + 1)^3,
  -(q - 1)^2 * (q + 1)^2 * (q^6 - q^2 - 1),
  -(q^2 + 1) * (q^2 + q + 1) * (q^2 - q + 1) * (q - 1)^3 * (q + 1)^3,
  (q - 1) * (q + 1) * (q^6 + q^4 - 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  2 * q^4 - q^2 + 1,
  -(q^2 + 1) * (2 * q^2 - 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1),
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1),
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1) * (q^2 - q + 1)^2,
  -(q - 1)^3 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^4 + q^3 + q^2 + 1),
  (q - 1)^2 * (q + 1)^3 * (q^2 + 1) * (q^2 - q + 1) * (q^4 - q^3 + q^2 + 1),
  (q - 1)^2 * (q + 1)^2 * (2 * q^4 + 2 * q^2 + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2,
  (q - 1) * (q + 1) * (q^6 - q^4 - q^2 - 1),
  -(q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 - q + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 - q + 1),
  -(q - 1) * (q + 1) * (q^4 + 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + 1),
  -(q - 1) * (q + 1) * (q^2 + 1)^2,
  (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1) * (q^2 + 1),
  (q - 1) * (q + 1) * (2 * q^2 - 1),
  -(q - 1) * (q + 1) * (2 * q^2 + 1),
  -(q - 1) * (q + 1),
  2 * q^4 + 1 + q^2,
  2 * q^4 + 1,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q^2 + q + 1),
  (q + 1) * (q^2 - q + 1),
  R(1),
  -q + 1,
  q + 1,
  R(1),
  R(1)] [
  (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
  -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1) * (q^4 - q^2 + 1),
  (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1) * (q^3 - q - 1),
  (q - 1)^2 * (q + 1)^3 * (q^2 + 1) * (3 * q^6 + 2 * q^5 - q^4 - 2 * q^3 + q + 1),
  -(q - 1)^2 * (q + 1)^2 * (2 * q^5 + 2 * q^4 - 2 * q^2 - 2 * q - 1),
  (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^4 - q^2 + 1),
  -(q - 1) * (q + 1)^2 * (1 + q - 2 * q^3 - q^4 + q^5 + 2 * q^6),
  (q - 1) * (q + 1) * (q^2 + q + 1) * (2 * q^3 + q^2 - q - 1),
  -(q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (2 * q^3 + q^2 - q - 1),
  (q - 1) * (q + 1)^2 * (3 * q^3 + q^2 - q - 1),
  (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q + 1)^3 * (q^2 + 1),
  (q - 1) * (q + 1) * (4 * q^3 + q^2 - 2 * q - 1),
  -(q - 1) * (q + 1)^3,
  (q - 1) * (6 * q^3 - 3 * q - 1),
  (q + 1) * (2 * q^3 + q + 1),
  -(q + 1) * (4 * q^3 + 2 * q^2 - q - 1),
  -(q - 1) * (q + 1) * (2 * q^2 + 2 * q + 1),
  -6 * q^4 - 6 * q^3 + 2 * q + 1,
  -(q - 1) * (q + 1) * (2 * q + 1),
  -(q - 1) * (q + 1) * (2 * q + 1),
  -(q - 1) * (3 * q^2 + 3 * q + 1),
  -(q + 1) * (q^2 - q - 1),
  2 * q + 1,
  q + 1,
  3 * q + 1,
  R(1),
  R(1)]]
classinfo = Vector{Any}[
  ["u_0"],
  ["u_1"],
  ["u_2"],
  ["u_3"],
  ["u_4"],
  ["u_5"],
  ["u_6"],
  ["u_7"],
  ["u_8"],
  ["u_9"],
  ["u_{10}"],
  ["u_{11}"],
  ["u_{12}"],
  ["u_{13}"],
  ["u_{14}"],
  ["u_{15}"],
  ["u_{16}"],
  ["u_{17}"],
  ["u_{18}"],
  ["u_{19}"],
  ["u_{20}"],
  ["u_{21}"],
  ["u_{22}"],
  ["u_{23}"],
  ["u_{24}"],
  ["u_{25}"],
  ["u_{26}"],
  ["u_{27}"]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    1//2 * q^3 * (q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^3 * (q - 1)^2 * (q + 1) * (q^2 + q + 1)^2 * (q^2 + 1) * (q^2 - q + 1) *
    (q^4 + 1) * (q^4 - q^2 + 1),
    q^4 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    q^4 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    q^4 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    q^8 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    q^10 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    q^10 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^12 * (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^12 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1) * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^12 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^12 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//24 * q^12 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//8 * q^12 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//4 * q^12 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//4 * q^12 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//3 * q^12 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^16 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^16 * (q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^15 * (q - 1)^3 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^15 * (q - 1)^4 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    q^16 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^18 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^18 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^20 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1),
    1//2 * q^20 * (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 + 1) * (q^4 - q^2 + 1)])
classtypeorder =
  R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
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
    (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1) * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1) * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^2 * (q + 1)^4 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^2 * (q + 1)^4 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^2 + q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^2 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^2 + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^2 + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^2 + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    -(q - 1)^3 * (q + 1)^3 * (q^2 + q + 1) * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^4 * (q + 1)^4 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
    (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1) * (q^2 - q + 1)^2 * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^4 * (q + 1)^2 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1) * (q^4 + 1) *
    (q^4 - q^2 + 1),
    (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1),
    (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 *
    (q^4 - q^2 + 1),
    (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^2 - q + 1)^2 * (q^4 + 1),
    (q - 1)^4 * (q + 1)^4 * (q^2 + q + 1)^2 * (q^2 + 1)^2 * (q^4 + 1) * (q^4 - q^2 + 1)])

information = raw"""- Information about the Green functions of $E_6(2^n):2$.

- CHEVIE-name of the table: ``E6e2green``

- The table was first computed in:
  {\sc G. Malle}, Green functions for groups of types E_6 and F_4 in
    characteristic 2, {\em Comm. Algebra \bf21} (1993), 747--798.

- The notation for the unipotent classes is as in that paper.
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

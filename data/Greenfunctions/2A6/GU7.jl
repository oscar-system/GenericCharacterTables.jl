using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order =
  (q + 1)^7 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^21 * (q - 1)^3 * (q^2 - q + 1)^2 *
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1)
table = QQPolyRingElem[[
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3,
  -(q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) *
  (6 * q^5 - 5 * q^4 + 4 * q^3 - 3 * q^2 + 2 * q - 1) * (q - 1)^2,
  -(q^2 - q + 1) *
  (14 * q^7 - 22 * q^6 + 24 * q^5 - 21 * q^4 + 13 * q^3 - 7 * q^2 + 3 * q - 1) *
  (q - 1)^2,
  -(q - 1) * (q^2 - q + 1) *
  (14 * q^6 - 28 * q^5 + 28 * q^4 - 20 * q^3 + 10 * q^2 - 4 * q + 1),
  (q^2 + 1) * (15 * q^4 - 10 * q^3 + 6 * q^2 - 3 * q + 1) * (q^2 - q + 1) * (q - 1)^2,
  -(q - 1) * (35 * q^6 - 62 * q^5 + 58 * q^4 - 34 * q^3 + 15 * q^2 - 5 * q + 1),
  (q - 1) * (21 * q^5 - 35 * q^4 + 28 * q^3 - 15 * q^2 + 5 * q - 1),
  -(q - 1) * (21 * q^4 - 28 * q^3 + 15 * q^2 - 5 * q + 1),
  (q - 1) * (q^2 - q + 1) * (20 * q^3 - 10 * q^2 + 4 * q - 1),
  35 * q^4 - 43 * q^3 + 20 * q^2 - 6 * q + 1,
  -14 * q^3 + 14 * q^2 - 6 * q + 1,
  -(q - 1) * (15 * q^2 - 5 * q + 1),
  14 * q^2 - 6 * q + 1,
  -6 * q + 1,
  R(1)] [
  (q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q^2 - q + 1)^2,
  (q - 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (4 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) * (q^2 - q + 1),
  (q - 1) * (q^2 - q + 1) *
  (6 * q^8 - 2 * q^7 - 2 * q^6 + 5 * q^5 - 8 * q^4 + 6 * q^3 - 4 * q^2 + 2 * q - 1),
  (q - 1) * (q^2 - q + 1) * (4 * q^6 + 2 * q^5 - 4 * q^4 + 6 * q^3 - 4 * q^2 + 2 * q - 1),
  -(q - 1) * (q^2 - q + 1) * (q^2 + 1) *
  (5 * q^5 + 5 * q^4 - 4 * q^3 + 3 * q^2 - 2 * q + 1),
  5 * q^7 - 20 * q^5 + 5 * q^6 + 26 * q^4 - 19 * q^3 + 10 * q^2 - 4 * q + 1,
  -(q - 1) * (q^5 + 7 * q^4 - 8 * q^3 + 7 * q^2 - 3 * q + 1),
  -(q - 1) * (q^4 - 8 * q^3 + 7 * q^2 - 3 * q + 1),
  -(q^2 - q + 1) * (10 * q^3 - 6 * q^2 + 3 * q - 1),
  5 * q^4 - 15 * q^3 + 10 * q^2 - 4 * q + 1,
  -(2 * q - 1) * (2 * q^2 - 2 * q + 1),
  -5 * q^3 + 10 * q^2 - 4 * q + 1,
  6 * q^2 - 4 * q + 1,
  -4 * q + 1,
  R(1)] [
  -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
  -(q + 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (2 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) * (q^2 - q + 1),
  -(q - 1) * (q^2 - q + 1) *
  (2 * q^8 + 4 * q^7 + 2 * q^6 + 3 * q^5 + 2 * q^4 + 2 * q^2 + 1),
  -(2 * q^7 + 2 * q^6 + 2 * q^3 - 2 * q^2 + q - 1) * (q^2 - q + 1),
  -(q + 1) * (q^2 + 1) * (q^2 - q + 1) * (q^5 - 5 * q^4 + 4 * q^3 - 3 * q^2 + 2 * q - 1),
  (q - 1) * (q^6 - 2 * q^5 - 2 * q^4 + 2 * q^3 - 3 * q^2 + q - 1),
  q^6 + 3 * q^4 - 3 * q^3 + 4 * q^2 - 2 * q + 1,
  -(q - 1) * (q^4 + 3 * q^2 - q + 1),
  -(q^2 - q + 1) * (4 * q^4 + 2 * q^3 - 2 * q^2 + q - 1),
  -q^4 - 3 * q^3 + 4 * q^2 - 2 * q + 1,
  -2 * q^3 + 2 * q^2 - 2 * q + 1,
  q^3 + 4 * q^2 - 2 * q + 1,
  2 * q^2 - 2 * q + 1,
  -2 * q + 1,
  R(1)] [
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + 1) * (q^2 - q + 1)^2 * (q + 1)^3,
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
  (q + 1) * (2 * q^8 + 2 * q^7 + 2 * q^6 + q^5 + 2 * q^4 + 2 * q^2 + 1) * (q^2 - q + 1),
  (q^2 - q + 1) * (2 * q^6 + 2 * q^5 + 2 * q^4 + 2 * q^3 + 2 * q^2 + q + 1),
  (q^2 - q + 1) * (3 * q^4 - 2 * q^3 + 2 * q^2 - q + 1) * (q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^6 + 4 * q^4 - 2 * q^3 + 3 * q^2 - q + 1),
  3 * q^6 + 2 * q^5 + 3 * q^4 + q^3 + 2 * q^2 + 1,
  (q + 1) * (3 * q^4 - 2 * q^3 + 3 * q^2 - q + 1),
  (q + 1) * (2 * q^2 + 1) * (q^2 - q + 1),
  q^4 + q^3 + 2 * q^2 + 1,
  2 * q^2 + 1,
  (q + 1) * (3 * q^2 - q + 1),
  2 * q^2 + 1,
  R(1),
  R(1)] [
  -(q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^3,
  -(q + 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (3 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) * (q - 1)^2,
  -(q + 1) * (2 * q^7 + 3 * q^6 - q^5 + 5 * q^4 - 3 * q^3 + 3 * q^2 - q + 1) * (q - 1)^3,
  (q + 1) * (q - 1) * (q^2 - q + 1) * (q^5 - 3 * q^4 + 5 * q^3 - 3 * q^2 + 2 * q - 1),
  (3 * q^6 + 5 * q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2,
  (q - 1) * (q^6 - 4 * q^5 - q^4 + 4 * q^3 - 3 * q^2 + 2 * q - 1),
  -(q - 1) * (3 * q^5 - q^4 - q^3 + 3 * q^2 - 2 * q + 1),
  (q - 1) * (3 * q^4 + q^3 - 3 * q^2 + 2 * q - 1),
  (q - 1) * (2 * q^5 + 4 * q^3 - 3 * q^2 + 2 * q - 1),
  -q^4 - 4 * q^3 + 5 * q^2 - 3 * q + 1,
  q^3 + 2 * q^2 - 3 * q + 1,
  -(q - 1) * (3 * q^2 - 2 * q + 1),
  (q - 1) * (2 * q - 1),
  -3 * q + 1,
  R(1)] [
  (q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q + 1)^3,
  (q - 1) * (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) * (q + 1)^2,
  (q + 1) * (q - 1) * (q^2 + 1) * (q^3 - q^2 - 1) * (q^3 - q + 1),
  (q + 1) * (q - 1) * (q^2 - q + 1) * (q^5 + q^4 + q^3 - q^2 - 1),
  (q + 1) * (q - 1) * (q^2 + 1) * (q^3 - q^2 - 1) * (q^3 - q + 1),
  -q^7 + q^5 - q^6 - q^4 - q^3 + q^2 - q + 1,
  -(q - 1) * (q^5 + q^4 + q^3 + q^2 + 1),
  -(q - 1) * (q^4 + q^3 + q^2 + 1),
  (q + 1) * (2 * q^2 + 1) * (q - 1)^2,
  -(q - 1) * (q^3 + q^2 + 1),
  -q^3 - q + 1,
  q^3 + q^2 - q + 1,
  1 - q,
  1 - q,
  R(1)] [
  -(q - 1) * (q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^4,
  (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (2 * q^8 + q^7 + 2 * q^6 + 2 * q^4 + 2 * q^2 + 1) * (q + 1)^2,
  (q + 1) * (q^2 - q + 1) * (q^6 + q^2 + q + 1),
  -(q^2 + 1) * (q^3 - q^2 - 1) * (q^3 - q + 1) * (q + 1)^2,
  (q + 1) * (q^6 + 2 * q^5 + q^4 + q^2 + 1),
  q^6 + q^2 + q + 1,
  -(q + 1) * (q - 1) * (q^3 + 2 * q^2 + q + 1),
  (2 * q^4 - 2 * q^3 + 2 * q^2 - q + 1) * (q + 1)^2,
  -(q + 1) * (q^3 - q^2 - 1),
  q^3 + 2 * q^2 + q + 1,
  (q + 1) * (q^2 + 1),
  2 * q^2 + q + 1,
  q + 1,
  R(1)] [
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + 1) * (q - 1)^3 * (q + 1)^4,
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^3 * (q - 1)^3,
  (q^2 + q + 1) * (q^5 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^2,
  -(q - 1) * (2 * q^6 - q^5 + q^4 - 2 * q^3 + q^2 - q + 1) * (q + 1)^2,
  -(q^2 + 1) * (q^2 + q + 1) * (q + 1)^2 * (q - 1)^3,
  (q + 1) * (q - 1) * (q^2 + 1) * (q^3 + q^2 - 1),
  (q + 1) * (q^2 + q + 1) * (q - 1)^2,
  (q - 1) * (q^3 - q - 1),
  (q - 1) * (2 * q^3 - q^2 + q - 1) * (q + 1)^2,
  -(q + 1) * (q^3 + q - 1),
  -2 * q^3 - q^2 + 1,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1)] [
  (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^3,
  (q - 1) * (q^4 - q^3 + q^2 - q + 1) * (2 * q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) *
  (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q - 1) * (q^2 - q + 1) * (2 * q^6 - 2 * q^5 - q^4 + q^3 - q^2 + q - 1),
  -(q + 1) * (q^2 - q + 1) * (2 * q^6 - 2 * q^5 + 2 * q^3 - 2 * q^2 + 2 * q - 1),
  -(q + 1) * (q - 1) * (q^6 + 2 * q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1),
  -(q + 1) * (q - 1) * (q^5 + q^4 - 3 * q^3 + 3 * q^2 - 2 * q + 1),
  (q + 1) * (q^5 + q^4 - 4 * q^3 + 5 * q^2 - 3 * q + 1),
  (q + 1) * (q - 1) * (q^3 - 3 * q^2 + 2 * q - 1),
  -(q - 1) * (q^2 - q + 1),
  -q^4 + q^3 + 2 * q^2 - 2 * q + 1,
  2 * q^3 - 2 * q + 1,
  -(q - 1) * (q^2 - q + 1),
  -2 * q + 1,
  -2 * q + 1,
  R(1)] [
  -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^3,
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^2 - q + 1),
  -(q - 1) * (q^5 + q^4 + q^2 + 1) * (q^2 - q + 1) * (q + 1)^2,
  -(q + 1) * (q - 1) * (q^5 + q^4 + q^3 + q^2 + 1),
  -(q + 1) * (q^5 - q^4 - q^2 + q - 1),
  (q + 1) * (q^4 + q^2 - q + 1),
  (q + 1) * (q^2 - q + 1),
  q^4 + q^3 + 1,
  R(1),
  (q + 1) * (q^2 - q + 1),
  R(1),
  R(1),
  R(1)] [
  (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
  (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q + 1)^5,
  -(q - 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^4,
  -(q - 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  (q^2 - q + 1) * (q^5 + q^4 - q^3 - q^2 + 1) * (q + 1)^2,
  -(q - 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^4 + 1) * (q + 1)^2,
  (q + 1) * (q^5 + q^4 - q^3 - q^2 + 1),
  (q + 1) * (q - 1) * (q^3 - q - 1),
  -(q - 1) * (q + 1)^2,
  -(q + 1) * (q^3 + q^2 - 1),
  -q^3 + q + 1,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1)] [
  -(q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q^2 - q + 1)^2 *
  (q - 1)^3 * (q + 1)^4,
  -(q^2 - q + 1) * (q^2 + 1) * (q^6 + q^5 - q^4 + q^3 - q^2 + q - 1) * (q - 1)^2 *
  (q + 1)^3,
  (q^2 - q + 1) * (q^5 + q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  (q - 1) * (q^2 - q + 1) * (q^4 + q^3 - q^2 + q - 1) * (q + 1)^2,
  (q^2 - q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  (q + 1) * (q - 1) * (2 * q^4 - q^2 + q - 1),
  (q + 1) * (q - 1) * (q^4 - q^3 - q^2 + q - 1),
  -(q + 1) * (q - 1) * (q^3 + q^2 - q + 1),
  -(q + 1) * (q - 1) * (q^2 - q + 1),
  (q + 1) * (2 * q^2 - 2 * q + 1),
  (q + 1) * (q - 1)^2,
  1 - q,
  -q^2 - q + 1,
  1 - q,
  R(1)] [
  (q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 *
  (q^2 - q + 1)^2 * (q + 1)^5,
  -(q - 1) * (q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^4,
  (q - 1) * (q^2 - q + 1) * (q^5 - q^2 - 1) * (q + 1)^3,
  -(q - 1) * (q^2 - q + 1) * (q^4 + q^3 + q^2 + q + 1) * (q + 1)^2,
  -(q - 1) * (q^2 + 1) * (q^2 - q + 1) * (q + 1)^3,
  (q^2 - q + 1) * (q + 1)^2,
  -(q + 1) * (q - 1) * (q^4 + q^3 + q^2 + q + 1),
  -(q - 1) * (q^2 + 1) * (q + 1)^2,
  (q^2 - q + 1) * (q + 1)^2,
  q + 1,
  (q + 1) * (q^2 + 1),
  q + 1,
  q^2 + q + 1,
  q + 1,
  R(1)] [
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
  (q^2 + 1) * (q - 1)^2 * (q + 1)^5,
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q^5 - q^3 + q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q^5 - q^4 + q^2 - q + 1) * (q + 1)^2,
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^3,
  (q^3 + q^2 + 1) * (q + 1)^2 * (q - 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^3 - q + 1),
  -(q - 1) * (q^2 - q + 1) * (q + 1)^2,
  (q + 1) * (q^3 - q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1)] [
  -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3 *
  (q + 1)^6,
  (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^5,
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  (q^2 + 1) * (q^2 - q + 1) * (q - 1)^2 * (q + 1)^4,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q + 1)^2,
  -(q - 1) * (q^2 - q + 1) * (q + 1)^3,
  -(q - 1) * (q + 1)^2,
  q + 1,
  -(q - 1) * (q + 1)^2,
  q + 1,
  q + 1,
  R(1)]]
classinfo = Vector{Any}[
  [[[1, 1, 1, 1, 1, 1, 1]]],
  [[[2, 1, 1, 1, 1, 1]]],
  [[[2, 2, 1, 1, 1]]],
  [[[2, 2, 2, 1]]],
  [[[3, 1, 1, 1, 1]]],
  [[[3, 2, 1, 1]]],
  [[[3, 2, 2]]],
  [[[3, 3, 1]]],
  [[[4, 1, 1, 1]]],
  [[[4, 2, 1]]],
  [[[4, 3]]],
  [[[5, 1, 1]]],
  [[[5, 2]]],
  [[[6, 1]]],
  [[[7]]]]
classlength =
  R.([
    1,
    (q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1) * (q^2 - q + 1) *
    (q^2 + q + 1),
    (q + 1)^2 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q * (q - 1) * (q^2 - q + 1) *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^3 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^3 * (q - 1)^2 * (q^2 - q + 1) *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^2 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^5 * (q - 1) * (q^2 - q + 1) *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1),
    (q + 1)^3 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^5 * (q - 1)^2 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^4 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^6 * (q - 1)^2 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^4 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^8 * (q - 1)^2 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^3 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^9 * (q - 1)^2 * (q^2 - q + 1) *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^4 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^9 * (q - 1)^3 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^5 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^10 * (q - 1)^3 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^4 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^12 * (q - 1)^2 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^5 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^12 * (q - 1)^3 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q + 1)^5 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * q^14 * (q - 1)^3 * (q^2 - q + 1)^2 *
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1),
    (q^2 + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + q + 1) * (q^2 - q + 1)^2 * (q - 1)^3 *
    q^15 * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^6])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
  [[1, 1, 1, 1, 1, 1, 1]],
  [[2, 1, 1, 1, 1, 1]],
  [[2, 2, 1, 1, 1]],
  [[2, 2, 2, 1]],
  [[3, 1, 1, 1, 1]],
  [[3, 2, 1, 1]],
  [[3, 2, 2]],
  [[3, 3, 1]],
  [[4, 1, 1, 1]],
  [[4, 2, 1]],
  [[4, 3]],
  [[5, 1, 1]],
  [[5, 2]],
  [[6, 1]],
  [[7]]]
chardegree =
  R.([
    -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
    (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3,
    (q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 * (q^2 - q + 1)^2,
    -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q + 1)^2 * (q^2 - q + 1)^2,
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
    (q^2 + 1) * (q^2 - q + 1)^2 * (q + 1)^3,
    -(q^2 + 1) * (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^2 * (q - 1)^3,
    (q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q + 1)^3,
    -(q - 1) * (q^2 - q + 1) * (q^2 + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q + 1)^4,
    -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
    (q^2 + 1) * (q - 1)^3 * (q + 1)^4,
    (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
    (q - 1)^2 * (q^2 - q + 1)^2 * (q + 1)^3,
    -(q - 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 - q + 1)^2 * (q + 1)^4,
    (q^2 - q + 1) * (q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) *
    (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q - 1)^2 * (q + 1)^5,
    -(q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q^2 - q + 1)^2 *
    (q - 1)^3 * (q + 1)^4,
    (q^2 + q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q - 1)^2 *
    (q^2 - q + 1)^2 * (q + 1)^5,
    (q^2 - q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^6 - q^5 + q^4 - q^3 + q^2 - q + 1) *
    (q^2 + 1) * (q - 1)^2 * (q + 1)^5,
    -(q^2 + q + 1) * (q^4 - q^3 + q^2 - q + 1) * (q^2 + 1) * (q^2 - q + 1)^2 * (q - 1)^3 *
    (q + 1)^6])

information = raw"""- Information about the tables of Green functions for GU_7(q).

- CHEVIE-name of the table: GU7green

- By a theorem of Hotta, Springer and Kawanaka we can get the Green
  functions of the unitary group GU_7(q^2) from those of GL_7(q) 
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

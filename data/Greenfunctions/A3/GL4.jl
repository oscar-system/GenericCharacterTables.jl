using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using ..GenericCharacterTables.Oscar
R, q = polynomial_ring(QQ, "q")

order = (q - 1)^4 * (q + 1)^2 * (q^2 + 1) * q^6 * (q^2 + q + 1)
table = QQPolyRingElem[[
  (q^2 + 1) * (q^2 + q + 1) * (q + 1)^2,
  (q + 1) * (3 * q^2 + 2 * q + 1),
  (q + 1) * (2 * q + 1),
  3 * q + 1,
  R(1)] [
  -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 + q + 1),
  -q^3 + q^2 + q + 1,
  q + 1,
  q + 1,
  R(1)] [
  (q^2 + 1) * (q^2 + q + 1) * (q - 1)^2,
  -(q - 1) * (q^2 + 1),
  2 * q^2 - q + 1,
  -q + 1,
  R(1)] [
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  -(q - 1) * (q + 1),
  -(q - 1) * (q + 1),
  R(1),
  R(1)] [
  -(q + 1) * (q^2 + q + 1) * (q - 1)^3,
  (q + 1) * (q - 1)^2,
  -q + 1,
  -q + 1,
  R(1)]]
classinfo = Vector{Any}[[[[1, 1, 1, 1]]], [[[2, 1, 1]]], [[[2, 2]]], [[[3, 1]]], [[[4]]]]
classlength =
  R.([
    1,
    (q - 1) * (q + 1) * (q^2 + 1) * (q^2 + q + 1),
    (q - 1)^2 * (q + 1) * (q^2 + 1) * q * (q^2 + q + 1),
    (q - 1)^2 * (q + 1)^2 * (q^2 + 1) * q^2 * (q^2 + q + 1),
    (q - 1)^3 * (q + 1)^2 * (q^2 + 1) * q^3 * (q^2 + q + 1)])
classtypeorder = R.([1, 1, 1, 1, 1])
charinfo = Vector{Any}[[[1, 1, 1, 1]], [[2, 1, 1]], [[2, 2]], [[3, 1]], [[4]]]
chardegree =
  R.([
    (q^2 + 1) * (q^2 + q + 1) * (q + 1)^2,
    -(q - 1) * (q + 1) * (q^2 + 1) * (q^2 + q + 1),
    (q^2 + 1) * (q^2 + q + 1) * (q - 1)^2,
    (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
    -(q + 1) * (q^2 + q + 1) * (q - 1)^3])

information = raw"""The Green functions of $\mathrm{GL}_4(q)$.

- These Green functions were introduced in: [Gre55](@cite).

- See also: [Ste51](@cite).

- This CHEVIE-table is computed by an algorithm from [LS78](@cite).

- The program which generates the files with the Green functions 
  of $\mathrm{GL}_n(q)$ and $\mathrm{GU}_n(q)$ is part of the CHEVIE-system. You 
  can reproduce them with the CHEVIE commands: 
  > GreenFunctionsA(n,filename);
  > GreenFunctions2A(n,filename);
  (see the corresponding help)
  These programs are written by U. Porsch and F. Lübeck.
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

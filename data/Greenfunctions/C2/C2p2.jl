using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^4*(q-1)^2*(q+1)^2*(q^2+1)
table = QQPolyRingElem[[
	(q+1)^2*(q^2+1),
	(q+1)^2,
	(q+1)^2,
	2*q+1,
	R(1),
	R(1)] [
	-(q-1)*(q+1)*(q^2+1),
	-(q-1)*(q+1),
	(q^2+1),
	R(1),
	R(1),
	R(1)] [
	-(q-1)*(q+1)*(q^2+1),
	(q^2+1),
	-(q-1)*(q+1),
	R(1),
	R(1),
	R(1)] [
	(q-1)^2*(q^2+1),
	(q-1)^2,
	(q-1)^2,
	-2*q+1,
	R(1),
	R(1)] [
	(q-1)^2*(q+1)^2,
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	R(1),
	R(1),
	R(1)]]
classinfo = Vector{Any}[["A1"], ["A2"], ["A31"], ["A32"], ["A41"], ["A42"]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+1),
	(q-1)*(q+1)*(q^2+1),
	(q-1)^2*(q+1)^2*(q^2+1),
	1//2*q^2*(q-1)^2*(q+1)^2*(q^2+1),
	1//2*q^2*(q-1)^2*(q+1)^2*(q^2+1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[[[[1,1],[]]], [[[1],[1]]], [[[2],[]]], [[[],[1,1]]], [[[],[2]]]]
chardegree = R.([(q+1)^2*(q^2+1), -(q-1)*(q+1)*(q^2+1), -(q-1)*(q+1)*(q^2+1), (q-1)^2*(q^2+1), (q-1)^2*(q+1)^2])

information = "- Information about the Green functions of \$Sp_4(q)\$, q even.

- CHEVIE-name of the table: ``C2p2green``

- The table was first computed in:
  {\\sc H. Ennomoto}, The characters of the finite  symplectic group
  \$Sp(4,q)\$, \$q=2^f\$, {\\em Osaka J. Math.} {\\bf9} (1972), 75--94.

- The names of the unipotent classes are taken from this paper.
"

TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information,splitext(basename(@__FILE__))[1])

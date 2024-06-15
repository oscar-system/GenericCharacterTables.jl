using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q*(q+1)*(q-1)^2
table = QQPolyRingElem[[
	q,
	R(0),
	R(1),
	R(-1)] [
	R(1),
	R(1),
	R(1),
	R(1)]]
classinfo = Vector{Any}[
	["A_1(q)",q-1,[[1,1]]],
	["A_1(q)",q-1,[[2]]],
	["\\emptyset",(q-1)^2,[[[1]],1]],
	["\\emptyset",(q-1)*(q+1),[[[1]],1]]]
classlength = R.([1, q^2-1, (q+1)*q, (q-1)*q])
classtypeorder = R.([q-1, q-1, 1//2*q^2-3//2*q+1, 1//2*q^2-1//2*q])
charinfo = Vector{Any}[[[1,1]], [[2]]]
chardegree = R.([q, 1])

information = "- Information about the tables of unipotent characters for GL_2(q).

- CHEVIE-name of the table: uniGL2

- This table is computed with general programs written by F.Luebeck.
  They compute the Deligne-Lusztig characters R_T^G(1) and find the
  unipotent characters as linear combinations of them.
"

TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information,splitext(basename(@__FILE__))[1])

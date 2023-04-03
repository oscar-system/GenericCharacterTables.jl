using ..GenericCharacterTables
import ..GenericCharacterTables: ExtendableMatrix, SimpleCharTable
using Oscar
R, q = PolynomialRing(QQ, "q")

order = 2*q^6*(q-1)^4*(q+1)^2*(q^2+q+1)*(q^2+1)
table = QQPolyRingElem[[
	(q+1)^2*(q^2+1),
	(q+1)^2,
	3*q+1,
	q+1,
	R(1)] [
	-(q-1)*(q+1)*(q^2+1),
	(q^2+1),
	-(q-1),
	(q+1),
	R(1)] [
	-(q-1)*(q+1)*(q^2+1),
	-(q-1)*(q+1),
	(q+1),
	-(q-1),
	R(1)] [
	(q-1)^2*(q^2+1),
	(q-1)^2,
	-(q-1),
	-3*q+1,
	R(1)] [
	(q-1)^2*(q+1)^2,
	-(q-1)*(q+1),
	-(q-1),
	(q+1),
	R(1)]]
classinfo = Vector{Any}[["u_1"], ["u_2"], ["u_3"], ["u_4"], ["u_5"]]
classlength = R.([1, q^4-1, 1//2*q*(q+1)*(q^4-1), 1//2*q*(q-1)*(q^4-1), q^2*(q^2-1)*(q^4-1)])
classtypeorder = R.([1, 1, 1, 1, 1])
charinfo = Vector{Any}[[[1,1],[]], [[2],[]], [[1],[1]], [[],[1,1]], [[],[2]]]
chardegree = R.([(q+1)^2*(q^2+1), -(q-1)*(q+1)*(q^2+1), -(q-1)*(q+1)*(q^2+1), (q-1)^2*(q^2+1), (q-1)^2*(q+1)^2])

information = "- Information about the Green functions of \$GL_4(2^n):2\$.

- CHEVIE-name of the table: ``GL4e2green``

- The table was first computed in:
  {\\sc G. Malle}, Generalized Deligne-Lusztig characters,
    {\\em J. Algebra \\bf159} (1993), 64--97.
"

TABLE=SimpleCharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

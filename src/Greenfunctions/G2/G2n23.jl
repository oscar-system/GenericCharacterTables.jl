using ..GenericCharacterTables
import ..GenericCharacterTables: ExtendableMatrix, SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^6*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1)
table = QQPolyRingElem[[
	(q+1)^2*(q^2+q+1)*(q^2-q+1),
	(q+1)*(q^2+q+1),
	(q+1)*(2*q+1),
	4*q+1,
	2*q+1,
	q+1,
	R(1)] [
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),
	-(q-1)*(q^2+q+1),
	q+1,
	2*q+1,
	R(1),
	-q+1,
	R(1)] [
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),
	(q+1)*(q^2-q+1),
	-q+1,
	-2*q+1,
	R(1),
	q+1,
	R(1)] [
	(q-1)^2*(q+1)^2*(q^2+q+1),
	-(q-1)*(q+1)^2,
	-(q-1)*(q+1),
	-q+1,
	q+1,
	2*q+1,
	R(1)] [
	(q-1)^2*(q+1)^2*(q^2-q+1),
	(q-1)^2*(q+1),
	-(q-1)*(q+1),
	q+1,
	-q+1,
	-2*q+1,
	R(1)] [
	(q-1)^2*(q^2+q+1)*(q^2-q+1),
	-(q-1)*(q^2-q+1),
	(q-1)*(2*q-1),
	-4*q+1,
	-2*q+1,
	-q+1,
	R(1)]]
classinfo = Vector{Any}[["u_0"], ["u_1"], ["u_2"], ["u_3"], ["u_4"], ["u_5"], ["u_6"]]
classlength = R.([
	1,
	(q^2-q+1)*(q^2+q+1)*(q+1)*(q-1),
	(q^2-q+1)*(q^2+q+1)*(q+1)*(q-1)*q^2,
	1//6*q^2*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1),
	1//2*q^2*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1),
	1//3*q^2*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1),
	q^4*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[["\\emptyset"], ["\\tildeA_1"], ["A_1"], ["G_2"], ["A_2"], ["A_1+\\tildeA_1"]]
chardegree = R.([
	(q+1)^2*(q^2+q+1)*(q^2-q+1),
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),
	(q-1)^2*(q+1)^2*(q^2+q+1),
	(q-1)^2*(q+1)^2*(q^2-q+1),
	(q-1)^2*(q^2+q+1)*(q^2-q+1)])

information = "- Information about the Green functions of \$G_2(q)\$, \$p>3\$.

- CHEVIE-name of the table: ``G2n23green``

- The table was first computed in:
  {\\sc B. Chang, R. Ree}, The characters of \$G_2(q)\$, Symposia
    Mathematica XIII, London (1974), 395--413.

  The notation for the unipotent classes is taken from that paper.
"

TABLE=SimpleCharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

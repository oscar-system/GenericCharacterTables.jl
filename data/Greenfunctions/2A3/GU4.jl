using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = (q+1)^4*(q-1)^2*(q^2+1)*q^6*(q^2-q+1)
table = QQPolyRingElem[[
	(q^2+1)*(q^2-q+1)*(q-1)^2,
	-(q-1)*(3*q^2-2*q+1),
	(q-1)*(2*q-1),
	-3*q+1,
	R(1)] [
	-(q+1)*(q-1)*(q^2+1)*(q^2-q+1),
	q^3+q^2-q+1,
	-q+1,
	-q+1,
	R(1)] [
	(q^2+1)*(q^2-q+1)*(q+1)^2,
	(q+1)*(q^2+1),
	2*q^2+q+1,
	q+1,
	R(1)] [
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	R(1),
	R(1)] [
	-(q-1)*(q^2-q+1)*(q+1)^3,
	-(q-1)*(q+1)^2,
	q+1,
	q+1,
	R(1)]]
classinfo = Vector{Any}[[[[1,1,1,1]]], [[[2,1,1]]], [[[2,2]]], [[[3,1]]], [[[4]]]]
classlength = R.([
	1,
	(q+1)*(q-1)*(q^2+1)*(q^2-q+1),
	(q+1)^2*(q-1)*(q^2+1)*q*(q^2-q+1),
	(q^2+1)*(q-1)^2*(q+1)^2*q^2*(q^2-q+1),
	(q^2-q+1)*q^3*(q^2+1)*(q-1)^2*(q+1)^3])
classtypeorder = R.([1, 1, 1, 1, 1])
charinfo = Vector{Any}[[[1,1,1,1]], [[2,1,1]], [[2,2]], [[3,1]], [[4]]]
chardegree = R.([
	(q^2+1)*(q^2-q+1)*(q-1)^2,
	-(q+1)*(q-1)*(q^2+1)*(q^2-q+1),
	(q^2+1)*(q^2-q+1)*(q+1)^2,
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q^2-q+1)*(q+1)^3])

information = "- Information about the tables of Green functions for GU_4(q).

- CHEVIE-name of the table: GU4green

- By a theorem of Hotta, Springer and Kawanaka we can get the Green
  functions of the unitary group GU_4(q^2) from those of GL_4(q) 
  by substituting q by -q. This is proved in:
  {\\sc R.~Hotta and T.~A.~Springer}, A specialisation theorem for
  certain Weyl group representations, {\\em Invent. Math.} 
  {\\bf 41} (1977), 113--127.
  {\\sc N.~Kawanaka}, Generalized Gelfand--Graev characters and
  Ennola duality, {\\em Adv. Stud. Pure Math.} {\\bf 6} (1985), 175--206.

- See also:
  {\\sc F.~Digne and J.~Michel}, Foncteurs de Lusztig et caract\\``{e}res
  des groupes lin\\'{e}aires et unitaires sur un corps fini, 
  {\\em J. of Alg.} {\\bf 107} (1987), 217--255.

- For the computation of the Green functions for GL_n(q) see for example:
  > GreenFunTab(GL2);
  > PrintInfoTab(GL2green);
"

TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information,splitext(basename(@__FILE__))[1])

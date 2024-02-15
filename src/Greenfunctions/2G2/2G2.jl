using ..GenericCharacterTables
import ..GenericCharacterTables: ExtendableMatrix, SimpleCharTable
using Oscar
K, sqrt3 = number_field(polynomial(QQ,[-3,0,1]), "sqrt(3)")
R, q = polynomial_ring(K, "q")

order = q^6*(q^2-1)*(q^2+1)*(q^4-q^2+1)
table = Generic.Poly{nf_elem}[[
	(q^2+1)*(q^4-q^2+1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	-(q^2-1)*(q^4-q^2+1),
	-2*q^2+1,
	R(1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	-(q^4-1)*(q^2-sqrt3*q+1),
	q^2-sqrt3*q+1,
	-sqrt3*q+1,
	-sqrt3*q+1,
	R(1),
	R(1),
	R(1)] [
	-(q^4-1)*(q^2+sqrt3*q+1),
	q^2+sqrt3*q+1,
	sqrt3*q+1,
	sqrt3*q+1,
	R(1),
	R(1),
	R(1)]]
classinfo = Vector{Any}[[""], [""], [""], [""], [""], [""], [""]]
classlength = R.([
	1,
	(q^2-1)*(q^2+1)*(q^4-q^2+1),
	1//2*q^2*(q^2-1)*(q^2+1)*(q^4-q^2+1),
	1//2*q^2*(q^2-1)*(q^2+1)*(q^4-q^2+1),
	1//3*q^4*(q^2-1)*(q^2+1)*(q^4-q^2+1),
	1//3*q^4*(q^2-1)*(q^2+1)*(q^4-q^2+1),
	1//3*q^4*(q^2-1)*(q^2+1)*(q^4-q^2+1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[["T_1"], ["T_2"], ["T_3"], ["T_4"]]
chardegree = R.([(q^2+1)*(q^4-q^2+1), -(q^2-1)*(q^4-q^2+1), -(q^4-1)*(q^2-sqrt3*q+1), -(q^4-1)*(q^2+sqrt3*q+1)])

information = "- Information about the Green functions of \$^2G_2(q^2)\$.

- CHEVIE-name of the table: ``2G2green``

- The table was first computed in:
  {\\sc H. N. Ward}, On Ree's series of simple groups, {\\em Trans.  Am. Math.
    Soc. \\bf121} (1966), 62--89.
"

TABLE=SimpleCharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

using ..GenericCharacterTables
import ..GenericCharacterTables: ExtendableMatrix, SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = (q-1)^4*(q+1)^2*(q^2+1)*q^6*(q^2+q+1)
table = QQPolyRingElem[[
	(q^2+1)*(q^2+q+1)*(q+1)^2,
	(q+1)*(3*q^2+2*q+1),
	(q+1)*(2*q+1),
	3*q+1,
	R(1)] [
	-(q-1)*(q+1)*(q^2+1)*(q^2+q+1),
	-q^3+q^2+q+1,
	q+1,
	q+1,
	R(1)] [
	(q^2+1)*(q^2+q+1)*(q-1)^2,
	-(q-1)*(q^2+1),
	2*q^2-q+1,
	-q+1,
	R(1)] [
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	R(1),
	R(1)] [
	-(q+1)*(q^2+q+1)*(q-1)^3,
	(q+1)*(q-1)^2,
	-q+1,
	-q+1,
	R(1)]]
classinfo = Vector{Any}[[[[1,1,1,1]]], [[[2,1,1]]], [[[2,2]]], [[[3,1]]], [[[4]]]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+1)*(q^2+q+1),
	(q-1)^2*(q+1)*(q^2+1)*q*(q^2+q+1),
	(q-1)^2*(q+1)^2*(q^2+1)*q^2*(q^2+q+1),
	(q-1)^3*(q+1)^2*(q^2+1)*q^3*(q^2+q+1)])
classtypeorder = R.([1, 1, 1, 1, 1])
charinfo = Vector{Any}[[[1,1,1,1]], [[2,1,1]], [[2,2]], [[3,1]], [[4]]]
chardegree = R.([
	(q^2+1)*(q^2+q+1)*(q+1)^2,
	-(q-1)*(q+1)*(q^2+1)*(q^2+q+1),
	(q^2+1)*(q^2+q+1)*(q-1)^2,
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q+1)*(q^2+q+1)*(q-1)^3])

information = "- Information about the tables of Green functions for GL_4(q).

- CHEVIE-name of the table: GL4green

- These Green functions were introduced in:
  {\\sc J.~A.~Green}, The characters of the finite general linear
  groups, {\\em Trans. Amer. Math. Soc.} {\\bf 80} (1955), 402--447.

- See also:
  {\\sc R.~Steinberg}, The representations of \$GL(3,q)\$,  \$GL(4,q)\$, \$PGL(3,q\
)\$ 
  and \$PGL(4,q)\$, {\\em Can. J. of Math.} {\\bf 3} (1951), 225--235.

- This CHEVIE-table is computed by an algorithm from 
  the following article:
  {\\sc A.~Lascoux and M.~P.~Schützenberger}, Sur une conjecture de 
  H.~O.~Foulkes, {\\em C. R. Acad. Sci. Paris} {\\bf 286A}  (1978), 323--324.\


- The program which generates the files with the Green functions 
  of GL_n(q) and GU_n(q) is part of the CHEVIE-system. You 
  can reproduce them with the CHEVIE commands: 
  > GreenFunctionsA(n,filename);
  > GreenFunctions2A(n,filename);
  (see the corresponding help)
  These programs are written by U. Porsch and F. Luebeck.
"

TABLE=SimpleCharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

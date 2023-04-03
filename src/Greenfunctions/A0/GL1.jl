using ..GenericCharacterTables
import ..GenericCharacterTables: ExtendableMatrix, SimpleCharTable
using Oscar
R, q = PolynomialRing(QQ, "q")

order = q-1
table = QQPolyRingElem[R(1)]
classinfo = Vector{Any}[[[[1]]]]
classlength = R.([1])
classtypeorder = R.([1])
charinfo = Vector{Any}[[[1]]]
chardegree = R.([1])

information = "- Information about the tables of Green functions for GL_1(q).

- CHEVIE-name of the table: GL1green

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

TABLE=SimpleCharTable(order,ExtendableMatrix(reshape(table,1,1)),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

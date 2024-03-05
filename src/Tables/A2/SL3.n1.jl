using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ExtendableMatrix, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
a,b,m,n, _...=gens(S, ["a", "b", "m", "n", "a1", "b1", "m1", "n1", "a2", "b2", "m2", "n2", "a3", "b3", "m3", "n3", "at1", "bt1", "mt1", "nt1", "at2", "bt2", "mt2", "nt2"])

order = q^3*(q-1)^2*(q+1)*(q^2+q+1)
table = Cyclotomic{QQPolyRingElem}[[
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(q^2+q)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(q^3)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(q^2+q+1)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(q+1)*e2p((n*a)*S(1//(q-1)))+e2p((-2*n*a)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1)))+e2p((-2*n*a)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1)))+e2p((n*b)*S(1//(q-1)))+e2p((n*(-a-b))*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1))),
	(0)*e2p(S(0))] [
	(q*(q^2+q+1))*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q+1)*e2p((n*a)*S(1//(q-1)))+q*e2p((-2*n*a)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1))),
	(e2p((n*a)*S(1//(q-1)))+e2p((n*b)*S(1//(q-1)))+e2p((n*(-a-b))*S(1//(q-1)))),
	-e2p((n*a)*S(1//(q-1))),
	(0)*e2p(S(0))] [
	((q+1)*(q^2+q+1))*e2p(S(0)),
	(2*q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(q+1)*(e2p((n*a-2*m*a)*S(1//(q-1)))+e2p((m*a-2*n*a)*S(1//(q-1)))+e2p((n*a+m*a)*S(1//(q-1)))),
	(e2p((n*a-2*m*a)*S(1//(q-1)))+e2p((m*a-2*n*a)*S(1//(q-1)))+e2p((n*a+m*a)*S(1//(q-1)))),
	(e2p((m*a+n*b)*S(1//(q-1)))+e2p((m*b+n*a)*S(1//(q-1)))+e2p((m*(-a-b)+n*a)*S(1//(q-1)))+e2p((m*a+n*(-a-b))*S(1//(q-1)))+e2p((m*(-a-b)+n*b)*S(1//(q-1)))+e2p((m*b+n*(-a-b))*S(1//(q-1)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q^2+q+1))*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(q-1)*e2p((n*a)*S(1//(q-1))),
	-e2p((n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	-(e2p((-n*a)*S(1//(q^2-1)))+e2p((-n*a*q)*S(1//(q^2-1)))),
	(0)*e2p(S(0))] [
	((q-1)^2*(q+1))*e2p(S(0)),
	(-(q-1))*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(e2p((n*a)*S(1//(q^2+q+1)))+e2p((n*a*q)*S(1//(q^2+q+1)))+e2p((-n*a-n*a*q)*S(1//(q^2+q+1))))]]
classinfo = Vector{Any}[
	["",[1,0],["A_2",[1,1,1]]],
	["",[1,1],["A_2",[2,1]]],
	["",[1,2],["A_2",[3]]],
	["",[2,0],["A_1",[1,1]]],
	["",[2,1],["A_1",[2]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+q+1),
	q*(q-1)^2*(q+1)*(q^2+q+1),
	q^2*(q^2+q+1),
	q^2*(q-1)*(q+1)*(q^2+q+1),
	q^3*(q+1)*(q^2+q+1),
	q^3*(q-1)*(q^2+q+1),
	q^3*(q-1)^2*(q+1)])
charinfo = Vector{Any}[
	["",[1,0],["A_2",[3]]],
	["",[1,1],["A_2",[2,1]]],
	["",[1,2],["A_2",[1,1,1]]],
	["",[2,0],["A_1",[1,1]]],
	["",[2,1],["A_1",[2]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
chardegree = R.([1, q^2+q, q^3, q^2+q+1, q*(q^2+q+1), (q+1)*(q^2+q+1), (q-1)*(q^2+q+1), (q-1)^2*(q+1)])

classsums=[
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	nesum(tt, a, 1, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 1, q-2, congruence)
end,
function (tt::Cyclotomic)
	ss5,e1=nesum(tt, a, 0, q-2, congruence)
	ss6,e2=nesum(ss5, b, 0, q-2, congruence)
	tt1=eesubs(tt, [b], [a])
	ss7,e3=nesum(tt1, a, 0, q-2, congruence)
	tt2=eesubs(tt1, [a], [0])
	(1//6*ss6-1//2*ss7+1//3*tt2, union(e1,e2,e3))
end,
function (tt::Cyclotomic)
	ss7,e1=nesum(tt, a, 0, q^2-2, congruence)
	tt1=eesubs(tt, [a], [(q+1)*a])
	ss8,e2=nesum(tt1, a, 0, q-2, congruence)
	(1//2*ss7-1//2*ss8, union(e1,e2))
end,
function (tt::Cyclotomic)
	ss8,e1=nesum(tt, a, 1, q^2+q, congruence)
	(1//3*ss8, e1)
end
]

charsums=[
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	nesum(tt, n, 1, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, n, 1, q-2, congruence)
end,
function (tt::Cyclotomic)
	ss5,e1=nesum(tt, n, 1, q-2, congruence)
	ss6,e2=nesum(ss5, m, 1, q-2, congruence)
	tt1=eesubs(tt, [m], [n])
	ss7,e3=nesum(tt1, n, 1, q-2, congruence)
	(1//6*ss6-1//6*ss7, union(e1,e2,e3))
end,
function (tt::Cyclotomic)
	ss7,e1=nesum(tt, n, 0, q^2-2, congruence)
	tt1=eesubs(tt, [n], [(q+1)*n])
	ss8,e2=nesum(tt1, n, 0, q-2, congruence)
	(1//2*ss7-1//2*ss8, union(e1,e2))
end,
function (tt::Cyclotomic)
	ss8,e1=nesum(tt, n, 1, q^2+q, congruence)
	(1//3*ss8, e1)
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1)], [ParameterException((a)*1//(q-1))]),
Parameters([Parameter(a, q-1)], [ParameterException((a)*1//(q-1))]),
Parameters([Parameter(a, q-1), Parameter(b, q-1)], [ParameterException((a-b)*1//(q-1))]),
Parameters([Parameter(a, q^2-1)], [ParameterException((a)*1//(q+1))]),
Parameters([Parameter(a, q^2+q+1)], [ParameterException((a)*1//(q^2+q+1))])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(n, q-1)], [ParameterException((n)*1//(q-1))]),
Parameters([Parameter(n, q-1)], [ParameterException((n)*1//(q-1))]),
Parameters([Parameter(n, q-1), Parameter(m, q-1)], [ParameterException((n-m)*1//(q-1))]),
Parameters([Parameter(n, q^2-1)], [ParameterException((n)*1//(q+1))]),
Parameters([Parameter(n, q^2+q+1)], [ParameterException((n)*1//(q^2+q+1))])
]

classparamindex=var_index.([a,b])
charparamindex=var_index.([m,n])
congruence=nothing

information = "- Information about the generic character table of \$SL_3(q)\$,
  \$q\$ not congruent to \$1\$ modulo \$3\$
  (See ``SL3.1`` for the generic character table of \$SL_3(q)\$,
  \$q\$ congruent to \$1\$ modulo \$3\$.)

- Note:
  The three groups \$SL_3(q)\$, \$PGL_3(q)\$ and \$PSL_3(q)\$ are
  mutually isomorphic for these values of \$q\$.

- CHEVIE-name of the table: ``SL3.n1``

- The table was first computed in:
  {\\sc W.~A.~Simpson and J.~S.~Frame}, The character tables for
  \$SL(3,q)\$, \$SU(3,q^2)\$, \$PSL(3,q)\$, \$PSU(3,q^2)\$,
  {\\em Can.\\ J.~Math.} {\\bf 25} (1973), 486--494.

- See also:
  {\\sc R.~Steinberg}, The representations of \$GL(3,q)\$, \$GL(4,q)\$, \$PGL(3,q)\$
  and \$PGL(4,q)\$, {\\em Can.\\ J.~Math.} {\\bf 3} (1951), 225--235.

  {\\sc J.~A.~Green}, The characters of the finite general linear groups,
  {\\em Trans.\\ Amer.\\ Math.\\ Soc.} {\\bf 80} (1955), 402--447.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

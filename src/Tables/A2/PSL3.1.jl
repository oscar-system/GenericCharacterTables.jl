using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ParameterSubstitution, ExtendableMatrix, CharTable
using Oscar
R, q = PolynomialRing(QQ, "q")
Q = FractionField(R)
S = UniversalPolynomialRing(Q, cached=false)
a,b,m,n, _...=gens(S, ["a", "b", "m", "n", "a1", "b1", "m1", "n1", "a2", "b2", "m2", "n2", "a3", "b3", "m3", "n3", "at1", "bt1", "mt1", "nt1", "at2", "bt2", "mt2", "nt2"])

order = q^3*(q-1)^2*(q+1)*(q^2+q+1)*1//3
table = Cyclotomic{QQPolyRingElem}[[
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
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
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(2)*e2p(S(0)),
	(2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(q^3)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(q^2+q+1)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	q*e2p((3*n*a)*S(1//(q-1)))+e2p((3*n*a)*S(1//(q-1)))+e2p((-6*n*a)*S(1//(q-1))),
	e2p((3*n*a)*S(1//(q-1)))+e2p((-6*n*a)*S(1//(q-1))),
	(3)*e2p(S(0)),
	e2p((3*n*a)*S(1//(q-1)))+e2p((3*n*b)*S(1//(q-1)))+e2p((3*n*(-a-b))*S(1//(q-1))),
	e2p((3*n*a)*S(1//(q-1))),
	(0)*e2p(S(0))] [
	(q*(q^2+q+1))*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q+1)*e2p((3*n*a)*S(1//(q-1)))+q*e2p((-6*n*a)*S(1//(q-1))),
	e2p((3*n*a)*S(1//(q-1))),
	(3)*e2p(S(0)),
	e2p((3*n*a)*S(1//(q-1)))+e2p((3*n*b)*S(1//(q-1)))+e2p((3*n*(-a-b))*S(1//(q-1))),
	-e2p((3*n*a)*S(1//(q-1))),
	(0)*e2p(S(0))] [
	((q+1)*(q^2+q+1)*1//3)*e2p(S(0)),
	((2*q+1)*1//3)*e2p(S(0)),
	(q-(q-1)*1//3)*e2p(S(0)),
	(-(q-1)*1//3)*e2p(S(0)),
	(-(q-1)*1//3)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(e2p(((q-1)*1//3)*S(1//(3)))+e2p((2*(q-1)*1//3)*S(1//(3)))),
	(e2p((a-b)*S(1//(3)))+e2p((b-a)*S(1//(3)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q+1)*(q^2+q+1)*1//3)*e2p(S(0)),
	((2*q+1)*1//3)*e2p(S(0)),
	(-(q-1)*1//3)*e2p(S(0)),
	(q-(q-1)*1//3)*e2p(S(0)),
	(-(q-1)*1//3)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(e2p(((q-1)*1//3)*S(1//(3)))+e2p((2*(q-1)*1//3)*S(1//(3)))),
	(e2p((a-(-a-b))*S(1//(3)))+e2p(((-a-b)-a)*S(1//(3)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q+1)*(q^2+q+1)*1//3)*e2p(S(0)),
	((2*q+1)*1//3)*e2p(S(0)),
	(-(q-1)*1//3)*e2p(S(0)),
	(-(q-1)*1//3)*e2p(S(0)),
	(q-(q-1)*1//3)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(e2p(((q-1)*1//3)*S(1//(3)))+e2p((2*(q-1)*1//3)*S(1//(3)))),
	(e2p((b-(-a-b))*S(1//(3)))+e2p(((-a-b)-b)*S(1//(3)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q+1)*(q^2+q+1))*e2p(S(0)),
	(2*q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(q+1)*(e2p((3*a*(n-m))*S(1//(q-1)))+e2p((a*(-6*n+3*m))*S(1//(q-1)))+e2p((3*n*a)*S(1//(q-1)))),
	e2p((3*a*(n-m))*S(1//(q-1)))+e2p((a*(3*m-6*n))*S(1//(q-1)))+e2p((3*n*a)*S(1//(q-1))),
	3*(e2p((m)*S(1//(3)))+e2p((2*m)*S(1//(3)))),
	e2p((a*m+3*b*n-b*m)*S(1//(q-1)))+e2p((b*m+a*(3*n-m))*S(1//(q-1)))+e2p((m*(-a-b)+3*n*a-m*a)*S(1//(q-1)))+e2p((m*a+3*n*(-a-b)-m*(-a-b))*S(1//(q-1)))+e2p((m*(-a-b)+3*n*b-m*b)*S(1//(q-1)))+e2p((m*b+3*n*(-a-b)-m*(-a-b))*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q^2+q+1))*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(q-1)*e2p((3*n*a)*S(1//(q-1))),
	-e2p((3*n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-(e2p((3*n*a)*S(1//(q^2-1)))+e2p((3*n*a*q)*S(1//(q^2-1)))),
	(0)*e2p(S(0))] [
	((q-1)^2*(q+1))*e2p(S(0)),
	(-(q-1))*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(e2p((3*n*a)*S(1//(q^2+q+1)))+e2p((3*n*a*q)*S(1//(q^2+q+1)))+e2p((-3*n*a-3*n*a*q)*S(1//(q^2+q+1))))]]
classinfo = Vector{Any}[
	["",[1,0],["A_2",[1,1,1]]],
	["",[1,1],["A_2",[2,1]]],
	["",[1,2],["A_2",[2,1]]],
	["",[1,3],["A_2",[3]]],
	["",[1,4],["A_2",[3]]],
	["",[2,0],["A_1",[1,1]]],
	["",[2,1],["A_1",[2]]],
	["",[6,0],["A_0:3",[1]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+q+1),
	q*(q-1)^2*(q+1)*(q^2+q+1)*1//3,
	q*(q-1)^2*(q+1)*(q^2+q+1)*1//3,
	q*(q-1)^2*(q+1)*(q^2+q+1)*1//3,
	q^2*(q^2+q+1),
	q^2*(q-1)*(q+1)*(q^2+q+1),
	q^3*(q+1)*(q^2+q+1)*1//3,
	q^3*(q+1)*(q^2+q+1),
	q^3*(q-1)*(q^2+q+1),
	q^3*(q-1)^2*(q+1)])
charinfo = Vector{Any}[
	["",[1,0],["A_2",[3]]],
	["",[1,1],["A_2",[2,1]]],
	["",[1,2],["A_2",[1,1,1]]],
	["",[2,0],["A_1",[2]]],
	["",[2,1],["A_1",[1,1]]],
	["",[3,0,1],["A_0:3","1"]],
	["",[3,0,2],["A_0:3","\\omega"]],
	["",[3,0,3],["A_0:3","\\omega^2"]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]],
	["",[8,0],["A_0",[1]]]]
chardegree = R.([
	1,
	q^2+q,
	q^3,
	q^2+q+1,
	q*(q^2+q+1),
	(q+1)*(q^2+q+1)*1//3,
	(q+1)*(q^2+q+1)*1//3,
	(q+1)*(q^2+q+1)*1//3,
	(q+1)*(q^2+q+1),
	(q-1)*(q^2+q+1),
	(q-1)^2*(q+1)])

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
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	ss6,e1=nesum(tt, a, 1, q-2, congruence)
	tt1=eesubs(tt, [a], [(q-1)*1//3])
	tt2=eesubs(tt, [a], [2*(q-1)*1//3])
	(1//3*ss6-1//3*tt1-1//3*tt2, e1)
end,
function (tt::Cyclotomic)
	ss6,e1=nesum(tt, a, 1, (q-2), congruence)
	tt1=eesubs(tt, [a], [(q-1)*1//3])
	tt2=eesubs(tt, [a], [2*(q-1)*1//3])
	(1//3*ss6-1//3*tt1-1//3*tt2, e1)
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	ss5,e1=nesum(tt, a, 0, q-2, congruence)
	ss8,e2=nesum(ss5, b, 0, q-2, congruence)
	tt1=eesubs(tt, [b], [a])
	ss9,e3=nesum(tt1, a, 0, q-2, congruence)
	tt2=eesubs(tt1, [a], [(q-1)*1//3*a])
	ss10,e4=nesum(tt2, a, 0, 2, congruence)
	tt5=eesubs(tt, [b], [a+(q-1)*1//3])
	tt4=eesubs(tt5, [a], [(q-1)*1//3*a])
	ss11,e5=nesum(tt4, a, 0, 2, congruence)
	(1//18*ss8-1//6*ss9+1//9*ss10-1//9*ss11, union(e1,e2,e3,e4,e5))
end,
function (tt::Cyclotomic)
	ss7,e1=nesum(tt, a, 0, q^2-2, congruence)
	tt1=eesubs(tt, [a], [(q+1)*a])
	ss8,e2=nesum(tt1, a, 0, q-2, congruence)
	(1//6*ss7-1//6*ss8, union(e1,e2))
end,
function (tt::Cyclotomic)
	ss10,e1=nesum(tt, a, 0, q^2+q, congruence)
	tt1=eesubs(tt, [a], [(q^2+q+1)*1//3*a])
	ss11,e2=nesum(tt1, a, 0, 2, congruence)
	(1//9*ss10-1//9*ss11, union(e1,e2))
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
	nesum(tt, n, 1, (q-4)*1//3, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, n, 1, (q-4)*1//3, congruence)
end,
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
	ss5a,e1=nesum(tt, m, 1, q-2, congruence)
	ss5,e2=nesum(ss5a, n, 1, (q-1)*1//3, congruence)
	tt1=eesubs(tt, [n], [2*n])
	tt2=eesubs(tt1, [m], [3*n])
	ss6,e3=nesum(tt2, n, 1, (q-4)*1//3, congruence)
	tt3=eesubs(tt, [m], [3*n])
	ss8,e4=nesum(tt3, n, 1, (q-4)*1//3, congruence)
	ss7=eesubs(tt, [m,n], [(q-1)*1//3,(q-1)*1//3])
	(1//6*ss5-1//6*ss6-1//6*ss8-1//3*ss7, union(e1,e2,e3,e4))
end,
function (tt::Cyclotomic)
	ss7,e1=nesum(tt, n, 0, (q^2-4)*1//3, congruence)
	tt1=eesubs(tt, [n], [(q+1)*n])
	ss8,e2=nesum(tt1, n, 0, (q-4)*1//3, congruence)
	(1//2*ss7-1//2*ss8, union(e1,e2))
end,
function (tt::Cyclotomic)
	ss8,e1=nesum(tt, n, 0, (q^2+q-2)*1//3, congruence)
	tt1=eesubs(tt, [n], [0])
	(1//3*ss8-1//3*tt1, e1)
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(a, (q-1))], [ParameterException((a)*1//((q-1)*1//3))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(a, (q-1))], [ParameterException((a)*1//((q-1)*1//3))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1), Parameter(b, q-1)], [ParameterException((a)*1//((q-1)*1//3)), ParameterException((b)*1//((q-1)*1//3)), ParameterException((a-b)*1//(q-1))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(a, (q^2-1))], [ParameterException((a)*1//(q+1))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(a, (q^2+q+1))], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(n, (q-1)*1//3)], [ParameterException((n)*1//((q-1)*1//3))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(n, (q-1)*1//3)], [ParameterException((n)*1//((q-1)*1//3))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(n, (q-1)*1//3), Parameter(m, q-1)], [ParameterException((3*n-m)*1//(q-1)), ParameterException((m)*1//(q-1)), ParameterException((3*n-2*m)*1//(q-1))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(n, (q^2-1)*1//3)], [ParameterException((n)*1//(q+1))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(n, (q^2+q-2)*1//3)], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[])
]

classparamindex=var_index.([a,b])
charparamindex=var_index.([m,n])
congruence=R.((1,3))

information = "- Information about the generic character table of \$PSL_3(q)\$,
  \$q\$ congruent to \$1\$ modulo \$3\$.
  (See ``SL3.n1`` for the generic character table of \$PSL_3(q)\$,
  \$q\$ not congruent to \$1\$ modulo \$3\$.)

- CHEVIE-name of the table: ``PSL3.1``

- The table was first computed in:
  {\\sc W.~A.~Simpson and J.~S.~Frame}, The character tables for
  \$SL(3,q)\$, \$SU(3,q^2)\$, \$PSL(3,q)\$, \$PSU(3,q^2)\$,
  {\\em Can.\\ J.~Math.} {\\bf 25} (1973), 486--494.

- The table was constructed by Jochen Gruber from the generic character
  table of \$SL_3(q)\$, \$q\$ congruent to \$1\$ modulo \$3\$.

- See also:
  {\\sc R.~Steinberg}, The representations of \$GL(3,q)\$, \$GL(4,q)\$, \$PGL(3,q)\$
  and \$PGL(4,q)\$, {\\em Can.\\ J.~Math.} {\\bf 3} (1951), 225--235.

  {\\sc J.~A.~Green}, The characters of the finite general linear groups,
  {\\em Trans.\\ Amer.\\ Math.\\ Soc.} {\\bf 80} (1955), 402--447.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

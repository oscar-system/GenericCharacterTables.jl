using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
a,b,m,n, _...=gens(S, ["a", "b", "m", "n", "a1", "b1", "m1", "n1", "a2", "b2", "m2", "n2", "a3", "b3", "m3", "n3", "at1", "bt1", "mt1", "nt1", "at2", "bt2", "mt2", "nt2"])

order = q^3*(q+1)^2*(q-1)*(q^2-q+1)
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
	(1)*e2p(S(0))] [
	(q^2-q)*e2p(S(0)),
	(-q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1-q)*e2p(S(0)),
	(1)*e2p(S(0)),
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
	(-1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(q^2-q+1)*e2p((n*a)*S(1//(3))),
	(1-q)*e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	(1-q)*e2p((n*a)*S(1//(q+1)))+e2p((-2*n*a)*S(1//(q+1))),
	e2p((n*a)*S(1//(q+1)))+e2p((-2*n*a)*S(1//(q+1))),
	e2p((n*a)*S(1//(q+1)))+e2p((n*b)*S(1//(q+1)))+e2p((n*(-a-b))*S(1//(q+1))),
	e2p((n*a)*S(1//(q+1))),
	(0)*e2p(S(0))] [
	q*(q^2-q+1)*e2p((n*a)*S(1//(3))),
	q*e2p((n*a)*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q-1)*e2p((n*a)*S(1//(q+1)))+q*e2p((-2*n*a)*S(1//(q+1))),
	-1*e2p((n*a)*S(1//(q+1))),
	-(e2p((n*a)*S(1//(q+1)))+e2p((n*b)*S(1//(q+1)))+e2p((n*(-a-b))*S(1//(q+1)))),
	e2p((n*a)*S(1//(q+1))),
	(0)*e2p(S(0))] [
	(q+1)*(q^2-q+1)*e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	(q+1)*e2p((n*a)*S(1//(q+1))),
	e2p((n*a)*S(1//(q+1))),
	(0)*e2p(S(0)),
	e2p((n*a)*S(1//(q^2-1)))+e2p((-1*n*a*q)*S(1//(q^2-1))),
	(0)*e2p(S(0))] [
	((q-1)*(q^2-q+1)*1//3)*e2p(S(0)),
	((2*q-1)*1//3)*e2p(S(0)),
	(q-(q+1)*1//3)*e2p(S(0)),
	(-(q+1)*1//3)*e2p(S(0)),
	(-(q+1)*1//3)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	-(e2p((a-b)*S(1//(3)))+e2p((b-a)*S(1//(3)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q^2-q+1)*1//3)*e2p(S(0)),
	((2*q-1)*1//3)*e2p(S(0)),
	(-(q+1)*1//3)*e2p(S(0)),
	(q-(q+1)*1//3)*e2p(S(0)),
	(-(q+1)*1//3)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	-(e2p((a-b)*S(1//(3)))+e2p((b-a)*S(1//(3)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q^2-q+1)*1//3)*e2p(S(0)),
	((2*q-1)*1//3)*e2p(S(0)),
	(-(q+1)*1//3)*e2p(S(0)),
	(-(q+1)*1//3)*e2p(S(0)),
	(q-(q+1)*1//3)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	-(e2p((a-b)*S(1//(3)))+e2p((b-a)*S(1//(3)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q-1)*(q^2-q+1)*e2p((n*a+m*a)*S(1//(3))),
	(2*q-1)*e2p((n*a+m*a)*S(1//(3))),
	-e2p((n*a+m*a)*S(1//(3))),
	-e2p((n*a+m*a)*S(1//(3))),
	-e2p((n*a+m*a)*S(1//(3))),
	(q-1)*(e2p((n*a-2*m*a)*S(1//(q+1)))+e2p((m*a-2*n*a)*S(1//(q+1)))+e2p((n*a+m*a)*S(1//(q+1)))),
	-(e2p((n*a-2*m*a)*S(1//(q+1)))+e2p((m*a-2*n*a)*S(1//(q+1)))+e2p((n*a+m*a)*S(1//(q+1)))),
	-(e2p((m*a+n*b)*S(1//(q+1)))+e2p((m*b+n*a)*S(1//(q+1)))+e2p((m*(-a-b)+n*a)*S(1//(q+1)))+e2p((m*a+n*(-a-b))*S(1//(q+1)))+e2p((m*(-a-b)+n*b)*S(1//(q+1)))+e2p((m*b+n*(-a-b))*S(1//(q+1)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q+1)^2*(q-1)*1//3*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	(q-(q+1)*1//3)*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p(a*S(1//(3)))] [
	(q+1)^2*(q-1)*1//3*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	(q-(q+1)*1//3)*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p(a*S(1//(3)))] [
	(q+1)^2*(q-1)*1//3*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	-(q+1)*1//3*e2p(a*S(1//(3))),
	(q-(q+1)*1//3)*e2p(a*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p(a*S(1//(3)))] [
	(q+1)^2*(q-1)*1//3*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	(q-(q+1)*1//3)*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-a)*S(1//(3)))] [
	(q+1)^2*(q-1)*1//3*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	(q-(q+1)*1//3)*e2p((-a)*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-a)*S(1//(3)))] [
	(q+1)^2*(q-1)*1//3*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	(q-(q+1)*1//3)*e2p((-a)*S(1//(3))),
	-(q+1)*1//3*e2p((-a)*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-a)*S(1//(3)))] [
	(q+1)^2*(q-1)*e2p((n*a)*S(1//(3))),
	-(q+1)*e2p((n*a)*S(1//(3))),
	-e2p((n*a)*S(1//(3))),
	-e2p((n*a)*S(1//(3))),
	-e2p((n*a)*S(1//(3))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-(e2p((n*a)*S(1//(q^2-q+1)))+e2p((-1*n*a*q)*S(1//(q^2-q+1)))+e2p((n*a*q^2)*S(1//(q^2-q+1))))]]
classinfo = Vector{Any}[
	[[1,0],["^2A_2",[1,1,1]]],
	[[1,1],["^2A_2",[2,1]]],
	[[1,2],["^2A_2",[3]]],
	[[1,3],["^2A_2",[3]]],
	[[1,4],["^2A_2",[3]]],
	[[2,0],["A_1",[1,1]]],
	[[2,1],["A_1",[2]]],
	[[3,0],["A_0",[1]]],
	[[4,0],["A_0",[1]]],
	[[5,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q+1)*(q-1)*(q^2-q+1),
	q*(q+1)^2*(q-1)*(q^2-q+1)*1//3,
	q*(q+1)^2*(q-1)*(q^2-q+1)*1//3,
	q*(q+1)^2*(q-1)*(q^2-q+1)*1//3,
	q^2*(q^2-q+1),
	q^2*(q+1)*(q-1)*(q^2-q+1),
	q^3*(q-1)*(q^2-q+1),
	q^3*(q+1)*(q^2-q+1),
	q^3*(q+1)^2*(q-1)])
charinfo = Vector{Any}[
	[[1,0],["^2A_2",[3]]],
	[[1,1],["^2A_2",[2,1]]],
	[[1,2],["^2A_2",[1,1,1]]],
	[[2,0],["A_1",[1,1]]],
	[[2,1],["A_1",[1,1]]],
	[[4,0],["A_0",[1]]],
	[[3,0,1],["A_0:3",[1]]],
	[[3,0,2],["A_0:3","\\omega"]],
	[[3,0,3],["A_0:3","\\omega^2"]],
	[[5,0],["A_0",[1]]],
	[[6,0,1],["A_0:3",[1]]],
	[[6,0,2],["A_0:3","\\omega"]],
	[[6,0,3],["A_0:3","\\omega^2"]],
	[[7,0,1],["A_0:3",[1]]],
	[[7,0,2],["A_0:3","\\omega"]],
	[[7,0,3],["A_0:3","\\omega^2"]],
	[[8,0],["A_0",[1]]]]
chardegree = R.([
	1,
	q^2-q,
	q^3,
	q^2-q+1,
	q*(q^2-q+1),
	(q+1)*(q^2-q+1),
	(q-1)*(q^2-q+1)*1//3,
	(q-1)*(q^2-q+1)*1//3,
	(q-1)*(q^2-q+1)*1//3,
	(q-1)*(q^2-q+1),
	(q+1)^2*(q-1)*1//3,
	(q+1)^2*(q-1)*1//3,
	(q+1)^2*(q-1)*1//3,
	(q+1)^2*(q-1)*1//3,
	(q+1)^2*(q-1)*1//3,
	(q+1)^2*(q-1)*1//3,
	(q+1)^2*(q-1)])

classsums=[
function (tt::Cyclotomic)
	nesum(tt, a, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	ss6=nesum(tt, a, 1, q, congruence)
	tt1=eesubs(tt, [a], [(q+1)*1//3])
	tt2=eesubs(tt, [a], [2*(q+1)*1//3])
	ss6-tt1-tt2
end,
function (tt::Cyclotomic)
	ss6=nesum(tt, a, 1, q, congruence)
	tt1=eesubs(tt, [a], [(q+1)*1//3])
	tt2=eesubs(tt, [a], [2*(q+1)*1//3])
	ss6-tt1-tt2
end,
function (tt::Cyclotomic)
	ss5=nesum(tt, a, 0, q, congruence)
	ss8=nesum(ss5, b, 0, q, congruence)
	tt1=eesubs(tt, [b], [a])
	ss9=nesum(tt1, a, 0, q, congruence)
	tt2=eesubs(tt1, [a], [(q+1)*1//3*a])
	ss10=nesum(tt2, a, 0, 2, congruence)
	1//6*ss8-1//2*ss9+1//3*ss10
end,
function (tt::Cyclotomic)
	ss7=nesum(tt, a, 0, q^2-2, congruence)
	tt1=eesubs(tt, [a], [(q-1)*a])
	ss8=nesum(tt1, a, 0, q, congruence)
	1//2*ss7-1//2*ss8
end,
function (tt::Cyclotomic)
	ss10=nesum(tt, a, 0, q^2-q, congruence)
	tt1=eesubs(tt, [a], [(q^2-q+1)*1//3*a])
	ss11=nesum(tt1, a, 0, 2, congruence)
	1//3*ss10-1//3*ss11
end
]

charsums=[
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	nesum(tt, n, 1, q, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, n, 1, q, congruence)
end,
function (tt::Cyclotomic)
	ss7=nesum(tt, n, 0, q^2-2, congruence)
	tt1=eesubs(tt, [n], [(q-1)*n])
	ss8=nesum(tt1, n, 0, q, congruence)
	1//2*ss7-1//2*ss8
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	ss5a=nesum(tt, n, 1, q, congruence)
	ss5=nesum(ss5a, m, 1, q, congruence)
	tt1=eesubs(tt, [m], [n])
	ss6=nesum(tt1, n, 1, q, congruence)
	ss7=eesubs(tt, [m,n], [(q+1)*1//3,2*(q+1)*1//3])
	1//6*ss5-1//6*ss6-1//3*ss7
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	ss8=nesum(tt, n, 0, q^2-q, congruence)
	tt1=eesubs(tt, [n], [(q^2-q+1)*1//3*n])
	ss9=nesum(tt1, n, 0, 2, congruence)
	1//3*ss8-1//3*ss9
end
]

classparams=[
Parameters([Parameter(a, R(3))]),
Parameters([Parameter(a, R(3))]),
Parameters([Parameter(a, R(3))]),
Parameters([Parameter(a, R(3))]),
Parameters([Parameter(a, R(3))]),
Parameters([Parameter(a, q+1)], [ParameterException((a)*1//((q+1)*1//3))]),
Parameters([Parameter(a, q+1)], [ParameterException((a)*1//((q+1)*1//3))]),
Parameters([Parameter(a, q+1), Parameter(b, q+1)], [ParameterException((a)*1//(q+1)), ParameterException((b)*1//(q+1)), ParameterException((a-b)*1//(q+1))]),
Parameters([Parameter(a, q^2-1)], [ParameterException((a)*1//(q-1))]),
Parameters([Parameter(a, q^2-q+1)], [ParameterException((a)*1//((q^2-q+1)*1//3))])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(n, q+1)], [ParameterException((n)*1//(q+1))]),
Parameters([Parameter(n, q+1)], [ParameterException((n)*1//(q+1))]),
Parameters([Parameter(n, q^2-1)], [ParameterException((n)*1//(q-1))]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(n, q+1), Parameter(m, q+1)], [ParameterException((n)*1//(q+1)), ParameterException((m)*1//(q+1)), ParameterException((n-m)*1//(q+1))]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(n, q^2-q+1)], [ParameterException((n)*1//((q^2-q+1)*1//3))])
]

classparamindex=var_index.([a,b])
charparamindex=var_index.([m,n])
congruence=R.((-1,3))

information = "- Information about the generic character table of \$SU_3(q)\$,
  \$q\$ congruent to \$2\$ modulo \$3\$
  (See ``SU3.n2`` for the generic character table of \$SL_3(q)\$,
  \$q\$ not congruent to \$2\$ modulo \$3\$.)

- CHEVIE-name of the table: ``SU3.2``

- The table was first computed in:
  {\\sc W.~A.~Simpson and J.~S.~Frame}, The character tables for
  \$SL(3,q)\$, \$SU(3,q^2)\$, \$PSL(3,q)\$, \$PSU(3,q^2)\$,
  {\\em Can.\\ J.~Math.} {\\bf 25} (1973), 486--494.

- Corrections in:
  {\\sc M.~Geck}, Irreducible Brauer characters of the \$3\$-dimensional
  special unitary groups in non-defining characteristic,
  {\\em Comm.\\ Algebra}, {\\bf 18} (1990), 563--584.

- See also:
  {\\sc V.~Ennola}, On the characters of the finite unitary groups,
  {\\em Ann.\\ Acad.\\ Sci.\\ Fenn.\\ Ser.~A~I} {\\bf 323} (1963), 1--36.

  {\\sc V.~Ennola}, On the conjugacy classes of the finite unitary groups,
  {\\em Ann.\\ Acad.\\ Sci.\\ Fenn.\\ Ser.~A~I} {\\bf 313} (1962), 1--14.

  {\\sc R.~Steinberg}, The representations of \$GL(3,q)\$, \$GL(4,q)\$, \$PGL(3,q)\$
  and \$PGL(4,q)\$, {\\em Can.\\ J.~Math.} {\\bf 3} (1951), 225--235.
"

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

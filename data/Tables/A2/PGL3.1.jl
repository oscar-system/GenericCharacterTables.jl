using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
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
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	(1)*e2p(S(0)),
	e2p((n*a+n*b)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3)))] [
	(q*(q+1))*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q+1)*e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	(2)*e2p(S(0)),
	2*e2p((n*a+n*b)*S(1//(3))),
	(0)*e2p(S(0)),
	-e2p((n*a)*S(1//(3))),
	-e2p((n*a)*S(1//(3)))] [
	(q^3)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((n*a)*S(1//(3)))*q,
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((n*a+n*b)*S(1//(3))),
	-e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(3)))] [
	(q^2+q+1)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((n*a)*S(1//(q-1)))*q+e2p((n*a)*S(1//(q-1)))+e2p((-2*n*a)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1)))+e2p((-2*n*a)*S(1//(q-1))),
	(3)*e2p(S(0)),
	e2p((-2*n*b+n*a)*S(1//(q-1)))+e2p((-2*n*a+n*b)*S(1//(q-1)))+e2p((n*a+n*b)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q*(q^2+q+1))*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((n*a)*S(1//(q-1)))*q+e2p((n*a)*S(1//(q-1)))+q*e2p((-2*n*a)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1))),
	(3)*e2p(S(0)),
	e2p((-2*n*b+n*a)*S(1//(q-1)))+e2p((-2*n*a+n*b)*S(1//(q-1)))+e2p((n*a+n*b)*S(1//(q-1))),
	-e2p((n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q+1)*(q^2+q+1))*e2p(S(0)),
	(2*q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(e2p((n*a)*S(1//(q-1)))+e2p((-a*(m+n))*S(1//(q-1)))+e2p((m*a)*S(1//(q-1))))*(q+1),
	e2p((n*a)*S(1//(q-1)))+e2p((-m*a-n*a)*S(1//(q-1)))+e2p((m*a)*S(1//(q-1))),
	3*e2p((2*m+n)*S(1//(3)))+3*e2p((m+2*n)*S(1//(3))),
	e2p((n*a-m*b-n*b)*S(1//(q-1)))+e2p((n*a+m*b)*S(1//(q-1)))+e2p((m*a+n*b)*S(1//(q-1)))+e2p((-m*a-n*a+n*b)*S(1//(q-1)))+e2p((m*a-m*b-n*b)*S(1//(q-1)))+e2p((-m*a-n*a+m*b)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q^2+q+1))*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(q-1)*e2p((-n*a)*S(1//(q-1))),
	-e2p((-n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((n*a)*S(1//(q^2-1)))-e2p((n*a*q)*S(1//(q^2-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)^2*(q+1))*e2p(S(0)),
	(-q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	3*e2p((n*a)*S(1//(3))),
	e2p((n*a)*S(1//(q^2+q+1)))+e2p((n*a*q)*S(1//(q^2+q+1)))+e2p((n*a*q^2)*S(1//(q^2+q+1)))]]
classinfo = Vector{Any}[
	[[1,0],["A_2",[1,1,1]]],
	[[1,1],["A_2",[2,1]]],
	[[1,2],["A_2",[3]]],
	[[2,0],["A_1",[1,1]]],
	[[2,1],["A_1",[2]]],
	[[6,0],["A_0:3",[1]]],
	[[3,0],["A_0",[1]]],
	[[4,0],["A_0",[1]]],
	[[7,0],["A_0:3",[1]]],
	[[5,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q^2-1)*(q^2+q+1),
	q*(q-1)^2*(q+1)*(q^2+q+1),
	q^2*(q^2+q+1),
	q^2*(q^2-1)*(q^2+q+1),
	q^3*(q+1)*(q^2+q+1)*1//3,
	q^3*(q+1)*(q^2+q+1),
	q^3*(q-1)*(q^2+q+1),
	q^3*(q-1)^2*(q+1)*1//3,
	q^3*(q-1)^2*(q+1)])
charinfo = Vector{Any}[
	[[1,0],["A_2",[3]]],
	[[1,1],["A_2",[2,1]]],
	[[1,2],["A_2",[1,1,1]]],
	[[2,0],["A_1",[2]]],
	[[2,1],["A_1",[1,1]]],
	[[3,0],["A_0",[1]]],
	[[4,0],["A_0",[1]]],
	[[5,0],["A_0",[1]]]]
chardegree = R.([1, q^2+q, q^3, q^2+q+1, q*(q^2+q+1), (q+1)*(q^2+q+1), (q-1)*(q^2+q+1), (q-1)^2*(q+1)])

classsums=[
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
	nesum(tt, a, 1, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 1, q-2, congruence)
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	ss5a=nesum(tt, a, 1, q-2, congruence)
	ss5=nesum(ss5a, b, 1, q-2, congruence)
	tt1=eesubs(tt, [b], [a])
	ss6=nesum(tt1, a, 1, q-2, congruence)
	ss7=eesubs(tt, [a,b], S.([(q-1)*1//3,2*(q-1)*1//3]))
	1//6*ss5-1//6*ss6-1//3*ss7
end,
function (tt::Cyclotomic)
	ss7=nesum(tt, a, 0, q^2-2, congruence)
	tt1=eesubs(tt, [a], [(q+1)*a])
	ss8=nesum(tt1, a, 0, q-2, congruence)
	1//2*ss7-1//2*ss8
end,
function (tt::Cyclotomic)
	nesum(tt, a, 1, 2, congruence)
end,
function (tt::Cyclotomic)
	ss10=nesum(tt, a, 0, q^2+q, congruence)
	tt1=eesubs(tt, [a], [(q^2+q+1)*1//3*a])
	ss11=nesum(tt1, a, 0, 2, congruence)
	1//3*ss10-1//3*ss11
end
]

charsums=[
function (tt::Cyclotomic)
	nesum(tt, n, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, n, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, n, 0, 2, congruence)
end,
function (tt::Cyclotomic)
	ss6=nesum(tt, n, 1, q-2, congruence)
	tt1=eesubs(tt, [n], [(q-1)*1//3])
	tt2=eesubs(tt, [n], [2*(q-1)*1//3])
	ss6-tt1-tt2
end,
function (tt::Cyclotomic)
	ss6=nesum(tt, n, 1, q-2, congruence)
	tt1=eesubs(tt, [n], [(q-1)*1//3])
	tt2=eesubs(tt, [n], [2*(q-1)*1//3])
	ss6-tt1-tt2
end,
function (tt::Cyclotomic)
	ss5=nesum(tt, n, 0, q-2, congruence)
	ss8=nesum(ss5, m, 0, q-2, congruence)
	tt1=eesubs(tt, [m], [-2*n])
	ss9=nesum(tt1, n, 0, q-2, congruence)
	tt1=eesubs(tt, [n], [-2*m])
	ss10=nesum(tt1, m, 0, q-2, congruence)
	tt1=eesubs(tt, [m], [n])
	ss11=nesum(tt1, n, 0, q-2, congruence)
	tt1=eesubs(tt1, [n], [(q-1)*1//3*n])
	ss12=nesum(tt1, n, 0, 2, congruence)
	1//6*ss8-1//6*ss9-1//6*ss10-1//6*ss11+1//3*ss12
end,
function (tt::Cyclotomic)
	ss7=nesum(tt, n, 0, q^2-2, congruence)
	tt1=eesubs(tt, [n], [(q+1)*n])
	ss8=nesum(tt1, n, 0, q-2, congruence)
	1//2*ss7-1//2*ss8
end,
function (tt::Cyclotomic)
	s10=nesum(tt, n, 1, q^2+q, congruence)
	tt1=eesubs(tt, [n], [(q^2+q+1)*1//3])
	tt2=eesubs(tt, [n], [2*(q^2+q+1)*1//3])
	1//3*s10-1//3*tt1-1//3*tt2
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1)], [ParameterException((a)*1//(q-1))]),
Parameters([Parameter(a, q-1)], [ParameterException((a)*1//(q-1))]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1), Parameter(b, q-1)], [ParameterException((a)*1//(q-1)), ParameterException((b)*1//(q-1)), ParameterException((a-b)*1//(q-1))]),
Parameters([Parameter(a, q^2-1)], [ParameterException((a)*1//(q+1))]),
Parameters([Parameter(a, R(2))]),
Parameters([Parameter(a, q^2+q+1)], [ParameterException((a)*1//((q^2+q+1)*1//3))])
]

charparams=[
Parameters([Parameter(n, R(3))]),
Parameters([Parameter(n, R(3))]),
Parameters([Parameter(n, R(3))]),
Parameters([Parameter(n, q-1)], [ParameterException((n)*1//((q-1)*1//3))]),
Parameters([Parameter(n, q-1)], [ParameterException((n)*1//((q-1)*1//3))]),
Parameters([Parameter(n, q-1), Parameter(m, q-1)], [ParameterException((n-m)*1//(q-1)), ParameterException((n+2*m)*1//(q-1)), ParameterException((m+2*n)*1//(q-1))]),
Parameters([Parameter(n, q^2-1)], [ParameterException((n)*1//(q+1))]),
Parameters([Parameter(n, q^2+q+1)], [ParameterException((n)*1//((q^2+q+1)*1//3))])
]

classparamindex=var_index.([a,b])
charparamindex=var_index.([m,n])
congruence=R.((1,3))

information = "- Information about the generic character table of \$PGL_3(q)\$,
  \$q\$ congruent to \$1\$ modulo \$3\$.
  (See ``SL3.n1`` for the generic character table of \$PGL_3(q)\$,
  \$q\$ not congruent to \$1\$ modulo \$3\$.)

- CHEVIE-name of the table: ``PGL3.1``

- The table was first computed in:
  {\\sc R.~Steinberg}, The representations of \$GL(3,q)\$, \$GL(4,q)\$, \$PGL(3,q)\$
  and \$PGL(4,q)\$, {\\em Can.\\ J.~Math.} {\\bf 3} (1951), 225--235.

- See also:
  {\\sc J.~A.~Green}, The characters of the finite general linear groups,
  {\\em Trans.\\ Amer.\\ Math.\\ Soc.} {\\bf 80} (1955), 402--447.
"

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information,splitext(basename(@__FILE__))[1])

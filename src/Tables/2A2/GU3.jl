using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ExtendableMatrix, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
k,l,m,u,v,w, _...=gens(S, ["k", "l", "m", "u", "v", "w", "k1", "l1", "m1", "u1", "v1", "w1", "k2", "l2", "m2", "u2", "v2", "w2", "k3", "l3", "m3", "u3", "v3", "w3", "kt1", "lt1", "mt1", "ut1", "vt1", "wt1", "kt2", "lt2", "mt2", "ut2", "vt2", "wt2"])

order = q^3*(q+1)^3*(q-1)*(q^2-q+1)
table = Cyclotomic{QQPolyRingElem}[[
	e2p((3*u*k)*S(1//(q+1))),
	e2p((3*u*k)*S(1//(q+1))),
	e2p((3*u*k)*S(1//(q+1))),
	e2p((2*k*u+l*u)*S(1//(q+1))),
	e2p((2*k*u+l*u)*S(1//(q+1))),
	e2p((u*k+u*l+u*m)*S(1//(q+1))),
	e2p((u*k-u*l)*S(1//(q+1))),
	e2p((u*k)*S(1//(q+1)))] [
	q*(q-1)*e2p((3*u*k)*S(1//(q+1))),
	-q*e2p((3*u*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	-(q-1)*e2p((2*u*k+u*l)*S(1//(q+1))),
	e2p((2*u*k+u*l)*S(1//(q+1))),
	2*e2p((u*k+u*l+u*m)*S(1//(q+1))),
	(0)*e2p(S(0)),
	-e2p((u*k)*S(1//(q+1)))] [
	q^3*e2p((3*u*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	q*e2p((2*u*k+u*l)*S(1//(q+1))),
	(0)*e2p(S(0)),
	-e2p((u*k+u*l+u*m)*S(1//(q+1))),
	e2p((u*k-u*l)*S(1//(q+1))),
	-e2p((u*k)*S(1//(q+1)))] [
	(q^2-q+1)*e2p((2*u*k+v*k)*S(1//(q+1))),
	-(q-1)*e2p((2*u*k+v*k)*S(1//(q+1))),
	e2p((2*u*k+v*k)*S(1//(q+1))),
	-(q-1)*e2p((u*k+v*k+u*l)*S(1//(q+1)))+e2p((2*u*k+v*l)*S(1//(q+1))),
	e2p((u*k+v*k+u*l)*S(1//(q+1)))+e2p((2*u*k+v*l)*S(1//(q+1))),
	e2p((v*k+u*l+u*m)*S(1//(q+1)))+e2p((v*l+u*k+u*m)*S(1//(q+1)))+e2p((v*m+u*k+u*l)*S(1//(q+1))),
	e2p((v*k-u*l)*S(1//(q+1))),
	(0)*e2p(S(0))] [
	q*(q^2-q+1)*e2p((2*u*k+v*k)*S(1//(q+1))),
	q*e2p((2*u*k+v*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(q-1)*e2p((u*k+v*k+u*l)*S(1//(q+1)))+q*e2p((2*u*k+v*l)*S(1//(q+1))),
	-e2p((u*k+v*k+u*l)*S(1//(q+1))),
	-e2p((v*k+u*l+u*m)*S(1//(q+1)))-e2p((v*l+u*k+u*m)*S(1//(q+1)))-e2p((v*m+u*k+u*l)*S(1//(q+1))),
	e2p((v*k-u*l)*S(1//(q+1))),
	(0)*e2p(S(0))] [
	(q-1)*(q^2-q+1)*e2p((u*k+v*k+w*k)*S(1//(q+1))),
	(2*q-1)*e2p((u*k+v*k+w*k)*S(1//(q+1))),
	-e2p((u*k+v*k+w*k)*S(1//(q+1))),
	(q-1)*(e2p((u*k+v*k+w*l)*S(1//(q+1)))+e2p((w*k+u*k+v*l)*S(1//(q+1)))+e2p((w*k+v*k+u*l)*S(1//(q+1)))),
	-e2p((u*k+v*k+w*l)*S(1//(q+1)))-e2p((w*k+u*k+v*l)*S(1//(q+1)))-e2p((w*k+v*k+u*l)*S(1//(q+1))),
	-e2p((u*k+v*l+w*m)*S(1//(q+1)))-e2p((u*k+v*m+w*l)*S(1//(q+1)))-e2p((v*k+u*l+w*m)*S(1//(q+1)))-e2p((v*k+w*l+u*m)*S(1//(q+1)))-e2p((w*k+u*l+v*m)*S(1//(q+1)))-e2p((w*k+v*l+u*m)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q+1)*(q^2-q+1)*e2p((u*k+v*k)*S(1//(q+1))),
	e2p((u*k+v*k)*S(1//(q+1))),
	e2p((u*k+v*k)*S(1//(q+1))),
	(q+1)*e2p((u*k+v*l)*S(1//(q+1))),
	e2p((u*k+v*l)*S(1//(q+1))),
	(0)*e2p(S(0)),
	e2p((v*k)*S(1//(q+1)))*(e2p((u*l)*S(1//(q^2-1)))+e2p((-q*u*l)*S(1//(q^2-1)))),
	(0)*e2p(S(0))] [
	(q+1)^2*(q-1)*e2p((u*k)*S(1//(q+1))),
	-(q+1)*e2p((u*k)*S(1//(q+1))),
	-e2p((u*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((u*k)*S(1//(q^3+1)))-e2p((-u*k*q)*S(1//(q^3+1)))-e2p((q^2*u*k)*S(1//(q^3+1)))]]
classinfo = Vector{Any}[
	["",[1,0],["^2A_2",[1,1,1]]],
	["",[1,1],["^2A_2",[2,1]]],
	["",[1,2],["^2A_2",[3]]],
	["",[2,0],["A_1",[1,1]]],
	["",[2,1],["A_1",[2]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2-q+1),
	q*(q+1)^2*(q-1)*(q^2-q+1),
	q^2*(q^2-q+1),
	q^2*(q-1)*(q+1)*(q^2-q+1),
	q^3*(q-1)*(q^2-q+1),
	q^3*(q+1)*(q^2-q+1),
	q^3*(q+1)^2*(q-1)])
charinfo = Vector{Any}[
	["",[1,0],["^2A_2",[3]]],
	["",[1,1],["^2A_2",[2,1]]],
	["",[1,2],["^2A_2",[1,1,1]]],
	["",[2,0],["A_1",[2]]],
	["",[2,1],["A_1",[1,1]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
chardegree = R.([1, q*(q-1), q^3, (q^2-q+1), q*(q^2-q+1), (q-1)*(q^2-q+1), (q+1)*(q^2-q+1), (q+1)^2*(q-1)])

classsums=[
function (tt::Cyclotomic)
	nesum(tt, k, 0, q, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, k, 0, q, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, k, 0, q, congruence)
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [l], [k])
	ss4=nesum(tt, l, 0, q, congruence)
	ss5=ss4-tt1
	ss5=nesum(ss5, k, 0, q, congruence)
	ss5
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [l], [k])
	ss4=nesum(tt, l, 0, q, congruence)
	ss5=ss4-tt1
	ss5=nesum(ss5, k, 0, q, congruence)
	ss5
end,
function (tt::Cyclotomic)
	ss6a=nesum(tt, k, 0, q, congruence)
	ss6b=nesum(ss6a, l, 0, q, congruence)
	ss6=nesum(ss6b, m, 0, q, congruence)
	tt1=eesubs(tt, [l], [k])
	ss7a=nesum(tt1, k, 0, q, congruence)
	ss7=nesum(ss7a, m, 0, q, congruence)
	tt2=eesubs(tt, [m], [l])
	ss8a=nesum(tt2, k, 0, q, congruence)
	ss8=nesum(ss8a, l, 0, q, congruence)
	tt3=eesubs(tt, [m], [k])
	ss9a=nesum(tt3, k, 0, q, congruence)
	ss9=nesum(ss9a, l, 0, q, congruence)
	tt4a=eesubs(tt, [l], [k])
	tt4=eesubs(tt4a, [m], [k])
	ss10=nesum(tt4, k, 0, q, congruence)
	1//6*ss6-1//6*ss7-1//6*ss8-1//6*ss9+1//3*ss10
end,
function (tt::Cyclotomic)
	ss7=nesum(tt, l, 0, q^2-2, congruence)
	tt1=eesubs(tt, [l], [(q-1)*l])
	ss8=nesum(tt1, l, 0, q, congruence)
	tt1=ss7-ss8
	ss9=nesum(tt1, k, 0, q, congruence)
	1//2*ss9
end,
function (tt::Cyclotomic)
	ss8=nesum(tt, k, 0, q^3, congruence)
	tt1=eesubs(tt, [k], [(q^2-q+1)*k])
	ss9=nesum(tt1, k, 0, q, congruence)
	1//3*ss8-1//3*ss9
end
]

charsums=[
function (tt::Cyclotomic)
	nesum(tt, u, 0, q, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, u, 0, q, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, u, 0, q, congruence)
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [v], [u])
	ss4=nesum(tt, v, 0, q, congruence)
	ss5=ss4-tt1
	ss5=nesum(ss5, u, 0, q, congruence)
	ss5
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [v], [u])
	ss4=nesum(tt, v, 0, q, congruence)
	ss5=ss4-tt1
	ss5=nesum(ss5, u, 0, q, congruence)
	ss5
end,
function (tt::Cyclotomic)
	ss6a=nesum(tt, u, 0, q, congruence)
	ss6b=nesum(ss6a, v, 0, q, congruence)
	ss6=nesum(ss6b, w, 0, q, congruence)
	tt1=eesubs(tt, [v], [u])
	ss7a=nesum(tt1, u, 0, q, congruence)
	ss7=nesum(ss7a, w, 0, q, congruence)
	tt2=eesubs(tt, [w], [v])
	ss8a=nesum(tt2, u, 0, q, congruence)
	ss8=nesum(ss8a, v, 0, q, congruence)
	tt3=eesubs(tt, [w], [u])
	ss9a=nesum(tt3, u, 0, q, congruence)
	ss9=nesum(ss9a, v, 0, q, congruence)
	tt4a=eesubs(tt, [v], [u])
	tt4=eesubs(tt4a, [w], [u])
	ss10=nesum(tt4, u, 0, q, congruence)
	1//6*ss6-1//6*ss7-1//6*ss8-1//6*ss9+1//3*ss10
end,
function (tt::Cyclotomic)
	ss7=nesum(tt, u, 0, q^2-2, congruence)
	tt1=eesubs(tt, [u], [(q-1)*u])
	ss8=nesum(tt1, u, 0, q, congruence)
	tt1=ss7-ss8
	ss9=nesum(tt1, v, 0, q, congruence)
	1//2*ss9
end,
function (tt::Cyclotomic)
	ss8=nesum(tt, u, 0, q^3, congruence)
	tt1=eesubs(tt, [u], [(q^2-q+1)*u])
	ss9=nesum(tt1, u, 0, q, congruence)
	1//3*ss8-1//3*ss9
end
]

classparams=[
Parameters([Parameter(k, q+1)]),
Parameters([Parameter(k, q+1)]),
Parameters([Parameter(k, q+1)]),
Parameters([Parameter(k, q+1), Parameter(l, q+1)], [ParameterException((k-l)*1//(q+1))]),
Parameters([Parameter(k, q+1), Parameter(l, q+1)], [ParameterException((k-l)*1//(q+1))]),
Parameters([Parameter(k, q+1), Parameter(l, q+1), Parameter(m, q+1)], [ParameterException((k-l)*1//(q+1)), ParameterException((k-m)*1//(q+1)), ParameterException((l-m)*1//(q+1))]),
Parameters([Parameter(k, q+1), Parameter(l, q^2-1)], [ParameterException((l)*1//(q-1))]),
Parameters([Parameter(k, q^3+1)], [ParameterException((k)*1//(q^2-q+1))])
]

charparams=[
Parameters([Parameter(u, q+1)]),
Parameters([Parameter(u, q+1)]),
Parameters([Parameter(u, q+1)]),
Parameters([Parameter(u, q+1), Parameter(v, q+1)], [ParameterException((u-v)*1//(q+1))]),
Parameters([Parameter(u, q+1), Parameter(v, q+1)], [ParameterException((u-v)*1//(q+1))]),
Parameters([Parameter(u, q+1), Parameter(v, q+1), Parameter(w, q+1)], [ParameterException((u-v)*1//(q+1)), ParameterException((u-w)*1//(q+1)), ParameterException((v-w)*1//(q+1))]),
Parameters([Parameter(v, q+1), Parameter(u, q^2-1)], [ParameterException((u)*1//(q-1))]),
Parameters([Parameter(u, q^3+1)], [ParameterException((u)*1//(q^2-q+1))])
]

classparamindex=var_index.([k,l,m])
charparamindex=var_index.([u,v,w])
congruence=nothing

information = "- Information about the generic character table of \$GU_3(q)\$.

- CHEVIE-name of the table: ``GU3``

- The table was first computed in:
  {\\sc V.~Ennola}, On the characters of the finite unitary groups,
  {\\em Ann.\\ Acad.\\ Sci.\\ Fenn.\\ Ser.~A~I} {\\bf 323} (1963), 1--36.


- See also:
  {\\sc V.~Ennola}, On the conjugacy classes of the finite unitary groups,
  {\\em Ann.\\ Acad.\\ Sci.\\ Fenn.\\ Ser.~A~I} {\\bf 313} (1962), 1--14.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

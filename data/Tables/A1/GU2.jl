using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
k,l,u,v, _...=gens(S, ["k", "l", "u", "v", "k1", "l1", "u1", "v1", "k2", "l2", "u2", "v2", "k3", "l3", "u3", "v3", "kt1", "lt1", "ut1", "vt1", "kt2", "lt2", "ut2", "vt2"])

order = q*(q+1)^2*(q-1)
table = Cyclotomic{QQPolyRingElem}[[
	e2p((2*u*k)*S(1//(q+1))),
	e2p((2*u*k)*S(1//(q+1))),
	e2p((u*k+u*l)*S(1//(q+1))),
	e2p((-u*k)*S(1//(q+1)))] [
	q*e2p((2*u*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	-e2p((u*k+u*l)*S(1//(q+1))),
	e2p((-u*k)*S(1//(q+1)))] [
	(q-1)*e2p((u*k+v*k)*S(1//(q+1))),
	-e2p((u*k+v*k)*S(1//(q+1))),
	-e2p((u*k+v*l)*S(1//(q+1)))-e2p((u*l+v*k)*S(1//(q+1))),
	(0)*e2p(S(0))] [
	(q+1)*e2p((u*k)*S(1//(q+1))),
	e2p((u*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	e2p((u*k)*S(1//(q^2-1)))+e2p((-u*k*q)*S(1//(q^2-1)))]]
classinfo = Vector{Any}[["",[1,0],["A_1",[1,1]]], ["",[1,1],["A_1",[2]]], ["",[2,0],["A_0",[1]]], ["",[3,0],["A_0",[1]]]]
classlength = R.([1, (q-1)*(q+1), q*(q-1), q*(q+1)])
charinfo = Vector{Any}[["",[1,0],["A_1",[2]]], ["",[1,1],["A_1",[1,1]]], ["",[2,0],["A_0",[1]]], ["",[3,0],["A_0",[1]]]]
chardegree = R.([1, q, q-1, q+1])

classsums=[
function (tt::Cyclotomic)
	nesum(tt, k, 0, q, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, k, 0, q, congruence)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [l], [k])
	s2=nesum(tt, l, 0, q, congruence)
	s1=s2-s1
	s2=nesum(s1, k, 0, q, congruence)
	1//2*s2
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q-1)*k])
	s1=nesum(s1, k, 0, q, congruence)
	s2=nesum(tt, k, 0, q^2-2, congruence)
	1//2*s2-1//2*s1
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
	s1=eesubs(tt, [v], [u])
	s2=nesum(tt, v, 0, q, congruence)
	s1=s2-s1
	s2=nesum(s1, u, 0, q, congruence)
	1//2*s2
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [u], [(q-1)*u])
	s1=nesum(s1, u, 0, q, congruence)
	s2=nesum(tt, u, 0, q^2-2, congruence)
	1//2*s2-1//2*s1
end
]

classparams=[
Parameters([Parameter(k, q+1)]),
Parameters([Parameter(k, q+1)]),
Parameters([Parameter(k, q+1), Parameter(l, q+1)], [ParameterException((k)*1//(q+1)), ParameterException((l)*1//(q+1)), ParameterException((k-l)*1//(q+1))]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//(q-1))])
]

charparams=[
Parameters([Parameter(u, q+1)]),
Parameters([Parameter(u, q+1)]),
Parameters([Parameter(u, q+1), Parameter(v, q+1)], [ParameterException((u)*1//(q+1)), ParameterException((v)*1//(q+1)), ParameterException((u-v)*1//(q+1))]),
Parameters([Parameter(u, q^2-1)], [ParameterException((u)*1//(q-1))])
]

classparamindex=var_index.([k,l])
charparamindex=var_index.([u,v])
congruence=nothing

information = "- Information about the generic character table of \$GU_2(q)\$.

- CHEVIE-name of the table: ``GU2``

- The table was first computed in:
  {\\sc V.~Ennola}, On the characters of the finite unitary groups,
  {\\em Ann.\\ Acad.\\ Sci.\\ Fenn.\\ Ser.~A~I} {\\bf 323} (1963), 1--36.


- See also:
  {\\sc V.~Ennola}, On the conjugacy classes of the finite unitary groups,
  {\\em Ann.\\ Acad.\\ Sci.\\ Fenn.\\ Ser.~A~I} {\\bf 313} (1962), 1--14.
"

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

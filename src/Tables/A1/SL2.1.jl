using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ExtendableMatrix, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = universal_polynomial_ring(Q; cached=false)
i,k, _...=gens(S, ["i", "k", "i1", "k1", "i2", "k2", "i3", "k3", "it1", "kt1", "it2", "kt2"])

order = q^2*(q^2-1)*(q^2+1)
table = Cyclotomic{QQPolyRingElem}[[
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(q^2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	1//2*(q^2+1)*e2p((1//2*(q^2-1)*i)*S(1//(2))),
	1//2*e2p((1//2*(q^2-1)*i)*S(1//(2)))+1//2*q*e2p((1//2*(q^2-1))*S(1//(4))),
	1//2*e2p((1//2*(q^2-1)*i)*S(1//(2)))-1//2*q*e2p((1//2*(q^2-1))*S(1//(4))),
	e2p(i*S(1//(2))),
	(0)*e2p(S(0))] [
	1//2*(q^2+1)*e2p((1//2*(q^2-1)*i)*S(1//(2))),
	1//2*e2p((1//2*(q^2-1)*i)*S(1//(2)))-1//2*q*e2p((1//2*(q^2-1))*S(1//(4))),
	1//2*e2p((1//2*(q^2-1)*i)*S(1//(2)))+1//2*q*e2p((1//2*(q^2-1))*S(1//(4))),
	e2p(i*S(1//(2))),
	(0)*e2p(S(0))] [
	1//2*(q^2-1)*e2p((1//2*i*q^2+1//2*i)*S(1//(2))),
	-1//2*e2p((1//2*(q^2+1)*i)*S(1//(2)))+1//2*q*e2p((2*i+1//2*(q^2-1))*S(1//(4))),
	-1//2*e2p((1//2*(q^2+1)*i)*S(1//(2)))-1//2*q*e2p((2*i+1//2*(q^2-1))*S(1//(4))),
	(0)*e2p(S(0)),
	-e2p(i*S(1//(2)))] [
	1//2*(q^2-1)*e2p((1//2*i*q^2+1//2*i)*S(1//(2))),
	-1//2*e2p((1//2*(q^2+1)*i)*S(1//(2)))-1//2*q*e2p((2*i+1//2*(q^2-1))*S(1//(4))),
	-1//2*e2p((1//2*(q^2+1)*i)*S(1//(2)))+1//2*q*e2p((2*i+1//2*(q^2-1))*S(1//(4))),
	(0)*e2p(S(0)),
	-e2p(i*S(1//(2)))] [
	(q^2+1)*e2p((i*k)*S(1//(2))),
	e2p((i*k)*S(1//(2))),
	e2p((i*k)*S(1//(2))),
	e2p((i*k)*S(1//(q^2-1)))+e2p((-i*k)*S(1//(q^2-1))),
	(0)*e2p(S(0))] [
	(q^2-1)*e2p((i*k)*S(1//(2))),
	-e2p((i*k)*S(1//(2))),
	-e2p((i*k)*S(1//(2))),
	(0)*e2p(S(0)),
	-e2p((i*k)*S(1//(q^2+1)))-e2p((-i*k)*S(1//(q^2+1)))]]
classinfo = Vector{Any}[
	["",[1,0],["A_1",[1,1]]],
	["",[1,1],["A_1",[2]]],
	["",[1,2],["A_1",[2]]],
	["",[2,0],["A_0",[1]]],
	["",[3,0],["A_0",[1]]]]
classlength = R.([1, (q^2-1)*(q^2+1)*1//2, (q^2-1)*(q^2+1)*1//2, q^2*(q^2+1), q^2*(q^2-1)])
charinfo = Vector{Any}[
	["",[1,0],["A_1",[2]],"1"],
	["",[1,1],["A_1",[1,1]],"St"],
	["",[2,0],["A_0:2",[1]]],
	["",[2,0],["A_0:2",[1]]],
	["",[3,0],["A_0:2",[1]]],
	["",[3,0],["A_0:2",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
chardegree = R.([1, q^2, 1//2*(q^2+1), 1//2*(q^2+1), 1//2*(q^2-1), 1//2*(q^2-1), q^2+1, q^2-1])

classsums=[
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [0])
	s2=eesubs(tt, [i], [1])
	s1+s2
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [0])
	s2=eesubs(tt, [i], [1])
	s1+s2
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [0])
	s2=eesubs(tt, [i], [1])
	s1+s2
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [(q^2-1)*1//2])
	t1,e1=nesum(tt, i, 1, q^2-2, congruence)
	(1//2*t1-1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [(q^2+1)*1//2])
	t1,e1=nesum(tt, i, 1, q^2, congruence)
	(1//2*t1-1//2*s1, e1)
end
]

charsums=[
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q^2-1)*1//2])
	t1,e1=nesum(tt, k, 1, q^2-2, congruence)
	(1//2*t1-1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q^2+1)*1//2])
	t1,e1=nesum(tt, k, 1, q^2, congruence)
	(1//2*t1-1//2*s1, e1)
end
]

classparams=[
Parameters([Parameter(i, R(2))]),
Parameters([Parameter(i, R(2))]),
Parameters([Parameter(i, R(2))]),
Parameters([Parameter(i, q^2-1)], [ParameterException((i)*1//((q^2-1)*1//2))]),
Parameters([Parameter(i, q^2+1)], [ParameterException((i)*1//((q^2+1)*1//2))])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//((q^2-1)*1//2))]),
Parameters([Parameter(k, q^2+1)], [ParameterException((k)*1//((q^2+1)*1//2))])
]

classparamindex=var_index.([i])
charparamindex=var_index.([k])
congruence=R.((1,2))

information = "- Information about the generic character table of \$SL_2(q^2)\$,
  \$q^2\$ odd. The possible values for q are given by
  \$q^2 = p^m\$ with m a non negative integer and \$p\$ a prime number.
  (See ``SL2.0`` for the generic character table of \$SL_2(q)\$, \$q\$ even).

- CHEVIE-name of the table: ``SL2.1``

- The table was first computed in:
  {\\sc F.~G.~Frobenius}, Über Gruppencharaktere, Sitzungsberichte
  der Königlich Preussischen Akademie der Wissenschaften zu
  Berlin (1896), 985--1021.

  {\\sc I.~Schur}, Untersuchungen über die Darstellung der
  endlichen Gruppen durch gebrochene lineare Substitutionen,
  {\\em J.~reine angew.\\ Math.} {\\bf 132} (1907), 85--137.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

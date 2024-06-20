using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
i,k, _...=gens(S, ["i", "k", "i1", "k1", "i2", "k2", "i3", "k3", "it1", "kt1", "it2", "kt2"])

order = q^2*(q^2-1)*(q^2+1)*1//2
table = Cyclotomic{QQPolyRingElem}[[
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(q^2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(1//2*(q^2-1))*e2p(S(0)),
	-1//2+1//2*q*e2p(S(1//(4))),
	-1//2-1//2*q*e2p(S(1//(4))),
	(0)*e2p(S(0)),
	-e2p(i*S(1//(2))),
	-e2p(((q^2+1)*1//4)*S(1//(2)))] [
	(1//2*(q^2-1))*e2p(S(0)),
	-1//2-1//2*q*e2p(S(1//(4))),
	-1//2+1//2*q*e2p(S(1//(4))),
	(0)*e2p(S(0)),
	-e2p(i*S(1//(2))),
	-e2p(((q^2+1)*1//4)*S(1//(2)))] [
	(q^2+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((2*i*k)*S(1//(q^2-1)))+e2p((-2*i*k)*S(1//(q^2-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q^2-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((2*i*k)*S(1//(q^2+1)))-e2p((-2*i*k)*S(1//(q^2+1))),
	-e2p(k*S(1//(2)))-e2p((-k)*S(1//(2)))]]
classinfo = Vector{Any}[
	["1",[1,0],["A_1",[1,1]]],
	["2",[1,1],["A_1",[2]]],
	["3",[1,2],["A_1",[2]]],
	["4",[2,0],["A_0",[1]]],
	["5",[3,0],["A_0",[1]]],
	["6",[2,0,1],["A_0",[1,0]]]]
classlength = R.([1, (q^2-1)*(q^2+1)*1//2, (q^2-1)*(q^2+1)*1//2, q^2*(q^2+1), q^2*(q^2-1), q^2*(q^2-1)*1//2])
charinfo = Vector{Any}[
	["1",[1,0],["A_1",[2]],"1"],
	["2",[1,1],["A_1",[1,1]],"St"],
	["3",[3,0],["A_0:2",[1]]],
	["4",[3,0],["A_0:2",[1]]],
	["5",[4,0],["A_0",[1]]],
	["6",[5,0],["A_0",[1]]]]
chardegree = R.([1, q^2, 1//2*(q^2-1), 1//2*(q^2-1), q^2+1, q^2-1])

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
	s1=nesum(tt, i, 1, (q^2-3)*1//2, congruence)
	1//2*s1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, (q^2-1)*1//2, congruence)
	s2=eesubs(tt, [i], [(q^2+1)*1//4])
	1//2*s1-1//2*s2
end,
function (tt::Cyclotomic)
	tt
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
	tt
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, (q^2-3)*1//2, congruence)
	1//2*s1
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q^2+1)*1//4])
	t1=nesum(tt, k, 1, (q^2-1)*1//2, congruence)
	1//2*t1-1//2*s1
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(i, (q^2-1)*1//2)], [ParameterException((i)*1//((q^2-1)*1//2))]),
Parameters([Parameter(i, (q^2+1)*1//2)], [ParameterException((i)*1//((q^2+1)*1//4))]),
Parameters(Parameter{QQPolyRingElem}[])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(k, (q^2-1)*1//2)], [ParameterException((k)*1//((q^2-1)*1//2))]),
Parameters([Parameter(k, (q^2+1)*1//2)], [ParameterException((k)*1//((q^2+1)*1//4))])
]

classparamindex=var_index.([i])
charparamindex=var_index.([k])
congruence=R.((-1,4))

information = raw"""- Information about the generic character table of $PSL_2(q^2)$,
  $q^2$ congruent to $3$ modulo $4$. The possible values for q are given by
  $q^2 = p^m$ with m a non negative integer and $p$ a prime number.

- CHEVIE-name of the table: ``PSL2.3``

- The table was first (implicitly) computed in:
  {\sc F.~G.~Frobenius}, Über Gruppencharaktere, Sitzungsberichte
  der Königlich Preussischen Akademie der Wissenschaften zu
  Berlin (1896), 985--1021.

- See also:
  {\sc I.~Schur}, Untersuchungen über die Darstellung der
  endlichen Gruppen durch gebrochene lineare Substitutionen,
  {\em J.~reine angew.\ Math.} {\bf 132} (1907), 85--137.
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information,splitext(basename(@__FILE__))[1])

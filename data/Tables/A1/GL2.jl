using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
i,j,l,k, _...=gens(S, ["i", "j", "l", "k", "i1", "j1", "l1", "k1", "i2", "j2", "l2", "k2", "i3", "j3", "l3", "k3", "it1", "jt1", "lt1", "kt1", "it2", "jt2", "lt2", "kt2"])

order = (q^2-1)*(q^2-q)
table = Cyclotomic{QQPolyRingElem}[[
	CycloSum(R(1), (2*k*i)*S(1//(q-1))),
	CycloSum(R(1), (2*k*i)*S(1//(q-1))),
	CycloSum(R(1), (k*i+k*j)*S(1//(q-1))),
	CycloSum(R(1), (k*i)*S(1//(q-1)))] [
	q*CycloSum(R(1), (2*k*i)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (k*i+k*j)*S(1//(q-1))),
	-CycloSum(R(1), (k*i)*S(1//(q-1)))] [
	(q+1)*CycloSum(R(1), (l*i+k*i)*S(1//(q-1))),
	CycloSum(R(1), (l*i+k*i)*S(1//(q-1))),
	CycloSum(R(1), (l*i+k*j)*S(1//(q-1)))+CycloSum(R(1), (k*i+l*j)*S(1//(q-1))),
	CycloSum(R(0), S(0))] [
	(q-1)*CycloSum(R(1), (k*i)*S(1//(q-1))),
	-CycloSum(R(1), (k*i)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (k*i)*S(1//(q^2-1)))-CycloSum(R(1), (k*i*q)*S(1//(q^2-1)))]]
classinfo = Vector{Any}[[[1,0],["A_1",[1,1]]], [[1,1],["A_1",[2]]], [[2,0],["A_0",[1]]], [[3,0],["A_0",[1]]]]
classlength = R.([1, q^2-1, q*(q+1), q*(q-1)])
charinfo = Vector{Any}[[[1,0],["A_1",[2]]], [[1,1],["A_1",[1,1]]], [[2,0],["A_0",[1]]], [[3,0],["A_0",[1]]]]
chardegree = R.([1, q, q+1, q-1])

classsums=[
function (tt::Cyclotomic)
	nesum(tt, i, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, i, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [j], [i])
	s2=nesum(tt, j, 0, q-2, congruence)
	s1=s2-s1
	s2=nesum(s1, i, 0, q-2, congruence)
	1//2*s2
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [(q+1)*i])
	s1=nesum(s1, i, 0, q-2, congruence)
	s2=nesum(tt, i, 0, q^2-2, congruence)
	1//2*s2-1//2*s1
end
]

charsums=[
function (tt::Cyclotomic)
	nesum(tt, k, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, k, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [l], [k])
	s2=nesum(tt, l, 0, q-2, congruence)
	s1=s2-s1
	s2=nesum(s1, k, 0, q-2, congruence)
	1//2*s2
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q+1)*k])
	s1=nesum(s1, k, 0, q-2, congruence)
	s2=nesum(tt, k, 0, q^2-2, congruence)
	1//2*s2-1//2*s1
end
]

classparams=[
Parameters([Parameter(i, q-1)]),
Parameters([Parameter(i, q-1)]),
Parameters([Parameter(i, q-1), Parameter(j, q-1)], [ParameterException((i-j)*1//(q-1))]),
Parameters([Parameter(i, q^2-1)], [ParameterException((i)*1//(q+1))])
]

charparams=[
Parameters([Parameter(k, q-1)]),
Parameters([Parameter(k, q-1)]),
Parameters([Parameter(k, q-1), Parameter(l, q-1)], [ParameterException((k-l)*1//(q-1))]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//(q+1))])
]

classparamindex=var_index.([i,j])
charparamindex=var_index.([l,k])
congruence=nothing

information = raw"""- Information about the generic character table of $GL_2(q)$.

- CHEVIE-name of the table: ``GL2``

- The table was first computed in:
  {\sc H.~Jordan}, Group-characters of various types of linear groups,
  {\em Amer.\ J.~Math.} {\bf 29} (1907), 387--405.

  {\sc I.~Schur}, Untersuchungen über die Darstellung der
  endlichen Gruppen durch gebrochene lineare Substitutionen,
  {\em J.~reine angew.\ Math.} {\bf 132} (1907), 85--137.

- See also:
  {\sc R.~Steinberg}, The representations of $GL(3,q)$, $GL(4,q)$, $PGL(3,q)$
  and $PGL(4,q)$, {\em Can.\ J.~Math.} {\bf 3} (1951), 225--235.
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information,splitext(basename(@__FILE__))[1])

using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = universal_polynomial_ring(Q; cached=false)
a,n, _...=gens(S, ["a", "n", "a1", "n1", "a2", "n2", "a3", "n3", "at1", "nt1", "at2", "nt2"])

order = q*(q-1)*(q+1)
table = Cyclotomic{QQPolyRingElem}[[
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0))] [
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0))] [
	((q+1))*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), (n*a)*S(1//(q-1)))+CycloSum(R(1), (-n*a)*S(1//(q-1))),
	CycloSum(R(0), S(0))] [
	((q-1))*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (n*a)*S(1//(q+1)))-CycloSum(R(1), (-n*a)*S(1//(q+1)))]]
classinfo = Vector{Any}[[[1,0],["A_1",[1,1]]], [[1,1],["A_1",[2]]], [[2,0],["A_0",[1]]], [[3,0],["A_0",[1]]]]
classlength = R.([1, (q-1)*(q+1), q*(q+1), q*(q-1)])
charinfo = Vector{Any}[[[1,0],["A_1",[2]]], [[1,1],["A_1",[1,1]]], [[2,0],["A_0",[1]]], [[3,0],["A_0",[1]]]]
chardegree = R.([1, q, q+1, q-1])

classsums=[
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	tt
end,
function (tt::Cyclotomic)
	s1=nesum(tt, a, 1, q-2, congruence)
	1//2*s1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, a, 1, q, congruence)
	1//2*s1
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
	s1=nesum(tt, n, 1, q-2, congruence)
	1//2*s1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, n, 1, q, congruence)
	1//2*s1
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1)], [ParameterException((a)*1//(q-1))]),
Parameters([Parameter(a, q+1)], [ParameterException((a)*1//(q+1))])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(n, q-1)], [ParameterException((n)*1//(q-1))]),
Parameters([Parameter(n, q+1)], [ParameterException((n)*1//(q+1))])
]

classparamindex=var_index.([a])
charparamindex=var_index.([n])
congruence=R.((0,2))

information = raw"""- Information about the generic character table of $SL_2(q)$, $q$ even
  (See ``SL2.1`` for the generic character table of $SL_2(q)$, $q$ odd)

- CHEVIE-name of the table: ``SL2.0``

- The table was first computed in:
  {\sc I.~Schur}, Untersuchungen über die Darstellung der
  endlichen Gruppen durch gebrochene lineare Substitutionen,
  {\em J.~reine angew.\ Math.} {\bf 132} (1907), 85--137.
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information,splitext(basename(@__FILE__))[1])

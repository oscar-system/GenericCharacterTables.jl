using ..GenericCharacterTables
import ..GenericCharacterTables: Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac
using Oscar
R = universal_polynomial_ring(QQ; cached=false)
q = gen(R, "q")
S = generic_cyclotomic_ring(R)
a,n, _...=gens(R, ["a", "n", "a1", "n1", "a2", "n2", "a3", "n3", "at1", "nt1", "at2", "nt2"])

order = q*(q-1)*(q+1)
table = GenericCyclo[[
	S(1),
	S(1),
	S(1),
	S(1)] [
	(q)*S(1),
	S(0),
	S(1),
	-S(1)] [
	((q+1))*S(1),
	S(1),
	S(1, exponent=(n*a)*1//R((q-1)))+S(1, exponent=(-n*a)*1//R((q-1))),
	S(0)] [
	((q-1))*S(1),
	-S(1),
	S(0),
	-S(1, exponent=(n*a)*1//R((q+1)))-S(1, exponent=(-n*a)*1//R((q+1)))]]
classinfo = Vector{Any}[[[1,0],["A_1",[1,1]]], [[1,1],["A_1",[2]]], [[2,0],["A_0",[1]]], [[3,0],["A_0",[1]]]]
classlength = R.([1, (q-1)*(q+1), q*(q+1), q*(q-1)])
charinfo = Vector{Any}[[[1,0],["A_1",[2]]], [[1,1],["A_1",[1,1]]], [[2,0],["A_0",[1]]], [[3,0],["A_0",[1]]]]
chardegree = R.([1, q, q+1, q-1])

classsums=[
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, a, 1, q-2, congruence)
	1//2*s1
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, a, 1, q, congruence)
	1//2*s1
end
]

charsums=[
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, n, 1, q-2, congruence)
	1//2*s1
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, n, 1, q, congruence)
	1//2*s1
end
]

classparams=[
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters([Parameter(a, q-1)], [((a)*1//(q-1))]),
Parameters([Parameter(a, q+1)], [((a)*1//(q+1))])
]

charparams=[
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters([Parameter(n, q-1)], [((n)*1//(q-1))]),
Parameters([Parameter(n, q+1)], [((n)*1//(q+1))])
]

classparamindex=var_index.([a])
charparamindex=var_index.([n])
congruence=QQ.((0,2))

information = raw"""- Information about the generic character table of $SL_2(q)$, $q$ even
  (See ``SL2.1`` for the generic character table of $SL_2(q)$, $q$ odd)

- CHEVIE-name of the table: ``SL2.0``

- The table was first computed in:
  {\sc I.~Schur}, Untersuchungen über die Darstellung der
  endlichen Gruppen durch gebrochene lineare Substitutionen,
  {\em J.~reine angew.\ Math.} {\bf 132} (1907), 85--137.
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,S,information,splitext(basename(@__FILE__))[1])

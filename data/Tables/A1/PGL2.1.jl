using ..GenericCharacterTables
import ..GenericCharacterTables: Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac
using Oscar
R = universal_polynomial_ring(QQ; cached=false)
q = gen(R, "q")
S = generic_cyclotomic_ring(R)
i,j,l,k, _...=gens(R, ["i", "j", "l", "k", "i1", "j1", "l1", "k1", "i2", "j2", "l2", "k2", "i3", "j3", "l3", "k3", "it1", "jt1", "lt1", "kt1", "it2", "jt2", "lt2", "kt2"])

order = q*(q^2-1)
table = GenericCyclo[[
	S(1),
	S(1),
	S(1, exponent=(k*(q-1))*1//R((4))),
	S(1, exponent=(k*i)*1//R((2))),
	S(1, exponent=(k*(q+1))*1//R((4))),
	S(1, exponent=(k*i)*1//R((2)))] [
	(q)*S(1),
	S(0),
	S(1, exponent=(k*(q-1))*1//R((4))),
	S(1, exponent=(k*i)*1//R((2))),
	-S(1, exponent=(k*(q+1))*1//R((4))),
	-S(1, exponent=(k*i)*1//R((2)))] [
	(q+1)*S(1),
	S(1),
	S(1, exponent=k*1//R((2)))+S(1, exponent=(-k)*1//R((2))),
	S(1, exponent=(k*i)*1//R((q-1)))+S(1, exponent=(-k*i)*1//R((q-1))),
	S(0),
	S(0)] [
	(q-1)*S(1),
	-S(1),
	S(0),
	S(0),
	-S(1, exponent=k*1//R((2)))-S(1, exponent=(-k)*1//R((2))),
	-S(1, exponent=(k*i)*1//R((q+1)))-S(1, exponent=(-k*i)*1//R((q+1)))]]
classinfo = Vector{Any}[
	["1",[1,0],["A_1",[1,1]]],
	["2",[1,1],["A_1",[2]]],
	["3",[2,0],["A_0:2",[1]]],
	["4",[3,0],["A_0",[1]]],
	["5",[4,0],["A_0:2",[1]]],
	["6",[5,0],["A_0",[1]]]]
classlength = R.([1, q^2-1, q*(q+1)*1//2, q*(q+1), q*(q-1)*1//2, q*(q-1)])
charinfo = Vector{Any}[["1",[1,0],["A_1",[2]]], ["2",[1,1],["A_1",[1,1]]], ["3",[2,0],["A_0",[1]]], ["4",[3,0],["A_0",[1]]]]
chardegree = R.([1, q, q+1, q-1])

classsums=[
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, i, 1, q-2, congruence)
	tt1=eesubs(tt, [i], [(q-1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, i, 1, q, congruence)
	tt1=eesubs(tt, [i], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end
]

charsums=[
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, k, 0, 1, congruence)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, k, 0, 1, congruence)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, k, 1, q-2, congruence)
	tt1=eesubs(tt, [k], [(q-1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=nesum(tt, k, 1, q, congruence)
	tt1=eesubs(tt, [k], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end
]

classparams=[
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters([Parameter(i, q-1)], [((i)*1//((q-1)*1//2))]),
Parameters(Parameter[]),
Parameters([Parameter(i, q+1)], [((i)*1//((q+1)*1//2))])
]

charparams=[
Parameters([Parameter(k, R(2))]),
Parameters([Parameter(k, R(2))]),
Parameters([Parameter(k, q-1)], [((k)*1//((q-1)*1//2))]),
Parameters([Parameter(k, q+1)], [((k)*1//((q+1)*1//2))])
]

classparamindex=var_index.([i,j])
charparamindex=var_index.([l,k])
congruence=QQ.((1,2))

information = raw"""- Information about the generic character table of $PGL_2(q)$, $q$ odd
  (See ``SL2.0`` for the generic character table of $PGL_2(q)$, $q$ even)

- CHEVIE-name of the table: ``PGL2.1``

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
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,S,information,splitext(basename(@__FILE__))[1])

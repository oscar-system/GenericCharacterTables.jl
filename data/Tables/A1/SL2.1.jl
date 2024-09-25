using ..GenericCharacterTables
import ..GenericCharacterTables: Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac
using Oscar
R = universal_polynomial_ring(QQ; cached=false)
q = gen(R, "q")
S = generic_cyclotomic_ring(R; congruence=ZZ.((1,2)))
i,k, _...=gens(R, ["i", "k", "i1", "k1", "i2", "k2", "i3", "k3", "it1", "kt1", "it2", "kt2"])

order = q^2*(q^2-1)*(q^2+1)
table = GenericCyclo[[
	S(1),
	S(1),
	S(1),
	S(1),
	S(1)] [
	(q^2)*S(1),
	S(0),
	S(0),
	S(1),
	-S(1)] [
	1//2*(q^2+1)*S(1, exponent=(1//2*(q^2-1)*i)*1//R((2))),
	1//2*S(1, exponent=(1//2*(q^2-1)*i)*1//R((2)))+1//2*q*S(1, exponent=(1//2*(q^2-1))*1//R((4))),
	1//2*S(1, exponent=(1//2*(q^2-1)*i)*1//R((2)))-1//2*q*S(1, exponent=(1//2*(q^2-1))*1//R((4))),
	S(1, exponent=i*1//R((2))),
	S(0)] [
	1//2*(q^2+1)*S(1, exponent=(1//2*(q^2-1)*i)*1//R((2))),
	1//2*S(1, exponent=(1//2*(q^2-1)*i)*1//R((2)))-1//2*q*S(1, exponent=(1//2*(q^2-1))*1//R((4))),
	1//2*S(1, exponent=(1//2*(q^2-1)*i)*1//R((2)))+1//2*q*S(1, exponent=(1//2*(q^2-1))*1//R((4))),
	S(1, exponent=i*1//R((2))),
	S(0)] [
	1//2*(q^2-1)*S(1, exponent=(1//2*i*q^2+1//2*i)*1//R((2))),
	-1//2*S(1, exponent=(1//2*(q^2+1)*i)*1//R((2)))+1//2*q*S(1, exponent=(2*i+1//2*(q^2-1))*1//R((4))),
	-1//2*S(1, exponent=(1//2*(q^2+1)*i)*1//R((2)))-1//2*q*S(1, exponent=(2*i+1//2*(q^2-1))*1//R((4))),
	S(0),
	-S(1, exponent=i*1//R((2)))] [
	1//2*(q^2-1)*S(1, exponent=(1//2*i*q^2+1//2*i)*1//R((2))),
	-1//2*S(1, exponent=(1//2*(q^2+1)*i)*1//R((2)))-1//2*q*S(1, exponent=(2*i+1//2*(q^2-1))*1//R((4))),
	-1//2*S(1, exponent=(1//2*(q^2+1)*i)*1//R((2)))+1//2*q*S(1, exponent=(2*i+1//2*(q^2-1))*1//R((4))),
	S(0),
	-S(1, exponent=i*1//R((2)))] [
	(q^2+1)*S(1, exponent=(i*k)*1//R((2))),
	S(1, exponent=(i*k)*1//R((2))),
	S(1, exponent=(i*k)*1//R((2))),
	S(1, exponent=(i*k)*1//R((q^2-1)))+S(1, exponent=(-i*k)*1//R((q^2-1))),
	S(0)] [
	(q^2-1)*S(1, exponent=(i*k)*1//R((2))),
	-S(1, exponent=(i*k)*1//R((2))),
	-S(1, exponent=(i*k)*1//R((2))),
	S(0),
	-S(1, exponent=(i*k)*1//R((q^2+1)))-S(1, exponent=(-i*k)*1//R((q^2+1)))]]
classinfo = Vector{Any}[
	[[1,0],["A_1",[1,1]]],
	[[1,1],["A_1",[2]]],
	[[1,2],["A_1",[2]]],
	[[2,0],["A_0",[1]]],
	[[3,0],["A_0",[1]]]]
classlength = R.([1, (q^2-1)*(q^2+1)*1//2, (q^2-1)*(q^2+1)*1//2, q^2*(q^2+1), q^2*(q^2-1)])
charinfo = Vector{Any}[
	[[1,0],["A_1",[2]],"1"],
	[[1,1],["A_1",[1,1]],"St"],
	[[2,0],["A_0:2",[1]]],
	[[2,0],["A_0:2",[1]]],
	[[3,0],["A_0:2",[1]]],
	[[3,0],["A_0:2",[1]]],
	[[4,0],["A_0",[1]]],
	[[5,0],["A_0",[1]]]]
chardegree = R.([1, q^2, 1//2*(q^2+1), 1//2*(q^2+1), 1//2*(q^2-1), 1//2*(q^2-1), q^2+1, q^2-1])

classsums=[
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=evaluate(tt, [i], [0])
	s2=evaluate(tt, [i], [1])
	s1+s2
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=evaluate(tt, [i], [0])
	s2=evaluate(tt, [i], [1])
	s1+s2
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=evaluate(tt, [i], [0])
	s2=evaluate(tt, [i], [1])
	s1+s2
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=evaluate(tt, [i], [(q^2-1)*1//2])
	t1=nesum(tt, i, 1, q^2-2)
	1//2*t1-1//2*s1
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=evaluate(tt, [i], [(q^2+1)*1//2])
	t1=nesum(tt, i, 1, q^2)
	1//2*t1-1//2*s1
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
	tt
end,
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
	s1=evaluate(tt, [k], [(q^2-1)*1//2])
	t1=nesum(tt, k, 1, q^2-2)
	1//2*t1-1//2*s1
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	s1=evaluate(tt, [k], [(q^2+1)*1//2])
	t1=nesum(tt, k, 1, q^2)
	1//2*t1-1//2*s1
end
]

classparams=[
Parameters([Parameter(i, R(2))]),
Parameters([Parameter(i, R(2))]),
Parameters([Parameter(i, R(2))]),
Parameters([Parameter(i, q^2-1)], [((i)*1//((q^2-1)*1//2))]),
Parameters([Parameter(i, q^2+1)], [((i)*1//((q^2+1)*1//2))])
]

charparams=[
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters(Parameter[]),
Parameters([Parameter(k, q^2-1)], [((k)*1//((q^2-1)*1//2))]),
Parameters([Parameter(k, q^2+1)], [((k)*1//((q^2+1)*1//2))])
]

classparamindex=var_index.([i])
charparamindex=var_index.([k])


information = raw"""- Information about the generic character table of $SL_2(q^2)$,
  $q^2$ odd. The possible values for q are given by
  $q^2 = p^m$ with m a non negative integer and $p$ a prime number.
  (See ``SL2.0`` for the generic character table of $SL_2(q)$, $q$ even).

- CHEVIE-name of the table: ``SL2.1``

- The table was first computed in:
  {\sc F.~G.~Frobenius}, Über Gruppencharaktere, Sitzungsberichte
  der Königlich Preussischen Akademie der Wissenschaften zu
  Berlin (1896), 985--1021.

  {\sc I.~Schur}, Untersuchungen über die Darstellung der
  endlichen Gruppen durch gebrochene lineare Substitutionen,
  {\em J.~reine angew.\ Math.} {\bf 132} (1907), 85--137.
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,S,information,splitext(basename(@__FILE__))[1])

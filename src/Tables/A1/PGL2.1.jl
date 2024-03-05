using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ExtendableMatrix, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
i,j,l,k, _...=gens(S, ["i", "j", "l", "k", "i1", "j1", "l1", "k1", "i2", "j2", "l2", "k2", "i3", "j3", "l3", "k3", "it1", "jt1", "lt1", "kt1", "it2", "jt2", "lt2", "kt2"])

order = q*(q^2-1)
table = Cyclotomic{QQPolyRingElem}[[
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((k*(q-1))*S(1//(4))),
	e2p((k*i)*S(1//(2))),
	e2p((k*(q+1))*S(1//(4))),
	e2p((k*i)*S(1//(2)))] [
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((k*(q-1))*S(1//(4))),
	e2p((k*i)*S(1//(2))),
	-e2p((k*(q+1))*S(1//(4))),
	-e2p((k*i)*S(1//(2)))] [
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p(k*S(1//(2)))+e2p((-k)*S(1//(2))),
	e2p((k*i)*S(1//(q-1)))+e2p((-k*i)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p(k*S(1//(2)))-e2p((-k)*S(1//(2))),
	-e2p((k*i)*S(1//(q+1)))-e2p((-k*i)*S(1//(q+1)))]]
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
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q-2, congruence)
	tt1=eesubs(tt, [i], [(q-1)*1//2])
	(1//2*s1-1//2*tt1, e1)
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q, congruence)
	tt1=eesubs(tt, [i], [(q+1)*1//2])
	(1//2*s1-1//2*tt1, e1)
end
]

charsums=[
function (tt::Cyclotomic)
	nesum(tt, k, 0, 1, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, k, 0, 1, congruence)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q-2, congruence)
	tt1=eesubs(tt, [k], [(q-1)*1//2])
	(1//2*s1-1//2*tt1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q, congruence)
	tt1=eesubs(tt, [k], [(q+1)*1//2])
	(1//2*s1-1//2*tt1, e1)
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//((q-1)*1//2))]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//((q+1)*1//2))])
]

charparams=[
Parameters([Parameter(k, R(2))]),
Parameters([Parameter(k, R(2))]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//((q-1)*1//2))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//((q+1)*1//2))])
]

classparamindex=var_index.([i,j])
charparamindex=var_index.([l,k])
congruence=R.((1,2))

information = "- Information about the generic character table of \$PGL_2(q)\$, \$q\$ odd
  (See ``SL2.0`` for the generic character table of \$PGL_2(q)\$, \$q\$ even)

- CHEVIE-name of the table: ``PGL2.1``

- The table was first computed in:
  {\\sc H.~Jordan}, Group-characters of various types of linear groups,
  {\\em Amer.\\ J.~Math.} {\\bf 29} (1907), 387--405.

  {\\sc I.~Schur}, Untersuchungen über die Darstellung der
  endlichen Gruppen durch gebrochene lineare Substitutionen,
  {\\em J.~reine angew.\\ Math.} {\\bf 132} (1907), 85--137.

- See also:
  {\\sc R.~Steinberg}, The representations of \$GL(3,q)\$, \$GL(4,q)\$, \$PGL(3,q)\$
  and \$PGL(4,q)\$, {\\em Can.\\ J.~Math.} {\\bf 3} (1951), 225--235.
 "

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

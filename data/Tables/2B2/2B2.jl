using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
using Oscar
R, q0 = polynomial_ring(QQ, "q0")
Q = fraction_field(R)
S = universal_polynomial_ring(Q; cached=false)
a,b,c,s,k,u, _...=gens(S, ["a", "b", "c", "s", "k", "u", "a1", "b1", "c1", "s1", "k1", "u1", "a2", "b2", "c2", "s2", "k2", "u2", "a3", "b3", "c3", "s3", "k3", "u3", "at1", "bt1", "ct1", "st1", "kt1", "ut1", "at2", "bt2", "ct2", "st2", "kt2", "ut2"])

order = 4*q0^4*(4*q0^4+1)*(2*q0^2-1)
table = Cyclotomic{QQPolyRingElem}[[
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0))] [
	(q0*(2*q0^2-1))*CycloSum(R(1), S(0)),
	(-q0)*CycloSum(R(1), S(0)),
	q0*CycloSum(R(1), S(1//(4))),
	-q0*CycloSum(R(1), S(1//(4))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0))] [
	(q0*(2*q0^2-1))*CycloSum(R(1), S(0)),
	(-q0)*CycloSum(R(1), S(0)),
	-q0*CycloSum(R(1), S(1//(4))),
	q0*CycloSum(R(1), S(1//(4))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0))] [
	(4*q0^4)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0))] [
	(4*q0^4+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), (s*a)*S(1//(2*q0^2-1)))+CycloSum(R(1), (-s*a)*S(1//(2*q0^2-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((2*q0^2-1)*(2*q0^2-2*q0+1))*CycloSum(R(1), S(0)),
	(2*q0-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	-(CycloSum(R(1), (k*b)*S(1//(2*q0^2+2*q0+1)))+CycloSum(R(1), (-k*b)*S(1//(2*q0^2+2*q0+1)))+CycloSum(R(1), (2*q0^2*k*b)*S(1//(2*q0^2+2*q0+1)))+CycloSum(R(1), (-2*q0^2*k*b)*S(1//(2*q0^2+2*q0+1)))),
	CycloSum(R(0), S(0))] [
	((2*q0^2-1)*(2*q0^2+2*q0+1))*CycloSum(R(1), S(0)),
	(-2*q0-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-(CycloSum(R(1), (u*c)*S(1//(2*q0^2-2*q0+1)))+CycloSum(R(1), (-u*c)*S(1//(2*q0^2-2*q0+1)))+CycloSum(R(1), (2*q0^2*u*c)*S(1//(2*q0^2-2*q0+1)))+CycloSum(R(1), (-2*q0^2*u*c)*S(1//(2*q0^2-2*q0+1))))]]
classinfo = [
	[[1,0],["^2B_2","u_0"]],
	[[1,1],["^2B_2","u_1"]],
	[[1,2],["^2B_2","u_2"]],
	[[1,3],["^2B_2","u_3"]],
	[[2,0],["A_0",[1]]],
	[[3,0],["A_0",[1]]],
	[[4,0],["A_0",[1]]]]
classlength = R.([
	1,
	(2*q0^2-1)*(4*q0^4+1),
	2*q0^2*1//2*(2*q0^2-1)*(4*q0^4+1),
	2*q0^2*1//2*(2*q0^2-1)*(4*q0^4+1),
	4*q0^4*(4*q0^4+1),
	4*q0^4*(2*q0^2-1)*(2*q0^2-2*q0+1),
	4*q0^4*(2*q0^2-1)*(2*q0^2+2*q0+1)])
charinfo = [
	[[1,0],["^2B_2","1"],"1"],
	[[1,1],["^2B_2","2B2[a]"],"2B2[a]"],
	[[1,2],["^2B_2","2B2[b]"],"2B2[b]"],
	[[1,3],["^2B_2","\\epsilon"],"St"],
	[[2,0],["A_0",[1]],"chi5"],
	[[3,0],["A_0",[1]],"chi6"],
	[[4,0],["A_0",[1]],"chi7"]]
chardegree = R.([1, q0*(2*q0^2-1), q0*(2*q0^2-1), 4*q0^4, 4*q0^4+1, (2*q0^2-1)*(2*q0^2-2*q0+1), (2*q0^2-1)*(2*q0^2+2*q0+1)])

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
	tt
end,
function (tt::Cyclotomic)
	s1=nesum(tt, a, 1, 2*q0^2-2, congruence)
	1//2*s1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, b, 1, 2*q0^2+2*q0, congruence)
	1//4*s1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, c, 1, 2*q0^2-2*q0, congruence)
	1//4*s1
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
	s1=nesum(tt, s, 1, 2*q0^2-2, congruence)
	1//2*s1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, 2*q0^2+2*q0, congruence)
	1//4*s1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, u, 1, 2*q0^2-2*q0, congruence)
	1//4*s1
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(a, 2*q0^2-1)], [ParameterException((a)*1//(2*q0^2-1))]),
Parameters([Parameter(b, 2*q0^2+2*q0+1)], [ParameterException((b)*1//(2*q0^2+2*q0+1))]),
Parameters([Parameter(c, 2*q0^2-2*q0+1)], [ParameterException((c)*1//(2*q0^2-2*q0+1))])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(s, 2*q0^2-1)], [ParameterException((s)*1//(2*q0^2-1))]),
Parameters([Parameter(k, 2*q0^2+2*q0+1)], [ParameterException((k)*1//(2*q0^2+2*q0+1))]),
Parameters([Parameter(u, 2*q0^2-2*q0+1)], [ParameterException((u)*1//(2*q0^2-2*q0+1))])
]

classparamindex=var_index.([a,b,c])
charparamindex=var_index.([s,k,u])
congruence=nothing

information = raw"""- Information about the generic character table of $^2B_2(q^2)$,
  where ``q = \sqrt{2}q_0``.

- CHEVIE-name of the table: ``Sz``

- The table was first computed in:
  {\sc M. Suzuki}, On a class of doubly transitive groups, {\em Ann. of
    Math. \bf75} (1962), 105--145.
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information,splitext(basename(@__FILE__))[1])

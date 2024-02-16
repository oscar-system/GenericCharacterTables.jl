using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ParameterSubstitution, ExtendableMatrix, CharTable
using Oscar
K, sqrt2 = quadratic_field(2)
R, q = polynomial_ring(K, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
a,b,c,s,k,u, _...=gens(S, ["a", "b", "c", "s", "k", "u", "a1", "b1", "c1", "s1", "k1", "u1", "a2", "b2", "c2", "s2", "k2", "u2", "a3", "b3", "c3", "s3", "k3", "u3", "at1", "bt1", "ct1", "st1", "kt1", "ut1", "at2", "bt2", "ct2", "st2", "kt2", "ut2"])

order = q^4*(q^4+1)*(q^2-1)
table = Cyclotomic{Generic.Poly{AbsSimpleNumFieldElem}}[[
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(q*1//sqrt2*(q^2-1))*e2p(S(0)),
	(-q*1//sqrt2)*e2p(S(0)),
	q*1//sqrt2*e2p(S(1//(4))),
	-q*1//sqrt2*e2p(S(1//(4))),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(q*1//sqrt2*(q^2-1))*e2p(S(0)),
	(-q*1//sqrt2)*e2p(S(0)),
	-q*1//sqrt2*e2p(S(1//(4))),
	q*1//sqrt2*e2p(S(1//(4))),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(q^4)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(q^4+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((s*a)*S(1//(q^2-1)))+e2p((-s*a)*S(1//(q^2-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q^2-1)*(q^2-sqrt2*q+1))*e2p(S(0)),
	(sqrt2*q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	-(e2p((k*b)*S(1//(q^2+sqrt2*q+1)))+e2p((-k*b)*S(1//(q^2+sqrt2*q+1)))+e2p((q^2*k*b)*S(1//(q^2+sqrt2*q+1)))+e2p((-q^2*k*b)*S(1//(q^2+sqrt2*q+1)))),
	(0)*e2p(S(0))] [
	((q^2-1)*(q^2+sqrt2*q+1))*e2p(S(0)),
	(-sqrt2*q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-(e2p((u*c)*S(1//(q^2-sqrt2*q+1)))+e2p((-u*c)*S(1//(q^2-sqrt2*q+1)))+e2p((q^2*u*c)*S(1//(q^2-sqrt2*q+1)))+e2p((-q^2*u*c)*S(1//(q^2-sqrt2*q+1))))]]
classinfo = [
	["",[1,0],["^2B_2","u_0"]],
	["",[1,1],["^2B_2","u_1"]],
	["",[1,2],["^2B_2","u_2"]],
	["",[1,3],["^2B_2","u_3"]],
	["",[2,0],["A_0",[1]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q^2-1)*(q^4+1),
	q^2*1//2*(q^2-1)*(q^4+1),
	q^2*1//2*(q^2-1)*(q^4+1),
	q^4*(q^4+1),
	q^4*(q^2-1)*(q^2-sqrt2*q+1),
	q^4*(q^2-1)*(q^2+sqrt2*q+1)])
charinfo = [
	["",[1,0],["^2B_2","1"],"1"],
	["",[1,1],["^2B_2","2B2[a]"],"2B2[a]"],
	["",[1,2],["^2B_2","2B2[b]"],"2B2[b]"],
	["",[1,3],["^2B_2","\\epsilon"],"St"],
	["",[2,0],["A_0",[1]],"chi5"],
	["",[3,0],["A_0",[1]],"chi6"],
	["",[4,0],["A_0",[1]],"chi7"]]
chardegree = R.([1, q*1//sqrt2*(q^2-1), q*1//sqrt2*(q^2-1), q^4, q^4+1, (q^2-1)*(q^2-sqrt2*q+1), (q^2-1)*(q^2+sqrt2*q+1)])

classsums=[
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, a, 1, q^2-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, b, 1, q^2+sqrt2*q, congruence)
	(1//4*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, c, 1, q^2-sqrt2*q, congruence)
	(1//4*s1, e1)
end
]

charsums=[
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}}())
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, s, 1, q^2-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q^2+sqrt2*q, congruence)
	(1//4*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, u, 1, q^2-sqrt2*q, congruence)
	(1//4*s1, e1)
end
]

classparams=[
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(a, q^2-1)], [ParameterException((a)*1//(q^2-1))], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(b, q^2+sqrt2*q+1)], [ParameterException((b)*1//(q^2+sqrt2*q+1))], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(c, q^2-sqrt2*q+1)], [ParameterException((c)*1//(q^2-sqrt2*q+1))], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[])
]

charparams=[
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(s, q^2-1)], [ParameterException((s)*1//(q^2-1))], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(k, q^2+sqrt2*q+1)], [ParameterException((k)*1//(q^2+sqrt2*q+1))], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(u, q^2-sqrt2*q+1)], [ParameterException((u)*1//(q^2-sqrt2*q+1))], ParameterSubstitution{Generic.Poly{AbsSimpleNumFieldElem}}[])
]

classparamindex=var_index.([a,b,c])
charparamindex=var_index.([s,k,u])
congruence=R.((0,sqrt2))

information = "- Information about the generic character table of \$^2B_2(q^2)\$.

- CHEVIE-name of the table: ``Sz``

- The table was first computed in:
  {\\sc M. Suzuki}, On a class of doubly transitive groups, {\\em Ann. of
    Math. \\bf75} (1962), 105--145.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

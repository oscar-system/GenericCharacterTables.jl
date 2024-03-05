using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ExtendableMatrix, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
a,b,c,l,m,n, _...=gens(S, ["a", "b", "c", "l", "m", "n", "a1", "b1", "c1", "l1", "m1", "n1", "a2", "b2", "c2", "l2", "m2", "n2", "a3", "b3", "c3", "l3", "m3", "n3", "at1", "bt1", "ct1", "lt1", "mt1", "nt1", "at2", "bt2", "ct2", "lt2", "mt2", "nt2"])

order = q^3*(q-1)^3*(q+1)*(q^2+q+1)
table = Cyclotomic{QQPolyRingElem}[[
	e2p((3*n*a)*S(1//(q-1))),
	e2p((3*n*a)*S(1//(q-1))),
	e2p((3*n*a)*S(1//(q-1))),
	e2p((2*n*a+n*b)*S(1//(q-1))),
	e2p((2*n*a+n*b)*S(1//(q-1))),
	e2p((n*a+n*b+n*c)*S(1//(q-1))),
	e2p((n*a+n*b)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1)))] [
	(q^2+q)*e2p((3*n*a)*S(1//(q-1))),
	q*e2p((3*n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(q+1)*e2p((2*n*a+n*b)*S(1//(q-1))),
	e2p((2*n*a+n*b)*S(1//(q-1))),
	2*e2p((n*a+n*b+n*c)*S(1//(q-1))),
	(0)*e2p(S(0)),
	-e2p((n*a)*S(1//(q-1)))] [
	q^3*e2p((3*n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	q*e2p((2*n*a+n*b)*S(1//(q-1))),
	(0)*e2p(S(0)),
	e2p((n*a+n*b+n*c)*S(1//(q-1))),
	-e2p((n*a+n*b)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1)))] [
	(q^2+q+1)*e2p((m*a+2*n*a)*S(1//(q-1))),
	(q+1)*e2p((m*a+2*n*a)*S(1//(q-1))),
	e2p((m*a+2*n*a)*S(1//(q-1))),
	(q+1)*e2p((m*a+n*a+n*b)*S(1//(q-1)))+e2p((2*n*a+m*b)*S(1//(q-1))),
	e2p((m*a+n*a+n*b)*S(1//(q-1)))+e2p((2*n*a+m*b)*S(1//(q-1))),
	e2p((m*a+n*b+n*c)*S(1//(q-1)))+e2p((m*b+n*a+n*c)*S(1//(q-1)))+e2p((m*c+n*a+n*b)*S(1//(q-1))),
	e2p((m*a+n*b)*S(1//(q-1))),
	(0)*e2p(S(0))] [
	q*(q^2+q+1)*e2p((m*a+2*n*a)*S(1//(q-1))),
	q*e2p((m*a+2*n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(q+1)*e2p((m*a+n*a+n*b)*S(1//(q-1)))+q*e2p((2*n*a+m*b)*S(1//(q-1))),
	e2p((m*a+n*a+n*b)*S(1//(q-1))),
	e2p((m*a+n*b+n*c)*S(1//(q-1)))+e2p((m*b+n*a+n*c)*S(1//(q-1)))+e2p((m*c+n*a+n*b)*S(1//(q-1))),
	-e2p((m*a+n*b)*S(1//(q-1))),
	(0)*e2p(S(0))] [
	(q+1)*(q^2+q+1)*e2p((l*a+m*a+n*a)*S(1//(q-1))),
	(2*q+1)*e2p((l*a+m*a+n*a)*S(1//(q-1))),
	e2p((l*a+m*a+n*a)*S(1//(q-1))),
	(q+1)*(e2p((l*a+m*a+n*b)*S(1//(q-1)))+e2p((m*a+n*a+l*b)*S(1//(q-1)))+e2p((l*a+n*a+m*b)*S(1//(q-1)))),
	e2p((l*a+m*a+n*b)*S(1//(q-1)))+e2p((l*a+n*a+m*b)*S(1//(q-1)))+e2p((m*a+n*a+l*b)*S(1//(q-1))),
	e2p((l*a+m*b+n*c)*S(1//(q-1)))+e2p((l*a+n*b+m*c)*S(1//(q-1)))+e2p((m*a+n*b+l*c)*S(1//(q-1)))+e2p((m*a+l*b+n*c)*S(1//(q-1)))+e2p((n*a+m*b+l*c)*S(1//(q-1)))+e2p((n*a+l*b+m*c)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q-1)*(q^2+q+1)*e2p((m*a+n*a)*S(1//(q-1))),
	-e2p((m*a+n*a)*S(1//(q-1))),
	-e2p((m*a+n*a)*S(1//(q-1))),
	(q-1)*e2p((n*a+m*b)*S(1//(q-1))),
	-e2p((n*a+m*b)*S(1//(q-1))),
	(0)*e2p(S(0)),
	-e2p((m*a*q+m*a+n*b)*S(1//(q^2-1)))-e2p((m*a*q+m*a+n*b*q)*S(1//(q^2-1))),
	(0)*e2p(S(0))] [
	(q-1)^2*(q+1)*e2p((n*a)*S(1//(q-1))),
	-(q-1)*e2p((n*a)*S(1//(q-1))),
	e2p((n*a)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((n*a)*S(1//(q^3-1)))+e2p((n*a*q)*S(1//(q^3-1)))+e2p((n*a*q^2)*S(1//(q^3-1)))]]
classinfo = Vector{Any}[
	["",[1,0],["A_2",[1,1,1]]],
	["",[1,1],["A_2",[2,1]]],
	["",[1,2],["A_2",[3]]],
	["",[2,0],["A_1",[1,1]]],
	["",[2,1],["A_1",[2]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q^2-1)*(q^2+q+1),
	q*(q-1)^2*(q+1)*(q^2+q+1),
	q^2*(q^2+q+1),
	q^2*(q^2-1)*(q^2+q+1),
	q^3*(q+1)*(q^2+q+1),
	q^3*(q-1)*(q^2+q+1),
	q^3*(q-1)^2*(q+1)])
charinfo = Vector{Any}[
	["",[1,0],["A_2",[3]]],
	["",[1,1],["A_2",[2,1]]],
	["",[1,2],["A_2",[1,1,1]]],
	["",[2,0],["A_1",[2]]],
	["",[2,1],["A_1",[1,1]]],
	["",[3,0],["A_0",[1]]],
	["",[4,0],["A_0",[1]]],
	["",[5,0],["A_0",[1]]]]
chardegree = R.([1, q^2+q, q^3, q^2+q+1, q*(q^2+q+1), (q+1)*(q^2+q+1), (q-1)*(q^2+q+1), (q-1)^2*(q+1)])

classsums=[
function (tt::Cyclotomic)
	nesum(tt, a, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, a, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [b], [a])
	ss4,e1=nesum(tt, b, 0, q-2, congruence)
	ss5=ss4-tt1
	ss5,e2=nesum(ss5, a, 0, q-2, congruence)
	(ss5, union(e1,e2))
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [b], [a])
	ss4,e1=nesum(tt, b, 0, q-2, congruence)
	ss5=ss4-tt1
	ss5,e2=nesum(ss5, a, 0, q-2, congruence)
	(ss5, union(e1,e2))
end,
function (tt::Cyclotomic)
	ss6a,e1=nesum(tt, a, 0, q-2, congruence)
	ss6b,e2=nesum(ss6a, b, 0, q-2, congruence)
	ss6,e3=nesum(ss6b, c, 0, q-2, congruence)
	tt1=eesubs(tt, [b], [a])
	ss7a,e4=nesum(tt1, a, 0, q-2, congruence)
	ss7,e5=nesum(ss7a, c, 0, q-2, congruence)
	tt2=eesubs(tt, [c], [b])
	ss8a,e6=nesum(tt2, a, 0, q-2, congruence)
	ss8,e7=nesum(ss8a, b, 0, q-2, congruence)
	tt3=eesubs(tt, [c], [a])
	ss9a,e8=nesum(tt3, a, 0, q-2, congruence)
	ss9,e9=nesum(ss9a, b, 0, q-2, congruence)
	tt4a=eesubs(tt, [b], [a])
	tt4=eesubs(tt4a, [c], [a])
	ss10,e10=nesum(tt4, a, 0, q-2, congruence)
	(1//6*ss6-1//6*ss7-1//6*ss8-1//6*ss9+1//3*ss10, union(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10))
end,
function (tt::Cyclotomic)
	ss7,e1=nesum(tt, b, 0, q^2-2, congruence)
	tt1=eesubs(tt, [b], [(q+1)*b])
	ss8,e2=nesum(tt1, b, 0, q-2, congruence)
	tt1=ss7-ss8
	ss9,e3=nesum(tt1, a, 0, q-2, congruence)
	(1//2*ss9, union(e1,e2,e3))
end,
function (tt::Cyclotomic)
	ss8,e1=nesum(tt, a, 0, q^3-2, congruence)
	tt1=eesubs(tt, [a], [(q^2+q+1)*a])
	ss9,e2=nesum(tt1, a, 0, q-2, congruence)
	(1//3*ss8-1//3*ss9, union(e1,e2))
end
]

charsums=[
function (tt::Cyclotomic)
	nesum(tt, n, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, n, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, n, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [m], [n])
	ss4,e1=nesum(tt, m, 0, q-2, congruence)
	ss5=ss4-tt1
	ss5,e2=nesum(ss5, n, 0, q-2, congruence)
	(ss5, union(e1,e2))
end,
function (tt::Cyclotomic)
	tt1=eesubs(tt, [m], [n])
	ss4,e1=nesum(tt, m, 0, q-2, congruence)
	ss5=ss4-tt1
	ss5,e2=nesum(ss5, n, 0, q-2, congruence)
	(ss5, union(e1,e2))
end,
function (tt::Cyclotomic)
	ss6a,e1=nesum(tt, n, 0, q-2, congruence)
	ss6b,e2=nesum(ss6a, m, 0, q-2, congruence)
	ss6,e3=nesum(ss6b, l, 0, q-2, congruence)
	tt1=eesubs(tt, [m], [n])
	ss7a,e4=nesum(tt1, n, 0, q-2, congruence)
	ss7,e5=nesum(ss7a, l, 0, q-2, congruence)
	tt2=eesubs(tt, [l], [m])
	ss8a,e6=nesum(tt2, n, 0, q-2, congruence)
	ss8,e7=nesum(ss8a, m, 0, q-2, congruence)
	tt3=eesubs(tt, [l], [n])
	ss9a,e8=nesum(tt3, n, 0, q-2, congruence)
	ss9,e9=nesum(ss9a, m, 0, q-2, congruence)
	tt4a=eesubs(tt, [m], [n])
	tt4=eesubs(tt4a, [l], [n])
	ss10,e10=nesum(tt4, n, 0, q-2, congruence)
	(1//6*ss6-1//6*ss7-1//6*ss8-1//6*ss9+1//3*ss10, union(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10))
end,
function (tt::Cyclotomic)
	ss7,e1=nesum(tt, n, 0, q^2-2, congruence)
	tt1=eesubs(tt, [n], [(q+1)*n])
	ss8,e2=nesum(tt1, n, 0, q-2, congruence)
	tt1=ss7-ss8
	ss9,e3=nesum(tt1, m, 0, q-2, congruence)
	(1//2*ss9, union(e1,e2,e3))
end,
function (tt::Cyclotomic)
	ss8,e1=nesum(tt, n, 0, q^3-2, congruence)
	tt1=eesubs(tt, [n], [(q^2+q+1)*n])
	ss9,e2=nesum(tt1, n, 0, q-2, congruence)
	(1//3*ss8-1//3*ss9, union(e1,e2))
end
]

classparams=[
Parameters([Parameter(a, q-1)], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1)], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1)], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(a, q-1), Parameter(b, q-1)], [ParameterException((a-b)*1//(q-1))]),
Parameters([Parameter(a, q-1), Parameter(b, q-1)], [ParameterException((a-b)*1//(q-1))]),
Parameters([Parameter(a, q-1), Parameter(b, q-1), Parameter(c, q-1)], [ParameterException((a-b)*1//(q-1)), ParameterException((a-c)*1//(q-1)), ParameterException((b-c)*1//(q-1))]),
Parameters([Parameter(a, q-1), Parameter(b, q^2-1)], [ParameterException((b)*1//(q+1))]),
Parameters([Parameter(a, q^3-1)], [ParameterException((a)*1//(q^2+q+1))])
]

charparams=[
Parameters([Parameter(n, q-1)], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(n, q-1)], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(n, q-1)], ParameterException{QQPolyRingElem}[]),
Parameters([Parameter(n, q-1), Parameter(m, q-1)], [ParameterException((n-m)*1//(q-1))]),
Parameters([Parameter(n, q-1), Parameter(m, q-1)], [ParameterException((n-m)*1//(q-1))]),
Parameters([Parameter(n, q-1), Parameter(m, q-1), Parameter(l, q-1)], [ParameterException((n-m)*1//(q-1)), ParameterException((n-l)*1//(q-1)), ParameterException((m-l)*1//(q-1))]),
Parameters([Parameter(m, q-1), Parameter(n, q^2-1)], [ParameterException((n)*1//(q+1))]),
Parameters([Parameter(n, q^3-1)], [ParameterException((n)*1//(q^2+q+1))])
]

classparamindex=var_index.([a,b,c])
charparamindex=var_index.([l,m,n])
congruence=nothing

information = "- Information about the generic character table of \$GL_3(q)\$.

- CHEVIE-name of the table: ``GL3``

- The table was first computed in:
  {\\sc R.~Steinberg}, The representations of \$GL(3,q)\$, \$GL(4,q)\$, \$PGL(3,q)\$
  and \$PGL(4,q)\$, {\\em Can.\\ J.~Math.} {\\bf 3} (1951), 225--235.

- See also:
  {\\sc J.~A.~Green}, The characters of the finite general linear groups,
  {\\em Trans.\\ Amer.\\ Math.\\ Soc.} {\\bf 80} (1955), 402--447.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

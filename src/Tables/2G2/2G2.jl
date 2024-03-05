using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ExtendableMatrix, CharTable
using Oscar
K, sqrt3 = quadratic_field(3)
R, q = polynomial_ring(K, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
i,j,k,l, _...=gens(S, ["i", "j", "k", "l", "i1", "j1", "k1", "l1", "i2", "j2", "k2", "l2", "i3", "j3", "k3", "l3", "it1", "jt1", "kt1", "lt1", "it2", "jt2", "kt2", "lt2"])

order = q^6*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1)*(q-1)*(q+1)
table = Cyclotomic{Generic.Poly{AbsSimpleNumFieldElem}}[[
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1+q*sqrt3))*e2p(S(0)),
	(-1//2*(q^2+q*1//sqrt3))*e2p(S(0)),
	1//2//sqrt3*(-q+q^2*e2p(S(1//(4)))),
	1//2//sqrt3*(-q-q^2*e2p(S(1//(4)))),
	(q*1//sqrt3)*e2p(S(0)),
	-q*1//2//sqrt3*(1+sqrt3*e2p(S(1//(4)))),
	-q*1//2//sqrt3*(1-sqrt3*e2p(S(1//(4)))),
	(-1//2*(q^2-1))*e2p(S(0)),
	1//2*(1-q*e2p(S(1//(4)))),
	1//2*(1+q*e2p(S(1//(4)))),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1-q*sqrt3))*e2p(S(0)),
	(1//2*(q^2-q*1//sqrt3))*e2p(S(0)),
	1//2//sqrt3*(-q+q^2*e2p(S(1//(4)))),
	1//2//sqrt3*(-q-q^2*e2p(S(1//(4)))),
	(q*1//sqrt3)*e2p(S(0)),
	-q*1//2//sqrt3*(1+sqrt3*e2p(S(1//(4)))),
	-q*1//2//sqrt3*(1-sqrt3*e2p(S(1//(4)))),
	(1//2*(q^2-1))*e2p(S(0)),
	-1//2*(1-q*e2p(S(1//(4)))),
	-1//2*(1+q*e2p(S(1//(4)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1+q*sqrt3))*e2p(S(0)),
	(-1//2*(q^2+q*1//sqrt3))*e2p(S(0)),
	1//2//sqrt3*(-q-q^2*e2p(S(1//(4)))),
	1//2//sqrt3*(-q+q^2*e2p(S(1//(4)))),
	(q*1//sqrt3)*e2p(S(0)),
	-q*1//2//sqrt3*(1-sqrt3*e2p(S(1//(4)))),
	-q*1//2//sqrt3*(1+sqrt3*e2p(S(1//(4)))),
	(-1//2*(q^2-1))*e2p(S(0)),
	1//2*(1+q*e2p(S(1//(4)))),
	1//2*(1-q*e2p(S(1//(4)))),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1-q*sqrt3))*e2p(S(0)),
	(1//2*(q^2-q*1//sqrt3))*e2p(S(0)),
	1//2//sqrt3*(-q-q^2*e2p(S(1//(4)))),
	1//2//sqrt3*(-q+q^2*e2p(S(1//(4)))),
	(q*1//sqrt3)*e2p(S(0)),
	-q*1//2//sqrt3*(1-sqrt3*e2p(S(1//(4)))),
	-q*1//2//sqrt3*(1+sqrt3*e2p(S(1//(4)))),
	(1//2*(q^2-1))*e2p(S(0)),
	-1//2*(1+q*e2p(S(1//(4)))),
	-1//2*(1-q*e2p(S(1//(4)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(1//sqrt3*q*(q^4-1))*e2p(S(0)),
	(-q*1//sqrt3)*e2p(S(0)),
	1//sqrt3*(-q+q^2*e2p(S(1//(4)))),
	1//sqrt3*(-q-q^2*e2p(S(1//(4)))),
	(-q*1//sqrt3)*e2p(S(0)),
	q*1//2//sqrt3*(1+sqrt3*e2p(S(1//(4)))),
	q*1//2//sqrt3*(1-sqrt3*e2p(S(1//(4)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(1//sqrt3*q*(q^4-1))*e2p(S(0)),
	(-q*1//sqrt3)*e2p(S(0)),
	1//sqrt3*(-q-q^2*e2p(S(1//(4)))),
	1//sqrt3*(-q+q^2*e2p(S(1//(4)))),
	(-q*1//sqrt3)*e2p(S(0)),
	q*1//2//sqrt3*(1-sqrt3*e2p(S(1//(4)))),
	q*1//2//sqrt3*(1+sqrt3*e2p(S(1//(4)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(q^6)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q^2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	((q^2+1-q*sqrt3)*(q^2+1+q*sqrt3))*e2p(S(0)),
	(1-q^2)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	e2p(i*S(1//(2))),
	(0)*e2p(S(0)),
	e2p(i*S(1//(2)))+e2p(j*S(1//(2)))+e2p((i+j)*S(1//(2))),
	(0)*e2p(S(0))] [
	(q^2*(q^2+1-q*sqrt3)*(q^2+1+q*sqrt3))*e2p(S(0)),
	(q^2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-q^2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p(i*S(1//(2))),
	(0)*e2p(S(0)),
	-(e2p(i*S(1//(2)))+e2p(j*S(1//(2)))+e2p((i+j)*S(1//(2)))),
	(0)*e2p(S(0))] [
	((q^2+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3))*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(q^2+1)*e2p(k*S(1//(2))),
	e2p(k*S(1//(2))),
	e2p(k*S(1//(2))),
	e2p((i*k)*S(1//(q^2-1)))+e2p((-i*k)*S(1//(q^2-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q+1)*(q^2+sqrt3*q+1)*(q^2+1))*e2p(S(0)),
	(-q^2-1-sqrt3*q)*e2p(S(0)),
	(-sqrt3*q-1)*e2p(S(0)),
	(-sqrt3*q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-(e2p((i*k)*S(1//(q^2-sqrt3*q+1)))+e2p(((sqrt3*q-1)*i*k)*S(1//(q^2-sqrt3*q+1)))+e2p(((sqrt3*q-2)*i*k)*S(1//(q^2-sqrt3*q+1)))+e2p((-i*k)*S(1//(q^2-sqrt3*q+1)))+e2p(((-sqrt3*q+1)*i*k)*S(1//(q^2-sqrt3*q+1)))+e2p(((-sqrt3*q+2)*i*k)*S(1//(q^2-sqrt3*q+1)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q+1)*(q^2+1-q*sqrt3)*(q^2+1+q*sqrt3))*e2p(S(0)),
	(2*q^2-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(e2p(k*S(1//(2)))+e2p((k+l)*S(1//(2)))+e2p(l*S(1//(2))))*(q^2-1),
	-(e2p(k*S(1//(2)))+e2p((k+l)*S(1//(2)))+e2p(l*S(1//(2)))),
	-(e2p(k*S(1//(2)))+e2p((k+l)*S(1//(2)))+e2p(l*S(1//(2)))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-(e2p((2*i*k+1//2*j*l*q^2+1//2*j*l)*S(1//(q^2+1)))+e2p((i*k*q*sqrt3+i*k+1//2*k*j*q^2+1//2*k*j+1//2*l*i*q^2+1//2*l*i)*S(1//(q^2+1)))+e2p((i*k*q*sqrt3-i*k+1//2*k*j*q^2+1//2*k*j+1//2*l*i*q^2+1//2*l*i+1//2*j*l*q^2+1//2*j*l)*S(1//(q^2+1)))+e2p((-2*i*k+1//2*j*l*q^2+1//2*j*l)*S(1//(q^2+1)))+e2p((-i*k*q*sqrt3-i*k+1//2*k*j*q^2+1//2*k*j+1//2*l*i*q^2+1//2*l*i)*S(1//(q^2+1)))+e2p((i*k-i*k*q*sqrt3+1//2*k*j*q^2+1//2*k*j+1//2*l*i*q^2+1//2*l*i+1//2*j*l*q^2+1//2*j*l)*S(1//(q^2+1)))),
	(0)*e2p(S(0))] [
	((q-1)*(q+1)*(q^2-sqrt3*q+1)*(q^2+1))*e2p(S(0)),
	(-q^2-1+sqrt3*q)*e2p(S(0)),
	(sqrt3*q-1)*e2p(S(0)),
	(sqrt3*q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-(e2p((i*k)*S(1//(q^2+sqrt3*q+1)))+e2p(((sqrt3*q+2)*i*k)*S(1//(q^2+sqrt3*q+1)))+e2p(((sqrt3*q+1)*i*k)*S(1//(q^2+sqrt3*q+1)))+e2p((-i*k)*S(1//(q^2+sqrt3*q+1)))+e2p(((-sqrt3*q-2)*i*k)*S(1//(q^2+sqrt3*q+1)))+e2p(((-sqrt3*q-1)*i*k)*S(1//(q^2+sqrt3*q+1))))]]
classinfo = [
	["",[1,0],["^2G_2","1"],"1"],
	["",[1,1],["^2G_2","X"],"X"],
	["",[1,2],["^2G_2","T"],"T"],
	["",[1,3],["^2G_2","T^{-1}"],"T^{-1}"],
	["",[1,4],["^2G_2","Y"],"Y"],
	["",[1,5],["^2G_2","YT"],"YT"],
	["",[1,6],["^2G_2","YT^{-1}"],"YT^{-1}"],
	["",[2,0],["A_1","1"],"J"],
	["",[2,1],["A_1","T"],"JT"],
	["",[2,2],["A_1","T^{-1}"],"JT^{-1}"],
	["",[3,0],["A_0","1"],"R^aandJR^a"],
	["",[4,0],["A_0","1"],"V"],
	["",[5,0],["A_0","1"],"S^aandJS^a"],
	["",[6,0],["A_0","1"],"W"]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	1//2*q^2*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	1//2*q^2*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	1//3*q^4*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	1//3*q^4*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	1//3*q^4*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	q^4*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3),
	1//2*q^4*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	1//2*q^4*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	q^6*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3)*(q^2+1),
	q^6*(q-1)*(q+1)*(q^2+1)*(q^2+1+q*sqrt3),
	q^6*(q-1)*(q+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3),
	q^6*(q-1)*(q+1)*(q^2+1)*(q^2+1-q*sqrt3)])
charinfo = [
	["",[1,0],["^2G_2",0],"xi_1,one"],
	["",[1,1],["^2G_2",1],"xi_5"],
	["",[1,2],["^2G_2",2],"xi_6"],
	["",[1,3],["^2G_2",3],"xi_7"],
	["",[1,4],["^2G_2",4],"xi_8"],
	["",[1,5],["^2G_2",5],"xi_9"],
	["",[1,6],["^2G_2",6],"xi_{10}"],
	["",[1,7],["^2G_2",7],"xi_3,St"],
	["",[2,0],["A_1",[2]],"xi_2"],
	["",[2,1],["A_1",[1,1]],"xi_4"],
	["",[3,0],["A_0",[1]],"eta_randeta_r'"],
	["",[4,0],["A_0",[1]],"eta_i^-"],
	["",[5,0],["A_0",[1]],"eta_tandeta_t'"],
	["",[4,0],["A_0",[1]],"eta_i^+"]]
chardegree = R.([
	1,
	1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1+q*sqrt3),
	1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1-q*sqrt3),
	1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1+q*sqrt3),
	1//6*sqrt3*q*(q-1)*(q+1)*(q^2+1-q*sqrt3),
	1//sqrt3*q*(q^4-1),
	1//sqrt3*q*(q^4-1),
	q^6,
	(q^2+1-q*sqrt3)*(q^2+1+q*sqrt3),
	q^2*(q^2+1-q*sqrt3)*(q^2+1+q*sqrt3),
	(q^2+1)*(q^2+1+q*sqrt3)*(q^2+1-q*sqrt3),
	(q-1)*(q+1)*(q^2+sqrt3*q+1)*(q^2+1),
	(q-1)*(q+1)*(q^2+1-q*sqrt3)*(q^2+1+q*sqrt3),
	(q-1)*(q+1)*(q^2-sqrt3*q+1)*(q^2+1)])

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
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
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
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [0])
	s2=eesubs(tt, [i], [(q^2-1)*1//2])
	s3,e1=nesum(tt, i, 0, q^2-2, congruence)
	(1//2*s3-1//2*s2-1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q^2-sqrt3*q, congruence)
	(1//6*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [(q^2+1)*1//4])
	s2,e1=nesum(tt, i, 1, (q^2-1)*1//2, congruence)
	s2=1//6*s2-1//6*s1
	s1=eesubs(s2, [j], [0])
	s2=eesubs(s2, [j], [1])
	(s1+s2, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q^2+sqrt3*q, congruence)
	(1//6*s1, e1)end
]

charsums=[
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
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
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
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	(tt, Set{ParameterException{QQPolyRingElem}}())
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [0])
	s2=eesubs(tt, [k], [(q^2-1)*1//2])
	s3,e1=nesum(tt, k, 0, q^2-2, congruence)
	(1//2*s3-1//2*s2-1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q^2-sqrt3*q, congruence)
	(1//6*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q^2+1)*1//4])
	s2,e1=nesum(tt, k, 1, (q^2-1)*1//2, congruence)
	s2=1//6*s2-1//6*s1
	s1=eesubs(s2, [l], [0])
	s2=eesubs(s2, [l], [1])
	(s1+s2, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q^2+sqrt3*q, congruence)
	(1//6*s1, e1)end
]

classparams=[
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(i, q^2-1)], [ParameterException((i)*1//((q^2-1)*1//2))]),
Parameters([Parameter(i, q^2-sqrt3*q+1)], [ParameterException((i)*1//(q^2-sqrt3*q+1))]),
Parameters([Parameter(i, (q^2+1)*1//2), Parameter(j, R(2))], [ParameterException((i)*1//((q^2+1)*1//4))]),
Parameters([Parameter(i, q^2+sqrt3*q+1)], [ParameterException((i)*1//(q^2-sqrt3*q+1))])
]

charparams=[
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters(Parameter{Generic.Poly{AbsSimpleNumFieldElem}}[], ParameterException{Generic.Poly{AbsSimpleNumFieldElem}}[]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//((q^2-1)*1//2))]),
Parameters([Parameter(k, q^2-sqrt3*q+1)], [ParameterException((k)*1//(q^2-sqrt3*q+1))]),
Parameters([Parameter(k, (q^2+1)*1//2), Parameter(l, R(2))], [ParameterException((k)*1//((q^2+1)*1//4))]),
Parameters([Parameter(k, q^2+sqrt3*q+1)], [ParameterException((k)*1//(q^2-sqrt3*q+1))])
]

classparamindex=var_index.([i,j])
charparamindex=var_index.([k,l])
congruence=R.((-sqrt3,4*sqrt3))

information = "
- Information about the generic character table of the Ree groups
  ``^2G_2(q)``. The possible values for q are given by
   \$q^2 = 3^{2*m+1}\$ with m a non negative integer.

- CHEVIE-name of the table: ``ree``

- Most of the table was determined in:
  {\\sc H.~N.~Ward}, On Ree's series of simple groups,
  {\\em Trans.\\ Amer.\\ Math.\\ Soc.} {\\bf 121} (1966), 62--89.

- The values of the irreducible Deligne-Lusztig characters were
  computed by F.Luebeck.

- The names of class types and character types used in the above
  cited article can be recovered as fourths components of the 
  information given by ``PrintInfoClass`` and ``PrintInfoChar``.
  These names are also used as names for the unipotent parts of
  the classes.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

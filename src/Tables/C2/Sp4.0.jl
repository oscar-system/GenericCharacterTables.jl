using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ExtendableMatrix, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = UniversalPolynomialRing(Q, cached=false)
i,j,k,l, _...=gens(S, ["i", "j", "k", "l", "i1", "j1", "k1", "l1", "i2", "j2", "k2", "l2", "i3", "j3", "k3", "l3", "it1", "jt1", "kt1", "lt1", "it2", "jt2", "kt2", "lt2"])

order = q^4*(q-1)^2*(q+1)^2*(q^2+1)
table = Cyclotomic{QQPolyRingElem}[[
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
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	(1//2*q*(q+1)^2)*e2p(S(0)),
	(1//2*q*(q+1))*e2p(S(0)),
	(1//2*q*(q+1))*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(-1//2*q)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(2)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(1//2*q*(q^2+1))*e2p(S(0)),
	(-1//2*q*(q-1))*e2p(S(0)),
	(1//2*q*(q+1))*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(-1//2*q)*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(1//2*q*(q^2+1))*e2p(S(0)),
	(1//2*q*(q+1))*e2p(S(0)),
	(-1//2*q*(q-1))*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(-1//2*q)*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-1)*e2p(S(0))] [
	(1//2*q*(q-1)^2)*e2p(S(0)),
	(-1//2*q*(q-1))*e2p(S(0)),
	(-1//2*q*(q-1))*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(1//2*q)*e2p(S(0)),
	(-1//2*q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-2)*e2p(S(0))] [
	(q^4)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(-q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0))] [
	((q+1)*(q^2+1))*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(q^2+q+1)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	q+1+e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	1+e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))*q+e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))*q+e2p((-i*k)*S(1//(q-1))),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))+e2p((j*k)*S(1//(q-1)))+e2p((-j*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q*(q+1)*(q^2+1))*e2p(S(0)),
	(q*(q+1))*e2p(S(0)),
	(q)*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	q+1+e2p((i*k)*S(1//(q-1)))*q+e2p((-i*k)*S(1//(q-1)))*q,
	(1)*e2p(S(0)),
	(-q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))*q+e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))*q+e2p((-i*k)*S(1//(q-1))),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))+e2p((j*k)*S(1//(q-1)))+e2p((-j*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	-e2p((i*k)*S(1//(q-1)))-e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q^2+1))*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-q^2-1+q)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	q-1-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1))),
	-1-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((-i*k)*S(1//(q+1)))*q-e2p((-i*k)*S(1//(q+1)))+e2p((i*k)*S(1//(q+1)))*q-e2p((i*k)*S(1//(q+1))),
	-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-j*k)*S(1//(q+1)))-e2p((j*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1)))-e2p((-j*k)*S(1//(q+1)))-e2p((j*k)*S(1//(q+1)))] [
	(q*(q-1)*(q^2+1))*e2p(S(0)),
	(q*(q-1))*e2p(S(0)),
	(-q)*e2p(S(0)),
	(-q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	-q+1-e2p((-i*k)*S(1//(q+1)))*q-e2p((i*k)*S(1//(q+1)))*q,
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-i*k)*S(1//(q+1)))*q+e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1)))*q+e2p((i*k)*S(1//(q+1))),
	e2p((-i*k)*S(1//(q+1)))+e2p((i*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-j*k)*S(1//(q+1)))-e2p((j*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	e2p((-i*k)*S(1//(q+1)))+e2p((i*k)*S(1//(q+1)))+e2p((-j*k)*S(1//(q+1)))+e2p((j*k)*S(1//(q+1)))] [
	((q+1)*(q^2+1))*e2p(S(0)),
	(q^2+q+1)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))*q+e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))*q+e2p((-i*k)*S(1//(q-1))),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	q+1+e2p((-2*i*k)*S(1//(q-1)))+e2p((2*i*k)*S(1//(q-1))),
	1+e2p((-2*i*k)*S(1//(q-1)))+e2p((2*i*k)*S(1//(q-1))),
	(q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((-i*k-j*k)*S(1//(q-1)))+e2p((j*k+i*k)*S(1//(q-1)))+e2p((-j*k+i*k)*S(1//(q-1)))+e2p((-i*k+j*k)*S(1//(q-1))),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	(q*(q+1)*(q^2+1))*e2p(S(0)),
	(q)*e2p(S(0)),
	(q*(q+1))*e2p(S(0)),
	(q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))*q+e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))*q+e2p((-i*k)*S(1//(q-1))),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	q+1+q*e2p((-2*i*k)*S(1//(q-1)))+q*e2p((2*i*k)*S(1//(q-1))),
	(1)*e2p(S(0)),
	(-q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	e2p((-i*k-j*k)*S(1//(q-1)))+e2p((j*k+i*k)*S(1//(q-1)))+e2p((-j*k+i*k)*S(1//(q-1)))+e2p((-i*k+j*k)*S(1//(q-1))),
	-e2p((i*k)*S(1//(q-1)))-e2p((-i*k)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q^2+1))*e2p(S(0)),
	(-q^2-1+q)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((-i*k)*S(1//(q+1)))*q-e2p((-i*k)*S(1//(q+1)))+e2p((i*k)*S(1//(q+1)))*q-e2p((i*k)*S(1//(q+1))),
	-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1))),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	q-1-e2p((-2*i*k)*S(1//(q+1)))-e2p((2*i*k)*S(1//(q+1))),
	-1-e2p((-2*i*k)*S(1//(q+1)))-e2p((2*i*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-i*k-j*k)*S(1//(q+1)))-e2p((j*k+i*k)*S(1//(q+1)))-e2p((-i*k+j*k)*S(1//(q+1)))-e2p((-j*k+i*k)*S(1//(q+1)))] [
	(q*(q-1)*(q^2+1))*e2p(S(0)),
	(-q)*e2p(S(0)),
	(q*(q-1))*e2p(S(0)),
	(-q)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-i*k)*S(1//(q+1)))*q+e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1)))*q+e2p((i*k)*S(1//(q+1))),
	e2p((-i*k)*S(1//(q+1)))+e2p((i*k)*S(1//(q+1))),
	(q-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	-q+1-q*e2p((-2*i*k)*S(1//(q+1)))-q*e2p((2*i*k)*S(1//(q+1))),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((-i*k-j*k)*S(1//(q+1)))+e2p((j*k+i*k)*S(1//(q+1)))+e2p((-i*k+j*k)*S(1//(q+1)))+e2p((-j*k+i*k)*S(1//(q+1)))] [
	((q+1)^2*(q^2+1))*e2p(S(0)),
	((q+1)^2)*e2p(S(0)),
	((q+1)^2)*e2p(S(0)),
	(2*q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))*q+e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))*q+e2p((-i*k)*S(1//(q-1)))+e2p((-i*l)*S(1//(q-1)))*q+e2p((-i*l)*S(1//(q-1)))+e2p((i*l)*S(1//(q-1)))*q+e2p((i*l)*S(1//(q-1))),
	e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))+e2p((-i*l)*S(1//(q-1)))+e2p((i*l)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((-i*k-i*l)*S(1//(q-1)))*q+e2p((-i*k-i*l)*S(1//(q-1)))+e2p((-i*k+i*l)*S(1//(q-1)))*q+e2p((-i*k+i*l)*S(1//(q-1)))+e2p((i*k+i*l)*S(1//(q-1)))*q+e2p((i*k+i*l)*S(1//(q-1)))+e2p((i*k-i*l)*S(1//(q-1)))*q+e2p((i*k-i*l)*S(1//(q-1))),
	e2p((-i*k-i*l)*S(1//(q-1)))+e2p((-i*k+i*l)*S(1//(q-1)))+e2p((i*k+i*l)*S(1//(q-1)))+e2p((i*k-i*l)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((j*k-i*l)*S(1//(q-1)))+e2p((-i*k-j*l)*S(1//(q-1)))+e2p((j*k+i*l)*S(1//(q-1)))+e2p((i*k+j*l)*S(1//(q-1)))+e2p((-j*k+i*l)*S(1//(q-1)))+e2p((i*k-j*l)*S(1//(q-1)))+e2p((-j*k-i*l)*S(1//(q-1)))+e2p((-i*k+j*l)*S(1//(q-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q+1)*(q^2+1))*e2p(S(0)),
	(-q^2-1)*e2p(S(0)),
	((q-1)*(q+1))*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))*q-e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))*q-e2p((-i*k)*S(1//(q-1))),
	-e2p((i*k)*S(1//(q-1)))-e2p((-i*k)*S(1//(q-1))),
	-e2p((-i*k)*S(1//(q+1)))*q-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1)))*q-e2p((i*k)*S(1//(q+1))),
	-e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1))),
	(0)*e2p(S(0)),
	-e2p((i*k)*S(1//(q^2-1)))-e2p((-q*i*k)*S(1//(q^2-1)))-e2p((q*i*k)*S(1//(q^2-1)))-e2p((-i*k)*S(1//(q^2-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)*(q+1)*(q^2+1))*e2p(S(0)),
	((q-1)*(q+1))*e2p(S(0)),
	(-q^2-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	(-1)*e2p(S(0)),
	e2p((i*k)*S(1//(q-1)))*q-e2p((i*k)*S(1//(q-1)))+e2p((-i*k)*S(1//(q-1)))*q-e2p((-i*k)*S(1//(q-1))),
	-e2p((i*k)*S(1//(q-1)))-e2p((-i*k)*S(1//(q-1))),
	-e2p((i*l)*S(1//(q+1)))*q-e2p((i*l)*S(1//(q+1)))-e2p((-i*l)*S(1//(q+1)))*q-e2p((-i*l)*S(1//(q+1))),
	-e2p((i*l)*S(1//(q+1)))-e2p((-i*l)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-q*i*k-i*k-j*l*q+j*l)*S(1//(q^2-1)))-e2p((q*i*k+i*k-j*l*q+j*l)*S(1//(q^2-1)))-e2p((-q*i*k-i*k+j*l*q-j*l)*S(1//(q^2-1)))-e2p((q*i*k+i*k+j*l*q-j*l)*S(1//(q^2-1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0))] [
	((q-1)^2*(q+1)^2)*e2p(S(0)),
	(-(q-1)*(q+1))*e2p(S(0)),
	(-(q-1)*(q+1))*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((-q*i*k)*S(1//(q^2+1)))+e2p((-i*k)*S(1//(q^2+1)))+e2p((q*i*k)*S(1//(q^2+1)))+e2p((i*k)*S(1//(q^2+1))),
	(0)*e2p(S(0))] [
	((q-1)^2*(q^2+1))*e2p(S(0)),
	((q-1)^2)*e2p(S(0)),
	((q-1)^2)*e2p(S(0)),
	(-2*q+1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(1)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-i*k)*S(1//(q+1)))*q+e2p((-i*k)*S(1//(q+1)))-e2p((i*k)*S(1//(q+1)))*q+e2p((i*k)*S(1//(q+1)))-e2p((i*l)*S(1//(q+1)))*q+e2p((i*l)*S(1//(q+1)))-e2p((-i*l)*S(1//(q+1)))*q+e2p((-i*l)*S(1//(q+1))),
	e2p((-i*k)*S(1//(q+1)))+e2p((i*k)*S(1//(q+1)))+e2p((i*l)*S(1//(q+1)))+e2p((-i*l)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	-e2p((-i*k-i*l)*S(1//(q+1)))*q+e2p((-i*k-i*l)*S(1//(q+1)))-e2p((i*k-i*l)*S(1//(q+1)))*q+e2p((i*k-i*l)*S(1//(q+1)))-e2p((-i*k+i*l)*S(1//(q+1)))*q+e2p((-i*k+i*l)*S(1//(q+1)))-e2p((i*k+i*l)*S(1//(q+1)))*q+e2p((i*k+i*l)*S(1//(q+1))),
	e2p((-i*k-i*l)*S(1//(q+1)))+e2p((i*k-i*l)*S(1//(q+1)))+e2p((-i*k+i*l)*S(1//(q+1)))+e2p((i*k+i*l)*S(1//(q+1))),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	(0)*e2p(S(0)),
	e2p((-i*k-j*l)*S(1//(q+1)))+e2p((j*k+i*l)*S(1//(q+1)))+e2p((-i*k+j*l)*S(1//(q+1)))+e2p((j*k-i*l)*S(1//(q+1)))+e2p((-j*k-i*l)*S(1//(q+1)))+e2p((i*k+j*l)*S(1//(q+1)))+e2p((i*k-j*l)*S(1//(q+1)))+e2p((-j*k+i*l)*S(1//(q+1)))]]
classinfo = Vector{Any}[
	["",[1,0],"C_2","A1"],
	["",[1,1],"C_2","A2"],
	["",[1,2],"C_2","A31"],
	["",[1,3],"C_2","A32"],
	["",[1,4],"C_2","A41"],
	["",[1,5],"C_2","A42"],
	["",[4,0],"A_1","C1"],
	["",[4,1],"A_1","D1"],
	["",[5,0],"A_1","C3"],
	["",[5,1],"A_1","D3"],
	["",[6,0],"A_1","C2"],
	["",[6,1],"A_1","D2"],
	["",[7,0],"A_1","C4"],
	["",[7,1],"A_1","D4"],
	["",[8,0],"A_0","B1"],
	["",[9,0],"A_0","B2"],
	["",[10,0],"A_0","B3"],
	["",[11,0],"A_0","B5"],
	["",[12,0],"A_0","B4"]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+1),
	(q-1)*(q+1)*(q^2+1),
	(q-1)^2*(q+1)^2*(q^2+1),
	1//2*q^2*(q-1)^2*(q+1)^2*(q^2+1),
	1//2*q^2*(q-1)^2*(q+1)^2*(q^2+1),
	q^3*(q+1)*(q^2+1),
	q^3*(q-1)*(q+1)^2*(q^2+1),
	q^3*(q-1)*(q^2+1),
	q^3*(q-1)^2*(q+1)*(q^2+1),
	q^3*(q+1)*(q^2+1),
	q^3*(q-1)*(q+1)^2*(q^2+1),
	q^3*(q-1)*(q^2+1),
	q^3*(q-1)^2*(q+1)*(q^2+1),
	q^4*(q+1)^2*(q^2+1),
	q^4*(q-1)*(q+1)*(q^2+1),
	q^4*(q-1)*(q+1)*(q^2+1),
	q^4*(q-1)^2*(q+1)^2,
	q^4*(q-1)^2*(q^2+1)])
charinfo = Vector{Any}[
	["",[1,0],"B_2","theta0"],
	["",[1,1],"B_2","theta1"],
	["",[1,2],"B_2","theta2"],
	["",[1,3],"B_2","theta3"],
	["",[1,4],"B_2","theta5"],
	["",[1,5],"B_2","theta4"],
	["",[2,0],"A_1","chi6"],
	["",[2,1],"A_1","chi10"],
	["",[3,0],"A_1","chi8"],
	["",[3,1],"A_1","chi12"],
	["",[4,0],"A_1","chi7"],
	["",[4,1],"A_1","chi11"],
	["",[5,0],"A_1","chi9"],
	["",[5,1],"A_1","chi13"],
	["",[6,0],"A_0","chi1"],
	["",[7,0],"A_0","chi2"],
	["",[8,0],"A_0","chi3"],
	["",[9,0],"A_0","chi5"],
	["",[10,0],"A_0","chi4"]]
chardegree = R.([
	1,
	1//2*q*(q+1)^2,
	1//2*q*(q^2+1),
	1//2*q*(q^2+1),
	1//2*q*(q-1)^2,
	q^4,
	(q+1)*(q^2+1),
	q*(q+1)*(q^2+1),
	(q-1)*(q^2+1),
	q*(q-1)*(q^2+1),
	(q+1)*(q^2+1),
	q*(q+1)*(q^2+1),
	(q-1)*(q^2+1),
	q*(q-1)*(q^2+1),
	(q+1)^2*(q^2+1),
	(q-1)*(q+1)*(q^2+1),
	(q-1)*(q+1)*(q^2+1),
	(q-1)^2*(q+1)^2,
	(q-1)^2*(q^2+1)])

classsums=[
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [j], [i])
	s2=eesubs(tt, [j], [-i])
	s3,e1=nesum(tt, j, 1, q-2, congruence)
	s3=s3-s2-s1
	s3,e2=nesum(s3, i, 1, q-2, congruence)
	(1//8*s3, union(e1,e2))
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [(q-1)*i])
	s1,e1=nesum(s1, i, 1, q, congruence)
	s2=eesubs(tt, [i], [(q+1)*i])
	s2,e2=nesum(s2, i, 1, q-2, congruence)
	s3,e3=nesum(tt, i, 1, q^2-2, congruence)
	(1//4*s3-1//4*s2-1//4*s1, union(e1,e2,e3))
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, j, 1, q, congruence)
	s1,e2=nesum(s1, i, 1, q-2, congruence)
	(1//4*s1, union(e1,e2))
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, i, 1, q^2, congruence)
	(1//4*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [j], [i])
	s2=eesubs(tt, [j], [-i])
	s3,e1=nesum(tt, j, 1, q, congruence)
	s3=s3-s2-s1
	s3,e2=nesum(s3, i, 1, q, congruence)
	(1//8*s3, union(e1,e2))
end
]

charsums=[
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	(tt, Set())
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q-2, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q, congruence)
	(1//2*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [l], [k])
	s2=eesubs(tt, [l], [-k])
	s3,e1=nesum(tt, l, 1, q-2, congruence)
	s3=s3-s2-s1
	s3,e2=nesum(s3, k, 1, q-2, congruence)
	(1//8*s3, union(e1,e2))
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q-1)*k])
	s1,e1=nesum(s1, k, 1, q, congruence)
	s2=eesubs(tt, [k], [(q+1)*k])
	s2,e2=nesum(s2, k, 1, q-2, congruence)
	s3,e3=nesum(tt, k, 1, q^2-2, congruence)
	(1//4*s3-1//4*s2-1//4*s1, union(e1,e2,e3))
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, l, 1, q, congruence)
	s1,e2=nesum(s1, k, 1, q-2, congruence)
	(1//4*s1, union(e1,e2))
end,
function (tt::Cyclotomic)
	s1,e1=nesum(tt, k, 1, q^2, congruence)
	(1//4*s1, e1)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [l], [k])
	s2=eesubs(tt, [l], [-k])
	s3,e1=nesum(tt, l, 1, q, congruence)
	s3=s3-s2-s1
	s3,e2=nesum(s3, k, 1, q, congruence)
	(1//8*s3, union(e1,e2))
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//(q-1))]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//(q-1))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//(q+1))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//(q+1))]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//(q-1))]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//(q-1))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//(q+1))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//(q+1))]),
Parameters([Parameter(i, q-1), Parameter(j, q-1)], [ParameterException((i+j)*1//(q-1)), ParameterException((i-j)*1//(q-1))]),
Parameters([Parameter(i, q^2-1)], [ParameterException((i)*1//(q-1)), ParameterException((i)*1//(q+1))]),
Parameters([Parameter(i, q-1), Parameter(j, q+1)], [ParameterException((i)*1//(q-1)), ParameterException((j)*1//(q+1))]),
Parameters([Parameter(i, q^2+1)], [ParameterException((i)*1//(q^2+1))]),
Parameters([Parameter(i, q+1), Parameter(j, q+1)], [ParameterException((i+j)*1//(q+1)), ParameterException((i-j)*1//(q+1))])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//(q-1))]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//(q-1))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//(q+1))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//(q+1))]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//(q-1))]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//(q-1))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//(q+1))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//(q+1))]),
Parameters([Parameter(k, q-1), Parameter(l, q-1)], [ParameterException((k+l)*1//(q-1)), ParameterException((k-l)*1//(q-1))]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//(q-1)), ParameterException((k)*1//(q+1))]),
Parameters([Parameter(k, q-1), Parameter(l, q+1)], [ParameterException((k)*1//(q-1)), ParameterException((l)*1//(q+1))]),
Parameters([Parameter(k, q^2+1)], [ParameterException((k)*1//(q^2+1))]),
Parameters([Parameter(k, q+1), Parameter(l, q+1)], [ParameterException((k+l)*1//(q+1)), ParameterException((k-l)*1//(q+1))])
]

classparamindex=var_index.([i,j])
charparamindex=var_index.([k,l])
congruence=R.((0,2))

information = "Information about the generic character table of \$Sp_4(q)\$, \$q\$ even

- CHEVIE-name of the table: ``Sp4.0``

- The table was first computed in:
  {\\sc H.Enomoto}, The characters of the finite symplectic group
  \$Sp(4,q)\$, \$q=2^f\$, {\\em Osaka J. Math.} {\\bf 9} (1972), 75--94.

- The table in the cited paper contains a lot of misprints.
  The table in the CHEVIE-library was recomputed by F.Luebeck
  (using Deligne--Lusztig theory).

- The names for the class (respectively character) types used in the
  paper of Enomoto can be found as 4th component of the lists
  in the (-1)st row (resp. column) of the table. Example:
> ``Sp4.0``[-1,3][4];

                                      A31

  shows, that the class type of the third column of the table
  is called A31 by Enomoto.
"

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

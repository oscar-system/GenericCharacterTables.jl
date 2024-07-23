using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, CharTable
using Oscar
R, q = polynomial_ring(QQ, "q")
Q = fraction_field(R)
S = universal_polynomial_ring(Q; cached=false)
i,j,k,l, _...=gens(S, ["i", "j", "k", "l", "i1", "j1", "k1", "l1", "i2", "j2", "k2", "l2", "i3", "j3", "k3", "l3", "it1", "jt1", "kt1", "lt1", "it2", "jt2", "kt2", "lt2"])

order = q^6*(q^2-1)^2*(q^4+q^2+1)
table = Cyclotomic{QQPolyRingElem}[[
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0))] [
	(1//6*q*(q^2+q+1)*(q+1)^2)*CycloSum(R(1), S(0)),
	(1//6*q*(q+1)*(2*q+1))*CycloSum(R(1), S(0)),
	(1//2*q*(q+1))*CycloSum(R(1), S(0)),
	(1//6*q*(5+q))*CycloSum(R(1), S(0)),
	(-1//6*q*(q-1))*CycloSum(R(1), S(0)),
	(1//6*q*(q-1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(1//2*(q+1)^2)*CycloSum(R(1), S(0)),
	(1//2*q+1//2)*CycloSum(R(1), S(0)),
	(1//2*q+1//2)*CycloSum(R(1), S(0)),
	(1//2*q+1//2)*CycloSum(R(1), S(0)),
	(-1//2*q+1//2)*CycloSum(R(1), S(0)),
	(1//3*(q+1)*(q^2+q+1))*CycloSum(R(1), S(0)),
	(2//3*q+1//3)*CycloSum(R(1), S(0)),
	(2//3*q+1//3)*CycloSum(R(1), S(0)),
	(-1//3*q+1//3)*CycloSum(R(1), S(0)),
	(-1//3*q+1//3)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), S(0))] [
	(1//2*q*(q^2-q+1)*(q+1)^2)*CycloSum(R(1), S(0)),
	(1//2*q*(q+1))*CycloSum(R(1), S(0)),
	(1//2*q*(q+1))*CycloSum(R(1), S(0)),
	(-1//2*q*(q-1))*CycloSum(R(1), S(0)),
	(1//2*q*(q+1))*CycloSum(R(1), S(0)),
	(-1//2*q*(q-1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(1//2*(q+1)^2)*CycloSum(R(1), S(0)),
	(1//2*q+1//2)*CycloSum(R(1), S(0)),
	(1//2*q+1//2)*CycloSum(R(1), S(0)),
	(-1//2*q+1//2)*CycloSum(R(1), S(0)),
	(1//2*q+1//2)*CycloSum(R(1), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0))] [
	(1//3*q*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(-1//3*q*(q-1)*(q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(1//3*q*(5+q))*CycloSum(R(1), S(0)),
	(-1//3*q*(q-1))*CycloSum(R(1), S(0)),
	(1//3*q*(q-1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(1//3*(2*q-1)*(q^2+q+1))*CycloSum(R(1), S(0)),
	(1//3*q-1//3)*CycloSum(R(1), S(0)),
	(-1//3-2//3*q)*CycloSum(R(1), S(0)),
	(1//3*q-1//3)*CycloSum(R(1), S(0)),
	(1//3*q-1//3)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(1//3*q*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(1//3*q*(2*q^2+1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(1//3*q*(q-1))*CycloSum(R(1), S(0)),
	(-1//3*q*(q-1))*CycloSum(R(1), S(0)),
	(1//3*q*(2+q))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(-1//3*(q-2)*(q^2+q+1))*CycloSum(R(1), S(0)),
	(1//3*q+2//3)*CycloSum(R(1), S(0)),
	(2//3-2//3*q)*CycloSum(R(1), S(0)),
	(1//3*q+2//3)*CycloSum(R(1), S(0)),
	(1//3*q+2//3)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(1//6*q*(q^2-q+1)*(q-1)^2)*CycloSum(R(1), S(0)),
	(1//6*q*(q-1)*(2*q-1))*CycloSum(R(1), S(0)),
	(-1//2*q*(q-1))*CycloSum(R(1), S(0)),
	(1//6*q*(5+q))*CycloSum(R(1), S(0)),
	(-1//6*q*(q-1))*CycloSum(R(1), S(0)),
	(1//6*q*(q-1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(-1//2*(q-1)^2)*CycloSum(R(1), S(0)),
	(1//2*q-1//2)*CycloSum(R(1), S(0)),
	(1//2*q-1//2)*CycloSum(R(1), S(0)),
	(-1//2*q-1//2)*CycloSum(R(1), S(0)),
	(1//2*q-1//2)*CycloSum(R(1), S(0)),
	(1//3*(q+1)*(q-1)^2)*CycloSum(R(1), S(0)),
	(-1//3*q+1//3)*CycloSum(R(1), S(0)),
	(2//3*q+1//3)*CycloSum(R(1), S(0)),
	(-1//3*q+1//3)*CycloSum(R(1), S(0)),
	(-1//3*q+1//3)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(-2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0))] [
	(1//2*q*(q^2+q+1)*(q-1)^2)*CycloSum(R(1), S(0)),
	(-1//2*q*(q-1))*CycloSum(R(1), S(0)),
	(-1//2*q*(q-1))*CycloSum(R(1), S(0)),
	(-1//2*q*(q-1))*CycloSum(R(1), S(0)),
	(1//2*q*(q+1))*CycloSum(R(1), S(0)),
	(-1//2*q*(q-1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(-1//2*(q-1)^2)*CycloSum(R(1), S(0)),
	(1//2*q-1//2)*CycloSum(R(1), S(0)),
	(1//2*q-1//2)*CycloSum(R(1), S(0)),
	(1//2*q-1//2)*CycloSum(R(1), S(0)),
	(-1//2*q-1//2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(-2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0))] [
	(1//3*q*(q-1)^2*(q+1)^2)*CycloSum(R(1), S(0)),
	(-1//3*q*(q-1)*(q+1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(1//3*q*(q-1))*CycloSum(R(1), S(0)),
	(-1//3*q*(q-1))*CycloSum(R(1), S(0)),
	(1//3*q*(2+q))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(-1//3*(q+1)*(q-1)^2)*CycloSum(R(1), S(0)),
	(1//3*q-1//3)*CycloSum(R(1), S(0)),
	(1//3*q-1//3)*CycloSum(R(1), S(0)),
	-1//3+q*CycloSum(R(1), S(1//(3)))+1//3*q,
	-1//3-2//3*q-q*CycloSum(R(1), S(1//(3))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0))] [
	(1//3*q*(q-1)^2*(q+1)^2)*CycloSum(R(1), S(0)),
	(-1//3*q*(q-1)*(q+1))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(1//3*q*(q-1))*CycloSum(R(1), S(0)),
	(-1//3*q*(q-1))*CycloSum(R(1), S(0)),
	(1//3*q*(2+q))*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(-1//3*(q+1)*(q-1)^2)*CycloSum(R(1), S(0)),
	(1//3*q-1//3)*CycloSum(R(1), S(0)),
	(1//3*q-1//3)*CycloSum(R(1), S(0)),
	-1//3-2//3*q-q*CycloSum(R(1), S(1//(3))),
	-1//3+q*CycloSum(R(1), S(1//(3)))+1//3*q,
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0))] [
	(q^6)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q^2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q^3)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(-q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(-q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0))] [
	((q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q^2+1)*CycloSum(R(1), S(0)),
	(q^2+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(2*q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q^2+q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	q*CycloSum(R(1), i*S(1//(2)))+CycloSum(R(1), i*S(1//(2)))+1,
	CycloSum(R(1), i*S(1//(2)))+1,
	q*CycloSum(R(1), i*S(1//(2)))+CycloSum(R(1), i*S(1//(2)))+1,
	CycloSum(R(1), i*S(1//(2)))+1,
	-q*CycloSum(R(1), i*S(1//(2)))+1+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2)))+1,
	-q*CycloSum(R(1), i*S(1//(2)))+1+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2)))+1,
	CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q*(q^2+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q^2+q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q^2+q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	q*CycloSum(R(1), i*S(1//(2)))+q+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	q*CycloSum(R(1), i*S(1//(2)))+CycloSum(R(1), i*S(1//(2)))+1,
	CycloSum(R(1), i*S(1//(2)))+1,
	q*CycloSum(R(1), i*S(1//(2)))-1-CycloSum(R(1), i*S(1//(2))),
	-1-CycloSum(R(1), i*S(1//(2))),
	q*CycloSum(R(1), i*S(1//(2)))+q-CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))-CycloSum(R(1), j*S(1//(2)))-CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(2*q)*CycloSum(R(1), S(0)),
	(3*q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q^2+q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q*(q^2+q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	q*CycloSum(R(1), i*S(1//(2)))+CycloSum(R(1), i*S(1//(2)))+1,
	CycloSum(R(1), i*S(1//(2)))+1,
	q*CycloSum(R(1), i*S(1//(2)))+q+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	q*CycloSum(R(1), i*S(1//(2)))+q-CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2))),
	q*CycloSum(R(1), i*S(1//(2)))-1-CycloSum(R(1), i*S(1//(2))),
	-1-CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))-CycloSum(R(1), j*S(1//(2)))-CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q^2*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q^2)*CycloSum(R(1), S(0)),
	(q^2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q^2+2*q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q*(q^2+q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	q*CycloSum(R(1), i*S(1//(2)))+q+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	q*CycloSum(R(1), i*S(1//(2)))+q+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	-q-q*CycloSum(R(1), i*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	-q-q*CycloSum(R(1), i*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(1), i*S(1//(2)))*CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), j*S(1//(2)))+CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2))),
	-CycloSum(R(1), i*S(1//(2))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	(2*q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(-q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), i*S(1//(3)))+CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(1), i*S(1//(3)))+CycloSum(R(1), (-i)*S(1//(3))),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i-j)*S(1//(3)))+CycloSum(R(1), (-i+j)*S(1//(3))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), i*S(1//(3)))+CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), i*S(1//(3)))+CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(0), S(0))] [
	(q*(q^2-q+1)*(q+1)^2)*CycloSum(R(1), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	((q+1)^2)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	((q+1)*(q^2+1))*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	q*CycloSum(R(1), i*S(1//(3)))+q*CycloSum(R(1), (-i)*S(1//(3)))+CycloSum(R(1), i*S(1//(3)))+CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(1), i*S(1//(3)))+CycloSum(R(1), (-i)*S(1//(3))),
	(2*q+2)*CycloSum(R(1), S(0)),
	(2)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	2*CycloSum(R(1), (i-j)*S(1//(3)))+2*CycloSum(R(1), (-i+j)*S(1//(3))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), i*S(1//(3)))-CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(0), S(0))] [
	(q^3*(q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q^3)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	q*CycloSum(R(1), i*S(1//(3)))+q*CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(0), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(-q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i-j)*S(1//(3)))+CycloSum(R(1), (-i+j)*S(1//(3))),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), i*S(1//(3)))-CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), i*S(1//(3)))+CycloSum(R(1), (-i)*S(1//(3))),
	CycloSum(R(0), S(0))] [
	((q+1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q^2+q+1)*CycloSum(R(1), S(0)),
	((q+1)^2)*CycloSum(R(1), S(0)),
	(3*q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*(q*CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), k*S(1//(2)))+1),
	q*CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), k*S(1//(2)))+1,
	(CycloSum(R(1), k*S(1//(2)))+1)*(q+1),
	CycloSum(R(1), k*S(1//(2)))+1,
	CycloSum(R(1), k*S(1//(2)))+1,
	((q+1)*(q^2+q+1))*CycloSum(R(1), S(0)),
	(2*q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	q*CycloSum(R(1), (i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (2*i*k)*S(1//(q-1)))+CycloSum(R(1), (-2*i*k)*S(1//(q-1))),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (2*i*k)*S(1//(q-1)))+CycloSum(R(1), (-2*i*k)*S(1//(q-1))),
	q*CycloSum(R(1), (3*i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-3*i*k)*S(1//(q-1)))+q+CycloSum(R(1), (3*i*k)*S(1//(q-1)))+CycloSum(R(1), (-3*i*k)*S(1//(q-1)))+1,
	CycloSum(R(1), (3*i*k)*S(1//(q-1)))+CycloSum(R(1), (-3*i*k)*S(1//(q-1)))+1,
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k+2*j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k-2*j*k)*S(1//(q-1)))+CycloSum(R(1), (2*i*k+j*k)*S(1//(q-1)))+CycloSum(R(1), (-2*i*k-j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k+j*k)*S(1//(q-1)))+CycloSum(R(1), (i*k-j*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q*(q+1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q*(q^2+q+1))*CycloSum(R(1), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q+1)*(q*CycloSum(R(1), k*S(1//(2)))+q+CycloSum(R(1), k*S(1//(2)))),
	q*CycloSum(R(1), k*S(1//(2)))+q+CycloSum(R(1), k*S(1//(2))),
	(q+1)*CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	((q+1)*(q^2+q+1))*CycloSum(R(1), S(0)),
	(2*q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	q*CycloSum(R(1), (i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-i*k)*S(1//(q-1)))+q*CycloSum(R(1), (2*i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-2*i*k)*S(1//(q-1)))+CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1))),
	q*CycloSum(R(1), (3*i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-3*i*k)*S(1//(q-1)))+q+CycloSum(R(1), (3*i*k)*S(1//(q-1)))+CycloSum(R(1), (-3*i*k)*S(1//(q-1)))+1,
	CycloSum(R(1), (3*i*k)*S(1//(q-1)))+CycloSum(R(1), (-3*i*k)*S(1//(q-1)))+1,
	(-q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k+2*j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k-2*j*k)*S(1//(q-1)))+CycloSum(R(1), (2*i*k+j*k)*S(1//(q-1)))+CycloSum(R(1), (-2*i*k-j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k+j*k)*S(1//(q-1)))+CycloSum(R(1), (i*k-j*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k)*S(1//(q-1)))-CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((q+1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	((q+1)*(q^2+1))*CycloSum(R(1), S(0)),
	(q^2+q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)*(q*CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), k*S(1//(2)))+1),
	(CycloSum(R(1), k*S(1//(2)))+1)*(q+1),
	q*CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), k*S(1//(2)))+1,
	CycloSum(R(1), k*S(1//(2)))+1,
	CycloSum(R(1), k*S(1//(2)))+1,
	(q^2+q+1)*(CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3)))),
	(CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3))))*(q+1),
	CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3))),
	CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3))),
	CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3))),
	q*CycloSum(R(1), (i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-i*k)*S(1//(q-1)))+q+CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+1,
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+1,
	q*CycloSum(R(1), (i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (2*i*k)*S(1//(q-1)))+CycloSum(R(1), (-2*i*k)*S(1//(q-1))),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (2*i*k)*S(1//(q-1)))+CycloSum(R(1), (-2*i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (j*k)*S(1//(q-1)))+CycloSum(R(1), (-j*k)*S(1//(q-1)))+CycloSum(R(1), (i*k+j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k-j*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q*(q+1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q*(q+1))*CycloSum(R(1), S(0)),
	(q*(2+q))*CycloSum(R(1), S(0)),
	(3*q)*CycloSum(R(1), S(0)),
	(q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q+1)*(q*CycloSum(R(1), k*S(1//(2)))+q+CycloSum(R(1), k*S(1//(2)))),
	(q+1)*CycloSum(R(1), k*S(1//(2))),
	q*CycloSum(R(1), k*S(1//(2)))+q+CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	q*(q^2+q+1)*(CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3)))),
	q*(CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3)))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	q*CycloSum(R(1), (i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-i*k)*S(1//(q-1)))+q+CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+1,
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+1,
	q*CycloSum(R(1), (i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-i*k)*S(1//(q-1)))+q*CycloSum(R(1), (2*i*k)*S(1//(q-1)))+q*CycloSum(R(1), (-2*i*k)*S(1//(q-1)))+CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(-q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (j*k)*S(1//(q-1)))+CycloSum(R(1), (-j*k)*S(1//(q-1)))+CycloSum(R(1), (i*k+j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k-j*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k)*S(1//(q-1)))-CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((q-1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	((q-1)*(q^2+1))*CycloSum(R(1), S(0)),
	(-q^2+q-1)*CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-(q-1)*(q*CycloSum(R(1), k*S(1//(2)))-CycloSum(R(1), k*S(1//(2)))-1),
	(CycloSum(R(1), k*S(1//(2)))+1)*(q-1),
	q*CycloSum(R(1), k*S(1//(2)))-CycloSum(R(1), k*S(1//(2)))-1,
	-CycloSum(R(1), k*S(1//(2)))-1,
	-CycloSum(R(1), k*S(1//(2)))-1,
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	q*CycloSum(R(1), (i*k)*S(1//(q+1)))+q*CycloSum(R(1), (-i*k)*S(1//(q+1)))-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1)))-CycloSum(R(1), (-2*i*k)*S(1//(q+1)))-CycloSum(R(1), (2*i*k)*S(1//(q+1))),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1)))-CycloSum(R(1), (-2*i*k)*S(1//(q+1)))-CycloSum(R(1), (2*i*k)*S(1//(q+1))),
	q*CycloSum(R(1), (i*k)*S(1//(q+1)))+q*CycloSum(R(1), (-i*k)*S(1//(q+1)))+q-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1)))-1,
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1)))-1,
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1)))-CycloSum(R(1), (j*k)*S(1//(q+1)))-CycloSum(R(1), (-j*k)*S(1//(q+1)))-CycloSum(R(1), (i*k+j*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k-j*k)*S(1//(q+1))),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q*(q-1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q*(q-1))*CycloSum(R(1), S(0)),
	(q*(q-2))*CycloSum(R(1), S(0)),
	(-3*q)*CycloSum(R(1), S(0)),
	(-q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*(q+q*CycloSum(R(1), k*S(1//(2)))-CycloSum(R(1), k*S(1//(2)))),
	-(q-1)*CycloSum(R(1), k*S(1//(2))),
	-q*CycloSum(R(1), k*S(1//(2)))-q+CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-q*CycloSum(R(1), (i*k)*S(1//(q+1)))-q*CycloSum(R(1), (-i*k)*S(1//(q+1)))-q*CycloSum(R(1), (-2*i*k)*S(1//(q+1)))-q*CycloSum(R(1), (2*i*k)*S(1//(q+1)))+CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1))),
	-q*CycloSum(R(1), (i*k)*S(1//(q+1)))-q*CycloSum(R(1), (-i*k)*S(1//(q+1)))-q+CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1)))+1,
	CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1)))+1,
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1)))+CycloSum(R(1), (j*k)*S(1//(q+1)))+CycloSum(R(1), (-j*k)*S(1//(q+1)))+CycloSum(R(1), (i*k+j*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k-j*k)*S(1//(q+1))),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((q-1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(-q^2+q-1)*CycloSum(R(1), S(0)),
	(-(q-1)^2)*CycloSum(R(1), S(0)),
	(3*q-1)*CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-(q-1)*(q*CycloSum(R(1), k*S(1//(2)))-CycloSum(R(1), k*S(1//(2)))-1),
	q*CycloSum(R(1), k*S(1//(2)))-CycloSum(R(1), k*S(1//(2)))-1,
	(CycloSum(R(1), k*S(1//(2)))+1)*(q-1),
	-CycloSum(R(1), k*S(1//(2)))-1,
	-CycloSum(R(1), k*S(1//(2)))-1,
	((q-1)*(q^2+q+1))*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	q*CycloSum(R(1), (3*i*k)*S(1//(q+1)))+q*CycloSum(R(1), (-3*i*k)*S(1//(q+1)))+q-CycloSum(R(1), (3*i*k)*S(1//(q+1)))-CycloSum(R(1), (-3*i*k)*S(1//(q+1)))-1,
	-CycloSum(R(1), (3*i*k)*S(1//(q+1)))-CycloSum(R(1), (-3*i*k)*S(1//(q+1)))-1,
	q*CycloSum(R(1), (i*k)*S(1//(q+1)))+q*CycloSum(R(1), (-i*k)*S(1//(q+1)))-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1)))-CycloSum(R(1), (-2*i*k)*S(1//(q+1)))-CycloSum(R(1), (2*i*k)*S(1//(q+1))),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1)))-CycloSum(R(1), (-2*i*k)*S(1//(q+1)))-CycloSum(R(1), (2*i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k+2*j*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k-2*j*k)*S(1//(q+1)))-CycloSum(R(1), (2*i*k+j*k)*S(1//(q+1)))-CycloSum(R(1), (-2*i*k-j*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k+j*k)*S(1//(q+1)))-CycloSum(R(1), (i*k-j*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q*(q-1)*(q^2+q+1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	(-q*(q^2-q+1))*CycloSum(R(1), S(0)),
	(q*(q-1))*CycloSum(R(1), S(0)),
	(-q)*CycloSum(R(1), S(0)),
	(-q)*CycloSum(R(1), S(0)),
	(-q)*CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*(q+q*CycloSum(R(1), k*S(1//(2)))-CycloSum(R(1), k*S(1//(2)))),
	-q*CycloSum(R(1), k*S(1//(2)))-q+CycloSum(R(1), k*S(1//(2))),
	-(q-1)*CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(1), k*S(1//(2))),
	((q-1)*(q^2+q+1))*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	-q*CycloSum(R(1), (3*i*k)*S(1//(q+1)))-q*CycloSum(R(1), (-3*i*k)*S(1//(q+1)))-q+CycloSum(R(1), (3*i*k)*S(1//(q+1)))+CycloSum(R(1), (-3*i*k)*S(1//(q+1)))+1,
	CycloSum(R(1), (3*i*k)*S(1//(q+1)))+CycloSum(R(1), (-3*i*k)*S(1//(q+1)))+1,
	-q*CycloSum(R(1), (i*k)*S(1//(q+1)))-q*CycloSum(R(1), (-i*k)*S(1//(q+1)))-q*CycloSum(R(1), (-2*i*k)*S(1//(q+1)))-q*CycloSum(R(1), (2*i*k)*S(1//(q+1)))+CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k+2*j*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k-2*j*k)*S(1//(q+1)))+CycloSum(R(1), (2*i*k+j*k)*S(1//(q+1)))+CycloSum(R(1), (-2*i*k-j*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k+j*k)*S(1//(q+1)))+CycloSum(R(1), (i*k-j*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((q+1)*(q^2+q+1)*(q^3+1))*CycloSum(R(1), S(0)),
	((q+1)*(q^2+q+1))*CycloSum(R(1), S(0)),
	((q+1)*(2*q+1))*CycloSum(R(1), S(0)),
	(4*q+1)*CycloSum(R(1), S(0)),
	(2*q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q+1)^2*(CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2)))),
	(q+1)*(CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2)))),
	(q+1)*(CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2)))),
	CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2))),
	CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2))),
	(q+1)*(q^2+q+1)*(CycloSum(R(1), (k+l)*S(1//(3)))+CycloSum(R(1), (-k-l)*S(1//(3)))),
	(2*q+1)*(CycloSum(R(1), (k+l)*S(1//(3)))+CycloSum(R(1), (-k-l)*S(1//(3)))),
	CycloSum(R(1), (k+l)*S(1//(3)))+CycloSum(R(1), (-k-l)*S(1//(3))),
	CycloSum(R(1), (k+l)*S(1//(3)))+CycloSum(R(1), (-k-l)*S(1//(3))),
	CycloSum(R(1), (k+l)*S(1//(3)))+CycloSum(R(1), (-k-l)*S(1//(3))),
	(q+1)*(CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (i*l)*S(1//(q-1)))+CycloSum(R(1), (-i*l)*S(1//(q-1)))+CycloSum(R(1), (i*(k-l))*S(1//(q-1)))+CycloSum(R(1), (-i*(k-l))*S(1//(q-1)))),
	CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))+CycloSum(R(1), (i*l)*S(1//(q-1)))+CycloSum(R(1), (-i*l)*S(1//(q-1)))+CycloSum(R(1), (i*(k-l))*S(1//(q-1)))+CycloSum(R(1), (-i*(k-l))*S(1//(q-1))),
	(q+1)*(CycloSum(R(1), (i*(k+l))*S(1//(q-1)))+CycloSum(R(1), (-i*(k+l))*S(1//(q-1)))+CycloSum(R(1), (i*(k-2*l))*S(1//(q-1)))+CycloSum(R(1), (-i*(k-2*l))*S(1//(q-1)))+CycloSum(R(1), (i*(l-2*k))*S(1//(q-1)))+CycloSum(R(1), (-i*(l-2*k))*S(1//(q-1)))),
	CycloSum(R(1), (i*(k+l))*S(1//(q-1)))+CycloSum(R(1), (-i*(k+l))*S(1//(q-1)))+CycloSum(R(1), (i*(k-2*l))*S(1//(q-1)))+CycloSum(R(1), (-i*(k-2*l))*S(1//(q-1)))+CycloSum(R(1), (i*(l-2*k))*S(1//(q-1)))+CycloSum(R(1), (-i*(l-2*k))*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k+j*l)*S(1//(q-1)))+CycloSum(R(1), (-i*k-j*l)*S(1//(q-1)))+CycloSum(R(1), (i*l+j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*l-j*k)*S(1//(q-1)))+CycloSum(R(1), (i*(k-l)-j*l)*S(1//(q-1)))+CycloSum(R(1), (-i*(k-l)+j*l)*S(1//(q-1)))+CycloSum(R(1), (i*l-j*(k-l))*S(1//(q-1)))+CycloSum(R(1), (-i*l+j*(k-l))*S(1//(q-1)))+CycloSum(R(1), (i*(k-l)+j*k)*S(1//(q-1)))+CycloSum(R(1), (-i*(k-l)-j*k)*S(1//(q-1)))+CycloSum(R(1), (i*k+j*(k-l))*S(1//(q-1)))+CycloSum(R(1), (-i*k-j*(k-l))*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((q-1)*(q^2-q+1)*(q^3-1))*CycloSum(R(1), S(0)),
	(-(q-1)*(q^2-q+1))*CycloSum(R(1), S(0)),
	((q-1)*(2*q-1))*CycloSum(R(1), S(0)),
	(-4*q+1)*CycloSum(R(1), S(0)),
	(-2*q+1)*CycloSum(R(1), S(0)),
	(-q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	(q-1)^2*(CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2)))),
	-(q-1)*(CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2)))),
	-(q-1)*(CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2)))),
	CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2))),
	CycloSum(R(1), k*S(1//(2)))+CycloSum(R(1), l*S(1//(2)))+CycloSum(R(1), (k+l)*S(1//(2))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-(q-1)*(CycloSum(R(1), (i*(k+l))*S(1//(q+1)))+CycloSum(R(1), (-i*(k+l))*S(1//(q+1)))+CycloSum(R(1), (i*(k-2*l))*S(1//(q+1)))+CycloSum(R(1), (-i*(k-2*l))*S(1//(q+1)))+CycloSum(R(1), (i*(l-2*k))*S(1//(q+1)))+CycloSum(R(1), (-i*(l-2*k))*S(1//(q+1)))),
	CycloSum(R(1), (i*(k+l))*S(1//(q+1)))+CycloSum(R(1), (-i*(k+l))*S(1//(q+1)))+CycloSum(R(1), (i*(k-2*l))*S(1//(q+1)))+CycloSum(R(1), (-i*(k-2*l))*S(1//(q+1)))+CycloSum(R(1), (i*(l-2*k))*S(1//(q+1)))+CycloSum(R(1), (-i*(l-2*k))*S(1//(q+1))),
	-(q-1)*(CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1)))+CycloSum(R(1), (i*l)*S(1//(q+1)))+CycloSum(R(1), (-i*l)*S(1//(q+1)))+CycloSum(R(1), (i*(k-l))*S(1//(q+1)))+CycloSum(R(1), (-i*(k-l))*S(1//(q+1)))),
	CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1)))+CycloSum(R(1), (i*l)*S(1//(q+1)))+CycloSum(R(1), (-i*l)*S(1//(q+1)))+CycloSum(R(1), (i*(k-l))*S(1//(q+1)))+CycloSum(R(1), (-i*(k-l))*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k+j*l)*S(1//(q+1)))+CycloSum(R(1), (-i*k-j*l)*S(1//(q+1)))+CycloSum(R(1), (i*l+j*k)*S(1//(q+1)))+CycloSum(R(1), (-i*l-j*k)*S(1//(q+1)))+CycloSum(R(1), (i*(k-l)-j*l)*S(1//(q+1)))+CycloSum(R(1), (-i*(k-l)+j*l)*S(1//(q+1)))+CycloSum(R(1), (i*l-j*(k-l))*S(1//(q+1)))+CycloSum(R(1), (-i*l+j*(k-l))*S(1//(q+1)))+CycloSum(R(1), (i*(k-l)+j*k)*S(1//(q+1)))+CycloSum(R(1), (-i*(k-l)-j*k)*S(1//(q+1)))+CycloSum(R(1), (i*k+j*(k-l))*S(1//(q+1)))+CycloSum(R(1), (-i*k-j*(k-l))*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q^6-1)*CycloSum(R(1), S(0)),
	(q^3-1)*CycloSum(R(1), S(0)),
	(-q-1)*CycloSum(R(1), S(0)),
	(-2*q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	(q^2-1)*CycloSum(R(1), k*S(1//(2))),
	(q-1)*CycloSum(R(1), k*S(1//(2))),
	-(q+1)*CycloSum(R(1), k*S(1//(2))),
	-CycloSum(R(1), k*S(1//(2))),
	-CycloSum(R(1), k*S(1//(2))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*(CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))),
	-CycloSum(R(1), (i*k)*S(1//(q-1)))-CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-(q+1)*(CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1)))),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k)*S(1//(q^2-1)))-CycloSum(R(1), (-i*k)*S(1//(q^2-1)))-CycloSum(R(1), (q*i*k)*S(1//(q^2-1)))-CycloSum(R(1), (-q*i*k)*S(1//(q^2-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	(q^6-1)*CycloSum(R(1), S(0)),
	(-q^3-1)*CycloSum(R(1), S(0)),
	(q-1)*CycloSum(R(1), S(0)),
	(2*q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	(-q-1)*CycloSum(R(1), S(0)),
	-CycloSum(R(1), S(0)),
	(q^2-1)*CycloSum(R(1), k*S(1//(2))),
	-(q+1)*CycloSum(R(1), k*S(1//(2))),
	(q-1)*CycloSum(R(1), k*S(1//(2))),
	-CycloSum(R(1), k*S(1//(2))),
	-CycloSum(R(1), k*S(1//(2))),
	(q^3-1)*(CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3)))),
	-CycloSum(R(1), k*S(1//(3)))-CycloSum(R(1), (-k)*S(1//(3))),
	-CycloSum(R(1), k*S(1//(3)))-CycloSum(R(1), (-k)*S(1//(3))),
	-CycloSum(R(1), k*S(1//(3)))-CycloSum(R(1), (-k)*S(1//(3))),
	-CycloSum(R(1), k*S(1//(3)))-CycloSum(R(1), (-k)*S(1//(3))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*(CycloSum(R(1), (i*k)*S(1//(q-1)))+CycloSum(R(1), (-i*k)*S(1//(q-1)))),
	-CycloSum(R(1), (i*k)*S(1//(q-1)))-CycloSum(R(1), (-i*k)*S(1//(q-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-(q+1)*(CycloSum(R(1), (i*k)*S(1//(q+1)))+CycloSum(R(1), (-i*k)*S(1//(q+1)))),
	-CycloSum(R(1), (i*k)*S(1//(q+1)))-CycloSum(R(1), (-i*k)*S(1//(q+1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	-CycloSum(R(1), (i*k)*S(1//(q^2-1)))-CycloSum(R(1), (-i*k)*S(1//(q^2-1)))-CycloSum(R(1), (q*i*k)*S(1//(q^2-1)))-CycloSum(R(1), (-q*i*k)*S(1//(q^2-1))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0))] [
	((q-1)*(q^2-1)*(q^3+1))*CycloSum(R(1), S(0)),
	((q-1)*(q^2-1))*CycloSum(R(1), S(0)),
	(-q^2+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	(-q+1)*CycloSum(R(1), S(0)),
	(-2*q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	(q-1)*(q^2-1)*(CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3)))),
	(-q+1)*(CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3)))),
	CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3))),
	CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3))),
	CycloSum(R(1), k*S(1//(3)))+CycloSum(R(1), (-k)*S(1//(3))),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k)*S(1//(q^2+q+1)))+CycloSum(R(1), (-i*k)*S(1//(q^2+q+1)))+CycloSum(R(1), (q*i*k)*S(1//(q^2+q+1)))+CycloSum(R(1), (-q*i*k)*S(1//(q^2+q+1)))+CycloSum(R(1), (q^2*i*k)*S(1//(q^2+q+1)))+CycloSum(R(1), (-q^2*i*k)*S(1//(q^2+q+1))),
	CycloSum(R(0), S(0))] [
	((q+1)*(q^2-1)*(q^3-1))*CycloSum(R(1), S(0)),
	(-(q+1)*(q^2-1))*CycloSum(R(1), S(0)),
	(-q^2+1)*CycloSum(R(1), S(0)),
	(-q+1)*CycloSum(R(1), S(0)),
	(q+1)*CycloSum(R(1), S(0)),
	(2*q+1)*CycloSum(R(1), S(0)),
	CycloSum(R(1), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(0), S(0)),
	CycloSum(R(1), (i*k)*S(1//(q^2-q+1)))+CycloSum(R(1), (-i*k)*S(1//(q^2-q+1)))+CycloSum(R(1), (q*i*k)*S(1//(q^2-q+1)))+CycloSum(R(1), (-q*i*k)*S(1//(q^2-q+1)))+CycloSum(R(1), (q^2*i*k)*S(1//(q^2-q+1)))+CycloSum(R(1), (-q^2*i*k)*S(1//(q^2-q+1)))]]
classinfo = Vector{Any}[
	[[1,0],["G_2","u_0"],"1"],
	[[1,1],["G_2","u_1"],"u_1"],
	[[1,2],["G_2","u_2"],"u_2"],
	[[1,3],["G_2","u_3"],"u_3"],
	[[1,4],["G_2","u_4"],"u_4"],
	[[1,5],["G_2","u_5"],"u_5"],
	[[1,6],["G_2","u_6"],"u_6"],
	[[2,0],["A_1+\\tildeA_1","u_0"],"k_{2}"],
	[[2,1],["A_1+\\tildeA_1","u_1"],"k_{2,1}"],
	[[2,2],["A_1+\\tildeA_1","u_2"],"k_{2,2}"],
	[[2,3],["A_1+\\tildeA_1","u_3"],"k_{2,3}"],
	[[2,4],["A_1+\\tildeA_1","u_4"],"k_{2,4}"],
	[[3,0],["A_2","u_0"],"k_{3}"],
	[[3,1],["A_2","u_1"],"k_{3,1}"],
	[[3,2],["A_2","u_2"],"k_{3,2}"],
	[[3,3],["A_2","u_3"],"k_{3,3,1}"],
	[[3,4],["A_2","u_4"],"k_{3,3,2}"],
	[[4,0],["\\tildeA_1",[1,1]],"h_{1a}"],
	[[4,1],["\\tildeA_1",[2]],"h_{1a,1}"],
	[[5,0],["A_1",[1,1]],"h_{1b}"],
	[[5,1],["A_1",[2]],"h_{1b,1}"],
	[[6,0],["\\tildeA_1",[1,1]],"h_{2a}"],
	[[6,1],["\\tildeA_1",[2]],"h_{2a,1}"],
	[[7,0],["A_1",[1,1]],"h_{2b}"],
	[[7,1],["A_1",[2]],"h_{2b,1}"],
	[[8,0],["A_0",[1]],"h_1"],
	[[9,0],["A_0",[1]],"h_2"],
	[[10,0],["A_0",[1]],"h_a"],
	[[11,0],["A_0",[1]],"h_b"],
	[[12,0],["A_0",[1]],"h_3"],
	[[13,0],["A_0",[1]],"h_6"]]
classlength = R.([
	1,
	q^6-1,
	q^2*(q^6-1),
	1//6*q^2*(q^2-1)*(q^6-1),
	1//2*q^2*(q^2-1)*(q^6-1),
	1//3*q^2*(q^2-1)*(q^6-1),
	q^4*(q^2-1)*(q^6-1),
	q^4*(q^4+q^2+1),
	q^4*(q^2-1)*(q^4+q^2+1),
	q^4*(q^2-1)*(q^4+q^2+1),
	1//2*q^4*(q^2-1)*(q^6-1),
	1//2*q^4*(q^2-1)*(q^6-1),
	q^3*(q^3+1),
	q^3*(q+1)*(q^6-1),
	1//3*q^4*(q^2-1)*(q^6-1),
	1//3*q^4*(q^2-1)*(q^6-1),
	1//3*q^4*(q^2-1)*(q^6-1),
	q^5*(q+1)*(q^4+q^2+1),
	q^5*(q+1)*(q^2-1)*(q^4+q^2+1),
	q^5*(q+1)*(q^4+q^2+1),
	q^5*(q+1)*(q^2-1)*(q^4+q^2+1),
	q^5*(q-1)*(q^4+q^2+1),
	q^5*(q-1)*(q^2-1)*(q^4+q^2+1),
	q^5*(q-1)*(q^4+q^2+1),
	q^5*(q-1)*(q^2-1)*(q^4+q^2+1),
	q^6*(q+1)^2*(q^4+q^2+1),
	q^6*(q-1)^2*(q^4+q^2+1),
	q^6*(q^2-1)*(q^4+q^2+1),
	q^6*(q^2-1)*(q^4+q^2+1),
	q^6*(q^2-1)^2*(q^2-q+1),
	q^6*(q^2-1)^2*(q^2+q+1)])
charinfo = Vector{Any}[
	[[1,0],["G_2","\\phi_{1,0}"],"X_{11}"],
	[[1,1],["G_2","\\phi_{2,1}"],"X_{16}"],
	[[1,2],["G_2","\\phi_{2,2}"],"X_{15}"],
	[[1,3],["G_2","\\phi_{1,3}'"],"X_{13}"],
	[[1,4],["G_2","\\phi_{1,3}''"],"X_{14}"],
	[[1,5],["G_2","G_2[1]"],"X_{18}"],
	[[1,6],["G_2","G_2[-1]"],"X_{17}"],
	[[1,7],["G_2","G_2[\\theta]"],"X_{19}(1)"],
	[[1,8],["G_2","G_2[\\theta^2]"],"X_{19}(2)"],
	[[1,9],["G_2","\\phi_{1,6}"],"X_{12}"],
	[[2,0],["A_1+\\tildeA_1",[[2],[2]]],"X_{22}"],
	[[2,1],["A_1+\\tildeA_1",[[2],[1,1]]],"X_{23}"],
	[[2,2],["A_1+\\tildeA_1",[[1,1],[2]]],"X_{24}"],
	[[2,3],["A_1+\\tildeA_1",[[1,1],[1,1]]],"X_{21}"],
	[[3,0],["A_2",[3]],"X_{32}"],
	[[3,1],["A_2",[2,1]],"X_{33}"],
	[[3,2],["A_2",[1,1,1]],"X_{31}"],
	[[5,0],["A_1",[2]],"X_{1a}'"],
	[[5,1],["A_1",[1,1]],"X_{1a}"],
	[[4,0],["\\tildeA_1",[2]],"X_{1b}'"],
	[[4,1],["\\tildeA_1",[1,1]],"X_{1b}"],
	[[7,0],["A_1",[2]],"X_{2a}'"],
	[[7,1],["A_1",[1,1]],"X_{2a}"],
	[[6,0],["\\tildeA_1",[2]],"X_{2b}'"],
	[[6,1],["\\tildeA_1",[1,1]],"X_{2b}"],
	[[8,0],["A_0",[1]],"X_{1}"],
	[[9,0],["A_0",[1]],"X_{2}"],
	[[11,0],["A_0",[1]],"X_{a}"],
	[[10,0],["A_0",[1]],"X_{b}"],
	[[12,0],["A_0",[1]],"X_{3}"],
	[[13,0],["A_0",[1]],"X_{6}"]]
chardegree = R.([
	1,
	1//6*q*(q^2+q+1)*(q+1)^2,
	1//2*q*(q^2-q+1)*(q+1)^2,
	1//3*q*(q^2+q+1)*(q^2-q+1),
	1//3*q*(q^2+q+1)*(q^2-q+1),
	1//6*q*(q^2-q+1)*(q-1)^2,
	1//2*q*(q^2+q+1)*(q-1)^2,
	1//3*q*(q-1)^2*(q+1)^2,
	1//3*q*(q-1)^2*(q+1)^2,
	q^6,
	(q^2+q+1)*(q^2-q+1),
	q*(q^2+q+1)*(q^2-q+1),
	q*(q^2+q+1)*(q^2-q+1),
	q^2*(q^2+q+1)*(q^2-q+1),
	(q+1)*(q^2-q+1),
	q*(q^2-q+1)*(q+1)^2,
	q^3*(q+1)*(q^2-q+1),
	(q+1)*(q^2+q+1)*(q^2-q+1),
	q*(q+1)*(q^2+q+1)*(q^2-q+1),
	(q+1)*(q^2+q+1)*(q^2-q+1),
	q*(q+1)*(q^2+q+1)*(q^2-q+1),
	(q-1)*(q^2+q+1)*(q^2-q+1),
	q*(q-1)*(q^2+q+1)*(q^2-q+1),
	(q-1)*(q^2+q+1)*(q^2-q+1),
	q*(q-1)*(q^2+q+1)*(q^2-q+1),
	(q+1)*(q^2+q+1)*(q^3+1),
	(q-1)*(q^2-q+1)*(q^3-1),
	q^6-1,
	q^6-1,
	(q-1)*(q^2-1)*(q^3+1),
	(q+1)*(q^2-1)*(q^3-1)])

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
	tt
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, (q-2), congruence)
	tt1=eesubs(tt, [i], [(q-1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, (q-2), congruence)
	tt1=eesubs(tt, [i], [(q-1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, (q-2), congruence)
	tt1=eesubs(tt, [i], [(q-1)*1//2])
	tt2=eesubs(tt, [i], [(q-1)*1//3])
	1//2*s1-1//2*tt1-tt2
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, (q-2), congruence)
	tt1=eesubs(tt, [i], [(q-1)*1//2])
	tt2=eesubs(tt, [i], [(q-1)*1//3])
	1//2*s1-1//2*tt1-tt2
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q, congruence)
	tt1=eesubs(tt, [i], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q, congruence)
	tt1=eesubs(tt, [i], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q, congruence)
	tt1=eesubs(tt, [i], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q, congruence)
	tt1=eesubs(tt, [i], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q-2, congruence)
	s2=nesum(s1, j, 1, q-2, congruence)
	tt1=eesubs(tt, [i], [j])
	s3=nesum(tt1, j, 1, q-2, congruence)
	tt1=eesubs(tt, [j], [-2*i])
	s4=nesum(tt1, i, 1, q-2, congruence)
	tt1=eesubs(tt, [i], [-j])
	s5=nesum(tt1, j, 1, q-2, congruence)
	s6=eesubs(tt, [i,j], S.([(q-1)*1//2,(q-1)*1//2]))
	s7=eesubs(tt, [i,j], S.([(q-1)*1//2,0]))
	s8=eesubs(tt, [i,j], S.([(q-1)*1//3,(q-1)*1//3]))
	s9=eesubs(tt, [i,j], S.([2*(q-1)*1//3,2*(q-1)*1//3]))
	1//12*s2-1//12*s3-1//6*s4-1//12*s5+1//12*s6+1//6*s7+1//6*s8+1//6*s9
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q, congruence)
	s2=nesum(s1, j, 1, q, congruence)
	tt1=eesubs(tt, [i], [j])
	s3=nesum(tt1, j, 1, q, congruence)
	tt1=eesubs(tt, [j], [-2*i])
	s4=nesum(tt1, i, 1, q, congruence)
	tt1=eesubs(tt, [i], [-j])
	s5=nesum(tt1, j, 1, q, congruence)
	s6=eesubs(tt, [i,j], S.([(q+1)*1//2,(q+1)*1//2]))
	s7=eesubs(tt, [i,j], S.([(q+1)*1//2,0]))
	1//12*s2-1//12*s3-1//6*s4-1//12*s5+1//12*s6+1//6*s7
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q^2-1, congruence)
	tt1=eesubs(tt, [i], [(q-1)*i])
	s2=nesum(tt1, i, 1, q+1, congruence)
	tt1=eesubs(tt, [i], [(q+1)*i])
	s3=nesum(tt1, i, 1, q-1, congruence)
	s4=eesubs(tt, [i], [(q^2-1)*1//2])
	s5=eesubs(tt, [i], [(q^2-1)])
	1//4*s1-1//4*s2-1//4*s3+1//4*s4+1//4*s5
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q^2-1, congruence)
	tt1=eesubs(tt, [i], [(q-1)*i])
	s2=nesum(tt1, i, 1, q+1, congruence)
	tt1=eesubs(tt, [i], [(q+1)*i])
	s3=nesum(tt1, i, 1, q-1, congruence)
	s4=eesubs(tt, [i], [(q^2-1)*1//2])
	s5=eesubs(tt, [i], [(q^2-1)])
	1//4*s1-1//4*s2-1//4*s3+1//4*s4+1//4*s5
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q^2+q, congruence)
	tt1=eesubs(tt, [i], [(q^2+q+1)*1//3])
	1//6*s1-1//3*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, i, 1, q^2-q, congruence)
	1//6*s1
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
	tt
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, (q-2), congruence)
	tt1=eesubs(tt, [k], [(q-1)*1//2])
	tt2=eesubs(tt, [k], [(q-1)*1//3])
	1//2*s1-1//2*tt1-tt2
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, (q-2), congruence)
	tt1=eesubs(tt, [k], [(q-1)*1//2])
	tt2=eesubs(tt, [k], [(q-1)*1//3])
	1//2*s1-1//2*tt1-tt2
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, (q-2), congruence)
	tt1=eesubs(tt, [k], [(q-1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, (q-2), congruence)
	tt1=eesubs(tt, [k], [(q-1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q, congruence)
	tt1=eesubs(tt, [k], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q, congruence)
	tt1=eesubs(tt, [k], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q, congruence)
	tt1=eesubs(tt, [k], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q, congruence)
	tt1=eesubs(tt, [k], [(q+1)*1//2])
	1//2*s1-1//2*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q-2, congruence)
	s2=nesum(s1, l, 1, q-2, congruence)
	tt1=eesubs(tt, [k], [l])
	s3=nesum(tt1, l, 1, q-2, congruence)
	tt1=eesubs(tt, [l], [2*k])
	s4=nesum(tt1, k, 1, q-2, congruence)
	tt1=eesubs(tt, [k], [-l])
	s5=nesum(tt1, l, 1, q-2, congruence)
	s6=eesubs(tt, [k,l], S.([(q-1)*1//2,(q-1)*1//2]))
	s7=eesubs(tt, [k,l], S.([(q-1)*1//2,0]))
	s8=eesubs(tt, [k,l], S.([(q-1)*1//3,2*(q-1)*1//3]))
	s9=eesubs(tt, [k,l], S.([2*(q-1)*1//3,(q-1)*1//3]))
	1//12*s2-1//12*s3-1//6*s4-1//12*s5+1//12*s6+1//6*s7+1//6*s8+1//6*s9
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q, congruence)
	s2=nesum(s1, l, 1, q, congruence)
	tt1=eesubs(tt, [k], [l])
	s3=nesum(tt1, l, 1, q, congruence)
	tt1=eesubs(tt, [l], [2*k])
	s4=nesum(tt1, k, 1, q, congruence)
	tt1=eesubs(tt, [k], [-l])
	s5=nesum(tt1, l, 1, q, congruence)
	s6=eesubs(tt, [k,l], S.([(q+1)*1//2,(q+1)*1//2]))
	s7=eesubs(tt, [k,l], S.([(q+1)*1//2,0]))
	1//12*s2-1//12*s3-1//6*s4-1//12*s5+1//12*s6+1//6*s7
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q^2-1, congruence)
	tt1=eesubs(tt, [k], [(q-1)*k])
	s2=nesum(tt1, k, 1, q+1, congruence)
	tt1=eesubs(tt, [k], [(q+1)*k])
	s3=nesum(tt1, k, 1, q-1, congruence)
	s4=eesubs(tt, [k], [(q^2-1)*1//2])
	s5=eesubs(tt, [k], [(q^2-1)])
	1//4*s1-1//4*s2-1//4*s3+1//4*s4+1//4*s5
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q^2-1, congruence)
	tt1=eesubs(tt, [k], [(q-1)*k])
	s2=nesum(tt1, k, 1, q+1, congruence)
	tt1=eesubs(tt, [k], [(q+1)*k])
	s3=nesum(tt1, k, 1, q-1, congruence)
	s4=eesubs(tt, [k], [(q^2-1)*1//2])
	s5=eesubs(tt, [k], [(q^2-1)])
	1//4*s1-1//4*s2-1//4*s3+1//4*s4+1//4*s5
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q^2+q, congruence)
	tt1=eesubs(tt, [k], [(q^2+q+1)*1//3])
	1//6*s1-1//3*tt1
end,
function (tt::Cyclotomic)
	s1=nesum(tt, k, 1, q^2-q, congruence)
	1//6*s1
end
]

classparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//((q-1)*1//2))]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//((q-1)*1//2))]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//((q-1)*1//2)), ParameterException((i)*1//((q-1)*1//3))]),
Parameters([Parameter(i, q-1)], [ParameterException((i)*1//((q-1)*1//2)), ParameterException((i)*1//((q-1)*1//3))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//((q+1)*1//2))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//((q+1)*1//2))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//((q+1)*1//2))]),
Parameters([Parameter(i, q+1)], [ParameterException((i)*1//((q+1)*1//2))]),
Parameters([Parameter(i, q-1), Parameter(j, q-1)], [ParameterException((i)*1//(q-1)), ParameterException((j)*1//(q-1)), ParameterException((i-j)*1//(q-1)), ParameterException((i+j)*1//(q-1)), ParameterException((2*i+j)*1//(q-1)), ParameterException((i+2*j)*1//(q-1))]),
Parameters([Parameter(i, q+1), Parameter(j, q+1)], [ParameterException((i)*1//(q+1)), ParameterException((j)*1//(q+1)), ParameterException((i-j)*1//(q+1)), ParameterException((i+j)*1//(q+1)), ParameterException((2*i+j)*1//(q+1)), ParameterException((i+2*j)*1//(q+1))]),
Parameters([Parameter(i, q^2-1)], [ParameterException((i)*1//(q-1)), ParameterException((i)*1//(q+1))]),
Parameters([Parameter(i, q^2-1)], [ParameterException((i)*1//(q-1)), ParameterException((i)*1//(q+1))]),
Parameters([Parameter(i, q^2+q+1)], [ParameterException((i)*1//((q^2+q+1)*1//3))]),
Parameters([Parameter(i, q^2-q+1)], [ParameterException((i)*1//(q^2-q+1))])
]

charparams=[
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters(Parameter{QQPolyRingElem}[]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//((q-1)*1//2)), ParameterException((k)*1//((q-1)*1//3))]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//((q-1)*1//2)), ParameterException((k)*1//((q-1)*1//3))]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//((q-1)*1//2))]),
Parameters([Parameter(k, q-1)], [ParameterException((k)*1//((q-1)*1//2))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//((q+1)*1//2))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//((q+1)*1//2))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//((q+1)*1//2))]),
Parameters([Parameter(k, q+1)], [ParameterException((k)*1//((q+1)*1//2))]),
Parameters([Parameter(k, q-1), Parameter(l, q-1)], [ParameterException((k)*1//(q-1)), ParameterException((l)*1//(q-1)), ParameterException((k-l)*1//(q-1)), ParameterException((k+l)*1//(q-1)), ParameterException((2*k-l)*1//(q-1)), ParameterException((k-2*l)*1//(q-1))]),
Parameters([Parameter(k, q+1), Parameter(l, q+1)], [ParameterException((k)*1//(q+1)), ParameterException((l)*1//(q+1)), ParameterException((k-l)*1//(q+1)), ParameterException((k+l)*1//(q+1)), ParameterException((2*k-l)*1//(q+1)), ParameterException((k-2*l)*1//(q+1))]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//(q-1)), ParameterException((k)*1//(q+1))]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//(q-1)), ParameterException((k)*1//(q+1))]),
Parameters([Parameter(k, q^2+q+1)], [ParameterException((k)*1//((q^2+q+1)*1//3))]),
Parameters([Parameter(k, q^2-q+1)], [ParameterException((k)*1//(q^2-q+1))])
]

classparamindex=var_index.([i,j])
charparamindex=var_index.([k,l])
congruence=R.((1,12))

information = raw"""- Information about the generic character table of $G_2(q)$,
  $q$ odd, congruent to $1$ modulo $3$ and $4$.

- CHEVIE-name of the table: ``G2.11``

- The table was first computed in:
  {\sc B.~Chang and R.~Ree}, The characters of $G_2(q)$, {\em in}:
  Symposia Mathematica Vol.~13, pp.~395--413, Academic Press, London, 1974.

- See also:

  {\sc B.~Chang}, The conjugate classes of Chevalley groups of
  type ($G_2$), {\em J.~Algebra} {\bf 9} (1968), 190--211.

  {\sc G.~Hiss}, Zerlegungszahlen endlicher Gruppen vom Lie-Typ in
  nicht-definierender Charakteristik, Habilitationsschrift, Aachen 1990.

- Note:
  Chang's and Ree's notation for the irreducible characters is
  given in the fourth component of the character information list.

  Chang's and Ree's notation for the conjugacy classes is given in
  the fourth component of the class information list.

- Example:
> PrintInfoChar(``G2.11``,6);

cht   Information

======================================================
6   [ , [1, 5], [G_2, G_2[1]], X_{18}]

- Explanation of example:
  Character type 6 of G2.11 is called X_{18} by Chang and Ree
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information,splitext(basename(@__FILE__))[1])

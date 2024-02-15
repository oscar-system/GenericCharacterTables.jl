using ..GenericCharacterTables
import ..GenericCharacterTables: ExtendableMatrix, SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^9*(q^6-1)*(q^4-1)*(q^2-1)*(q-1)
table = QQPolyRingElem[[
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	1//2*q*(q^2+q+1)*(q^2+1),
	1//2*q*(q+1)*(q^2+1),
	1//2*q*(q+1)^2,
	1//2*q*(q^2+1),
	1//2*q*(q+1),
	q,
	1//2*q*(q+1),
	q,
	R(0),
	R(0),
	1//2*(2*q+1)*(q^2+1),
	1//2*(q+1)*(q^2+1),
	1//2*(q+1)^2,
	1//2*(q+1)^2,
	-1//2*q^2+q+1//2,
	1//2*q+1//2,
	q^2+1//2*q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	1//2*(q+2)*(q^2+1),
	1//2*q^2+1//2*q+1,
	q+1,
	R(1),
	R(1),
	1//2*q*(q^2+1),
	1//2*q*(q+1),
	R(0),
	q,
	R(0),
	q^2+q+1,
	q+1,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	q+3//2+1//2*q^2,
	3//2+1//2*q,
	3//2+1//2*q,
	3//2+1//2*q,
	-1//2*q+3//2,
	2*q+1,
	q+1,
	q+1,
	R(1),
	-1//2*q^2+q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	1//2*q+1//2,
	q,
	q,
	R(0),
	R(0),
	1//2*q^2+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	-1//2*q^2-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	q+2,
	R(2),
	q+2,
	R(2),
	R(1),
	R(1),
	q,
	R(0),
	q,
	R(0),
	R(1),
	R(1),
	q,
	R(0),
	R(0),
	R(0),
	R(-1),
	R(-1),
	R(3),
	R(1),
	R(1),
	R(1),
	R(-1),
	R(0),
	R(0),
	R(-1),
	R(0),
	R(-1)] [
	1//2*q*(q^2-q+1)*(q^2+1),
	-1//2*(q-1)*q*(q^2+1),
	1//2*q*(q^2+1),
	1//2*(q-1)^2*q,
	-1//2*(q-1)*q,
	q,
	-1//2*(q-1)*q,
	q,
	R(0),
	R(0),
	1//2*(2*q-1)*(q^2+1),
	1//2*(q-1)*(q^2+1),
	-1//2*(q-1)^2,
	1//2*q^2+q-1//2,
	-1//2*(q-1)^2,
	1//2*q-1//2,
	-q^2+1//2*q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	1//2*q*(q^2+1),
	-1//2*(q-1)*q,
	q,
	R(0),
	R(0),
	1//2*(q-2)*(q^2+1),
	1//2*q-1-1//2*q^2,
	R(-1),
	q-1,
	R(-1),
	R(1),
	R(1),
	R(1),
	-q^2+q-1,
	q-1,
	R(-1),
	1//2*q^2+q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	q,
	q,
	R(0),
	R(0),
	-3//2-1//2*q^2+q,
	1//2*q-3//2,
	1//2*q-3//2,
	1//2*q-3//2,
	-3//2-1//2*q,
	2*q-1,
	q-1,
	q-1,
	R(-1),
	1//2*q^2+1//2,
	-1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q^2-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	q,
	R(0),
	R(1),
	R(1),
	R(-1),
	R(-1),
	q,
	R(0),
	R(-1),
	R(-1),
	q,
	R(0),
	q-2,
	R(-2),
	R(0),
	R(0),
	q-2,
	R(-2),
	R(1),
	R(-1),
	R(1),
	R(-1),
	R(-1),
	R(0),
	R(1),
	R(-3),
	R(0),
	R(0)] [
	1//2*q*(q^2-q+1)*(q+1)^2,
	1//2*q*(q+1)*(q^2+1),
	1//2*q*(q^2+1),
	1//2*q*(q+1)^2,
	1//2*q*(q+1),
	R(0),
	1//2*q*(q+1),
	R(0),
	q,
	R(0),
	1//2*(q+1)^2,
	1//2*(q+1)*(q^2+1),
	1//2*(q+1)^2,
	-1//2*q^2+q+1//2,
	1//2*(q+1)^2,
	1//2*q+1//2,
	1//2*q+1//2,
	q^2+1//2*q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	1//2*q+1//2,
	1//2*(q+1)*(q^2-q+2),
	1//2*q^2+1//2*q+1,
	R(1),
	q+1,
	R(1),
	1//2*q*(q+1)^2,
	1//2*q*(q+1),
	q,
	R(0),
	R(0),
	q*(q+1),
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	-1//2*(q+1)*(q-3),
	3//2+1//2*q,
	3//2+1//2*q,
	-1//2*q+3//2,
	3//2+1//2*q,
	q+1,
	R(1),
	q+1,
	R(1),
	1//2*(q+1)^2,
	1//2*q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	R(0),
	R(0),
	R(0),
	R(0),
	-1//2*(q-1)*(q+1),
	-1//2*q+1//2,
	1//2*q+1//2,
	1//2*(q-1)*(q+1),
	1//2*q-1//2,
	-1//2*q-1//2,
	R(2),
	R(2),
	q+1,
	R(1),
	q+1,
	R(1),
	R(0),
	R(0),
	q+1,
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	q,
	R(0),
	R(0),
	R(0),
	R(2),
	R(2),
	R(0),
	R(0),
	R(0),
	R(1),
	R(-1),
	R(0),
	R(-1),
	R(0)] [
	1//2*(q-1)^2*q*(q^2+q+1),
	-1//2*(q-1)*q*(q^2+1),
	1//2*(q-1)^2*q,
	1//2*q*(q^2+1),
	-1//2*(q-1)*q,
	R(0),
	-1//2*(q-1)*q,
	R(0),
	q,
	R(0),
	-1//2*(q-1)^2,
	1//2*(q-1)*(q^2+1),
	-1//2*(q-1)^2,
	-1//2*(q-1)^2,
	1//2*q^2+q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	-q^2+1//2*q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	1//2*(q-1)^2*q,
	-1//2*(q-1)*q,
	R(0),
	q,
	R(0),
	1//2*(q-1)*(q^2+q+2),
	1//2*q-1-1//2*q^2,
	q-1,
	R(-1),
	R(-1),
	R(0),
	R(0),
	R(0),
	-(q-1)*q,
	q,
	R(0),
	-1//2*(q-1)^2,
	1//2*q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*(q-1)*(3+q),
	1//2*q-3//2,
	1//2*q-3//2,
	-3//2-1//2*q,
	1//2*q-3//2,
	q-1,
	R(-1),
	q-1,
	R(-1),
	-1//2*(q-1)*(q+1),
	1//2*q+1//2,
	-1//2*q+1//2,
	1//2*(q-1)*(q+1),
	-1//2*q-1//2,
	1//2*q-1//2,
	R(0),
	R(0),
	R(0),
	R(0),
	q-1,
	R(-1),
	R(0),
	R(0),
	R(0),
	R(0),
	q-1,
	R(-1),
	R(-2),
	R(-2),
	q,
	R(0),
	q-1,
	R(-1),
	R(0),
	R(0),
	R(0),
	R(-2),
	R(0),
	R(1),
	R(0),
	R(-2),
	R(-1),
	R(1)] [
	q^2*(q^2-q+1)*(q^2+q+1),
	q^2,
	q^2*(q+1),
	-(q-1)*q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	q^2*(2+q^2),
	q^2,
	q^2,
	q*(q+1),
	(q-1)*q,
	R(0),
	R(0),
	R(0),
	q,
	-q,
	R(0),
	R(0),
	q*(q^2+q+1),
	q,
	2*q,
	R(0),
	R(0),
	-q*(q^2-q+1),
	-q,
	R(0),
	-2*q,
	R(0),
	q^2+q+1,
	q+1,
	R(1),
	q^2-q+1,
	-q+1,
	R(1),
	q*(q+2),
	q,
	q,
	R(0),
	R(0),
	q^2+q+1,
	q+1,
	R(1),
	R(1),
	q*(q-2),
	-q,
	-q,
	R(0),
	R(0),
	q^2-q+1,
	-q+1,
	R(1),
	R(1),
	q^2,
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	2*q+1,
	R(1),
	q+2,
	R(2),
	R(-1),
	R(-1),
	R(1),
	R(1),
	-q,
	R(0),
	q,
	R(0),
	-2*q+1,
	R(1),
	R(-1),
	R(-1),
	-q+2,
	R(2),
	R(3),
	R(-1),
	R(1),
	R(-1),
	R(1),
	R(-1),
	R(0),
	R(3),
	R(-1),
	R(0)] [
	q^3*(q^2-q+1)*(q^2+q+1),
	q^3*(q^2+1),
	q^3,
	q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q*(2*q^2+1),
	q*(q^2+1),
	q*(q^2+1),
	q,
	q,
	R(0),
	q,
	q,
	q,
	q,
	R(0),
	R(0),
	q*(q^2+q+1),
	q*(q+1),
	q,
	q,
	R(0),
	q*(q^2-q+1),
	-(q-1)*q,
	q,
	q,
	R(0),
	q*(q^2+q+1),
	q,
	R(0),
	q*(q^2-q+1),
	q,
	R(0),
	2*q+1,
	q+1,
	q+1,
	R(1),
	R(1),
	q^2+q+1,
	R(1),
	q+1,
	R(1),
	2*q-1,
	q-1,
	q-1,
	R(-1),
	R(-1),
	-q^2+q-1,
	R(-1),
	q-1,
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	R(1),
	R(1),
	q+2,
	R(2),
	2*q+1,
	R(1),
	q,
	R(0),
	-q,
	R(0),
	R(1),
	R(1),
	R(-1),
	R(-1),
	q-2,
	R(-2),
	-q,
	R(0),
	2*q-1,
	R(-1),
	R(3),
	R(1),
	R(-1),
	R(-1),
	R(1),
	R(-1),
	R(0),
	R(-3),
	R(1),
	R(0)] [
	1//2*q^4*(q^2+1)*(q^2+q+1),
	1//2*q^4*(q^2+1),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*q^2*(q+2)*(q^2+1),
	1//2*q^2*(q^2+1),
	q^2,
	q^2,
	R(0),
	R(0),
	1//2*q^2*(q+1),
	-1//2*(q-1)*q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*q*(2*q+1)*(q^2+1),
	1//2*q*(q+1),
	q,
	R(0),
	R(0),
	-1//2*q*(q^2+1),
	1//2*(q-1)*q,
	-q,
	R(0),
	R(0),
	q*(q^2+q+1),
	q,
	R(0),
	-q^3,
	R(0),
	R(0),
	3//2*q^2+q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	q*(q+2),
	q,
	q,
	R(0),
	-1//2*q^2-q+1//2,
	-1//2*q+1//2,
	-1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	-q,
	R(0),
	-q,
	R(0),
	-1//2*q^2-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	-1//2*q^2-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	2*q+1,
	R(1),
	2*q+1,
	R(1),
	-q,
	R(0),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	-q,
	R(0),
	R(1),
	R(1),
	R(0),
	R(0),
	-q,
	R(0),
	R(3),
	R(-1),
	R(-1),
	R(1),
	R(-1),
	R(0),
	R(0),
	R(1),
	R(0),
	R(1)] [
	1//2*q^4*(q^2-q+1)*(q+1)^2,
	-1//2*(q-1)*q^4*(q+1),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*q^3*(q+1)^2,
	1//2*(q-1)*q^2*(q+1),
	R(0),
	q^2,
	R(0),
	R(0),
	-1//2*q^2*(q+1),
	1//2*(q-1)*q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*q*(q+1)*(2*q^2-q+1),
	-1//2*(q-1)*q,
	q,
	R(0),
	R(0),
	-1//2*q*(q+1)^2,
	-1//2*q*(q+1),
	-q,
	R(0),
	R(0),
	q*(q+1),
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*(q+1)*(3*q-1),
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	q*(q+1),
	q,
	R(0),
	R(0),
	-1//2*(q+1)^2,
	-1//2*q-1//2,
	-1//2*q-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	R(0),
	R(0),
	R(0),
	R(0),
	-1//2*(q-1)*(q+1),
	-1//2*q+1//2,
	1//2*q+1//2,
	-1//2*(q-1)*(q+1),
	-1//2*q+1//2,
	1//2*q+1//2,
	2*q,
	R(0),
	q+1,
	R(1),
	-q-1,
	R(-1),
	R(0),
	R(0),
	-q-1,
	R(-1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(1),
	R(1),
	R(0),
	R(0),
	R(2),
	R(-2),
	R(0),
	R(0),
	R(0),
	R(1),
	R(-1),
	R(0),
	R(1),
	R(0)] [
	1//2*q^4*(q^2+1)*(q^2-q+1),
	1//2*q^4*(q^2+1),
	R(0),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-1//2*q^2*(q-2)*(q^2+1),
	1//2*q^2*(q^2+1),
	q^2,
	R(0),
	q^2,
	R(0),
	-1//2*(q-1)*q^2,
	1//2*q^2*(q+1),
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*q*(q^2+1),
	1//2*q*(q+1),
	R(0),
	q,
	R(0),
	1//2*q*(2*q-1)*(q^2+1),
	1//2*(q-1)*q,
	R(0),
	-q,
	R(0),
	q^3,
	R(0),
	R(0),
	-q*(q^2-q+1),
	-q,
	R(0),
	-1//2*q^2+q+1//2,
	1//2*q+1//2,
	1//2*q+1//2,
	-1//2*q+1//2,
	1//2*q+1//2,
	q,
	R(0),
	q,
	R(0),
	3//2*q^2-q+1//2,
	-1//2*q+1//2,
	-1//2*q+1//2,
	-1//2*q+1//2,
	1//2*q+1//2,
	q*(q-2),
	-q,
	-q,
	R(0),
	-1//2*q^2-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q^2-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	R(1),
	R(1),
	q,
	R(0),
	q,
	R(0),
	R(-1),
	R(-1),
	q,
	R(0),
	R(-1),
	R(-1),
	-2*q+1,
	R(1),
	R(0),
	R(0),
	-2*q+1,
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(0),
	R(1),
	R(3),
	R(0),
	R(0)] [
	1//2*(q-1)^2*q^4*(q^2+q+1),
	-1//2*(q-1)*q^4*(q+1),
	R(0),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-1//2*(q-1)^2*q^3,
	1//2*(q-1)*q^2*(q+1),
	R(0),
	R(0),
	q^2,
	R(0),
	1//2*(q-1)*q^2,
	-1//2*q^2*(q+1),
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*(q-1)^2*q,
	-1//2*(q-1)*q,
	R(0),
	q,
	R(0),
	1//2*(q-1)*q*(2*q^2+q+1),
	-1//2*q*(q+1),
	R(0),
	-q,
	R(0),
	R(0),
	R(0),
	R(0),
	(q-1)*q,
	-q,
	R(0),
	-1//2*(q-1)^2,
	1//2*q-1//2,
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*(q-1)*(3*q+1),
	-1//2*q-1//2,
	-1//2*q-1//2,
	1//2*q-1//2,
	-1//2*q-1//2,
	(q-1)*q,
	-q,
	R(0),
	R(0),
	-1//2*(q-1)*(q+1),
	1//2*q+1//2,
	-1//2*q+1//2,
	-1//2*(q-1)*(q+1),
	1//2*q+1//2,
	-1//2*q+1//2,
	R(0),
	R(0),
	R(0),
	R(0),
	q-1,
	R(-1),
	R(0),
	R(0),
	R(0),
	R(0),
	q-1,
	R(-1),
	-2*q,
	R(0),
	R(1),
	R(1),
	-q+1,
	R(1),
	R(0),
	R(0),
	R(0),
	R(-2),
	R(0),
	R(1),
	R(0),
	R(2),
	R(1),
	R(-1)] [
	q^9,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^5,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^3,
	R(0),
	R(0),
	q^3,
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	-q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	-q^2,
	R(0),
	R(0),
	R(0),
	-q^2,
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	q,
	R(0),
	q,
	R(0),
	-q,
	R(0),
	-q,
	R(0),
	-q,
	R(0),
	-q,
	R(0),
	q,
	R(0),
	q,
	R(0),
	q,
	R(0),
	R(1),
	R(-1),
	R(-1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(-1)]]
classinfo = Vector{Any}[
	["",[1,0],"C_3","h_1(i_1)"],
	["",[1,1],"C_3","h_1(i_1)u_9(1)"],
	["",[1,2],"C_3","h_1(i_1)u_8(1)"],
	["",[1,3],"C_3","h_1(i_1)u_7(1)u_9(-\\alpha)"],
	["",[1,4],"C_3","h_1(i_1)u_6(1)u_7(1)"],
	["",[1,5],"C_3","h_1(i_1)u_3(1)u_5(1)"],
	["",[1,6],"C_3","h_1(i_1)u_3(1)u_4(1)"],
	["",[1,7],"C_3","h_1(i_1)u_3(1)u_4(1)u_7(1)"],
	["",[1,8],"C_3","h_1(i_1)u_3(1)u_4(\\alpha)u_7(1)"],
	["",[1,9],"C_3","h_1(i_1)u_1(1)u_2(1)u_4(1)"],
	["",[2,0],"\\tilde{A}_1+C_2","h_2(i_1)"],
	["",[2,1],"\\tilde{A}_1+C_2","h_2(i_1)u_9(1)"],
	["",[2,2],"\\tilde{A}_1+C_2","h_2(i_1)u_7(1)"],
	["",[2,3],"\\tilde{A}_1+C_2","h_2(i_1)u_5(1)"],
	["",[2,4],"\\tilde{A}_1+C_2","h_2(i_1)u_4(1)u_7(-\\alpha)"],
	["",[2,5],"\\tilde{A}_1+C_2","h_2(i_1)u_2(1)u_4(1)"],
	["",[2,6],"\\tilde{A}_1+C_2","h_2(i_1)u_7(1)u_9(1)"],
	["",[2,7],"\\tilde{A}_1+C_2","h_2(i_1)u_7(1)u_9(\\alpha)"],
	["",[2,8],"\\tilde{A}_1+C_2","h_2(i_1)u_5(1)u_9(1)"],
	["",[2,9],"\\tilde{A}_1+C_2","h_2(i_1)u_4(1)u_7(-\\alpha)u_9(1)"],
	["",[2,10],"\\tilde{A}_1+C_2","h_2(i_1)u_2(1)u_4(1)u_9(1)"],
	["",[2,11],"\\tilde{A}_1+C_2","h_2(i_1)u_2(1)u_4(1)u_9(\\alpha)"],
	["",[3,0],"C_2","h_3(i_1,i_2)"],
	["",[3,1],"C_2","h_3(i_1,i_2)u_7(1)"],
	["",[3,2],"C_2","h_3(i_1,i_2)u_5(1)"],
	["",[3,3],"C_2","h_3(i_1,i_2)u_4(1)u_7(-\\alpha)"],
	["",[3,4],"C_2","h_3(i_1,i_2)u_2(1)u_4(1)"],
	["",[4,0],"C_2","h_4(i_1,i_2)"],
	["",[4,1],"C_2","h_4(i_1,i_2)u_7(1)"],
	["",[4,2],"C_2","h_4(i_1,i_2)u_5(1)"],
	["",[4,3],"C_2","h_4(i_1,i_2)u_4(1)u_7(-\\alpha)"],
	["",[4,4],"C_2","h_4(i_1,i_2)u_2(1)u_4(1)"],
	["",[5,0],"A_2","h_5(i_1,i_2)"],
	["",[5,1],"A_2","h_5(i_1,i_2)u_2(1)"],
	["",[5,2],"A_2","h_5(i_1,i_2)u_2(1)u_1(1)"],
	["",[6,0],"^2A_2","h_6(i_1,i_2)"],
	["",[6,1],"^2A_2","h_6(i_1,i_2)u_2(1)"],
	["",[6,2],"^2A_2","h_6(i_1,i_2)u_2(1)u_1(1)"],
	["",[7,0],"2\\tilde{A}_1","h_7(i_1,i_2)"],
	["",[7,1],"2\\tilde{A}_1","h_7(i_1,i_2)u_4(1)"],
	["",[7,2],"2\\tilde{A}_1","h_7(i_1,i_2)u_9(1)"],
	["",[7,3],"2\\tilde{A}_1","h_7(i_1,i_2)u_4(1)u_9(1)"],
	["",[7,4],"2\\tilde{A}_1","h_7(i_1,i_2)u_4(1)u_9(\\alpha)"],
	["",[8,0],"A_1+\\tilde{A}_1","h_8(i_1,i_2)"],
	["",[8,1],"A_1+\\tilde{A}_1","h_8(i_1,i_2)u_1(1)"],
	["",[8,2],"A_1+\\tilde{A}_1","h_8(i_1,i_2)u_4(1)"],
	["",[8,3],"A_1+\\tilde{A}_1","h_8(i_1,i_2)u_1(1)u_4(1)"],
	["",[9,0],"2\\tilde{A}_1","h_9(i_1,i_2)"],
	["",[9,1],"2\\tilde{A}_1","h_9(i_1,i_2)u_4(1)"],
	["",[9,2],"2\\tilde{A}_1","h_9(i_1,i_2)u_9(1)"],
	["",[9,3],"2\\tilde{A}_1","h_9(i_1,i_2)u_4(1)u_9(1)"],
	["",[9,4],"2\\tilde{A}_1","h_9(i_1,i_2)u_4(1)u_9(\\alpha)"],
	["",[10,0],"A_1+\\tilde{A}_1","h_{10}(i_1,i_2)"],
	["",[10,1],"A_1+\\tilde{A}_1","h_{10}(i_1,i_2)u_1(1)"],
	["",[10,2],"A_1+\\tilde{A}_1","h_{10}(i_1,i_2)u_4(1)"],
	["",[10,3],"A_1+\\tilde{A}_1","h_{10}(i_1,i_2)u_1(1)u_4(1)"],
	["",[11,0],"^2(2\\tilde{A}_1)","h_{11}(i_1,i_2)"],
	["",[11,1],"^2(2\\tilde{A}_1)","h_{11}(i_1,i_2)u_4(1)u_9(1)"],
	["",[11,2],"^2(2\\tilde{A}_1)","h_{11}(i_1,i_2)u_4(\\gamma)u_9(\\gamma^q)"],
	["",[12,0],"^2(2\\tilde{A}_1)","h_{12}(i_1,i_2)"],
	["",[12,1],"^2(2\\tilde{A}_1)","h_{12}(i_1,i_2)u_4(1)u_9(1)"],
	["",[12,2],"^2(2\\tilde{A}_1)","h_{12}(i_1,i_2)u_4(\\gamma)u_9(\\gamma^q)"],
	["",[13,0],"\\tilde{A}_1","h_{13}(i_1,i_2,i_3)"],
	["",[13,1],"\\tilde{A}_1","h_{13}(i_1,i_2,i_3)u_4(1)"],
	["",[14,0],"A_1","h_{14}(i_1,i_2,i_3)"],
	["",[14,1],"A_1","h_{14}(i_1,i_2,i_3)u_1(1)"],
	["",[15,0],"\\tilde{A}_1","h_{15}(i_1,i_2,i_3)"],
	["",[15,1],"\\tilde{A}_1","h_{15}(i_1,i_2,i_3)u_4(1)"],
	["",[16,0],"\\tilde{A}_1","h_{16}(i_1,i_2)"],
	["",[16,1],"\\tilde{A}_1","h_{16}(i_1,i_2)u_4(1)"],
	["",[17,0],"A_1","h_{17}(i_1,i_2,i_3)"],
	["",[17,1],"A_1","h_{17}(i_1,i_2,i_3)u_1(1)"],
	["",[18,0],"A_1","h_{18}(i_1,i_2,i_3)"],
	["",[18,1],"A_1","h_{18}(i_1,i_2,i_3)u_1(1)"],
	["",[19,0],"\\tilde{A}_1","h_{19}(i_1,i_2,i_3)"],
	["",[19,1],"\\tilde{A}_1","h_{19}(i_1,i_2,i_3)u_4(1)"],
	["",[20,0],"\\tilde{A}_1","h_{20}(i_1,i_2)"],
	["",[20,1],"\\tilde{A}_1","h_{20}(i_1,i_2)u_4(1)"],
	["",[21,0],"A_1","h_{21}(i_1,i_2,i_3)"],
	["",[21,1],"A_1","h_{21}(i_1,i_2,i_3)u_1(1)"],
	["",[22,0],"A_0","h_{22}(i_1,i_2,i_3,i_4)"],
	["",[23,0],"A_0","h_{23}(i_1,i_2,i_3,i_4)"],
	["",[24,0],"A_0","h_{24}(i_1,i_2,i_3)"],
	["",[25,0],"A_0","h_{25}(i_1,i_2,i_3,i_4)"],
	["",[26,0],"A_0","h_{26}(i_1,i_2,i_3)"],
	["",[27,0],"A_0","h_{27}(i_1,i_2,i_3)"],
	["",[28,0],"A_0","h_{28}(i_1,i_2)"],
	["",[29,0],"A_0","h_{29}(i_1,i_2,i_3,i_4)"],
	["",[30,0],"A_0","h_{30}(i_1,i_2,i_3)"],
	["",[31,0],"A_0","h_{31}(i_1,i_2)"]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),
	1//2*q*(q-1)*(q^2+q+1)*(q^2-q+1)*(q+1)^2*(q^2+1),
	1//2*q*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	q^2*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	q^4*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	q^4*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	1//2*q^4*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	1//2*q^4*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	q^6*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	(q^2-q+1)*(q^2+q+1)*q^4,
	(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1)*q^4,
	q^4*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)*(q^2+1),
	1//2*q^5*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	1//2*q^5*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	q^6*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	1//2*q^4*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	1//2*q^4*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	1//2*(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^5,
	1//2*(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^5,
	1//2*q^6*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	1//2*q^6*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	(q+1)*(q^2+q+1)*(q^2-q+1)*q^5,
	q^5*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	1//2*(q+1)^3*(q^2+q+1)*(q^2-q+1)*q^6*(q^2+1)*(q-1),
	1//2*q^6*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	q^5*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	1//2*q^6*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	1//2*q^6*(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q^2+1)*(q+1),
	(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^7,
	(q+1)^2*(q^2+1)*q^6*(q^2-q+1),
	(q+1)^3*(q^2+q+1)*(q^2-q+1)*q^6*(q^2+1)*(q-1),
	(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	(q-1)^2*(q^2+1)*(q^2+q+1)*q^6,
	q^6*(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q^2+1)*(q+1),
	(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^7,
	q^7*(q+1)*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	q^7*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	q^7*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	1//2*(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	1//2*(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	q^7*(q+1)*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	q^7*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	q^7*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	q^7*(q^2-q+1)*(q^2+q+1)*(q-1)*(q^2+1),
	q^7*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	q^7*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	1//2*(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^7,
	1//2*(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^7,
	q^7*(q^2-q+1)*(q^2+q+1)*(q-1)*(q^2+1),
	q^7*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	q^7*(q+1)*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^7,
	(q-1)*(q+1)^2*(q^2+q+1)*(q^2-q+1)*q^7,
	1//2*(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	1//2*(q-1)^2*(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	(q-1)^2*(q+1)*(q^2+q+1)*(q^2-q+1)*q^7,
	1//2*(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^7,
	1//2*(q-1)^3*(q+1)^2*(q^2+1)*(q^2-q+1)*(q^2+q+1)*q^7,
	(q+1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^8,
	(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^8*(q-1),
	(q+1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^8,
	(q+1)^3*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^8*(q-1),
	(q-1)*(q+1)*q^8*(q^2-q+1)*(q^2+q+1)*(q^2+1),
	q^8*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	(q-1)*(q+1)*q^8*(q^2-q+1)*(q^2+q+1)*(q^2+1),
	q^8*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	(q-1)*(q+1)*q^8*(q^2-q+1)*(q^2+q+1)*(q^2+1),
	q^8*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	(q-1)*(q+1)*q^8*(q^2-q+1)*(q^2+q+1)*(q^2+1),
	q^8*(q+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q^2+1),
	q^8*(q^2-q+1)*(q^2+q+1)*(q-1)^2*(q^2+1),
	q^8*(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q^2+1)*(q+1),
	(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1)*q^8,
	(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*q^8,
	q^8*(q^2-q+1)*(q^2+q+1)*(q-1)^2*(q^2+1),
	q^8*(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q^2+1)*(q+1),
	q^9*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	q^9*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	q^9*(q-1)*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1),
	(q+1)*(q^2+q+1)*(q^2-q+1)*q^9*(q-1)^2*(q^2+1),
	(q+1)*(q^2+q+1)*(q^2-q+1)*q^9*(q-1)^2*(q^2+1),
	(q+1)^3*(q^2+q+1)*(q^2-q+1)*q^9*(q-1)^2,
	(q+1)^3*(q^2-q+1)*q^9*(q-1)^2*(q^2+1),
	(q-1)^3*(q^2-q+1)*(q^2+q+1)*q^9*(q^2+1),
	q^9*(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q+1)^2,
	q^9*(q-1)^3*(q^2+q+1)*(q+1)^2*(q^2+1)])
classtypeorder = R.([
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	q-1,
	1//2*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//2*(q-1)^2,
	1//2*(q-1)^2,
	1//2*(q-1)^2,
	1//2*(q-1)^2,
	1//2*(q-1)^2,
	1//2*(q-1)*(q-2),
	1//2*(q-1)*(q-2),
	1//2*(q-1)*(q-2),
	1//2*q*(q-1),
	1//2*q*(q-1),
	1//2*q*(q-1),
	1//4*(q-3)*(q-1),
	1//4*(q-3)*(q-1),
	1//4*(q-3)*(q-1),
	1//4*(q-3)*(q-1),
	1//4*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//2*(q-3)*(q-1),
	1//4*(q-1)^2,
	1//4*(q-1)^2,
	1//4*(q-1)^2,
	1//4*(q-1)^2,
	1//4*(q-1)^2,
	1//2*(q-1)^2,
	1//2*(q-1)^2,
	1//2*(q-1)^2,
	1//2*(q-1)^2,
	1//4*(q-1)^2,
	1//4*(q-1)^2,
	1//4*(q-1)^2,
	1//4*(q+1)*(q-1),
	1//4*(q+1)*(q-1),
	1//4*(q+1)*(q-1),
	1//8*(q-5)*(q-1)*(q-3),
	1//8*(q-5)*(q-1)*(q-3),
	1//4*(q-1)*(q-3)^2,
	1//4*(q-1)*(q-3)^2,
	1//4*(q-3)*(q-1)^2,
	1//4*(q-3)*(q-1)^2,
	1//4*(q-1)^3,
	1//4*(q-1)^3,
	1//4*(q-1)^3,
	1//4*(q-1)^3,
	1//4*(q-1)^3,
	1//4*(q-1)^3,
	1//8*(q-3)*(q-1)^2,
	1//8*(q-3)*(q-1)^2,
	1//4*(q+1)*(q-1)^2,
	1//4*(q+1)*(q-1)^2,
	1//4*(q-1)^3,
	1//4*(q-1)^3,
	1//48*(q-5)*(q-1)*(q-3)*(q-4),
	1//16*(q-2)*(q-3)*(q-1)^2,
	1//8*q*(q-3)*(q-1)^2,
	1//16*(q^2-3*q+4)*(q-1)^2,
	1//8*(q-1)*(q^3-2*q^2-q-2),
	1//8*(q+1)*(q-2)*(q-1)^2,
	1//6*q*(q+1)*(q-1)^2,
	1//48*(q-2)*(q-3)*(q-1)^2,
	1//8*q*(q+1)*(q-1)^2,
	1//6*q*(q+1)*(q-1)^2])
charinfo = Vector{Any}[
	[1,[1,1]],
	[2,[1,2]],
	[3,[1,3]],
	[4,[1,4]],
	[5,[1,5]],
	[6,[1,6]],
	[7,[1,7]],
	[8,[1,8]],
	[9,[1,9]],
	[10,[1,10]],
	[11,[1,11]],
	[12,[1,12]]]
chardegree = R.([
	1,
	1//2*q*(q^2+q+1)*(q^2+1),
	1//2*q*(q^2-q+1)*(q^2+1),
	1//2*q*(q^2-q+1)*(q+1)^2,
	1//2*(q-1)^2*q*(q^2+q+1),
	q^2*(q^2-q+1)*(q^2+q+1),
	q^3*(q^2-q+1)*(q^2+q+1),
	1//2*q^4*(q^2+1)*(q^2+q+1),
	1//2*q^4*(q^2-q+1)*(q+1)^2,
	1//2*q^4*(q^2+1)*(q^2-q+1),
	1//2*(q-1)^2*q^4*(q^2+q+1),
	q^9])

information = "Information about the table of unipotent characters of \$CSp_6(q)\$, \$q\$ odd

- CHEVIE-name of the table: ``uniCSp6.1``

- The computation of the whole table of this group is explained in:
  {\\sc F.Lübeck}, Charaktertafeln für die Gruppen
  \$CSp_6(q)\$ mit ungeradem \$q\$ und \$Sp_6(q)\$ mit geradem \$q\$,
  Dissertation, Heidelberg (1993)

- This table is extracted from the table ``CSp6.1``, which
  contains the unipotent characters in the first 12 character
  types (specialize the parameter kK1 to 0).

- If you want to calculate *only* with the unipotent characters
  then use this table ``uniCSp6.1`` (the calculations will run
  much faster). If you also want to use the other characters
  of ``CSp6.1``, then produce the unipotent characters with the
  CHEVIE-commands ``Copy`` and ``SpecCharParam`` as explained
  above.
"

TABLE=SimpleCharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

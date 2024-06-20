using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^12*(q-1)^2*(q^2-1)*(q^4-1)^2*(q^6-1)
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
	q+q^5+2*q^3,
	2*q^3+q,
	q^3+q,
	q^3+q,
	q^3+q,
	q,
	q^2+q,
	-q^2+q,
	q,
	q,
	q,
	q,
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
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	4*q,
	3*q,
	3*q,
	2*q,
	3*q,
	2*q,
	2*q,
	q,
	3*q,
	2*q,
	2*q,
	q,
	2*q,
	q,
	q,
	R(0),
	R(0),
	3*q-1,
	2*q-1,
	2*q-1,
	q-1,
	2*q-1,
	q-1,
	q-1,
	R(-1),
	3*q+1,
	2*q+1,
	2*q+1,
	q+1,
	2*q+1,
	q+1,
	q+1,
	R(1),
	q^3-q^2+q-1,
	q-1-q^2,
	q-1,
	q-1,
	R(-1),
	q^3+q+q^2+1,
	q^2+q+1,
	q+1,
	q+1,
	R(1),
	q^3-q^2+q-1,
	q-1-q^2,
	q-1,
	q-1,
	R(-1),
	q^3+q+q^2+1,
	q^2+q+1,
	q+1,
	q+1,
	R(1),
	q^3-q^2+q-1,
	q-1-q^2,
	q-1,
	q-1,
	R(-1),
	q^3+q+q^2+1,
	q^2+q+1,
	q+1,
	q+1,
	R(1),
	-2+2*q,
	-2+q,
	-2+q,
	R(-2),
	R(0),
	R(0),
	R(0),
	R(0),
	2*q,
	q,
	q,
	R(0),
	2*q+2,
	q+2,
	q+2,
	R(2),
	-2+2*q,
	-2+q,
	-2+q,
	R(-2),
	R(0),
	R(0),
	R(0),
	R(0),
	2*q,
	q,
	q,
	R(0),
	2*q+2,
	q+2,
	q+2,
	R(2),
	-2+2*q,
	-2+q,
	-2+q,
	R(-2),
	R(0),
	R(0),
	R(0),
	R(0),
	2*q,
	q,
	q,
	R(0),
	2*q+2,
	q+2,
	q+2,
	R(2),
	-2-q^2+q,
	-2+q,
	R(-2),
	q^2+q+2,
	q+2,
	R(2),
	q-3,
	R(-3),
	q-1,
	R(-1),
	q-1,
	R(-1),
	q+1,
	R(1),
	q-1,
	R(-1),
	q+1,
	R(1),
	q+1,
	R(1),
	q+3,
	R(3),
	R(-4),
	R(0),
	R(-1),
	R(0),
	R(-2),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(1),
	R(2),
	R(4)] [
	q^2+q^6+q^4,
	q^4+q^2,
	q^4+q^2,
	q^2,
	q^2,
	q^2,
	q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	2*q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	q^2+1,
	R(1),
	q^2+1,
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	q^2-q+1,
	1-q,
	q^2+1,
	R(1),
	1-q,
	1-q,
	R(1),
	R(1),
	q^2+q+1,
	q+1,
	q^2+1,
	R(1),
	q+1,
	q+1,
	R(1),
	R(1),
	q^4+q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	q^4+q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	q^2-q-q^3,
	-q+q^2,
	-q,
	-q,
	R(0),
	q^3+q^2+q,
	q^2+q,
	q,
	q,
	R(0),
	q^2-q-q^3,
	-q+q^2,
	-q,
	-q,
	R(0),
	q^3+q^2+q,
	q^2+q,
	q,
	q,
	R(0),
	q^2+2,
	R(2),
	R(2),
	R(2),
	q^2,
	R(0),
	q^2+2,
	R(2),
	q^2,
	R(0),
	R(0),
	R(0),
	q^2+2,
	R(2),
	R(2),
	R(2),
	1-2*q,
	1-q,
	1-q,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	1-q,
	q+1,
	R(1),
	2*q+1,
	q+1,
	q+1,
	R(1),
	1-2*q,
	1-q,
	1-q,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	q+1,
	1-q,
	R(1),
	2*q+1,
	q+1,
	q+1,
	R(1),
	q^2-q+1,
	1-q,
	R(1),
	q^2+q+1,
	q+1,
	R(1),
	-q+2,
	R(2),
	-q,
	R(0),
	-q,
	R(0),
	-q+2,
	R(2),
	q+2,
	R(2),
	q,
	R(0),
	q,
	R(0),
	q+2,
	R(2),
	R(3),
	R(-1),
	R(0),
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(3),
	R(-1),
	R(-1),
	R(0),
	R(1),
	R(3)] [
	q^2+q^6+q^4,
	q^4+q^2,
	q^2,
	q^2,
	q^4+q^2,
	q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	2*q^2+1,
	q^2+1,
	q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	R(1),
	q^2+1,
	R(1),
	R(1),
	R(1),
	q^2+1,
	R(1),
	R(1),
	R(1),
	R(1),
	q^2-q+1,
	q^2+1,
	1-q,
	R(1),
	1-q,
	R(1),
	1-q,
	R(1),
	q^2+q+1,
	q+1,
	q+1,
	q+1,
	q^2+1,
	R(1),
	R(1),
	R(1),
	q^2-q-q^3,
	-q+q^2,
	-q,
	-q,
	R(0),
	q^3+q^2+q,
	q^2+q,
	q,
	q,
	R(0),
	q^2-q-q^3,
	-q+q^2,
	-q,
	-q,
	R(0),
	q^3+q^2+q,
	q^2+q,
	q,
	q,
	R(0),
	q^4+q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	q^4+q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	1-2*q,
	1-q,
	1-q,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	q+1,
	1-q,
	R(1),
	2*q+1,
	q+1,
	q+1,
	R(1),
	1-2*q,
	1-q,
	1-q,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	q+1,
	1-q,
	R(1),
	2*q+1,
	q+1,
	q+1,
	R(1),
	q^2+2,
	R(2),
	R(2),
	R(2),
	q^2,
	R(0),
	q^2+2,
	R(2),
	q^2,
	R(0),
	R(0),
	R(0),
	q^2+2,
	R(2),
	R(2),
	R(2),
	q^2-q+1,
	1-q,
	R(1),
	q^2+q+1,
	q+1,
	R(1),
	-q+2,
	R(2),
	q+2,
	R(2),
	-q,
	R(0),
	q,
	R(0),
	-q,
	R(0),
	q,
	R(0),
	-q+2,
	R(2),
	q+2,
	R(2),
	R(3),
	R(-1),
	R(0),
	R(-1),
	R(1),
	R(-1),
	R(1),
	R(-1),
	R(-1),
	R(3),
	R(0),
	R(1),
	R(3)] [
	q^2+q^6+q^4,
	q^4+q^2,
	q^2,
	q^4+q^2,
	q^2,
	q^2,
	q^2,
	q^2,
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	q^2+1,
	R(1),
	q^2+1,
	R(1),
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	q^2-q+1,
	1-q,
	1-q,
	1-q,
	q^2+1,
	R(1),
	R(1),
	R(1),
	q^2+q+1,
	q^2+1,
	q+1,
	R(1),
	q+1,
	R(1),
	q+1,
	R(1),
	q^2-q-q^3,
	-q+q^2,
	-q,
	-q,
	R(0),
	q^3+q^2+q,
	q^2+q,
	q,
	q,
	R(0),
	q^4+q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	q^4+q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	q^2-q-q^3,
	-q+q^2,
	-q,
	-q,
	R(0),
	q^3+q^2+q,
	q^2+q,
	q,
	q,
	R(0),
	1-2*q,
	1-q,
	1-q,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	1-q,
	q+1,
	R(1),
	2*q+1,
	q+1,
	q+1,
	R(1),
	q^2+2,
	R(2),
	R(2),
	R(2),
	q^2,
	R(0),
	q^2+2,
	R(2),
	q^2,
	R(0),
	R(0),
	R(0),
	q^2+2,
	R(2),
	R(2),
	R(2),
	1-2*q,
	1-q,
	1-q,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	1-q,
	q+1,
	R(1),
	2*q+1,
	q+1,
	q+1,
	R(1),
	q^2-q+1,
	1-q,
	R(1),
	q^2+q+1,
	q+1,
	R(1),
	-q+2,
	R(2),
	-q,
	R(0),
	q+2,
	R(2),
	q,
	R(0),
	-q,
	R(0),
	-q+2,
	R(2),
	q,
	R(0),
	q+2,
	R(2),
	R(3),
	R(-1),
	R(0),
	R(-1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(3),
	R(-1),
	R(0),
	R(1),
	R(3)] [
	3//2*q^5+1//2*q^3+1//2*q^9+3//2*q^7-1//2*q^4-1//2*q^8-q^6,
	3//2*q^5+1//2*q^3-1//2*q^4-1//2*q^6,
	1//2*q^5+1//2*q^3,
	1//2*q^5+1//2*q^3,
	1//2*q^5+1//2*q^3,
	1//2*q^3+1//2*q^4,
	R(0),
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*q^4+1//2+q^2,
	1//2+1//2*q^2,
	1//2+1//2*q^2,
	1//2-1//2*q^2,
	1//2+1//2*q^2,
	1//2*q^4+1//2+q^2,
	1//2+1//2*q^2,
	1//2+1//2*q^2,
	1//2-1//2*q^2,
	1//2+1//2*q^2,
	1//2*q^4+1//2+q^2,
	1//2+1//2*q^2,
	1//2+1//2*q^2,
	1//2-1//2*q^2,
	1//2+1//2*q^2,
	2*q^3+2*q+1//2*q^4+1//2-3*q^2,
	1//2*q^3+3//2*q+1//2-3//2*q^2,
	1//2*q^3+3//2*q+1//2-3//2*q^2,
	q+1//2-1//2*q^2,
	1//2*q^3+3//2*q+1//2-3//2*q^2,
	q+1//2-1//2*q^2,
	q+1//2-1//2*q^2,
	1//2*q+1//2,
	1//2*q^3+3//2*q+1//2-3//2*q^2,
	q+1//2-1//2*q^2,
	q+1//2-1//2*q^2,
	1//2*q+1//2,
	q+1//2-1//2*q^2,
	1//2*q+1//2,
	1//2*q+1//2,
	1//2-1//2*q^2,
	1//2+1//2*q^2,
	-3*q^2+3*q,
	-q^2+2*q,
	-q^2+2*q,
	q,
	-q^2+2*q,
	q,
	q,
	R(0),
	q^3+1,
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1),
	-q^4-q^2+q^5+2*q^3+q,
	-q^2+q^3+q,
	q,
	q,
	R(0),
	q^4+q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	-q^4-q^2+q^5+2*q^3+q,
	-q^2+q^3+q,
	q,
	q,
	R(0),
	q^4+q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	-q^4-q^2+q^5+2*q^3+q,
	-q^2+q^3+q,
	q,
	q,
	R(0),
	q^4+q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	-q^2+4*q-1,
	2*q-1,
	2*q-1,
	R(-1),
	R(0),
	R(0),
	q^2+1,
	R(1),
	-q^2+1,
	R(1),
	R(1),
	R(1),
	q^2+1,
	R(1),
	R(1),
	R(1),
	-q^2+4*q-1,
	2*q-1,
	2*q-1,
	R(-1),
	R(0),
	R(0),
	q^2+1,
	R(1),
	-q^2+1,
	R(1),
	R(1),
	R(1),
	q^2+1,
	R(1),
	R(1),
	R(1),
	-q^2+4*q-1,
	2*q-1,
	2*q-1,
	R(-1),
	R(0),
	R(0),
	q^2+1,
	R(1),
	-q^2+1,
	R(1),
	R(1),
	R(1),
	q^2+1,
	R(1),
	R(1),
	R(1),
	q^3-2*q^2+2*q-1,
	2*q-1,
	R(-1),
	q^2+q,
	q,
	R(0),
	-3+3*q,
	R(-3),
	q+1,
	R(1),
	q+1,
	R(1),
	1-q,
	R(1),
	q+1,
	R(1),
	1-q,
	R(1),
	1-q,
	R(1),
	q+1,
	R(1),
	R(-6),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(2),
	R(2),
	R(2),
	R(-1),
	R(0),
	R(2)] [
	3//2*q^5+1//2*q^3+1//2*q^9+3//2*q^7+3//2*q^4+3//2*q^8+q^6,
	3//2*q^5+1//2*q^3+3//2*q^4+1//2*q^6,
	1//2*q^5+1//2*q^3+q^4,
	1//2*q^5+1//2*q^3+q^4,
	1//2*q^5+1//2*q^3+q^4,
	1//2*q^3+1//2*q^4,
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	1//2*q^4+1//2-q^2,
	1//2-1//2*q^2,
	1//2-1//2*q^2,
	1//2+1//2*q^2,
	1//2-1//2*q^2,
	1//2*q^4+1//2-q^2,
	1//2-1//2*q^2,
	1//2-1//2*q^2,
	1//2+1//2*q^2,
	1//2-1//2*q^2,
	1//2*q^4+1//2-q^2,
	1//2-1//2*q^2,
	1//2-1//2*q^2,
	1//2+1//2*q^2,
	1//2-1//2*q^2,
	2*q^3+2*q+1//2*q^4+1//2+3*q^2,
	1//2*q^3+3//2*q+1//2+3//2*q^2,
	1//2*q^3+3//2*q+1//2+3//2*q^2,
	q+1//2+1//2*q^2,
	1//2*q^3+3//2*q+1//2+3//2*q^2,
	q+1//2+1//2*q^2,
	q+1//2+1//2*q^2,
	1//2*q+1//2,
	1//2*q^3+3//2*q+1//2+3//2*q^2,
	q+1//2+1//2*q^2,
	q+1//2+1//2*q^2,
	1//2*q+1//2,
	q+1//2+1//2*q^2,
	1//2*q+1//2,
	1//2*q+1//2,
	1//2+1//2*q^2,
	1//2-1//2*q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^3+3*q^2+3*q+1,
	q^2+2*q+1,
	q^2+2*q+1,
	q+1,
	q^2+2*q+1,
	q+1,
	q+1,
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^5+2*q^4+2*q^3+2*q^2+q,
	q^3+2*q^2+q,
	q^2+q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^5+2*q^4+2*q^3+2*q^2+q,
	q^3+2*q^2+q,
	q^2+q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^5+2*q^4+2*q^3+2*q^2+q,
	q^3+2*q^2+q,
	q^2+q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^2+1,
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	2*q^2+4*q+2,
	2*q+2,
	2*q+2,
	R(2),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^2+1,
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	2*q^2+4*q+2,
	2*q+2,
	2*q+2,
	R(2),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^2+1,
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	2*q^2+4*q+2,
	2*q+2,
	2*q+2,
	R(2),
	R(0),
	R(0),
	R(0),
	q^3+3*q^2+3*q+1,
	3*q+1,
	R(1),
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
	R(0),
	R(0),
	R(0),
	4*q+4,
	R(4),
	R(0),
	R(2),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(-1),
	R(0),
	R(8)] [
	3//2*q^5+1//2*q^3+1//2*q^9+3//2*q^7+1//2*q^4+1//2*q^8+q^6,
	3//2*q^5+1//2*q^3+1//2*q^4+1//2*q^6,
	1//2*q^5+1//2*q^3,
	1//2*q^5+1//2*q^3,
	1//2*q^5+1//2*q^3,
	1//2*q^3-1//2*q^4,
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-1//2*q^4-1//2-q^2,
	-1//2-1//2*q^2,
	-1//2-1//2*q^2,
	-1//2-1//2*q^2,
	-1//2+1//2*q^2,
	-1//2*q^4-1//2-q^2,
	-1//2-1//2*q^2,
	-1//2-1//2*q^2,
	-1//2-1//2*q^2,
	-1//2+1//2*q^2,
	-1//2*q^4-1//2-q^2,
	-1//2-1//2*q^2,
	-1//2-1//2*q^2,
	-1//2-1//2*q^2,
	-1//2+1//2*q^2,
	2*q^3+2*q-1//2*q^4-1//2+3*q^2,
	1//2*q^3+3//2*q-1//2+3//2*q^2,
	1//2*q^3+3//2*q-1//2+3//2*q^2,
	q-1//2+1//2*q^2,
	1//2*q^3+3//2*q-1//2+3//2*q^2,
	q-1//2+1//2*q^2,
	q-1//2+1//2*q^2,
	1//2*q-1//2,
	1//2*q^3+3//2*q-1//2+3//2*q^2,
	q-1//2+1//2*q^2,
	q-1//2+1//2*q^2,
	1//2*q-1//2,
	q-1//2+1//2*q^2,
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2-1//2*q^2,
	-1//2+1//2*q^2,
	q^3-1,
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	3*q^2+3*q,
	q^2+2*q,
	q^2+2*q,
	q,
	q^2+2*q,
	q,
	q,
	R(0),
	-q^4-q^2,
	-q^2,
	-q^2,
	R(0),
	R(0),
	q^5+q^4+2*q^3+q^2+q,
	q^3+q^2+q,
	q,
	q,
	R(0),
	-q^4-q^2,
	-q^2,
	-q^2,
	R(0),
	R(0),
	q^5+q^4+2*q^3+q^2+q,
	q^3+q^2+q,
	q,
	q,
	R(0),
	-q^4-q^2,
	-q^2,
	-q^2,
	R(0),
	R(0),
	q^5+q^4+2*q^3+q^2+q,
	q^3+q^2+q,
	q,
	q,
	R(0),
	-q^2-1,
	R(-1),
	R(-1),
	R(-1),
	R(0),
	R(0),
	-q^2-1,
	R(-1),
	q^2-1,
	R(-1),
	R(-1),
	R(-1),
	q^2+4*q+1,
	2*q+1,
	2*q+1,
	R(1),
	-q^2-1,
	R(-1),
	R(-1),
	R(-1),
	R(0),
	R(0),
	-q^2-1,
	R(-1),
	q^2-1,
	R(-1),
	R(-1),
	R(-1),
	q^2+4*q+1,
	2*q+1,
	2*q+1,
	R(1),
	-q^2-1,
	R(-1),
	R(-1),
	R(-1),
	R(0),
	R(0),
	-q^2-1,
	R(-1),
	q^2-1,
	R(-1),
	R(-1),
	R(-1),
	q^2+4*q+1,
	2*q+1,
	2*q+1,
	R(1),
	-q^2+q,
	q,
	R(0),
	q^3+2*q^2+2*q+1,
	2*q+1,
	R(1),
	q-1,
	R(-1),
	-q-1,
	R(-1),
	-q-1,
	R(-1),
	q-1,
	R(-1),
	-q-1,
	R(-1),
	q-1,
	R(-1),
	q-1,
	R(-1),
	3*q+3,
	R(3),
	R(-2),
	R(0),
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(-2),
	R(-2),
	R(-2),
	R(0),
	R(0),
	R(6)] [
	3//2*q^5+1//2*q^3+1//2*q^9+3//2*q^7-3//2*q^4-3//2*q^8-q^6,
	3//2*q^5+1//2*q^3-3//2*q^4-1//2*q^6,
	1//2*q^5+1//2*q^3-q^4,
	1//2*q^5+1//2*q^3-q^4,
	1//2*q^5+1//2*q^3-q^4,
	1//2*q^3-1//2*q^4,
	R(0),
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-1//2*q^4-1//2+q^2,
	-1//2+1//2*q^2,
	-1//2+1//2*q^2,
	-1//2+1//2*q^2,
	-1//2-1//2*q^2,
	-1//2*q^4-1//2+q^2,
	-1//2+1//2*q^2,
	-1//2+1//2*q^2,
	-1//2+1//2*q^2,
	-1//2-1//2*q^2,
	-1//2*q^4-1//2+q^2,
	-1//2+1//2*q^2,
	-1//2+1//2*q^2,
	-1//2+1//2*q^2,
	-1//2-1//2*q^2,
	2*q^3+2*q-1//2*q^4-1//2-3*q^2,
	1//2*q^3+3//2*q-1//2-3//2*q^2,
	1//2*q^3+3//2*q-1//2-3//2*q^2,
	q-1//2-1//2*q^2,
	1//2*q^3+3//2*q-1//2-3//2*q^2,
	q-1//2-1//2*q^2,
	q-1//2-1//2*q^2,
	1//2*q-1//2,
	1//2*q^3+3//2*q-1//2-3//2*q^2,
	q-1//2-1//2*q^2,
	q-1//2-1//2*q^2,
	1//2*q-1//2,
	q-1//2-1//2*q^2,
	1//2*q-1//2,
	1//2*q-1//2,
	-1//2+1//2*q^2,
	-1//2-1//2*q^2,
	q^3-3*q^2+3*q-1,
	-q^2+2*q-1,
	-q^2+2*q-1,
	q-1,
	-q^2+2*q-1,
	q-1,
	q-1,
	R(-1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-2*q^4-2*q^2+q^5+2*q^3+q,
	-2*q^2+q^3+q,
	-q^2+q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-2*q^4-2*q^2+q^5+2*q^3+q,
	-2*q^2+q^3+q,
	-q^2+q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-2*q^4-2*q^2+q^5+2*q^3+q,
	-2*q^2+q^3+q,
	-q^2+q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-2*q^2+4*q-2,
	-2+2*q,
	-2+2*q,
	R(-2),
	q^2-1,
	R(-1),
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
	-2*q^2+4*q-2,
	-2+2*q,
	-2+2*q,
	R(-2),
	q^2-1,
	R(-1),
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
	-2*q^2+4*q-2,
	-2+2*q,
	-2+2*q,
	R(-2),
	q^2-1,
	R(-1),
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
	q^3-3*q^2+3*q-1,
	3*q-1,
	R(-1),
	R(0),
	R(0),
	R(0),
	-4+4*q,
	R(-4),
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
	R(0),
	R(0),
	R(0),
	R(-8),
	R(-2),
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0)] [
	q^6+q^8+q^10,
	q^6,
	q^6,
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
	q^4+2*q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^4+2*q^2,
	q^2,
	q^2,
	R(0),
	q^2,
	q^2,
	R(0),
	R(0),
	q^2,
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^2-q-q^3,
	-q,
	q^2,
	R(0),
	-q,
	-q,
	R(0),
	R(0),
	q^3+q^2+q,
	q,
	q^2,
	R(0),
	q,
	q,
	R(0),
	R(0),
	q^2+q^6+q^4,
	q^2,
	q^2,
	R(0),
	R(0),
	q^2+q^6+q^4,
	q^2,
	q^2,
	R(0),
	R(0),
	-q^5+q^4-q^3,
	-q^3,
	R(0),
	R(0),
	R(0),
	q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	-q^5+q^4-q^3,
	-q^3,
	R(0),
	R(0),
	R(0),
	q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	2*q^2+1,
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	2*q^2+1,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q^2+1,
	R(1),
	R(1),
	R(1),
	q^2-2*q,
	-q,
	-q,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	-q^2,
	-q,
	q,
	R(0),
	q^2+2*q,
	q,
	q,
	R(0),
	q^2-2*q,
	-q,
	-q,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	-q^2,
	q,
	-q,
	R(0),
	q^2+2*q,
	q,
	q,
	R(0),
	q^2-q-q^3,
	-q,
	R(0),
	q^3+q^2+q,
	q,
	R(0),
	1-2*q,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	1-2*q,
	R(1),
	2*q+1,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q+1,
	R(1),
	R(3),
	R(-1),
	R(0),
	R(-1),
	R(-1),
	R(1),
	R(1),
	R(3),
	R(-1),
	R(-1),
	R(0),
	R(-1),
	R(3)] [
	q^6+q^8+q^10,
	q^6,
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^4+2*q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	q^4+2*q^2,
	q^2,
	q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	q^2-q-q^3,
	q^2,
	-q,
	R(0),
	-q,
	R(0),
	-q,
	R(0),
	q^3+q^2+q,
	q,
	q,
	q,
	q^2,
	R(0),
	R(0),
	R(0),
	-q^5+q^4-q^3,
	-q^3,
	R(0),
	R(0),
	R(0),
	q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	-q^5+q^4-q^3,
	-q^3,
	R(0),
	R(0),
	R(0),
	q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	q^2+q^6+q^4,
	q^2,
	q^2,
	R(0),
	R(0),
	q^2+q^6+q^4,
	q^2,
	q^2,
	R(0),
	R(0),
	q^2-2*q,
	-q,
	-q,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	-q^2,
	q,
	-q,
	R(0),
	q^2+2*q,
	q,
	q,
	R(0),
	q^2-2*q,
	-q,
	-q,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	-q^2,
	q,
	-q,
	R(0),
	q^2+2*q,
	q,
	q,
	R(0),
	2*q^2+1,
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	2*q^2+1,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q^2+1,
	R(1),
	R(1),
	R(1),
	q^2-q-q^3,
	-q,
	R(0),
	q^3+q^2+q,
	q,
	R(0),
	1-2*q,
	R(1),
	2*q+1,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	1-2*q,
	R(1),
	2*q+1,
	R(1),
	R(3),
	R(-1),
	R(0),
	R(1),
	R(-1),
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(3),
	R(0),
	R(-1),
	R(3)] [
	q^6+q^8+q^10,
	q^6,
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^4+2*q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^4+2*q^2,
	q^2,
	q^2,
	R(0),
	q^2,
	R(0),
	q^2,
	R(0),
	q^2,
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^2-q-q^3,
	-q,
	-q,
	-q,
	q^2,
	R(0),
	R(0),
	R(0),
	q^3+q^2+q,
	q^2,
	q,
	R(0),
	q,
	R(0),
	q,
	R(0),
	-q^5+q^4-q^3,
	-q^3,
	R(0),
	R(0),
	R(0),
	q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	q^2+q^6+q^4,
	q^2,
	q^2,
	R(0),
	R(0),
	q^2+q^6+q^4,
	q^2,
	q^2,
	R(0),
	R(0),
	-q^5+q^4-q^3,
	-q^3,
	R(0),
	R(0),
	R(0),
	q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	q^2-2*q,
	-q,
	-q,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	-q^2,
	-q,
	q,
	R(0),
	q^2+2*q,
	q,
	q,
	R(0),
	2*q^2+1,
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	2*q^2+1,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	2*q^2+1,
	R(1),
	R(1),
	R(1),
	q^2-2*q,
	-q,
	-q,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	-q^2,
	-q,
	q,
	R(0),
	q^2+2*q,
	q,
	q,
	R(0),
	q^2-q-q^3,
	-q,
	R(0),
	q^3+q^2+q,
	q,
	R(0),
	1-2*q,
	R(1),
	R(-1),
	R(-1),
	2*q+1,
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	1-2*q,
	R(1),
	R(-1),
	R(-1),
	2*q+1,
	R(1),
	R(3),
	R(-1),
	R(0),
	R(1),
	R(-1),
	R(-1),
	R(1),
	R(-1),
	R(3),
	R(-1),
	R(0),
	R(-1),
	R(3)] [
	q^11+2*q^9+q^7,
	q^7,
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
	R(0),
	R(0),
	R(0),
	R(0),
	4*q^3,
	q^3,
	q^3,
	R(0),
	q^3,
	R(0),
	R(0),
	R(0),
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^3-3*q^2,
	-q^2,
	-q^2,
	R(0),
	-q^2,
	R(0),
	R(0),
	R(0),
	q^3+3*q^2,
	q^2,
	q^2,
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	-q^6+q^5-q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	q^6+q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	-q^6+q^5-q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	q^6+q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	-q^6+q^5-q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	q^6+q^5+q^4+q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	-2*q^2+2*q,
	q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-2*q,
	-q,
	-q,
	R(0),
	2*q^2+2*q,
	q,
	q,
	R(0),
	-2*q^2+2*q,
	q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-2*q,
	-q,
	-q,
	R(0),
	2*q^2+2*q,
	q,
	q,
	R(0),
	-2*q^2+2*q,
	q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-2*q,
	-q,
	-q,
	R(0),
	2*q^2+2*q,
	q,
	q,
	R(0),
	2*q^3-q^2+q,
	q,
	R(0),
	2*q^3+q^2+q,
	q,
	R(0),
	3*q-1,
	R(-1),
	1-q,
	R(1),
	1-q,
	R(1),
	-q-1,
	R(-1),
	1-q,
	R(1),
	-q-1,
	R(-1),
	-q-1,
	R(-1),
	3*q+1,
	R(1),
	R(-4),
	R(0),
	R(-1),
	R(0),
	R(2),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(1),
	R(-2),
	R(4)] [
	q^12,
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
	R(0),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^4,
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
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
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
	q^2,
	R(0),
	-q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	-q^2,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	-q^2,
	R(0),
	q^2,
	R(0),
	-q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	-q^3,
	R(0),
	R(0),
	q^3,
	R(0),
	R(0),
	-q,
	R(0),
	q,
	R(0),
	q,
	R(0),
	-q,
	R(0),
	q,
	R(0),
	-q,
	R(0),
	-q,
	R(0),
	q,
	R(0),
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(-1),
	R(1)]]
classinfo = Vector{Any}[
	[[1,0],["D_4","u_0"]],
	[[1,1],["D_4","u_1"]],
	[[1,2],["D_4","u_2"]],
	[[1,3],["D_4","u_3"]],
	[[1,4],["D_4","u_4"]],
	[[1,5],["D_4","u_5"]],
	[[1,6],["D_4","u_6"]],
	[[1,7],["D_4","u_7"]],
	[[1,8],["D_4","u_8"]],
	[[1,9],["D_4","u_9"]],
	[[1,10],["D_4","u_{10}"]],
	[[1,11],["D_4","u_{11}"]],
	[[1,12],["D_4","u_{12}"]],
	[[2,0],["^2(2A_1)+^2(2A_1)",[[1,1],[1,1]]]],
	[[2,1],["^2(2A_1)+^2(2A_1)",[[1,1],[2]]]],
	[[2,2],["^2(2A_1)+^2(2A_1)",[[2],[1,1]]]],
	[[2,3],["^2(2A_1)+^2(2A_1)",[[2],[2]]]],
	[[2,4],["^2(2A_1)+^2(2A_1)",[[2],[2]]]],
	[[3,0],["^2(2A_1)+^2(2A_1)",[[1,1],[1,1]]]],
	[[3,1],["^2(2A_1)+^2(2A_1)",[[1,1],[2]]]],
	[[3,2],["^2(2A_1)+^2(2A_1)",[[2],[1,1]]]],
	[[3,3],["^2(2A_1)+^2(2A_1)",[[2],[2]]]],
	[[3,4],["^2(2A_1)+^2(2A_1)",[[2],[2]]]],
	[[4,0],["^2(2A_1)+^2(2A_1)",[[1,1],[1,1]]]],
	[[4,1],["^2(2A_1)+^2(2A_1)",[[1,1],[2]]]],
	[[4,2],["^2(2A_1)+^2(2A_1)",[[2],[1,1]]]],
	[[4,3],["^2(2A_1)+^2(2A_1)",[[2],[2]]]],
	[[4,4],["^2(2A_1)+^2(2A_1)",[[2],[2]]]],
	[[5,0],["4A_1",[[1,1],[1,1],[1,1],[1,1]]]],
	[[5,1],["4A_1",[[1,1],[1,1],[1,1],[2]]]],
	[[5,2],["4A_1",[[1,1],[1,1],[2],[1,1]]]],
	[[5,3],["4A_1",[[1,1],[1,1],[2],[2]]]],
	[[5,4],["4A_1",[[1,1],[2],[1,1],[1,1]]]],
	[[5,5],["4A_1",[[1,1],[2],[1,1],[2]]]],
	[[5,6],["4A_1",[[1,1],[2],[2],[1,1]]]],
	[[5,7],["4A_1",[[1,1],[2],[2],[2]]]],
	[[5,8],["4A_1",[[2],[1,1],[1,1],[1,1]]]],
	[[5,9],["4A_1",[[2],[1,1],[1,1],[2]]]],
	[[5,10],["4A_1",[[2],[1,1],[2],[1,1]]]],
	[[5,11],["4A_1",[[2],[1,1],[2],[2]]]],
	[[5,12],["4A_1",[[2],[2],[1,1],[1,1]]]],
	[[5,13],["4A_1",[[2],[2],[1,1],[2]]]],
	[[5,14],["4A_1",[[2],[2],[2],[1,1]]]],
	[[5,15],["4A_1",[[2],[2],[2],[2]]]],
	[[5,16],["4A_1",[[2],[2],[2],[2]]]],
	[[6,0],["3A_1",[[1,1],[1,1],[1,1]]]],
	[[6,1],["3A_1",[[1,1],[1,1],[2]]]],
	[[6,2],["3A_1",[[1,1],[2],[1,1]]]],
	[[6,3],["3A_1",[[1,1],[2],[2]]]],
	[[6,4],["3A_1",[[2],[1,1],[1,1]]]],
	[[6,5],["3A_1",[[2],[1,1],[2]]]],
	[[6,6],["3A_1",[[2],[2],[1,1]]]],
	[[6,7],["3A_1",[[2],[2],[2]]]],
	[[7,0],["3A_1",[[1,1],[1,1],[1,1]]]],
	[[7,1],["3A_1",[[1,1],[1,1],[2]]]],
	[[7,2],["3A_1",[[1,1],[2],[1,1]]]],
	[[7,3],["3A_1",[[1,1],[2],[2]]]],
	[[7,4],["3A_1",[[2],[1,1],[1,1]]]],
	[[7,5],["3A_1",[[2],[1,1],[2]]]],
	[[7,6],["3A_1",[[2],[2],[1,1]]]],
	[[7,7],["3A_1",[[2],[2],[2]]]],
	[[8,0],["^2A_3",[1,1,1,1]]],
	[[8,1],["^2A_3",[2,1,1]]],
	[[8,2],["^2A_3",[2,2]]],
	[[8,3],["^2A_3",[3,1]]],
	[[8,4],["^2A_3",[4]]],
	[[9,0],["A_3",[1,1,1,1]]],
	[[9,1],["A_3",[2,1,1]]],
	[[9,2],["A_3",[2,2]]],
	[[9,3],["A_3",[3,1]]],
	[[9,4],["A_3",[4]]],
	[[10,0],["^2A_3",[1,1,1,1]]],
	[[10,1],["^2A_3",[2,1,1]]],
	[[10,2],["^2A_3",[2,2]]],
	[[10,3],["^2A_3",[3,1]]],
	[[10,4],["^2A_3",[4]]],
	[[11,0],["A_3",[1,1,1,1]]],
	[[11,1],["A_3",[2,1,1]]],
	[[11,2],["A_3",[2,2]]],
	[[11,3],["A_3",[3,1]]],
	[[11,4],["A_3",[4]]],
	[[12,0],["^2A_3",[1,1,1,1]]],
	[[12,1],["^2A_3",[2,1,1]]],
	[[12,2],["^2A_3",[2,2]]],
	[[12,3],["^2A_3",[3,1]]],
	[[12,4],["^2A_3",[4]]],
	[[13,0],["A_3",[1,1,1,1]]],
	[[13,1],["A_3",[2,1,1]]],
	[[13,2],["A_3",[2,2]]],
	[[13,3],["A_3",[3,1]]],
	[[13,4],["A_3",[4]]],
	[[14,0],["2A_1",[[1,1],[1,1]]]],
	[[14,1],["2A_1",[[1,1],[2]]]],
	[[14,2],["2A_1",[[2],[1,1]]]],
	[[14,3],["2A_1",[[2],[2]]]],
	[[15,0],["^2(2A_1)",[1,1]]],
	[[15,1],["^2(2A_1)",[2]]],
	[[16,0],["^2(2A_1)",[1,1]]],
	[[16,1],["^2(2A_1)",[2]]],
	[[17,0],["2A_1",[[1,1],[1,1]]]],
	[[17,1],["2A_1",[[1,1],[2]]]],
	[[17,2],["2A_1",[[2],[1,1]]]],
	[[17,3],["2A_1",[[2],[2]]]],
	[[18,0],["2A_1",[[1,1],[1,1]]]],
	[[18,1],["2A_1",[[1,1],[2]]]],
	[[18,2],["2A_1",[[2],[1,1]]]],
	[[18,3],["2A_1",[[2],[2]]]],
	[[19,0],["2A_1",[[1,1],[1,1]]]],
	[[19,1],["2A_1",[[1,1],[2]]]],
	[[19,2],["2A_1",[[2],[1,1]]]],
	[[19,3],["2A_1",[[2],[2]]]],
	[[20,0],["^2(2A_1)",[1,1]]],
	[[20,1],["^2(2A_1)",[2]]],
	[[21,0],["^2(2A_1)",[1,1]]],
	[[21,1],["^2(2A_1)",[2]]],
	[[22,0],["2A_1",[[1,1],[1,1]]]],
	[[22,1],["2A_1",[[1,1],[2]]]],
	[[22,2],["2A_1",[[2],[1,1]]]],
	[[22,3],["2A_1",[[2],[2]]]],
	[[23,0],["2A_1",[[1,1],[1,1]]]],
	[[23,1],["2A_1",[[1,1],[2]]]],
	[[23,2],["2A_1",[[2],[1,1]]]],
	[[23,3],["2A_1",[[2],[2]]]],
	[[24,0],["2A_1",[[1,1],[1,1]]]],
	[[24,1],["2A_1",[[1,1],[2]]]],
	[[24,2],["2A_1",[[2],[1,1]]]],
	[[24,3],["2A_1",[[2],[2]]]],
	[[25,0],["^2(2A_1)",[1,1]]],
	[[25,1],["^2(2A_1)",[2]]],
	[[26,0],["^2(2A_1)",[1,1]]],
	[[26,1],["^2(2A_1)",[2]]],
	[[27,0],["2A_1",[[1,1],[1,1]]]],
	[[27,1],["2A_1",[[1,1],[2]]]],
	[[27,2],["2A_1",[[2],[1,1]]]],
	[[27,3],["2A_1",[[2],[2]]]],
	[[28,0],["2A_1",[[1,1],[1,1]]]],
	[[28,1],["2A_1",[[1,1],[2]]]],
	[[28,2],["2A_1",[[2],[1,1]]]],
	[[28,3],["2A_1",[[2],[2]]]],
	[[29,0],["^2A_2",[1,1,1]]],
	[[29,1],["^2A_2",[2,1]]],
	[[29,2],["^2A_2",[3]]],
	[[30,0],["A_2",[1,1,1]]],
	[[30,1],["A_2",[2,1]]],
	[[30,2],["A_2",[3]]],
	[[31,0],["A_1",[1,1]]],
	[[31,1],["A_1",[2]]],
	[[32,0],["A_1",[1,1]]],
	[[32,1],["A_1",[2]]],
	[[33,0],["A_1",[1,1]]],
	[[33,1],["A_1",[2]]],
	[[34,0],["A_1",[1,1]]],
	[[34,1],["A_1",[2]]],
	[[35,0],["A_1",[1,1]]],
	[[35,1],["A_1",[2]]],
	[[36,0],["A_1",[1,1]]],
	[[36,1],["A_1",[2]]],
	[[37,0],["A_1",[1,1]]],
	[[37,1],["A_1",[2]]],
	[[38,0],["A_1",[1,1]]],
	[[38,1],["A_1",[2]]],
	[[39,0],["A_0",[1]]],
	[[40,0],["A_0",[1]]],
	[[41,0],["A_0",[1]]],
	[[42,0],["A_0",[1]]],
	[[43,0],["A_0",[1]]],
	[[44,0],["A_0",[1]]],
	[[45,0],["A_0",[1]]],
	[[46,0],["A_0",[1]]],
	[[47,0],["A_0",[1]]],
	[[48,0],["A_0",[1]]],
	[[49,0],["A_0",[1]]],
	[[50,0],["A_0",[1]]],
	[[51,0],["A_0",[1]]]]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2,
	(q^2+q+1)*(q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^2,
	(q^2+q+1)*(q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^2,
	(q^2+q+1)*(q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^2,
	(q^2-q+1)*(q^2+q+1)*(q^2+1)^2*(q-1)^3*(q+1)^3*q^2,
	1//2*(q^2-q+1)*(q^2+q+1)*(q-1)^2*(q^2+1)^2*(q+1)^4*q^4,
	1//2*(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1)^2*(q-1)^4*q^4,
	(q^2-q+1)*(q^2+q+1)*(q^2+1)^2*(q-1)^3*(q+1)^3*q^6,
	(q^2-q+1)*(q^2+q+1)*(q^2+1)^2*(q-1)^3*(q+1)^3*q^6,
	(q^2-q+1)*(q^2+q+1)*(q^2+1)^2*(q-1)^3*(q+1)^3*q^6,
	(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4*q^6,
	q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	q^8*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1),
	q^8*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	q^8*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	q^8*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1),
	q^8*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	q^8*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	q^8*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2-q+1),
	q^8*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	q^8*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*(q^2+1),
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)*(q+1),
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)*(q+1),
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q+1)^2,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)*(q+1),
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q+1)^2,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q+1)^2,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3*(q+1)^3,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)*(q+1),
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q+1)^2,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q+1)^2,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3*(q+1)^3,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2*(q+1)^2,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3*(q+1)^3,
	q^8*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3*(q+1)^3,
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	1//2*q^8*(q^2+q+1)*(q^2-q+1)*(q^2+1)^2*(q-1)^4*(q+1)^4,
	q^9*(q^2+1)^2*(q-1)*(q^2+q+1)*(q^2-q+1),
	q^9*(q^2+1)^2*(q-1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^9*(q^2+1)^2*(q-1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^9*(q^2+1)^2*(q-1)^3*(q^2+q+1)*(q^2-q+1)*(q+1)^2,
	q^9*(q^2+1)^2*(q-1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^9*(q^2+1)^2*(q-1)^3*(q^2+q+1)*(q^2-q+1)*(q+1)^2,
	q^9*(q^2+1)^2*(q-1)^3*(q^2+q+1)*(q^2-q+1)*(q+1)^2,
	q^9*(q^2+1)^2*(q-1)^4*(q^2+q+1)*(q^2-q+1)*(q+1)^3,
	q^9*(q+1)*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^9*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^9*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^9*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2,
	q^9*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^9*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2,
	q^9*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2,
	q^9*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3,
	q^6*(q-1)^2*(q^2+1)*(q^2+q+1),
	q^6*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^7*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q+1)^2*(q^2-q+1),
	q^8*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q+1)^2*(q^2-q+1),
	q^9*(q^2+1)^2*(q-1)^4*(q^2+q+1)*(q^2-q+1)*(q+1)^3,
	q^6*(q+1)^2*(q^2+1)*(q^2-q+1),
	q^6*(q+1)^3*(q^2+1)^2*(q^2-q+1)*(q^2+q+1)*(q-1),
	q^7*(q+1)^3*(q^2+1)^2*(q^2-q+1)*(q-1)^2*(q^2+q+1),
	q^8*(q+1)^4*(q^2+1)^2*(q^2-q+1)*(q-1)^2*(q^2+q+1),
	q^9*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3,
	q^6*(q-1)^2*(q^2+1)*(q^2+q+1),
	q^6*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^7*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q+1)^2*(q^2-q+1),
	q^8*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q+1)^2*(q^2-q+1),
	q^9*(q^2+1)^2*(q-1)^4*(q^2+q+1)*(q^2-q+1)*(q+1)^3,
	q^6*(q+1)^2*(q^2+1)*(q^2-q+1),
	q^6*(q+1)^3*(q^2+1)^2*(q^2-q+1)*(q^2+q+1)*(q-1),
	q^7*(q+1)^3*(q^2+1)^2*(q^2-q+1)*(q-1)^2*(q^2+q+1),
	q^8*(q+1)^4*(q^2+1)^2*(q^2-q+1)*(q-1)^2*(q^2+q+1),
	q^9*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3,
	q^6*(q-1)^2*(q^2+1)*(q^2+q+1),
	q^6*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^7*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q+1)^2*(q^2-q+1),
	q^8*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q+1)^2*(q^2-q+1),
	q^9*(q^2+1)^2*(q-1)^4*(q^2+q+1)*(q^2-q+1)*(q+1)^3,
	q^6*(q+1)^2*(q^2+1)*(q^2-q+1),
	q^6*(q+1)^3*(q^2+1)^2*(q^2-q+1)*(q^2+q+1)*(q-1),
	q^7*(q+1)^3*(q^2+1)^2*(q^2-q+1)*(q-1)^2*(q^2+q+1),
	q^8*(q+1)^4*(q^2+1)^2*(q^2-q+1)*(q-1)^2*(q^2+q+1),
	q^9*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^3,
	q^10*(q-1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^10*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^10*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1)^2,
	(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*q^10,
	(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2-q+1)*q^10*(q^2+1),
	q^10*(q+1)^2*(q-1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^3*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	(q^2+q+1)*(q^2-q+1)*(q+1)*(q^2+1)^2*(q-1)*q^10,
	(q^2+q+1)*(q^2-q+1)*(q+1)^2*(q^2+1)^2*(q-1)^2*q^10,
	(q^2+q+1)*(q^2-q+1)*(q+1)^2*(q^2+1)^2*(q-1)^2*q^10,
	q^10*(q+1)^3*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^10*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^10*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2,
	q^10*(q-1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^10*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^10*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1)^2,
	(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*q^10,
	(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2-q+1)*q^10*(q^2+1),
	q^10*(q+1)^2*(q-1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^3*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	(q^2+q+1)*(q^2-q+1)*(q+1)*(q^2+1)^2*(q-1)*q^10,
	(q^2+q+1)*(q^2-q+1)*(q+1)^2*(q^2+1)^2*(q-1)^2*q^10,
	(q^2+q+1)*(q^2-q+1)*(q+1)^2*(q^2+1)^2*(q-1)^2*q^10,
	q^10*(q+1)^3*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^10*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^10*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2,
	q^10*(q-1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^10*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^10*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1)^2,
	(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2-q+1)*q^10,
	(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2-q+1)*q^10*(q^2+1),
	q^10*(q+1)^2*(q-1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^3*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	(q^2+q+1)*(q^2-q+1)*(q+1)*(q^2+1)^2*(q-1)*q^10,
	(q^2+q+1)*(q^2-q+1)*(q+1)^2*(q^2+1)^2*(q-1)^2*q^10,
	(q^2+q+1)*(q^2-q+1)*(q+1)^2*(q^2+1)^2*(q-1)^2*q^10,
	q^10*(q+1)^3*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^10*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^10*(q+1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1),
	q^10*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2,
	q^9*(q-1)^3*(q^2+1)^2*(q^2+q+1),
	q^9*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q+1)*(q^2-q+1),
	q^10*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1)^2,
	q^9*(q+1)^3*(q^2+1)^2*(q^2-q+1),
	q^9*(q+1)^4*(q^2+1)^2*(q^2-q+1)*(q-1)*(q^2+q+1),
	q^10*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q-1)^2,
	q^11*(q-1)^3*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q-1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)*(q+1),
	q^11*(q-1)^2*(q+1)*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q-1)^3*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q-1)^2*(q+1)*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q-1)^3*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q+1)^2*(q^2+1)^2*(q-1)*(q^2+q+1)*(q^2-q+1),
	q^11*(q+1)^3*(q^2+1)^2*(q-1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q-1)^2*(q+1)*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q-1)^3*(q+1)^2*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q+1)^2*(q^2+1)^2*(q-1)*(q^2+q+1)*(q^2-q+1),
	q^11*(q+1)^3*(q^2+1)^2*(q-1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q+1)^2*(q^2+1)^2*(q-1)*(q^2+q+1)*(q^2-q+1),
	q^11*(q+1)^3*(q^2+1)^2*(q-1)^2*(q^2+q+1)*(q^2-q+1),
	q^11*(q+1)^3*(q^2+1)^2*(q^2-q+1)*(q^2+q+1),
	q^11*(q+1)^4*(q^2+1)^2*(q^2-q+1)*(q^2+q+1)*(q-1),
	q^12*(q-1)^4*(q^2+1)^2*(q^2-q+1)*(q^2+q+1),
	q^12*(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2-q+1),
	(q-1)^4*q^12*(q+1)^2*(q^2+1)^2*(q^2+q+1),
	(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q+1)^3*(q^2+1)*q^12,
	q^12*(q+1)*(q-1)^3*(q^2+1)^2*(q^2-q+1)*(q^2+q+1),
	(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q+1)^3*(q^2+1)*q^12,
	(q-1)^3*(q^2-q+1)*(q^2+q+1)*(q+1)^3*(q^2+1)*q^12,
	q^12*(q+1)^2*(q-1)^2*(q^2+1)^2*(q^2-q+1)*(q^2+q+1),
	q^12*(q+1)^2*(q-1)^2*(q^2+1)^2*(q^2-q+1)*(q^2+q+1),
	q^12*(q+1)^2*(q-1)^2*(q^2+1)^2*(q^2-q+1)*(q^2+q+1),
	q^12*(q+1)^4*(q-1)^2*(q^2+1)^2*(q^2-q+1),
	q^12*(q+1)^3*(q^2+1)^2*(q-1)*(q^2-q+1)*(q^2+q+1),
	(q+1)^4*(q^2+1)^2*q^12*(q^2-q+1)*(q^2+q+1)])
classtypeorder = R.([
	(q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	(q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	 (q-1)^2,
	(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//4*(q-1)^2,
	 1//2*(q-1)^3,
	 1//2*(q-1)^3,
	1//2*(q-1)^3,
	 1//2*(q-1)^3,
	 1//2*(q-1)^3,
	 1//2*(q-1)^3,
	 1//2*(q-1)^3,
	1//2*(q-1)^3,
	 1//2*(q-3)*(q-1)^2,
	 1//2*(q-3)*(q-1)^2,
	 1//2*(q-3)*(q-1)^2,
	1//2*(q-3)*(q-1)^2,
	 1//2*(q-3)*(q-1)^2,
	 1//2*(q-3)*(q-1)^2,
	 1//2*(q-3)*(q-1)^2,
	1//2*(q-3)*(q-1)^2,
	 1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	 1//2*q*(q-1)^2,
	1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	 1//2*q*(q-1)^2,
	1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	 1//2*q*(q-1)^2,
	1//2*q*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	 1//2*(-2+q)*(q-1)^2,
	1//8*(q-1)^4,
	 1//8*(q-1)^4,
	 1//8*(q-1)^4,
	 1//8*(q-1)^4,
	1//4*(q-1)^3*(q+1),
	 1//4*(q-1)^3*(q+1),
	 1//4*(q^2-2*q-1)*(q-1)^2,
	 1//4*(q^2-2*q-1)*(q-1)^2,
	 1//4*(q-1)^4,
	 1//4*(q-1)^4,
	 1//4*(q-1)^4,
	1//4*(q-1)^4,
	 1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^2*(q-3)^2,
	1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^4,
	1//8*(q-1)^4,
	 1//8*(q-1)^4,
	 1//8*(q-1)^4,
	 1//4*(q-1)^3*(q+1),
	1//4*(q-1)^3*(q+1),
	 1//4*(q^2-2*q-1)*(q-1)^2,
	1//4*(q^2-2*q-1)*(q-1)^2,
	 1//4*(q-1)^4,
	 1//4*(q-1)^4,
	 1//4*(q-1)^4,
	1//4*(q-1)^4,
	 1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^2*(q-3)^2,
	1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^4,
	1//8*(q-1)^4,
	 1//8*(q-1)^4,
	 1//8*(q-1)^4,
	 1//4*(q-1)^3*(q+1),
	1//4*(q-1)^3*(q+1),
	 1//4*(q^2-2*q-1)*(q-1)^2,
	1//4*(q^2-2*q-1)*(q-1)^2,
	 1//4*(q-1)^4,
	 1//4*(q-1)^4,
	 1//4*(q-1)^4,
	1//4*(q-1)^4,
	 1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^2*(q-3)^2,
	1//8*(q-1)^2*(q-3)^2,
	 1//8*(q-1)^2*(q-3)^2,
	 1//2*q*(q-1)^3,
	1//2*q*(q-1)^3,
	 1//2*q*(q-1)^3,
	 1//2*(-2+q)*(q-3)*(q-1)^2,
	 1//2*(-2+q)*(q-3)*(q-1)^2,
	 1//2*(-2+q)*(q-3)*(q-1)^2,
	1//8*(q^2-3*q+1)*(q-1)^3,
	 1//8*(q^2-3*q+1)*(q-1)^3,
	1//8*(q^3-2*q^2-1)*(q-1)^2,
	 1//8*(q^3-2*q^2-1)*(q-1)^2,
	 1//8*(q^3-2*q^2-1)*(q-1)^2,
	 1//8*(q^3-2*q^2-1)*(q-1)^2,
	1//8*(q^2-3*q+1)*(q-1)^3,
	 1//8*(q^2-3*q+1)*(q-1)^3,
	1//8*(q^3-2*q^2-1)*(q-1)^2,
	 1//8*(q^3-2*q^2-1)*(q-1)^2,
	1//8*(q^2-3*q+1)*(q-1)^3,
	 1//8*(q^2-3*q+1)*(q-1)^3,
	1//8*(q^2-3*q+1)*(q-1)^3,
	 1//8*(q^2-3*q+1)*(q-1)^3,
	 1//8*(q-3)*(q^2-7*q+11)*(q-1)^2,
	 1//8*(q-3)*(q^2-7*q+11)*(q-1)^2,
	1//192*(q-3)*(q^2-4*q+1)*(q-1)^3,
	 1//16*(q+1)*(q^2-3)*(q-1)^3,
	1//6*q*(q-1)^3*(q+1)^2,
	 1//8*(q-1)^4*(q+1)^2,
	 1//16*(q^3-q^2-q-1)*(q-1)^3,
	1//8*(q-1)^4*(q+1)^2,
	 1//8*(q-1)^4*(q+1)^2,
	1//32*(q-3)*(q+1)*(q^2-2*q-1)*(q-1)^2,
	1//32*(q-3)*(q+1)*(q^2-2*q-1)*(q-1)^2,
	1//32*(q-3)*(q+1)*(q^2-2*q-1)*(q-1)^2,
	1//6*q*(q-1)^4*(q+1),
	 1//16*(q^3-5*q^2+7*q-1)*(q-1)^3,
	1//192*(q-5)*(q-3)*(q^2-8*q+13)*(q-1)^2])
charinfo = Vector{Any}[
	[[1,0],["D_4",[[4],[0]]]],
	[[1,1],["D_4",[[3],[1]]]],
	[[1,2],["D_4",[[1,4],[0,1]]]],
	[[1,3],["D_4",[[2],[2]]]],
	[[1,4],["D_4",[[2],[2]]]],
	[[1,5],["D_4",[[2,3],[0,1]]]],
	[[1,6],["D_4",[[1,3],[0,2]]]],
	[[1,7],["D_4",[[1,2],[0,3]]]],
	[[1,8],["D_4",[[0,1,2,3],[]]]],
	[[1,9],["D_4",[[1,2,4],[0,1,2]]]],
	[[1,10],["D_4",[[1,2],[1,2]]]],
	[[1,11],["D_4",[[1,2],[1,2]]]],
	[[1,12],["D_4",[[1,2,3],[0,1,3]]]],
	[[1,13],["D_4",[[1,2,3,4],[0,1,2,3]]]]]
chardegree = R.([
	1,
	q*(q^2+1)^2,
	q^2*(q^2-q+1)*(q^2+q+1),
	q^2*(q^2-q+1)*(q^2+q+1),
	q^2*(q^2-q+1)*(q^2+q+1),
	1//2*q^3*(q^2-q+1)*(q^2+1)^2,
	1//2*q^3*(q^2-q+1)*(q+1)^4,
	1//2*q^3*(q^2+q+1)*(q^2+1)^2,
	1//2*q^3*(q^2+q+1)*(q-1)^4,
	q^6*(q^2-q+1)*(q^2+q+1),
	q^6*(q^2-q+1)*(q^2+q+1),
	q^6*(q^2-q+1)*(q^2+q+1),
	q^7*(q^2+1)^2,
	q^12])

information = raw"""- Information about the unipotent character table of $CSpin_8(q)$, $q$ odd

- CHEVIE-name of the table: ``uniCSpin8.1``

- The table was first computed in:
  {\sc M.~Geck and G.~Pfeiffer}, Unipotent characters of the Chevalley groups
  $D_4(q)$, $q$ odd, {\em Manuscripta Math.} {\bf 76} (1992), 281--304.

- The symbols parametrizing the unipotent characters are given in form
  of a pair of lists in (the 2nd part of) position 3 of the character
  information list. (Look at ``uniCSpin8.1``[i,-1][3][2], i = 1, ... ,14.)
"""

TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information,splitext(basename(@__FILE__))[1])

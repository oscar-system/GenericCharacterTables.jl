using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^15*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*(q-1)^3*(q+1)^6
table = QQPolyRingElem[[
	q^15,
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
	-q^10,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
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
	-q^6,
	R(0),
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
	-q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	-q^4,
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
	q^3,
	R(0),
	R(0),
	R(0),
	q^3,
	R(0),
	q^3,
	R(0),
	R(0),
	-q^3,
	R(0),
	R(0),
	q^3,
	R(0),
	R(0),
	-q^2,
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
	q,
	R(0),
	-q,
	R(0),
	q,
	R(0),
	q,
	R(0),
	-q,
	R(0),
	R(-1),
	R(1),
	R(-1),
	R(1),
	R(-1),
	R(1),
	R(-1),
	R(1),
	R(-1),
	R(-1),
	R(1)] [
	q^10*(q^4-q^3+q^2-q+1),
	q^10,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^6*(q^4-q^3+q^2-q+1),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^4*(q^3-2*q^2+q-1),
	q^6,
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^4*(q^2-2*q+2),
	q^4,
	R(0),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^6,
	R(0),
	R(0),
	q^3*(2*q^3-q^2+q-1),
	-q^3,
	R(0),
	R(0),
	R(0),
	(q^2-q+1)*q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	q^2*(2*q^2-2*q+1),
	-q^3,
	q^2,
	R(0),
	R(0),
	R(0),
	-q^2*(2*q-3),
	q^2,
	q^2,
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	q^2,
	R(0),
	q^2,
	R(0),
	q^3,
	R(0),
	-q*(3*q^2-q+1),
	-q,
	R(0),
	q*(q^2-q+1),
	q,
	R(0),
	(q-1)*q,
	-q,
	R(0),
	q*(3*q-2),
	-q,
	-q,
	R(0),
	-q*(q-2),
	q,
	q,
	R(0),
	q^2,
	R(0),
	q^2,
	R(0),
	-4*q+1,
	R(1),
	2*q-1,
	R(-1),
	-q+1,
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	R(5),
	R(-3),
	R(1),
	R(1),
	R(2),
	R(0),
	R(-1),
	R(-1),
	R(-1),
	R(0),
	R(1)] [
	q^7*(q^2+q+1)*(q^2-q+1)^2,
	q^7*(q^2-q+1),
	q^7,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	q^4*(q^2-q+1)*(q^3-q^2-1),
	-q^4*(q^2-q+1),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^3*(q^2-q+1)*(q^2+2),
	(q^2-q+1)*q^3,
	-q^3*(q-2),
	q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^2*(q^2-q+1)^2,
	-(q^2-q+1)*q^2,
	R(0),
	-(q^2-q+1)*q^2,
	-q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	q^2*(q^2+q+1)*(q^2-q+1),
	q^2,
	R(0),
	-q^2*(q^2-q+1)^2,
	q^2*(2*q-1),
	-q^2,
	R(0),
	R(0),
	q^2*(q^2+q+1)*(q^2-q+1),
	q^2,
	q^2,
	R(0),
	R(0),
	-q*(2*q-1)*(q^2-q+1),
	q*(q^2-q+1),
	-q*(2*q-1),
	q,
	R(0),
	R(0),
	3*q*(q^2-q+1),
	-q*(q-2),
	-q*(q-2),
	q,
	-q*(q-2),
	q,
	q,
	R(0),
	q*(q^2+q+1),
	q,
	q^2,
	R(0),
	R(0),
	R(0),
	3*q*(q^2-q+1),
	3*q,
	R(0),
	-q*(q^2-q+1),
	-q,
	R(0),
	R(0),
	R(0),
	R(0),
	-(2*q-1)^2,
	2*q-1,
	2*q-1,
	R(-1),
	2*q^2+1,
	R(1),
	R(1),
	R(1),
	R(-1),
	R(-1),
	2*q^2+1,
	R(1),
	6*q-3,
	R(-3),
	-2*q+1,
	R(1),
	R(0),
	R(0),
	2*q+1,
	R(1),
	R(-1),
	R(-1),
	R(-9),
	R(3),
	R(-1),
	R(3),
	R(0),
	R(0),
	R(0),
	R(-1),
	R(-1),
	R(1),
	R(0)] [
	q^6*(q^2+q+1)*(q^4-q^3+q^2-q+1),
	q^6*(q^2+1),
	q^6,
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	(q^4-q^3+q^2-q+1)*q^4,
	-q^4*(q-1),
	q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	q^2*(q^4-q^3+2*q^2+1),
	q^2*(q^2+1),
	q^2*(q^2+1),
	q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	q^2*(q^4+q^2-2*q+1),
	-q^2*(q-1),
	R(0),
	-q^2*(q-1),
	q^2,
	R(0),
	R(0),
	R(0),
	R(0),
	q^2*(q^2+q+1)*(q^2-q+1),
	q^2,
	R(0),
	-q^2*(q^3-2*q^2+q-1),
	-q^2*(q-1),
	q^2,
	R(0),
	R(0),
	q^2*(q^3+q+1),
	q^2*(q+1),
	q^2,
	R(0),
	R(0),
	q*(q^3-q^2+2*q-1),
	(q-1)*q,
	(q-1)*q,
	-q,
	R(0),
	R(0),
	-q^3+3*q^2+1,
	q^2+1,
	q^2+1,
	R(1),
	q^2+1,
	R(1),
	R(1),
	R(1),
	q^3+q^2+1,
	R(1),
	q^2+1,
	R(1),
	-(q-1)*(q^2+q+1),
	R(1),
	-q*(q^2-2*q+2),
	-2*q,
	R(0),
	q^3,
	R(0),
	R(0),
	-q*(q^2+q-1),
	q,
	R(0),
	2*q^2-2*q+1,
	-q+1,
	-q+1,
	R(1),
	2*q+1,
	q+1,
	q+1,
	R(1),
	R(1),
	R(1),
	2*q^2+1,
	R(1),
	-3*q+2,
	R(2),
	q,
	R(0),
	R(-1),
	R(-1),
	2+q,
	R(2),
	-q,
	R(0),
	R(5),
	R(-1),
	R(1),
	R(3),
	R(-1),
	R(-1),
	R(2),
	R(1),
	R(-1),
	R(0),
	R(0)] [
	(q^2+1)*(q^4-q^3+q^2-q+1)*q^6,
	-q^6*(q-1)*(q^2+1),
	q^6,
	R(0),
	q^6,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^3*(q^2+1)*(q^4-q^3+q^2-q+1),
	(q-1)*(q^2+1)*q^3,
	-q^3,
	-q^3,
	R(0),
	R(0),
	R(0),
	q^2*(q^2+1)*(2*q^2-2*q+1),
	(q-1)*(q^2+1)*q^3,
	q^2*(q-1)^2,
	-q^3,
	q^2,
	R(0),
	q^2,
	R(0),
	R(0),
	R(0),
	-q^2*(2*q^3-3*q^2+4*q-1),
	q^2*(q-1)^2,
	-q^3,
	q^2*(q-1)^2,
	q^2,
	R(0),
	-q^3,
	R(0),
	R(0),
	q^2*(q^2+1),
	q^2,
	R(0),
	q*(q^2+1)*(q^3-2*q^2+q-1),
	-q*(2*q^2-q+1),
	-q,
	-q,
	R(0),
	q*(q^2+1)*(q^3-q+1),
	-(q-1)*q,
	q,
	q,
	R(0),
	q*(q^3-4*q^2+3*q-2),
	-q*(2*q^2-q+1),
	2*(q-1)*q,
	-q,
	-q,
	R(0),
	-q*(q^2-6*q+3),
	2*(q-1)*q,
	2*(q-1)*q,
	-q,
	2*(q-1)*q,
	-q,
	-q,
	R(0),
	q*(q^2+1),
	q,
	R(0),
	R(0),
	-q^3,
	R(0),
	-3*q^3+3*q^2-3*q+1,
	-3*q+1,
	R(1),
	-q^3-q^2+q-1,
	q-1,
	R(-1),
	R(1),
	R(1),
	R(1),
	3*q^2-6*q+1,
	-3*q+1,
	-3*q+1,
	R(1),
	q^2+2*q-1,
	q-1,
	q-1,
	R(-1),
	-q^2-1,
	R(-1),
	q^2+1,
	R(1),
	-6*q+4,
	R(4),
	R(-2),
	R(-2),
	R(1),
	R(1),
	2*q,
	R(0),
	R(0),
	R(0),
	R(10),
	R(-2),
	R(-2),
	R(2),
	R(1),
	R(1),
	R(1),
	R(0),
	R(0),
	R(0),
	R(-1)] [
	q^4*(q^2+1)*(q^2+q+1)*(q-1)^3,
	-q^4*(q^2+1)*(q-1)^2,
	-q^4*(q-1)^2,
	q^4*(q-1),
	q^4*(q-1),
	-q^4,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-q^2*(q-1)^2*(q^2+1)^2,
	q^2*(q-1)*(2*q^2-q+1),
	-q^2*(q-1)^2,
	q^2*(q-1),
	-q^2,
	R(0),
	R(0),
	-q*(q^2+1)*(q-1)^3,
	q*(q^2+1)*(q-1)^2,
	-q*(q-1)^3,
	q*(q-1)^2,
	q*(q-1)^2,
	-(q-1)*q,
	-(q-1)*q,
	q,
	R(0),
	R(0),
	2*q*(q^2+1)*(q-1)^2,
	-q*(q-1)*(q^2-q+2),
	-(q-1)*q,
	-q*(q-1)*(q^2-q+2),
	-2*(q-1)*q,
	q,
	-(q-1)*q,
	q,
	R(0),
	R(0),
	R(0),
	R(0),
	2*q*(q^2+1)*(q-1)^2,
	2*q*(q-1)^2,
	-2*(q-1)*q,
	2*q,
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	-(q-1)^4,
	(q-1)^3,
	-(3*q-1)*(q-1),
	3*q-1,
	q-1,
	R(-1),
	2*(q-1)^3,
	-2*(q-1)^2,
	-2*(q-1)^2,
	2*q-2,
	-2*(q-1)^2,
	2*q-2,
	2*q-2,
	R(-2),
	R(0),
	R(0),
	R(0),
	R(0),
	-(q-1)*(q^2+q+1),
	R(1),
	2*(q-1)^3,
	6*q-2,
	R(-2),
	R(0),
	R(0),
	R(0),
	-(q-1)*(q^2+q+1),
	R(1),
	R(1),
	-4*(q-1)^2,
	4*q-4,
	4*q-4,
	R(-4),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	R(0),
	8*q-8,
	R(-8),
	R(0),
	R(0),
	-q+1,
	R(1),
	R(0),
	R(0),
	R(0),
	R(0),
	R(-16),
	R(0),
	R(0),
	R(0),
	R(2),
	R(0),
	R(2),
	R(0),
	R(0),
	R(-1),
	R(0)] [
	q^3*(q^2+q+1)*(q^4-q^3+q^2-q+1),
	-q^3*(q^3-q^2-1),
	q^3*(q^2+1),
	q^3,
	q^3,
	q^3,
	q^3,
	R(0),
	R(0),
	R(0),
	R(0),
	-q^2*(q^4-q^3+q^2-q+1),
	-(q^2-q+1)*q^2,
	q^2*(q-1),
	-q^2,
	-q^2,
	R(0),
	R(0),
	q*(q^4+2*q^2-q+1),
	q*(q^2-q+1),
	q*(q^2-q+1),
	-(q-1)*q,
	q*(q^2+1),
	q,
	q,
	q,
	R(0),
	R(0),
	-q^4+2*q^3-q^2-1,
	q^3-q^2-1,
	R(-1),
	q^3-q^2-1,
	-q^2-1,
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	(q^2-q+1)*(q^2+q+1),
	q^2+1,
	R(1),
	-q*(q^3-q^2+2*q-1),
	-q*(2*q-1),
	-(q-1)*q,
	q,
	R(0),
	q*(q^3+q^2+1),
	q,
	(q+1)*q,
	q,
	R(0),
	q^3-2*q^2+q-1,
	-q^2+q-1,
	-q^2+q-1,
	q-1,
	R(-1),
	R(-1),
	q^3+3*q-1,
	2*q-1,
	2*q-1,
	q-1,
	2*q-1,
	q-1,
	q-1,
	R(-1),
	q^3+q+1,
	q+1,
	R(1),
	R(1),
	(q-1)*(q^2+q+1),
	R(-1),
	-2*q^2+2*q-1,
	2*q-1,
	R(-1),
	R(-1),
	R(-1),
	R(-1),
	q^2-q-1,
	-q-1,
	R(-1),
	-q^2+2*q-2,
	q-2,
	q-2,
	R(-2),
	q*(2+q),
	q,
	q,
	R(0),
	-q^2,
	R(0),
	q^2+2,
	R(2),
	2*q-3,
	R(-3),
	R(-1),
	R(-1),
	-q,
	R(0),
	2*q+1,
	R(1),
	R(1),
	R(1),
	R(-5),
	R(-1),
	R(-1),
	R(3),
	R(1),
	R(-1),
	R(-2),
	R(1),
	R(1),
	R(0),
	R(0)] [
	q^3*(q^2+1)*(q^4-q^3+q^2-q+1),
	q^3*(q^2-q+1)*(q^2+1),
	(q^2-q+1)*q^3,
	q^3,
	(q^2-q+1)*q^3,
	q^3,
	R(0),
	q^3,
	R(0),
	R(0),
	R(0),
	q*(q^2+1)*(q^4-q^3+q^2-q+1),
	q*(q^2-q+1)*(q^2+1),
	q*(q^2-q+1),
	q*(q^2-q+1),
	q,
	q,
	R(0),
	q*(q^2-2*q+2)*(q^2+1),
	q*(q^2-q+1)*(q^2+1),
	2*q*(q^2-q+1),
	q*(q^2-q+1),
	-q*(q-2),
	q,
	-q*(q-2),
	q,
	q,
	R(0),
	-q*(q^3-4*q^2+3*q-2),
	2*q*(q^2-q+1),
	q*(q^2-q+1),
	2*q*(q^2-q+1),
	-q*(q-2),
	q,
	q*(q^2-q+1),
	q,
	R(0),
	q^2*(q^2+1),
	q^2,
	R(0),
	(q^2+1)*(q^3-q^2+2*q-1),
	(q-1)*(q^2-q+1),
	2*q-1,
	2*q-1,
	R(-1),
	(q^2+1)*(q^3-q^2+1),
	(q+1)*(q^2-q+1),
	R(1),
	R(1),
	R(1),
	2*q^3-3*q^2+4*q-1,
	(q-1)*(q^2-q+1),
	-q^2+4*q-1,
	2*q-1,
	2*q-1,
	R(-1),
	-3*q^2+6*q-1,
	-q^2+4*q-1,
	-q^2+4*q-1,
	2*q-1,
	-q^2+4*q-1,
	2*q-1,
	2*q-1,
	R(-1),
	q^2+1,
	R(1),
	q^2+1,
	R(1),
	R(-1),
	R(-1),
	q^3-3*q^2+3*q-3,
	3*q-3,
	R(-3),
	q^3-q^2+q+1,
	q+1,
	R(1),
	q^3,
	R(0),
	R(0),
	-q^2+6*q-3,
	3*q-3,
	3*q-3,
	R(-3),
	-q^2+2*q+1,
	q+1,
	q+1,
	R(1),
	q^2+1,
	R(1),
	q^2+1,
	R(1),
	4*q-6,
	R(-6),
	2*q,
	R(0),
	q,
	R(0),
	R(2),
	R(2),
	R(0),
	R(0),
	R(-10),
	R(-2),
	R(2),
	R(2),
	R(-1),
	R(1),
	R(-1),
	R(0),
	R(0),
	R(0),
	R(-1)] [
	q^2*(q^2+q+1)*(q^2-q+1)^2,
	q^2*(q^2-q+1)*(q^2+1),
	q^2*(2*q^2-q+1),
	(q^2-q+1)*q^2,
	(q^2-q+1)*q^2,
	-q^2*(q-1),
	q^2,
	q^2,
	q^2,
	R(0),
	R(0),
	q*(q^2-q+1)*(q^3+q-1),
	q*(q-1)*(q^2-q+1),
	-q*(q-1)^2,
	q*(2*q-1),
	(q-1)*q,
	-q,
	R(0),
	(2*q^2+1)*(q^2-q+1),
	(q^2-q+1)*(q^2+1),
	-q^3+3*q^2-q+1,
	2*q^2-q+1,
	2*q^2-q+1,
	q^2-q+1,
	q^2-q+1,
	-q+1,
	R(1),
	R(1),
	(q^2-q+1)^2,
	-(q-1)*(q^2-q+1),
	q^2-q+1,
	-(q-1)*(q^2-q+1),
	(q-1)^2,
	-q+1,
	q^2-q+1,
	-q+1,
	R(1),
	(q^2-q+1)*(q^2+q+1),
	q^2+1,
	R(1),
	(q^2-q+1)^2,
	3*q^2-2*q+1,
	(q-1)^2,
	-2*q+1,
	R(1),
	(q^2-q+1)*(q^2+q+1),
	q^2+1,
	q^2+1,
	R(1),
	R(1),
	-(q-2)*(q^2-q+1),
	2*q^2-2*q+2,
	(q-1)*(q-2),
	-2*q+2,
	-q+2,
	R(2),
	3*q^2-3*q+3,
	q^2-2*q+3,
	q^2-2*q+3,
	-q+3,
	q^2-2*q+3,
	-q+3,
	-q+3,
	R(3),
	q^2+q+1,
	q+1,
	q^2+1,
	R(1),
	R(0),
	R(0),
	3*q^2-3*q+3,
	-3*q+3,
	R(3),
	q^2-q+1,
	-q+1,
	R(1),
	R(0),
	R(0),
	R(0),
	(q-2)^2,
	-2*q+4,
	-2*q+4,
	R(4),
	q^2+2,
	R(2),
	R(2),
	R(2),
	q^2,
	R(0),
	q^2+2,
	R(2),
	-3*q+6,
	R(6),
	-q+2,
	R(2),
	R(0),
	R(0),
	2+q,
	R(2),
	q,
	R(0),
	R(9),
	R(3),
	R(1),
	R(3),
	R(0),
	R(0),
	R(0),
	R(-1),
	R(1),
	R(-1),
	R(0)] [
	q*(q^4-q^3+q^2-q+1),
	-q*(q-1)*(q^2+1),
	q*(q^2-q+1),
	-(q-1)*q,
	q*(q^2-q+1),
	-(q-1)*q,
	q,
	-(q-1)*q,
	q,
	q,
	R(0),
	-q^4+q^3-q^2+q-1,
	(q-1)*(q^2+1),
	-q^2+q-1,
	-q^2+q-1,
	q-1,
	q-1,
	R(-1),
	q^3-q^2+2*q-1,
	(q-1)*(q^2+1),
	-(q-1)^2,
	-q^2+q-1,
	2*q-1,
	q-1,
	2*q-1,
	q-1,
	q-1,
	R(-1),
	-2*q^2+2*q-1,
	-(q-1)^2,
	-q^2+q-1,
	-(q-1)^2,
	2*q-1,
	q-1,
	-q^2+q-1,
	q-1,
	R(-1),
	R(1),
	R(1),
	R(1),
	q^3-q^2+q-2,
	-q^2+q-2,
	q-2,
	q-2,
	R(-2),
	q*(q^2-q+1),
	-(q-1)*q,
	q,
	q,
	R(0),
	-q^2+2*q-2,
	-q^2+q-2,
	2*q-2,
	q-2,
	q-2,
	R(-2),
	3*q-2,
	2*q-2,
	2*q-2,
	q-2,
	2*q-2,
	q-2,
	q-2,
	R(-2),
	q,
	q,
	R(0),
	R(0),
	R(1),
	R(1),
	-q^2+q-3,
	q-3,
	R(-3),
	-q^2+q-1,
	q-1,
	R(-1),
	-(q-1)*q,
	q,
	R(0),
	2*q-3,
	q-3,
	q-3,
	R(-3),
	2*q-1,
	q-1,
	q-1,
	R(-1),
	R(-1),
	R(-1),
	R(1),
	R(1),
	q-4,
	R(-4),
	q-2,
	R(-2),
	q-1,
	R(-1),
	q,
	R(0),
	q,
	R(0),
	R(-5),
	R(-3),
	R(-1),
	R(1),
	R(-2),
	R(0),
	R(1),
	R(-1),
	R(1),
	R(0),
	R(1)] [
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
	R(1)]]
classinfo = Vector{Any}[
	["^2A_5(q)",q+1,[[1,1,1,1,1,1]]],
	["^2A_5(q)",q+1,[[2,1,1,1,1]]],
	["^2A_5(q)",q+1,[[2,2,1,1]]],
	["^2A_5(q)",q+1,[[2,2,2]]],
	["^2A_5(q)",q+1,[[3,1,1,1]]],
	["^2A_5(q)",q+1,[[3,2,1]]],
	["^2A_5(q)",q+1,[[3,3]]],
	["^2A_5(q)",q+1,[[4,1,1]]],
	["^2A_5(q)",q+1,[[4,2]]],
	["^2A_5(q)",q+1,[[5,1]]],
	["^2A_5(q)",q+1,[[6]]],
	["^2A_4(q)",(q+1)^2,[[1,1,1,1,1]]],
	["^2A_4(q)",(q+1)^2,[[2,1,1,1]]],
	["^2A_4(q)",(q+1)^2,[[2,2,1]]],
	["^2A_4(q)",(q+1)^2,[[3,1,1]]],
	["^2A_4(q)",(q+1)^2,[[3,2]]],
	["^2A_4(q)",(q+1)^2,[[4,1]]],
	["^2A_4(q)",(q+1)^2,[[5]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[1,1,1,1],[1,1]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[1,1,1,1],[2]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[2,1,1],[1,1]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[2,1,1],[2]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[2,2],[1,1]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[2,2],[2]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[3,1],[1,1]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[3,1],[2]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[4],[1,1]]],
	["^2A_3(q)+A_1(q)",(q+1)^2,[[4],[2]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[1,1,1],[1,1,1]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[1,1,1],[2,1]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[1,1,1],[3]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[2,1],[1,1,1]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[2,1],[2,1]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[2,1],[3]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[3],[1,1,1]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[3],[2,1]]],
	["^2A_2(q)+^2A_2(q)",(q+1)^2,[[3],[3]]],
	["A_2(q^2)",(q-1)*(q+1),[[1,1,1]]],
	["A_2(q^2)",(q-1)*(q+1),[[2,1]]],
	["A_2(q^2)",(q-1)*(q+1),[[3]]],
	["^2A_3(q)",(q+1)^3,[[1,1,1,1]]],
	["^2A_3(q)",(q+1)^3,[[2,1,1]]],
	["^2A_3(q)",(q+1)^3,[[2,2]]],
	["^2A_3(q)",(q+1)^3,[[3,1]]],
	["^2A_3(q)",(q+1)^3,[[4]]],
	["^2A_3(q)",(q-1)*(q+1)^2,[[1,1,1,1]]],
	["^2A_3(q)",(q-1)*(q+1)^2,[[2,1,1]]],
	["^2A_3(q)",(q-1)*(q+1)^2,[[2,2]]],
	["^2A_3(q)",(q-1)*(q+1)^2,[[3,1]]],
	["^2A_3(q)",(q-1)*(q+1)^2,[[4]]],
	["^2A_2(q)+A_1(q)",(q+1)^3,[[1,1,1],[1,1]]],
	["^2A_2(q)+A_1(q)",(q+1)^3,[[1,1,1],[2]]],
	["^2A_2(q)+A_1(q)",(q+1)^3,[[2,1],[1,1]]],
	["^2A_2(q)+A_1(q)",(q+1)^3,[[2,1],[2]]],
	["^2A_2(q)+A_1(q)",(q+1)^3,[[3],[1,1]]],
	["^2A_2(q)+A_1(q)",(q+1)^3,[[3],[2]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[1,1],[1,1],[1,1]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[1,1],[1,1],[2]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[1,1],[2],[1,1]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[1,1],[2],[2]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[2],[1,1],[1,1]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[2],[1,1],[2]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[2],[2],[1,1]]],
	["A_1(q)+A_1(q)+A_1(q)",(q+1)^3,[[2],[2],[2]]],
	["A_1(q)+A_1(q^2)",(q-1)*(q+1)^2,[[1,1],[1,1]]],
	["A_1(q)+A_1(q^2)",(q-1)*(q+1)^2,[[1,1],[2]]],
	["A_1(q)+A_1(q^2)",(q-1)*(q+1)^2,[[2],[1,1]]],
	["A_1(q)+A_1(q^2)",(q-1)*(q+1)^2,[[2],[2]]],
	["A_1(q^3)",(q+1)*(q^2-q+1),[[1,1]]],
	["A_1(q^3)",(q+1)*(q^2-q+1),[[2]]],
	["^2A_2(q)",(q+1)^4,[[1,1,1]]],
	["^2A_2(q)",(q+1)^4,[[2,1]]],
	["^2A_2(q)",(q+1)^4,[[3]]],
	["^2A_2(q)",(q-1)*(q+1)^3,[[1,1,1]]],
	["^2A_2(q)",(q-1)*(q+1)^3,[[2,1]]],
	["^2A_2(q)",(q-1)*(q+1)^3,[[3]]],
	["^2A_2(q)",(q^2-q+1)*(q+1)^2,[[1,1,1]]],
	["^2A_2(q)",(q^2-q+1)*(q+1)^2,[[2,1]]],
	["^2A_2(q)",(q^2-q+1)*(q+1)^2,[[3]]],
	["A_1(q)+A_1(q)",(q+1)^4,[[1,1],[1,1]]],
	["A_1(q)+A_1(q)",(q+1)^4,[[1,1],[2]]],
	["A_1(q)+A_1(q)",(q+1)^4,[[2],[1,1]]],
	["A_1(q)+A_1(q)",(q+1)^4,[[2],[2]]],
	["A_1(q)+A_1(q)",(q-1)*(q+1)^3,[[1,1],[1,1]]],
	["A_1(q)+A_1(q)",(q-1)*(q+1)^3,[[1,1],[2]]],
	["A_1(q)+A_1(q)",(q-1)*(q+1)^3,[[2],[1,1]]],
	["A_1(q)+A_1(q)",(q-1)*(q+1)^3,[[2],[2]]],
	["A_1(q^2)",(q-1)*(q+1)^3,[[1,1]]],
	["A_1(q^2)",(q-1)*(q+1)^3,[[2]]],
	["A_1(q^2)",(q-1)^2*(q+1)^2,[[1,1]]],
	["A_1(q^2)",(q-1)^2*(q+1)^2,[[2]]],
	["A_1(q)",(q+1)^5,[[1,1]]],
	["A_1(q)",(q+1)^5,[[2]]],
	["A_1(q)",(q-1)*(q+1)^4,[[1,1]]],
	["A_1(q)",(q-1)*(q+1)^4,[[2]]],
	["A_1(q)",(q^2-q+1)*(q+1)^3,[[1,1]]],
	["A_1(q)",(q^2-q+1)*(q+1)^3,[[2]]],
	["A_1(q)",(q-1)^2*(q+1)^3,[[1,1]]],
	["A_1(q)",(q-1)^2*(q+1)^3,[[2]]],
	["A_1(q)",(q-1)*(q^2+1)*(q+1)^2,[[1,1]]],
	["A_1(q)",(q-1)*(q^2+1)*(q+1)^2,[[2]]],
	["\\emptyset",(q+1)^6,[[[1]],1]],
	["\\emptyset",(q-1)*(q+1)^5,[[[1]],1]],
	["\\emptyset",(q-1)^2*(q+1)^4,[[[1]],1]],
	["\\emptyset",(q-1)^3*(q+1)^3,[[[1]],1]],
	["\\emptyset",(q^2-q+1)*(q+1)^4,[[[1]],1]],
	["\\emptyset",(q-1)*(q^2-q+1)*(q+1)^3,[[[1]],1]],
	["\\emptyset",(q+1)^2*(q^2-q+1)^2,[[[1]],1]],
	["\\emptyset",(q-1)*(q^2+1)*(q+1)^3,[[[1]],1]],
	["\\emptyset",(q^2+1)*(q-1)^2*(q+1)^2,[[[1]],1]],
	["\\emptyset",(q^4-q^3+q^2-q+1)*(q+1)^2,[[[1]],1]],
	["\\emptyset",(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),[[[1]],1]]]
classlength = R.([
	1,
	q^10-q^9+q^8-q^7+q^6-q^4+q^3-q^2+q-1,
	q^16-q^15+2*q^14-q^13+q^12+q^11-2*q^10+3*q^9-3*q^8+2*q^7-q^6-q^5+q^4-2*q^3+q^2-q,
	q^18-q^14+q^13-q^12-q^9+q^8-q^7+q^3,
	q^18-q^17+q^16-q^15+q^13-2*q^12+2*q^11-2*q^10+q^9-q^7+q^6-q^5+q^4,
	q^22-2*q^21+2*q^20-q^19-q^18+3*q^17-5*q^16+5*q^15-3*q^14+3*q^12-5*q^11+5*q^10-3*q^9+q^8+q^7-2*q^6+2*q^5-q^4,
	q^24+q^21-q^20+q^19-q^18-q^17+q^16-2*q^15+q^14-q^13-q^12+q^11-q^10+q^9+q^6,
	q^24-q^23+q^22-q^20+2*q^19-3*q^18+2*q^17-q^16-q^15+2*q^14-3*q^13+2*q^12-q^11+q^9-q^8+q^7,
	q^26-q^25+q^23-2*q^22+2*q^21-2*q^20+2*q^18-3*q^17+3*q^16-2*q^15+2*q^13-2*q^12+2*q^11-q^10+q^8-q^7,
	q^28-q^27+q^25-2*q^24+2*q^23-2*q^22+2*q^20-3*q^19+3*q^18-2*q^17+2*q^15-2*q^14+2*q^13-q^12+q^10-q^9,
	q^30-q^28+q^27-q^26-2*q^23+2*q^22-q^21+q^19-2*q^18+2*q^17+q^14-q^13+q^12-q^10,
	(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	(q^8-q^7+q^6-q^5+q^3-q^2+q-1)*(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	(q^12-q^11+q^10-q^8+2*q^7-2*q^6+q^5-q^3+q^2-q)*(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	(q^14-q^13+q^12-q^10+2*q^9-2*q^8+q^7-q^5+q^4-q^3)*(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	(q^16-q^15+q^13-2*q^12+2*q^11-q^10-q^9+2*q^8-2*q^7+q^6-q^4+q^3)*(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	(q^18-q^17+q^15-2*q^14+2*q^13-q^12-q^11+2*q^10-2*q^9+q^8-q^6+q^5)*(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	(q^20-q^18+q^17-q^16+q^14-2*q^13+q^12-q^10+q^9-q^8+q^6)*(q-1)*(q^2-q+1)*(q^2+q+1)*q^5,
	(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^2-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^6-q^5+q^4-q^2+q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^8-q^7+q^5-2*q^4+q^3-q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^8+q^5-q^4-q)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^10-q^8+q^7-q^6-q^5+q^4-q^3+q)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^10-q^9+q^7-2*q^6+q^5-q^3+q^2)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^12-q^11-q^10+2*q^9-2*q^8+2*q^6-2*q^5+q^4+q^3-q^2)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^12-q^10+q^9-q^8-q^7+q^6-q^5+q^3)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q^14-2*q^12+q^11-2*q^9+2*q^8-q^6+2*q^5-q^3)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^8,
	(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^4-q^3+q-1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^6-q^4+q^3-q)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^4-q^3+q-1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^8-2*q^7+q^6+2*q^5-4*q^4+2*q^3+q^2-2*q+1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^10-q^9-q^8+3*q^7-2*q^6-2*q^5+3*q^4-q^3-q^2+q)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^6-q^4+q^3-q)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^10-q^9-q^8+3*q^7-2*q^6-2*q^5+3*q^4-q^3-q^2+q)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^12-2*q^10+2*q^9+q^8-4*q^7+q^6+2*q^5-2*q^4+q^2)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^9,
	(q^2-q+1)*(q^4-q^3+q^2-q+1)*(q+1)^3*q^9,
	(q^8+q^6-q^2-1)*(q^2-q+1)*(q^4-q^3+q^2-q+1)*(q+1)^3*q^9,
	(q^12-q^8-q^6+q^2)*(q^2-q+1)*(q^4-q^3+q^2-q+1)*(q+1)^3*q^9,
	(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^6-q^5+q^4-q^2+q-1)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^8+q^5-q^4-q)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^10-q^9+q^7-2*q^6+q^5-q^3+q^2)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^12-q^10+q^9-q^8-q^7+q^6-q^5+q^3)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^6-q^5+q^4-q^2+q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^8+q^5-q^4-q)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^10-q^9+q^7-2*q^6+q^5-q^3+q^2)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q^12-q^10+q^9-q^8-q^7+q^6-q^5+q^3)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*q^9,
	(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^11,
	(q^2-1)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^11,
	(q^4-q^3+q-1)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^11,
	(q^6-q^5-q^4+2*q^3-q^2-q+1)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^11,
	(q^6-q^4+q^3-q)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^11,
	(q^8-2*q^6+q^5+q^4-2*q^3+q)*(q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^11,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^2-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^2-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^4-2*q^2+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^2-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^4-2*q^2+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^4-2*q^2+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^6-3*q^4+3*q^2-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^12,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q+1)^2*(q^2-q+1)^2*q^12,
	(q^4-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q+1)^2*(q^2-q+1)^2*q^12,
	(q^2-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q+1)^2*(q^2-q+1)^2*q^12,
	(q^6-q^4-q^2+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q+1)^2*(q^2-q+1)^2*q^12,
	(q^2+1)*(q^4-q^3+q^2-q+1)*(q-1)^2*(q+1)^4*q^12,
	(q^6-1)*(q^2+1)*(q^4-q^3+q^2-q+1)*(q-1)^2*(q+1)^4*q^12,
	(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*q^12,
	(q^4-q^3+q-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*q^12,
	(q^6-q^4+q^3-q)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*q^12,
	(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^12,
	(q^4-q^3+q-1)*(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^12,
	(q^6-q^4+q^3-q)*(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*q^12,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^12,
	(q^4-q^3+q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^12,
	(q^6-q^4+q^3-q)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^12,
	(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q^2-1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q^2-1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q^4-2*q^2+1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q^2-1)*(q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q^2-1)*(q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q^4-2*q^2+1)*(q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^13,
	(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q+1)^2*(q^2-q+1)^2*q^13,
	(q^4-1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q+1)^2*(q^2-q+1)^2*q^13,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2-q+1)^2*(q+1)^3*q^13,
	(q^4-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2-q+1)^2*(q+1)^3*q^13,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q^2-q+1)^2*q^14,
	(q^2-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q^2-q+1)^2*q^14,
	(q-1)*(q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^14,
	(q^2-1)*(q-1)*(q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*q^14,
	(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^14,
	(q^2-1)*(q^2-q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^2*q^14,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q+1)^2*(q^2-q+1)^2*q^14,
	(q^2-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q+1)^2*(q^2-q+1)^2*q^14,
	(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2-q+1)^2*(q+1)^3*q^14,
	(q^2-1)*(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2-q+1)^2*(q+1)^3*q^14,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*(q-1)^3*q^15,
	(q+1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q^2-q+1)^2*q^15,
	(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q+1)^2*(q^2-q+1)^2*q^15,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q^2-q+1)^2*(q+1)^3*q^15,
	(q^2+q+1)*(q^2-q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q+1)^2*(q-1)^3*q^15,
	(q^2+q+1)*(q^2-q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^3*q^15,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^3*(q+1)^4*q^15,
	(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q-1)^2*(q^2-q+1)^2*(q+1)^3*q^15,
	(q-1)*(q^2+q+1)*(q^4-q^3+q^2-q+1)*(q^2-q+1)^2*(q+1)^4*q^15,
	(q^2+1)*(q^2+q+1)*(q^2-q+1)^2*(q-1)^3*(q+1)^4*q^15,
	(q^2-q+1)*(q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^5*q^15])
classtypeorder = R.([
	q+1,
	 q+1,
	 q+1,
	 q+1,
	 q+1,
	 q+1,
	 q+1,
	 q+1,
	 q+1,
	 q+1,
	 q+1,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 q^2+q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2+1//2*q,
	 1//2*q^2-1//2*q-1,
	 1//2*q^2-1//2*q-1,
	 1//2*q^2-1//2*q-1,
	 1//2*q^3-1//2*q,
	 1//2*q^3-1//2*q,
	 1//2*q^3-1//2*q,
	 1//2*q^3-1//2*q,
	 1//2*q^3-1//2*q,
	 1//2*q^3-3//2*q-1,
	 1//2*q^3-3//2*q-1,
	 1//2*q^3-3//2*q-1,
	 1//2*q^3-3//2*q-1,
	 1//2*q^3-3//2*q-1,
	 q^3-q,
	 q^3-q,
	 q^3-q,
	 q^3-q,
	 q^3-q,
	 q^3-q,
	 1//6*q^3-1//6*q,
	 1//6*q^3-1//6*q,
	 1//6*q^3-1//6*q,
	 1//6*q^3-1//6*q,
	 1//6*q^3-1//6*q,
	 1//6*q^3-1//6*q,
	 1//6*q^3-1//6*q,
	 1//6*q^3-1//6*q,
	 1//2*q^3-3//2*q-1,
	 1//2*q^3-3//2*q-1,
	 1//2*q^3-3//2*q-1,
	 1//2*q^3-3//2*q-1,
	 1//3*q^3-1//3*q,
	 1//3*q^3-1//3*q,
	 1//6*q^4-1//3*q^3-1//6*q^2+1//3*q,
	 1//6*q^4-1//3*q^3-1//6*q^2+1//3*q,
	 1//6*q^4-1//3*q^3-1//6*q^2+1//3*q,
	 1//2*q^4-3//2*q^2-q,
	 1//2*q^4-3//2*q^2-q,
	 1//2*q^4-3//2*q^2-q,
	 1//3*q^4+1//3*q^3-1//3*q^2-1//3*q,
	 1//3*q^4+1//3*q^3-1//3*q^2-1//3*q,
	 1//3*q^4+1//3*q^3-1//3*q^2-1//3*q,
	 1//4*q^4-1//2*q^3-1//4*q^2+1//2*q,
	 1//4*q^4-1//2*q^3-1//4*q^2+1//2*q,
	 1//4*q^4-1//2*q^3-1//4*q^2+1//2*q,
	 1//4*q^4-1//2*q^3-1//4*q^2+1//2*q,
	 1//4*q^4-3//4*q^2-1//2*q,
	 1//4*q^4-3//4*q^2-1//2*q,
	 1//4*q^4-3//4*q^2-1//2*q,
	 1//4*q^4-3//4*q^2-1//2*q,
	 1//4*q^4-3//4*q^2-1//2*q,
	 1//4*q^4-3//4*q^2-1//2*q,
	 1//4*q^4-1//2*q^3-5//4*q^2+3//2*q+2,
	 1//4*q^4-1//2*q^3-5//4*q^2+3//2*q+2,
	 1//24*q^5-5//24*q^4+5//24*q^3+5//24*q^2-1//4*q,
	 1//24*q^5-5//24*q^4+5//24*q^3+5//24*q^2-1//4*q,
	 1//4*q^5-1//4*q^4-3//4*q^3+1//4*q^2+1//2*q,
	 1//4*q^5-1//4*q^4-3//4*q^3+1//4*q^2+1//2*q,
	 1//3*q^5+1//3*q^4-1//3*q^3-1//3*q^2,
	 1//3*q^5+1//3*q^4-1//3*q^3-1//3*q^2,
	 1//8*q^5-1//8*q^4-7//8*q^3+1//8*q^2+7//4*q+1,
	 1//8*q^5-1//8*q^4-7//8*q^3+1//8*q^2+7//4*q+1,
	 1//4*q^5+1//4*q^4-1//4*q^3-1//4*q^2,
	 1//4*q^5+1//4*q^4-1//4*q^3-1//4*q^2,
	 1//720*q^6-1//80*q^5+5//144*q^4-1//48*q^3-13//360*q^2+1//30*q,
	 1//48*q^6-1//16*q^5-1//48*q^4+7//48*q^3-1//12*q,
	 1//16*q^6-1//16*q^5-7//16*q^4+1//16*q^3+7//8*q^2+1//2*q,
	 1//48*q^6-1//16*q^5-3//16*q^4+23//48*q^3+2//3*q^2-11//12*q-1,
	 1//18*q^6-1//9*q^4+1//18*q^2,
	 1//6*q^6-2//3*q^4-1//3*q^3+1//2*q^2+1//3*q,
	 1//18*q^6-1//9*q^4-1//6*q^3+1//18*q^2+1//6*q,
	 1//8*q^6+1//8*q^5-1//8*q^4-1//8*q^3,
	 1//8*q^6-1//8*q^5-3//8*q^4+1//8*q^3+1//4*q^2,
	 1//5*q^6+1//5*q^5-1//5*q^2-1//5*q,
	 1//6*q^6-1//6*q^3-1//6*q^2+1//6*q])
charinfo = Vector{Any}[
	[[1,1,1,1,1,1]],
	[[2,1,1,1,1]],
	[[2,2,1,1]],
	[[2,2,2]],
	[[3,1,1,1]],
	[[3,2,1]],
	[[3,3]],
	[[4,1,1]],
	[[4,2]],
	[[5,1]],
	[[6]]]
chardegree = R.([
	q^15,
	q^10*(q^4-q^3+q^2-q+1),
	q^7*(q^2+q+1)*(q^2-q+1)^2,
	q^6*(q^2+q+1)*(q^4-q^3+q^2-q+1),
	(q^2+1)*(q^4-q^3+q^2-q+1)*q^6,
	q^4*(q^2+1)*(q^2+q+1)*(q-1)^3,
	q^3*(q^2+q+1)*(q^4-q^3+q^2-q+1),
	q^3*(q^2+1)*(q^4-q^3+q^2-q+1),
	q^2*(q^2+q+1)*(q^2-q+1)^2,
	q*(q^4-q^3+q^2-q+1),
	1])

information = "- Information about the tables of unipotent characters for GU_6(q).

- CHEVIE-name of the table: uniGU6

- This table is computed with general programs written by F.Luebeck.
  They compute the Deligne-Lusztig characters R_T^G(1) and find the
  unipotent characters as linear combinations of them.
"

TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

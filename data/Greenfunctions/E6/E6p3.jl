using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^36*(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1)
table = QQPolyRingElem[[
	(q^2+q+1)^3*(q^2+1)^2*(q+1)^4*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2-q+1)*(q^4+q^3+q^2+q+1)*(q^2+1)*(6*q^10+5*q^9+5*q^8+5*q^7+4*q^6+3*q^5+3*q^4+2*q^3+q^2+q+1)*(q^2+q+1)^2*(q+1)^3,
	(q^2+1)*(q^2+q+1)*(q^2-q+1)*(20*q^11+34*q^10+42*q^9+44*q^8+40*q^7+31*q^6+23*q^5+16*q^4+10*q^3+6*q^2+3*q+1)*(q+1)^3,
	(q^2+q+1)*(15*q^12+45*q^11+70*q^10+90*q^9+91*q^8+79*q^7+60*q^6+40*q^5+25*q^4+14*q^3+7*q^2+3*q+1)*(q+1)^2,
	(1+2*q+4*q^2+8*q^3+13*q^4+25*q^5+39*q^6+54*q^7+49*q^8+45*q^9)*(q+1)^2*(q^2+q+1)^2,
	(q^2-q+1)*(q^2+q+1)*(q^2+1)*(15*q^7+31*q^6+33*q^5+26*q^4+16*q^3+9*q^2+4*q+1)*(q+1)^2,
	(q+1)*(64*q^10+127*q^9+150*q^8+139*q^7+100*q^6+65*q^5+39*q^4+21*q^3+10*q^2+4*q+1)*(q^2+q+1),
	(q^2-q+1)*(q^2+q+1)*(24*q^6+32*q^5+29*q^4+20*q^3+10*q^2+4*q+1)*(q+1)^2,
	(q+1)*(60*q^10+161*q^9+220*q^8+219*q^7+175*q^6+119*q^5+70*q^4+35*q^3+15*q^2+5*q+1),
	(81*q^6+89*q^5+59*q^4+26*q^3+10*q^2+4*q+1)*(q^2+1)*(q+1)^2,
	(10*q^7+40*q^6+50*q^5+40*q^4+24*q^3+11*q^2+4*q+1)*(q+1)^2,
	(q+1)*(60*q^7+170*q^6+155*q^5+93*q^4+41*q^3+15*q^2+5*q+1),
	1+6*q+20*q^2+169*q^4+62*q^3+470*q^6+342*q^5+280*q^7,
	(q+1)*(2*q+1)*(30*q^5+30*q^4+17*q^3+9*q^2+3*q+1),
	(q+1)*(10*q^4+15*q^3+10*q^2+4*q+1)*(q^2+q+1),
	(q+1)*(81*q^5+73*q^4+41*q^3+15*q^2+5*q+1),
	(q+1)*(2*q+1)*(q^2+q+1)*(12*q^2+2*q+1),
	1+6*q+20*q^2+79*q^4+50*q^3+60*q^5,
	(q+1)*(15*q^3+15*q^2+5*q+1),
	64*q^4+65*q^3+26*q^2+6*q+1,
	45*q^3+26*q^2+6*q+1,
	(3*q+1)*(5*q^2+3*q+1),
	20*q^2+6*q+1,
	6*q+1,
	R(1),
	R(1),
	R(1)] [
	(q-1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2-q+1)*(q^2+1)*(q^4+q^3+q^2+q+1)*(2*q^10-q^9+q^8-q^7+2*q^6-q^5+q^4+q^2-q+1)*(q^2+q+1)^2*(q-1)^3,
	(q^2+q+1)*(q^2+1)*(q^2-q+1)*(4*q^12-2*q^11+4*q^10-2*q^9+4*q^8-q^7+2*q^6-q^5+2*q^4+q^2+1)*(q-1)^2,
	(q-1)*(q^2+q+1)*(7*q^13-14*q^12+17*q^11-20*q^10+17*q^9-16*q^8+13*q^7-12*q^6+9*q^5-7*q^4+5*q^3-4*q^2+2*q-1),
	-(11*q^9-13*q^8+14*q^7-11*q^6+7*q^5-5*q^4+4*q^3-4*q^2+2*q-1)*(q-1)^2*(q^2+q+1)^2,
	-(q^2+q+1)*(q^2-q+1)*(9*q^9-5*q^8+2*q^7-3*q^6+3*q^5-3*q^4+2*q^3-2*q^2+2*q-1)*(q^2+1),
	(q^2+q+1)*(7*q^8-5*q^7+8*q^6-4*q^5+5*q^4-2*q^3+3*q^2-q+1)*(q-1)^2,
	(q^2+q+1)*(q^2-q+1)*(8*q^6+5*q^4+2*q^2+1)*(q-1)^2,
	-(q-1)*(4*q^10-q^9+10*q^8-5*q^7+9*q^6-5*q^5+6*q^4-3*q^3+3*q^2-q+1),
	(q-1)*(9*q^7-4*q^6+10*q^5-5*q^4+4*q^3-2*q^2+q-1)*(q^2+1),
	-(q-1)*(6*q^8-6*q^7+14*q^6-6*q^5+8*q^4-3*q^3+3*q^2-q+1),
	(q-1)*(12*q^7-14*q^6+15*q^5-9*q^4+5*q^3-3*q^2+q-1),
	1-2*q+4*q^2+17*q^4-10*q^3+30*q^6-34*q^5-24*q^7,
	-(1+2*q^2)*(10*q^5-7*q^4+2*q^3-2*q^2+2*q-1),
	-(q-1)*(6*q^4-3*q^3+4*q^2-2*q+1)*(q^2+q+1),
	(q-1)*(9*q^5-5*q^4+5*q^3-3*q^2+q-1),
	(2*q-1)*(q^2+q+1)*(4*q^3-2*q^2+q-1),
	-(q-1)*(4*q^4-3*q^3+3*q^2-q+1),
	(q-1)*(7*q^3-3*q^2+q-1),
	-7*q^3+2*q^2-2*q+1,
	-11*q^3+2*q^2-2*q+1,
	-9*q^3+6*q^2-2*q+1,
	4*q^2-2*q+1,
	1-2*q,
	R(1),
	R(1),
	R(1)] [
	(q^2+q+1)^3*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)*(q+1)*(q^2-q+1)*(q^4+q^3+q^2+q+1)*(2*q^9-q^8-2*q^7+q^6+q^5-2*q^4-q^3+q^2-1)*(q^2+q+1)^2*(q^2+1)^2,
	(q+1)*(q^2+q+1)*(q^2-q+1)*(4*q^13-2*q^12-2*q^11-2*q^10-2*q^9-q^8+q^7+q^6+q^5+2*q^4+q^3+q^2+q+1)*(q^2+1),
	(q+1)*(q^2+q+1)*(3*q^13-q^11-3*q^9+2*q^8-q^7+4*q^6+q^5+3*q^4+q^3+2*q^2+1),
	(q-1)*(q^10-8*q^9-7*q^8-11*q^7-10*q^6-8*q^5-5*q^4-4*q^3-2*q^2-q-1)*(q^2+q+1)^2,
	(q+1)*(q^2+q+1)*(q^2+1)*(q^2-q+1)*(3*q^8-2*q^7-q^5+2*q^4+q^3+q^2+q+1),
	-(q^2+q+1)*(q^2+1)*(5*q^8-q^7-2*q^6-2*q^5-3*q^4-2*q^3-q^2-q-1),
	(q^2-q+1)*(q^2+q+1)*(q+1)^2*(q^2+1)^2,
	(q+1)*(4*q^10-3*q^9+4*q^8-q^7+7*q^6+3*q^5+6*q^4+3*q^3+3*q^2+q+1),
	-(q^2+1)*(3*q^8+9*q^7+2*q^6-5*q^5-9*q^4-6*q^3-3*q^2-2*q-1),
	(q+1)*(2*q^8+2*q^7+2*q^6+2*q^5+4*q^4+3*q^3+3*q^2+q+1),
	1+2*q+4*q^2+10*q^4+8*q^3+q^6+8*q^5-2*q^7+4*q^8,
	1+2*q+4*q^2+13*q^4+10*q^3-6*q^6+10*q^5-16*q^7,
	1+2*q+4*q^2+7*q^4+6*q^3+2*q^6+6*q^5+4*q^7,
	(q+1)*(q+1+2*q^2)*(q^2-q+1)*(q^2+q+1),
	1+2*q+4*q^2+6*q^4+8*q^3-3*q^6+6*q^5,
	(4*q^2+1+q)*(q^2+q+1),
	(q^2+1)*(4*q^3+3*q^2+2*q+1),
	(3*q^2+2*q+1)*(q^2+1),
	(q+1)*(5*q^2+q+1),
	6*q^2+q^3+1+2*q,
	3*q^3+2*q+2*q^2+1,
	2*q+1+4*q^2,
	2*q+1,
	R(1),
	R(1),
	R(1)] [
	(q-1)^6*(q+1)^4*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2-q+1)*(q^4+q^3+q^2+q+1)*(q^2+1)*(3*q^9-2*q^8-q^7+3*q^6-q^5-q^4+2*q^3-q+1)*(q+1)^3*(q-1)^5,
	(q^2+1)*(2*q^7+q^6-2*q^5+q^4+q^3-q^2+1)*(q^2-q+1)^2*(q+1)^3*(q-1)^4,
	-(1-2*q+2*q^2+q^3-4*q^4+3*q^5+3*q^6-5*q^7+2*q^8+5*q^9-6*q^10+3*q^11)*(q+1)^2*(q-1)^3,
	(1-q+q^2+2*q^3-2*q^4-2*q^5+6*q^6-3*q^7-5*q^8+9*q^9)*(q+1)^2*(q-1)^4,
	-(q^2-q+1)*(q^2+1)*(3*q^6-q^5-q^4+3*q^3-q^2-q+1)*(q+1)^2*(q-1)^3,
	-(q+1)*(8*q^9-5*q^8-2*q^7+6*q^6-q^5-3*q^4+3*q^3-q+1)*(q-1)^3,
	(q^2-q+1)*(6*q^6-4*q^5-q^4+2*q^3+q^2-2*q+1)*(q-1)^2*(q+1)^2,
	(q+1)*(6*q^8-7*q^7+2*q^6+5*q^5-6*q^4+3*q^3+q^2-2*q+1)*(q-1)^2,
	-(q^2+1)*(q+1)^2*(q-1)^5,
	(q-1)*(q^6-4*q^5+q^4+5*q^3-7*q^2+4*q-1)*(q+1)^2,
	-(q+1)*(3*q^5-2*q^4-q^2+2*q-1)*(q-1)^2,
	(q^5+4*q^4-2*q^3-q^2-q+1)*(q-1)^2,
	-(q+1)*(3*q^3-q+1)*(q-1)^3,
	-26*q^7+26*q^6+6*q^5-17*q^4+8*q^3+2*q^2-3*q+1,
	(q+1)*(q-1)^4,
	(q+1)*(6*q^3-2*q^2-2*q+1)*(q-1)^2,
	(q-1)*(6*q^4-5*q^3+2*q-1),
	-(q-1)*(q+1)*(3*q^2-3*q+1),
	-(q-1)*(8*q^3-3*q^2-2*q+1),
	9*q^3-q^2-3*q+1,
	-(q-1)*(3*q^2-2*q+1),
	(2*q-1)*(q-1),
	-3*q+1,
	R(1),
	R(1),
	R(1)] [
	(q^2+1)^2*(q-1)^2*(q+1)^4*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^2+q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)*(q^2+1)*(q^2+q+1)*(q^2-q+1)*(q^4+q^3+q^2+q+1)*(3*q^11-q^10-q^7-q^6-q^4-q^3-1)*(q+1)^3,
	(q-1)*(q^2-q+1)*(5*q^12+2*q^11-q^10-4*q^9-7*q^8-9*q^7-8*q^6-7*q^5-6*q^4-4*q^3-3*q^2-2*q-1)*(q^2+1)*(q+1)^3,
	-(q-1)*(5*q^9+5*q^8+7*q^7+9*q^6+6*q^5+5*q^4+4*q^3+2*q^2+q+1)*(q^2+q+1)*(q+1)^2,
	(6*q^11-8*q^10+q^9-5*q^8+q^7+2*q^6+4*q^5+q^4+2*q^3+q^2+1)*(q^2+q+1)*(q+1)^2,
	-(q-1)*(q^2+q+1)*(q^2+1)*(q^2-q+1)*(2*q^5+5*q^4+3*q^3+2*q^2+2*q+1)*(q+1)^2,
	(q+1)*(4*q^12-7*q^11-10*q^10-7*q^9-4*q^8+7*q^7+9*q^6+8*q^5+7*q^4+5*q^3+3*q^2+2*q+1),
	-(q^2-q+1)*(4*q^7+2*q^6-2*q^4-4*q^3-3*q^2-2*q-1)*(q+1)^2,
	-(q+1)*(3*q^10+7*q^9+8*q^8-4*q^6-5*q^5-7*q^4-5*q^3-3*q^2-2*q-1),
	-(q^2+1)*(4*q^5-5*q^4-5*q^3-q^2-q-1)*(q+1)^2,
	-(2*q^7+2*q^6+q^5-q^4-3*q^3-2*q^2-q-1)*(q+1)^2,
	-(q+1)*(6*q^7+q^6-2*q^5-9*q^4-8*q^3-3*q^2-2*q-1),
	1+3*q+5*q^2+25*q^4+14*q^3+8*q^6+18*q^5-2*q^7,
	-(q+1)*(6*q^6-4*q^4-5*q^3-3*q^2-2*q-1),
	-(q+1)*(2*q^4-q^2-q-1)*(q^2+q+1),
	(q+1)*(2*q+1)*(2*q^3+3*q^2+1),
	(q+1)*(4*q^2+1+q)*(q^2+q+1),
	1+3*q+5*q^2+4*q^4+8*q^3-3*q^5,
	(q+1)*(3*q^2+2*q+1),
	4*q^4+11*q^3+8*q^2+3*q+1,
	(q+1)*(6*q^2+2*q+1),
	(q+1)*(2*q+1),
	5*q^2+3*q+1,
	3*q+1,
	R(1),
	R(1),
	R(1)] [
	(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^2+1)^2*(q+1)^4*(q-1)^4*(q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q-1)^3*(q+1)^3,
	-(q^2+1)*(q^6+q^3+1)*(q^3-q-1)*(q-1)^2*(q^2-q+1)^2*(q+1)^3,
	(3*q^12+q^10+3*q^9+q^8+q^7+3*q^6+q^5+q^4+2*q^3+q^2+1)*(q-1)^2*(q+1)^2,
	(3*q^11-2*q^10+q^9+q^8+q^7+2*q^6+q^5+q^4+2*q^3+q^2+1)*(q-1)^2*(q+1)^2,
	(q^2+1)*(q^2-q+1)*(3*q^7+q^6+2*q^4+q^3+q+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1)*(2*q^11+q^9-q^8+2*q^6-q^5+2*q^3+1),
	(3*q^8-q^7+q^6-q^4+q^3-q+1)*(q^2-q+1)*(q+1)^2,
	-(q-1)*(q+1)*(3*q^9-2*q^8+3*q^6-q^5+2*q^3+1),
	(q^2+1)*(2*q^3+1)*(q-1)^2*(q+1)^2,
	(q+1)*(4*q^8-4*q^7+3*q^6-2*q^4+2*q^3-q+1),
	-(q-1)*(q+1)*(q^2-q+1)*(q^3+q+1),
	(4*q^5+4*q^4+4*q^3+2*q^2+2*q+1)*(q-1)^2,
	-(q-1)*(q+1)*(2*q^3+1),
	(q+1)*(4*q^6-2*q^5-q^4+2*q^3-q+1),
	-(q-1)*(q+1)*(2*q^3+1),
	(q+1)*(1+3*q^3+q^2+q)*(q-1)^2,
	-(q-1)*(3*q^4+2*q^3+q+1),
	(q+1)*(3*q^3-q+1),
	-(q-1)*(2*q^3+1+q),
	3*q^3+1-q^2,
	3*q^3+1-q^2,
	-(q-1)*(q+1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	(q-1)^4*(q+1)^4*(q^2+q+1)^3*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2-q+1)*(q^4+q^3+q^2+q+1)*(2*q^9-q^8-2*q^7+q^6+q^5-2*q^4-q^3+q^2-1)*(q^2+q+1)^2*(q-1)^3*(q+1)^3,
	-(q^2-q+1)*(q^2+q+1)*(q^4+q^3+q^2+q+1)*(2*q^4+1)*(q-1)^3*(q+1)^4,
	-(q-1)*(q^2+q+1)*(q^11-2*q^9+q^7-2*q^6-2*q^5+2*q^4+q^3-q^2+1)*(q+1)^2,
	(q^7-q^6-q^5+2*q^4+2*q^3-q^2+1)*(q-1)^2*(q+1)^2*(q^2+q+1)^2,
	-(q^2-q+1)*(q^2+q+1)*(5*q^9-3*q^8-4*q^7+3*q^6+3*q^5-3*q^4+2*q^2-1)*(q+1)^2,
	-(q^2+q+1)*(q^5-2*q^4-q^3-1)*(q-1)^2*(q+1)^3,
	(q^2-q+1)*(q^2+q+1)*(q-1)^2*(q+1)^4,
	(q-1)*(q+1)*(q^8+5*q^7+4*q^6-q^5-2*q^4-q^2-2*q-1),
	-(q-1)*(3*q^7-2*q^6-2*q^5+3*q^4+2*q^3+q+1)*(q+1)^2,
	(q-1)*(2*q^5-1)*(q+1)^3,
	(q-1)*(q+1)*(4*q^6+2*q^5-3*q^4-2*q^3-q^2-2*q-1),
	1+2*q+5*q^4+2*q^3-6*q^6-6*q^5+8*q^7,
	-(q+1)*(2*q^2-1)*(2*q^4+q^3+q+1+q^2),
	(q-1)*(q+1)*(2*q^3+q^2-q-1)*(q^2+q+1),
	-(q-1)*(q+1)*(3*q^4+2*q^3+q^2+2*q+1),
	(q+1)*(q^2+q+1),
	-(q-1)*(q+1)^3,
	-(q-1)*(q+1)^3,
	(q+1)*(q^2+q+1),
	(q+1)*(q^2+q+1),
	-5*q^3+2*q-2*q^2+1,
	2*q+1,
	2*q+1,
	R(1),
	R(1),
	R(1)] [
	(q+1)^2*(q^2+q+1)^3*(q-1)^4*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^2+q+1)^2*(q-1)^3,
	(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4+q^3+q^2+q+1)*(q^4+1)*(q-1)^2,
	(q-1)*(q^13-q^11+q^9-q^7+q^5-q^4-q^3-1)*(q^2+q+1),
	-(q+1)*(q^8-2*q^6+q^5-q^3-q^2+q-1)*(q-1)^2*(q^2+q+1)^2,
	(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^9-q^8-q^6+q^5-q^4-1),
	(q-1)*(q^2+q+1)*(q^5-q^3-1)*(q^4+1),
	-(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^4+1),
	-(q-1)*(q^2+q+1)*(q^7+q^6-q^5+q^4+q^3+1),
	-(q-1)*(q+1)*(q^8-q^7-q^5+q^4+q^2+1),
	-(q-1)*(2*q^8+2*q^7+2*q^6+2*q^5+2*q^4+q^3+q^2+q+1),
	1-q^6+2*q^7,
	(4*q^5+4*q^4+4*q^3+3*q^2+2*q+1)*(q-1)^2,
	q^4+1,
	-(q-1)*(2*q^4+q^3+1)*(q^2+q+1),
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),
	-(q-1)*(q^2+q+1),
	q^4+1,
	q^4+1,
	-(q-1)*(q^2+q+1),
	-(q-1)*(q^2+q+1),
	(q^2-q+1)*(q+1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	(q^2+1)^2*(q^2+q+1)^3*(q+1)^4*(q-1)^4*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)*(q^9-q^7-q^6-q^5-q^4-q-1)*(q^2-q+1)^2*(q^2+q+1)^2*(q-1)^3*(q+1)^3,
	-(q^2+1)*(q^8-q^4-1)*(q^2-q+1)*(q^2+q+1)*(q-1)^2*(q+1)^3,
	(q^2+q+1)*(q^2+1)*(q^4+q^3+1)*(q+1)^2*(q-1)^2,
	-(q^2+1)*(q^4-2*q^3+q-1)*(q-1)^2*(q+1)^2*(q^2+q+1)^2,
	(q^2+q+1)*(q^2+1)*(q^2-q+1)*(q^4+q+1)*(q+1)^2*(q-1)^2,
	-(q-1)*(q+1)*(q^2+q+1)*(q^9-q^8-q^7+q^3+1),
	-(q-1)*(q^2+q+1)*(q^2-q+1)*(q^5-q^4+1)*(q+1)^2,
	(q-1)*(q+1)*(q^8+q^7-q^4-q^3-q^2-q-1),
	(q-1)*(q^2+1)*(q^5-q^3-1)*(q+1)^2,
	-(q-1)*(q+1)^2*(q^2+1),
	-(q-1)*(q+1)*(2*q^3+q^2+q+1),
	-(q-1)*(q+1)*(1+3*q^3+q^2+q),
	-(q-1)*(q+1)^2*(q^2+1),
	-(q-1)*(q+1)*(q^2+q+1),
	(q+1)*(q^5-2*q^4+q^3+1),
	-(q-1)*(q+1)*(q^2+q+1)*(q^2+1),
	1+q-q^4,
	q+1,
	-(q+1)*(q^3-q^2-1),
	q^2+q+1,
	-q^2+1+q,
	q+1,
	q+1,
	R(1),
	R(1),
	R(1)] [
	(q-1)^6*(q+1)^4*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2+q+1)*(q^9-q^7-q^6-q^5-q^4-q-1)*(q+1)^3*(q-1)^5,
	-(q^2+q+1)*(2*q^9+q^8-q^7-q^4-q-1)*(q^2+1)*(q+1)^3*(q-1)^4,
	(q^11+2*q^10+3*q^9+2*q^8+q^7+q^6+q^5-q^3-2*q^2-2*q-1)*(q+1)^2*(q-1)^3,
	(q^2+q+1)*(q^6+q^5+q^4+q^3+q^2+q+1)*(q+1)^3*(q-1)^4,
	-(3*q^9+q^8-q^7+2*q^3+q^2-q-1)*(q^2+1)*(q-1)^2*(q+1)^2,
	(q^2+q+1)*(q^5-q-1)*(q+1)^2*(q-1)^3,
	(q^2+q+1)*(2*q^6-q^4-q^2+1)*(q-1)^2*(q+1)^2,
	(q+1)*(q^3-q-1)*(2*q^5+q^4-q-1)*(q-1)^2,
	-(q^2+1)*(q-1)^3*(q+1)^4,
	-(q-1)*(3*q^6-q^4-q^3-q^2+1)*(q+1)^2,
	-(q+1)*(3*q^5+2*q^4-q^2-2*q-1)*(q-1)^2,
	-(3*q^5-2*q^3-3*q^2-3*q-1)*(q-1)^2,
	(q-1)*(q^3+q-1)*(q+1)^3,
	6*q^7+6*q^6+2*q^5-q^4-4*q^3-2*q^2+q+1,
	(q-1)^2*(q+1)^3,
	(q+1)*(2*q^3+2*q+2*q^2+1)*(q-1)^2,
	(q-1)*(q+1)*(2*q^3+q^2-q-1),
	(q-1)*(q+1)*(q^2-q-1),
	-(q-1)*(q+1)^2,
	q^3-q^2+q+1,
	-(q+1)*(3*q^2-1),
	-(2*q+1)*(q-1),
	q+1,
	R(1),
	R(1),
	R(1)] [
	(q-1)^4*(q+1)^2*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^2-q+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q+1)*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^9-q^7-q^6-q^5-q^4-q-1)*(q^2+q+1)^2*(q-1)^3,
	(q^2+q+1)*(q^2+1)*(q^12-2*q^11+q^10-2*q^9+q^8-q^7+2*q^6-q^5+2*q^4+q^2+1)*(q+1)^2*(q-1)^2,
	-(q-1)*(q+1)*(q^2+q+1)*(2*q^12+q^10-2*q^9-2*q^7+q^6-q^5+q^4+q^2+1),
	-(-1+q-2*q^2+q^3-2*q^4+q^5-2*q^6+2*q^7)*(q-1)^2*(q+1)^2*(q^2+q+1)^2,
	(q^2+1)*(q^2+q+1)*(q^2-q+1)*(2*q^8+q^7-2*q^3-q^2+q+1),
	(q+1)*(q^2+q+1)*(q^7+3*q^6+2*q^5+3*q^4+2*q^3+2*q^2+q+1)*(q-1)^2,
	(q^2+q+1)*(2*q^6+2*q^4+2*q^2+1)*(q+1)^2*(q-1)^2,
	-(q-1)*(q^3-q-1)*(q^7-q^6-q^5-2*q^4-2*q^3-2*q^2-q-1),
	(q-1)*(q+1)*(q^2+1)*(2*q^5-q^4-q^3-q^2-q-1),
	(q-1)*(q+1)*(q^5-q^4-q^3-2*q^2-q-1),
	(q-1)*(q+1)*(q^5-q^4-2*q^3-2*q^2-q-1),
	-(q-1)*(4*q^4+5*q^3+3*q^2+2*q+1),
	(q+1)*(1+2*q^2)*(2*q^4-q^3-q^2+1),
	-(q-1)*(q^2+q+1)^2,
	-(q-1)*(1+2*q^2)*(q+1)^2,
	(q^2+q+1)*(2*q^4-2*q^3+q^2+1),
	-(q-1)*(q+1)*(q^3+2*q^2+q+1),
	-(q-1)*(q+1)*(q+1+2*q^2),
	-q^3+1+q+2*q^2,
	-2*q^3+1+q+2*q^2,
	q+1,
	q^2+q+1,
	q+1,
	R(1),
	R(1),
	R(1)] [
	(q-1)^6*(q+1)^2*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2+q+1)*(q^2+1)*(q^4+q^3+q^2+q+1)*(2*q^10-q^9+q^8-q^7+2*q^6-q^5+q^4+q^2-q+1)*(q+1)^2*(q-1)^5,
	(q+1)*(q^2+1)*(q^2-q+1)*(q^2+q+1)*(q^9+2*q^8+q^7+q^4+q+1)*(q-1)^4,
	(q+1)*(q^12-q^10-q^9-3*q^8-q^7-q^6+q^5-q^4-q^2-1)*(q-1)^3,
	(q+1)*(q^2+q+1)*(q^8+q^6-2*q^5+q^4+q^3+q^2+1)*(q-1)^4,
	-(q^2+1)*(3*q^9-2*q^8+2*q^7-3*q^6+3*q^5-3*q^4+2*q^3-2*q^2+2*q-1)*(q-1)^2*(q+1)^2,
	-(q+1)*(q^2+q+1)*(2*q^6-q^5+q^2-q+1)*(q-1)^3,
	-(q^2+q+1)*(q^2-q+1)*(q^3-q+1)*(q^3-q-1)*(q-1)^2,
	-(q+1)*(q^8-q^7-q^6-q^4+q^3-q^2+q-1)*(q-1)^2,
	(q+1)*(q^2+1)*(2*q^3-1)*(q-1)^3,
	(q-1)*(q^6-2*q^4+q-1),
	(q^5+q^4-2*q^3+1)*(q-1)^2,
	-(4*q^3-1)*(q-1)^2,
	(q-1)*(q+1)*(2*q^2-2*q+1)*(2*q^3-1),
	-(q-1)*(q^4+2*q^3-q+1),
	-(2*q^3-1)*(q-1)^2,
	-(q+1)*(q^3+q^2+q-1)*(q-1)^2,
	-(q-1)*(1-q+q^4),
	(q-1)*(q^3+q-1),
	(q-1)*(2*q-1)*(q+1),
	q^3-q^2-2*q+1,
	-3*q^3+3*q^2-2*q+1,
	(q-1)^2,
	1-2*q,
	R(1),
	R(1),
	R(1)] [
	(q-1)^4*(q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^2+q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	-(q+1)*(q^2+q+1)*(q^2-q+1)*(q^4+q^3+q^2+q+1)*(q^7+q^6+q^5+q^4+q^3+q^2+1)*(q^2+1)*(q^4-q^2+1)*(q-1)^3,
	(q+1)*(q^2+1)*(q^2-q+1)*(q^13+q^12+q^11+q^10+q^9+2*q^8+q^7+q^6+q^5+2*q^4+q^3+q^2+q+1)*(q-1)^2,
	-(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^8-q^7+2*q^6-q^5+q^2-q+1),
	-(q^2+q+1)*(2*q^11-q^9+q^8-q^7-2*q^6-q^4-2*q^3-q^2-1)*(q-1)^2,
	-(q-1)*(q+1)*(q^2+q+1)*(q^2+1)*(q^2-q+1)*(2*q^6-q^5+q^3-q+1),
	(q-1)*(q^2+1)*(q^9-2*q^7+q^5-q^4-q^3-1),
	-(q-1)*(q+1)*(q^2-q+1)*(2*q^4+1)*(q^2+1),
	(q+1)*(q^10-3*q^9+4*q^8-4*q^7+4*q^6-3*q^5+3*q^4-3*q^3+3*q^2-2*q+1),
	(q^2+1)*(q^4+q^3+q^2+q+1)*(q-1)^2,
	(q+1)*(2*q^8-4*q^7+5*q^6-4*q^5+4*q^4-3*q^3+3*q^2-2*q+1),
	-(q-1)*(2*q^7+q^6+q^4+q^2+1),
	(q-1)*(2*q^3-1)*(q^3+q^2+1),
	1-q+q^2+q^4+2*q^6-2*q^7,
	(q+1)*(q^2-q+1)*(2*q^2-2*q+1)*(q^2+q+1),
	-(q-1)*(q^2+1),
	(q^2+q+1)*(q-1)^2,
	(q^2+1)*(q^3-q+1),
	-(q-1)*(q^2+1),
	-q^3-q+1,
	-2*q^3-q+1,
	2*q^2-q+1,
	q^2-q+1,
	-q+1,
	R(1),
	R(1),
	R(1)] [
	(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^4-q^2+1),
	-(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^2+q+1)^2*(q+1)^3*(q-1)^5,
	-(q^2+1)*(q^3-q-1)*(q^2-q+1)^2*(q^2+q+1)^2*(q+1)^3*(q-1)^4,
	(q^2+q+1)*(q^7+q^5-q^4-q^2-1)*(q+1)^2*(q-1)^3,
	(q^4+q^3+q^2+1)*(q+1)^2*(q^2+q+1)^2*(q-1)^4,
	(q^2+1)*(q^2+q+1)*(q^2-q+1)*(q^3-q-1)*(q+1)^2*(q-1)^3,
	(q+1)*(q^5-q^3-1)*(q^2+q+1)^2*(q-1)^3,
	-(q^2-q+1)*(q+1)^2*(q^2+q+1)^2*(q-1)^3,
	-(q+1)*(q^2+q+1)*(q^4+q^3+q^2+q+1)*(q-1)^3,
	-(q^2+1)*(q^2+q+1)*(q+1)^2*(q-1)^3,
	(q-1)*(q+1)*(q^7+q^3-1),
	-(q^3-q^2-1)*(q-1)^2*(q+1)^2,
	-(q+1)*(2*q^4-q^2-q-1)*(q-1)^2,
	(q+1)*(q^2+q+1)*(q-1)^2,
	-(q^2+q+1)*(2*q^5-q^4-q^3+q^2+q-1),
	(q+1)*(q^2+q+1)*(q-1)^2,
	(q+1)*(q^2+q+1)*(q-1)^2,
	(q-1)*(q^3-q-1),
	-(q-1)*(q+1),
	(q-1)*(q^3-q-1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	(q-1)^6*(q+1)^4*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1),
	-(q^2-q+1)*(q^2+q+1)*(q^4+q^3+q^2+q+1)*(q^7+q^6+q^5+q^4+q^3+q^2+1)*(q^2+1)*(q+1)^3*(q-1)^5,
	(q^2+q+1)*(q^4+q^3+q^2+q+1)*(q^2+1)*(q^2-q+1)^2*(q+1)^3*(q-1)^4,
	-(q^11+q^9+q^7+q^6+q^5+2*q^4+q^3+2*q^2+1)*(q+1)^2*(q-1)^3,
	(q^2+q+1)*(q^3+q^2+1)*(q^4+q^3+q^2+1)*(q+1)^2*(q-1)^4,
	(q^2-q+1)*(q^6-q^5+q^4-q^3+q^2-q+1)*(q^2+1)*(q-1)^2*(q+1)^3,
	-(q^2-q+1)*(q^2+q+1)*(q^3+q^2+1)*(q+1)^2*(q-1)^3,
	(q^2+q+1)*(q-1)^2*(q+1)^2*(q^2-q+1)^2,
	(q+1)*(q^7+q^5+q^3+q^2+1)*(q-1)^2,
	-(q+1)^2*(q^2+1)^2*(q-1)^3,
	-(q-1)*(q^2-q+1)*(q^4-q^3+q^2-q+1)*(q+1)^2,
	(q+1)*(q^5+q^2+1)*(q-1)^2,
	-(q+1)*(q^3+2*q^2+q+1)*(q-1)^3,
	-(q+1)*(q^2+1)*(q-1)*(q^3-q+1),
	(2*q^3+1)*(1-q+q^4),
	(q+1)*(q^2+1)*(q-1)^2,
	(q+1)*(q-1)^2,
	-(q-1)*(q+1)*(q^2-q+1),
	-(q-1)*(q+1)*(q^2-q+1),
	(q+1)*(q-1)^2,
	(q+1)*(q-1)^2,
	q^3+q^2-q+1,
	-q+1,
	-q+1,
	R(1),
	R(1),
	R(1)] [
	-(q-1)*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2+1)*(q^2-q+1)*(q^4+q^3+q^2+q+1)*(4*q^11-q^10-q^7-q^6-q^4-q^3-1)*(q+1)^2*(q^2+q+1)^2,
	-(q^2+1)*(q^2+q+1)*(q^2-q+1)*(10*q^12+6*q^11+2*q^10-2*q^9-6*q^8-9*q^7-8*q^6-7*q^5-6*q^4-4*q^3-3*q^2-2*q-1)*(q+1)^2,
	-(q+1)*(q^2+q+1)*(5*q^13+10*q^12+5*q^11-11*q^9-18*q^8-21*q^7-20*q^6-15*q^5-11*q^4-7*q^3-4*q^2-2*q-1),
	-(q+1)*(15*q^10-4*q^9-3*q^8-13*q^7-12*q^6-10*q^5-5*q^4-4*q^3-2*q^2-q-1)*(q^2+q+1)^2,
	-(q^2-q+1)*(q^2+q+1)*(q^2+1)*(5*q^7-q^6-3*q^5-6*q^4-4*q^3-3*q^2-2*q-1)*(q+1)^2,
	-(q^2+q+1)*(16*q^11+7*q^10-13*q^9-29*q^8-41*q^7-35*q^6-26*q^5-18*q^4-11*q^3-6*q^2-3*q-1),
	-(q+1)*(q^2+q+1)*(q^2-q+1)*(q+1+2*q^2)*(2*q^5-3*q^4-4*q^3-2*q^2-2*q-1),
	-(q+1)*(10*q^10-q^9-18*q^8-31*q^7-35*q^6-29*q^5-22*q^4-13*q^3-7*q^2-3*q-1),
	-(q+1)*(9*q^7-18*q^6-30*q^5-27*q^4-14*q^3-6*q^2-3*q-1)*(q^2+1),
	(q+1)*(10*q^6+18*q^5+18*q^4+13*q^3+7*q^2+3*q+1),
	1+4*q+10*q^2+46*q^4+24*q^3+53*q^6+62*q^5+10*q^7,
	1+4*q+10*q^2+61*q^4+28*q^3+78*q^6+88*q^5,
	(q+1)*(3*q^2+2*q+1)*(6*q^3+2*q^2+q+1),
	(q+3*q^2+1)*(q+1)^2*(q^2+q+1),
	1+4*q+10*q^2+36*q^4+24*q^3+9*q^6+36*q^5,
	(q+1)*(q^2+q+1)*(4*q^3+8*q^2+2*q+1),
	(2*q+1)*(5*q^4+8*q^3+6*q^2+2*q+1),
	10*q^2+4*q+1+5*q^4+10*q^3,
	16*q^4+25*q^3+14*q^2+4*q+1,
	14*q^2+4*q+1+15*q^3,
	5*q^3+6*q^2+4*q+1,
	10*q^2+4*q+1,
	4*q+1,
	R(1),
	R(1),
	R(1)] [
	-(q-1)^3*(q+1)*(q^2+q+1)^3*(q^2+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q-1)^2*(q^2+q+1)^2,
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1)*(2*q^12-2*q^11+2*q^10-2*q^9+2*q^8-q^7+2*q^6-q^5+2*q^4+q^2+1)*(q^2+1),
	-(q^2+q+1)*(q^2+1)*(q^12-q^11-2*q^10+2*q^9-q^8+q^7-2*q^6+2*q^5-q^4-q^2+q-1),
	(q+1)*(5*q^8-2*q^7+6*q^6-q^5+4*q^4-q^3+3*q^2-q+1)*(q-1)^2*(q^2+q+1)^2,
	-(q^2+1)*(q^2+q+1)*(q^2-q+1)*(q^9-3*q^8-q^6+q^5-q^4-1),
	-(q-1)*(q^2+q+1)*(3*q^9+2*q^8+q^7+4*q^6+q^5+3*q^4+q^3+2*q^2+1),
	-(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(4*q^6+3*q^4+2*q^2+1),
	-(q^2+q+1)*(2*q^9-5*q^8+4*q^7-4*q^6+2*q^5-2*q^4+q^3-2*q^2+q-1),
	(q-1)*(q^2+1)*(3*q^7-3*q^4-2*q^3-2*q^2-q-1),
	2*q^7+4*q^6+3*q^4+2*q^2+1,
	1+2*q^2+2*q^4+q^6-2*q^5+2*q^7,
	1+2*q^2+q^4-6*q^6-4*q^5,
	(1+2*q^2)*(3*q^4+1),
	(-q^3+2*q^2-q+1+3*q^4)*(q^2+q+1),
	-(q-1)*(q+1)*(3*q^4+3*q^2+1),
	(q^2+q+1)*(4*q^4-4*q^3+2*q^2-q+1),
	2*q^5+q^4+2*q^2+1,
	q^4-2*q^3+2*q^2+1,
	-(q-1)*(q+3*q^2+1),
	2*q^2+1-5*q^3,
	2*q^2+1+q^3,
	1+2*q^2,
	R(1),
	R(1),
	R(1),
	R(1)] [
	-(q-1)^5*(q+1)*(q^2+q+1)^3*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q+1)*(q^2-q+1)*(q^4+q^3+q^2+q+1)*(2*q^10-q^9+q^8-q^7+2*q^6-q^5+q^4+q^2-q+1)*(q^2+q+1)^2*(q-1)^4,
	-(q^2+q+1)*(q^2-q+1)*(2*q^13+2*q^12+2*q^11+2*q^10+2*q^9+3*q^8+q^7+q^6+q^5+2*q^4+q^3+q^2+q+1)*(q-1)^3,
	-(3*q^12-3*q^11-2*q^10+2*q^9-q^8-q^7-2*q^6+2*q^5-q^4-q^2+q-1)*(q^2+q+1)*(q-1)^2,
	(1+q^2+2*q^3+2*q^4-q^5+3*q^6+3*q^7)*(q^2+q+1)^2*(q-1)^4,
	(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(5*q^9-3*q^8+2*q^7-3*q^6+3*q^5-3*q^4+2*q^3-2*q^2+2*q-1),
	-(q^8-q^7-2*q^6+2*q^5-q^4-q^2+q-1)*(q^2+q+1)*(q-1)^2,
	(q^2-q+1)*(q^2+q+1)*(3*q^4+1)*(q-1)^2,
	(q-1)*(2*q^10-q^9-q^7-q^6+q^5-2*q^4+q^3-q^2+q-1),
	-(3*q^8+3*q^7+2*q^6+3*q^5-q^4+2*q^3-q^2-1)*(q-1)^2,
	-(q-1)*(2*q^6-2*q^5+4*q^4-q^3+q^2-q+1),
	-(q^2-q+1)*(2*q^3-q^2-q-1)*(q-1)^2,
	(q-1)*(8*q^5-6*q^4+5*q^3-q^2+q-1),
	1-2*q+2*q^2+5*q^4-2*q^3-6*q^5,
	-(q-1)*(q^3+2*q^2-2*q+1)*(q^2+q+1),
	(q-1)*(3*q^3-1)*(q^2-q+1),
	(2*q-1)*(q-1)*(q^2+q+1),
	-(q-1)*(1-q+q^2-q^3+2*q^4),
	(q-1)*(3*q^3-q^2+q-1),
	-q^3-2*q+1,
	-3*q^3-2*q+1,
	-5*q^3+4*q^2-2*q+1,
	2*q^2-2*q+1,
	1-2*q,
	R(1),
	R(1),
	R(1)] [
	-(q+1)^3*(q^2+q+1)^3*(q-1)^3*(q^2+1)*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2-q+1)*(q^4+q^3+q^2+q+1)*(2*q^9-q^8-2*q^7+q^6+q^5-2*q^4-q^3+q^2-1)*(q^2+1)*(q-1)^2*(q+1)^2*(q^2+q+1)^2,
	-(q-1)*(q^2-q+1)*(q^2+q+1)*(2*q^13-2*q^12-2*q^11-2*q^10-2*q^9-q^8+q^7+q^6+q^5+2*q^4+q^3+q^2+q+1)*(q+1)^2,
	(q-1)*(q^2+q+1)*(q^11+2*q^9+q^7-2*q^6-2*q^4-q^3-q^2-1)*(q+1)^2,
	-(q-1)*(q+1)*(q^9-3*q^8+q^6+q^5+q^4+2*q^3+1)*(q^2+q+1)^2,
	(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(q^9+q^8+2*q^7+q^6-q^5-3*q^4-2*q^3-2*q^2-2*q-1),
	(q-1)*(q+1)*(q^2+q+1)*(3*q^8-q^7-2*q^6-2*q^5-3*q^4-2*q^3-q^2-q-1),
	-(q-1)*(q^2+q+1)*(q^2+1)*(q^2-q+1)*(q+1)^3,
	(q-1)*(q+1)*(2*q^9+q^8-q^7-4*q^6-5*q^5-6*q^4-4*q^3-3*q^2-2*q-1),
	(q^8-3*q^7+2*q^6-3*q^5+q^4+2*q^3+q^2+1)*(q+1)^2,
	-(q-1)*(2*q^4+2*q^3+2*q^2+q+1)*(q+1)^2,
	-(2*q^5+q^4-2*q^3-q^2-1)*(q+1)^2,
	-(q+1)*(4*q^5-2*q^4-5*q^3-q^2-q-1),
	1+2*q+2*q^2+q^4+2*q^3-4*q^6-2*q^5,
	-(q-1)*(q+1)*(q^2+q+1)^2,
	-(q+1)*(q^2-q-1)*(2*q^2+1+q^3),
	(q+1+2*q^2)*(q^2+q+1),
	-(q+1)*(2*q^4-q^3-q^2-q-1),
	-(q+1)*(q^3-q^2-q-1),
	(q+1)*(q+3*q^2+1),
	q^3+4*q^2+2*q+1,
	-(q+1)*(q^2-q-1),
	2*q+1+2*q^2,
	2*q+1,
	R(1),
	R(1),
	R(1)] [
	-(q+1)^3*(q^4+q^3+q^2+q+1)*(q^2+1)^2*(q-1)^3*(q^2-q+1)^2*(q^4+1)*(q^2+q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2+q+1)*(q^9-q^7-q^6-q^5-q^4-q-1)*(q-1)^2*(q+1)^2*(q^2-q+1)^2,
	-(q-1)*(q^2+1)*(q^2-q+1)*(q^12-2*q^11+q^10-2*q^9+q^8-q^7+2*q^6-q^5+2*q^4+q^2+1)*(q+1)^3,
	-(q-1)*(q+1)*(q^2+q+1)*(2*q^12-q^10+2*q^9+3*q^6+q^5+q^4+2*q^3+q^2+1),
	(q-1)*(q+1)*(q^2+q+1)*(4*q^10-q^9+q^8-q^7-2*q^6-2*q^5-q^4-2*q^3-q^2-1),
	-(q-1)*(q^2+q+1)*(q^2+1)*(q^2-q+1)*(2*q^6-2*q^5+q^4+q^3+1)*(q+1)^2,
	1+q+q^2+2*q^4+2*q^3+q^6+q^5-3*q^8+q^12+2*q^13-q^11-q^10-q^9,
	(q+1)*(q^2-q+1)*(2*q^9+q^3+q^2+q+1),
	-(q+1)*(q^10-q^9+2*q^7-2*q^6+q^5-q^4-q^3-q^2-1),
	-(q-1)*(q+1)*(3*q^4+3*q^3+q^2+q+1)*(q^2+1),
	(q+1)*(q^6+q^3+q^2+1),
	1+q+q^2+q^4+3*q^3-q^6-q^5+q^7,
	-(q-1)*(6*q^5+8*q^4+7*q^3+3*q^2+2*q+1),
	(q+1)*(q^3+q^2+1),
	(q+1)*(q^2+q+1)*(q^2-q+1),
	1+3*q^3+q^2+q,
	-(q-1)*(q+1)*(1+2*q^2)*(q^2+q+1),
	(q^2+1)*(q^3+q+1),
	2*q^4+q^3+q+1+q^2,
	-2*q^4+1+q+2*q^2+q^3,
	q+1+2*q^2,
	2*q^3+1+q,
	q^2+q+1,
	q+1,
	R(1),
	R(1),
	R(1)] [
	-(q-1)^5*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)*(q^2-q+1)*(q^4+q^3+q^2+q+1)*(2*q^10-q^9+q^8-q^7+2*q^6-q^5+q^4+q^2-q+1)*(q+1)^3*(q-1)^4,
	-(q^2+1)*(q^9+2*q^8+q^7+q^4+q+1)*(q^2-q+1)^2*(q+1)^2*(q-1)^3,
	(q+1)*(q^13-q^12+q^11+2*q^9+2*q^6-q^4+q^3+q^2-q+1)*(q-1)^2,
	-(1-q+2*q^2+q^4-2*q^5+4*q^6-3*q^7+2*q^8-q^9+3*q^10)*(q+1)^2*(q-1)^3,
	(q^2-q+1)*(q^2+1)*(q^7+q^6+q^3-q+1)*(q+1)^2*(q-1)^2,
	(2*q^11+2*q^10+q^9-q^8+2*q^7+2*q^6-q^5+2*q^3+1)*(q-1)^2,
	-(q-1)*(q+1)*(q^2-q+1)*(q^8+q^7+q^6-2*q^5+q^4+q^3-q+1),
	-(q-1)*(q+1)*(q^9-q^6+3*q^5-2*q^4+2*q^2-2*q+1),
	-(q+1)*(q^2+1)*(q-1)^3,
	(q+1)*(q^6-2*q^3+4*q^2-3*q+1),
	(q^2+q+1)*(q^3-q+1)*(q-1)^2,
	-(2*q^3-1)*(q-1)^2,
	-(q-1)*(q+1)*(2*q^2-2*q+1),
	(q+1)*(6*q^5-5*q^4+4*q^2-3*q+1),
	(q-1)^2,
	(q+1)^2*(q-1)^4,
	(q-1)*(q^4-2*q^3+q-1),
	-(q-1)*(q^3-q+1),
	-(2*q^2-1)*(q-1)^2,
	-q^2-2*q+1+3*q^3,
	3*q^2-2*q+1-q^3,
	(q-1)^2,
	1-2*q,
	R(1),
	R(1),
	R(1)] [
	-(q^2+q+1)^2*(q^4+q^3+q^2+q+1)*(q^2+1)^2*(q+1)^3*(q-1)^5*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q+1)^2*(q-1)^4,
	(q^2+q+1)*(q^2-q+1)*(q^3-q-1)*(q^6+q^3+1)*(q^2+1)*(q+1)^2*(q-1)^3,
	-(q+1)*(q^2+1)*(q^11+q^10-q^8+q^6-q^4-q-1)*(q-1)^2,
	-(q^2+q+1)*(q^8+q^6+q^4+q^3+q^2+1)*(q+1)^2*(q-1)^3,
	-(q^2+1)*(q^9-q^6+q^5-q^4-1)*(q-1)^2*(q+1)^2,
	(q+1)*(q^2+q+1)*(q^6-q^5+q^3+1)*(q-1)^2,
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1)*(q^6-q^2+1),
	(q+1)*(q^8+q^7+q^6+q^4+q^3+q^2+q+1)*(q-1)^2,
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q^6+q+1),
	-(q-1)*(q+1)*(q^5-q^4+1),
	(2*q^3+2*q+2*q^2+1)*(q-1)^2,
	-(q-1)*(q+1),
	-(q-1)*(q^4+q+1),
	-(q-1)*(q+1),
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q^4+q+1),
	(q+1)*(q^3-q+1),
	-(q-1)*(q+1),
	1+q^3-q^2,
	1+q^3-q^2,
	-(q-1)*(q+1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	-(q-1)^5*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^6+q^3+1)*(q+1)^2*(q^2+q+1)^2*(q-1)^4,
	-(q^2+q+1)*(q^2-q+1)*(q^4+q^3+q^2+q+1)*(q^2+1)*(q+1)^2*(q-1)^3,
	(q+1)*(q^2+q+1)*(q^11-q^7+q^3+q^2+1)*(q-1)^2,
	(q+1)*(q^7-q^6-q^5-2*q^3-q^2-1)*(q^2+q+1)^2*(q-1)^3,
	-(q-1)*(q+1)*(q^2+q+1)*(q^2+1)*(q^2-q+1)*(q^7+q^6-q^5-q^2+1),
	-(q+1)*(q^2+1)*(q^2+q+1)*(q^5-q^3-1)*(q-1)^2,
	(q^2+q+1)*(q^2+1)*(q^2-q+1)*(q+1)^2*(q-1)^2,
	-(q-1)*(q+1)*(q^8-q^7-q^5+q^2+1),
	-(q+1)*(q^5-q^3-q^2-q-1)*(q^2+1)*(q-1)^2,
	-(q-1)*(q+1)*(q^2+1),
	(q-1)*(q+1)*(q^4-q^2-1),
	(1+2*q^2)*(q+1)^2*(q-1)^2,
	1-q^4+2*q^6,
	-(q-1)*(q+1)*(q^2+q+1)*(q^2-q+1),
	(q-1)*(q+1)*(q^4-q^2-1),
	-(q-1)*(q^2+q+1),
	-(q-1)*(q+1)*(q^2+1),
	-(q-1)*(q+1)*(q^2+1),
	-(q-1)*(q^2+q+1),
	-(q-1)*(q^2+q+1),
	(q^2-q+1)*(q+1),
	R(1),
	R(1),
	R(1),
	R(1),
	R(1)] [
	-(q-1)^5*(q^2+1)^2*(q^2+q+1)^3*(q+1)^3*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2-q+1)*(q^2+1)*(q^7+q^6+q^5+q^4+q^3+q^2+1)*(q^4-q^2+1)*(q+1)^2*(q^2+q+1)^2*(q-1)^4,
	-(q^2+1)*(q^4-q^2+1)*(q+1)^2*(q^2+q+1)^2*(q^2-q+1)^2*(q-1)^3,
	(q+1)*(q^2+q+1)*(q^7+q^2-q+1)*(q-1)^2,
	-(q+1)*(q^6-q^4+q^3+q^2-q+1)*(q^2+q+1)^2*(q-1)^3,
	(q^2-q+1)*(q^2+1)*(q^2+q+1)*(1-q+q^4)*(q+1)^2*(q-1)^2,
	-(q^7-2*q^6+2*q^4-2*q^3+q-1)*(q-1)^2*(q^2+q+1)^2,
	(q+1)*(q^2-q+1)*(q^3-q+1)*(q-1)^2*(q^2+q+1)^2,
	(q-1)*(q+1)*(q^8-q^7-q^4+q^3-q^2+q-1),
	(q+1)*(q^2+1)*(q^5-q^3+1)*(q-1)^2,
	-(q-1)*(q+1)*(1-q+q^2-q^3+2*q^4),
	-(q-1)*(q+1)*(2*q^4-2*q^3+q^2-q+1),
	-(q+1)*(q+1+2*q^2)*(q-1)^3,
	-(q-1)*(q+1)*(1-q+q^2-q^3+2*q^4),
	-(q-1)*(q+1)*(2*q^2-2*q+1)*(q^2+q+1),
	-(q-1)*(q^5-q^3+1),
	-(q+1)*(q^2+q+1)*(q-1)^3,
	1-q+q^4,
	-q+1,
	(q-1)*(q^3+q^2-1),
	-q^2-q+1,
	q^2-q+1,
	-q+1,
	-q+1,
	R(1),
	R(1),
	R(1)] [
	-(q-1)^5*(q+1)^3*(q^2+q+1)^3*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^2-q+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2-q+1)*(q^4+q^3+q^2+q+1)*(q^9-q^7-q^6-q^5-q^4-q-1)*(q+1)^2*(q^2+q+1)^2*(q-1)^4,
	(q^2+q+1)*(q^13+q^12+q^11+q^10+q^9-q^7-q^6-q^5-2*q^4-q^3-q^2-q-1)*(q+1)^2*(q-1)^3,
	-(q+1)*(q^2+q+1)*(q^9+q^8+q^7+q^6-q^4-q-1)*(q-1)^2,
	-(q^4+q^3+1)*(q+1)^2*(q^2+q+1)^2*(q-1)^3,
	(q-1)*(q+1)*(q^2-q+1)*(q^2+q+1)*(2*q^9-q^7+2*q^3+q^2-q-1),
	-(q+1)*(q^2+q+1)*(q^7+q^6-q^4-q-1)*(q-1)^2,
	(q^2+q+1)*(q+1)^2*(q-1)^2,
	-(q-1)*(q^3-q-1)*(q^7+q^6+q^5-q-1),
	(q^4+q^3+q^2+q+1)*(q+1)^2*(q-1)^2,
	(q-1)*(q+1)*(q^5+q^4+q^3-q-1),
	(q^2+1)*(q-1)^2*(q+1)^3,
	(q-1)*(2*q^5-q^3-q^2-2*q-1),
	-(q+1)*(q^3+q^2-1),
	(q-1)*(2*q^3+q^2-q-1)*(q^2+q+1),
	-(q-1)*(q+1)^2,
	-(q-1)*(q+1)*(q^2+q+1),
	(q-1)*(q+1)*(q^3-q-1),
	-(q-1)*(q+1)^2,
	1-q^3+q,
	q+1,
	-(q+1)*(2*q^2-1),
	-q^2+1+q,
	q+1,
	R(1),
	R(1),
	R(1)]]
classinfo = Vector{Any}[[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+q+1)*(q^2+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^3*(q-1)^2*(q+1)*(q^2+q+1)^2*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^5*(q-1)^3*(q+1)^2*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//2*q^10*(q-1)^2*(q+1)^2*(q^2+q+1)*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//2*q^10*(q-1)^4*(q+1)^2*(q^2+q+1)^2*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^10*(q-1)^3*(q+1)^3*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^14*(q-1)^4*(q+1)^2*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^11*(q-1)^4*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^17*(q-1)^3*(q+1)^2*(q^2+q+1)^3*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^14*(q-1)^5*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^17*(q-1)^4*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//6*q^18*(q-1)^4*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//2*q^18*(q-1)^5*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//3*q^18*(q-1)^6*(q+1)^4*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^21*(q-1)^4*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^23*(q-1)^4*(q+1)^3*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^21*(q-1)^5*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^24*(q-1)^5*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^23*(q-1)^5*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//2*q^24*(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//2*q^24*(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^27*(q-1)^5*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	q^28*(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//3*q^30*(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//3*q^30*(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	1//3*q^30*(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
	["\\emptyset"],
	["4A_1"],
	["2A_1"],
	["3A_2"],
	["A_2"],
	["2A_2"],
	["D_4(a_1)"],
	["A_3+A_1"],
	["A_4"],
	["E_6(a_2)"],
	["D_4"],
	["A_5+A_1"],
	["A_2+2A_1"],
	["E_6(a_1)"],
	["E_6"],
	["A_1"],
	["3A_1"],
	["A_3+2A_1"],
	["A_3"],
	["A_2+A_1"],
	["2A_2+A_1"],
	["A_5"],
	["D_5"],
	["A_4+A_1"],
	["D_5(a_1)"]]
chardegree = R.([
	(q^2+q+1)^3*(q^2+1)^2*(q+1)^4*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+q+1)^3*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^6*(q+1)^4*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)^2*(q-1)^2*(q+1)^4*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^2+q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^2+1)^2*(q+1)^4*(q-1)^4*(q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^4*(q+1)^4*(q^2+q+1)^3*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q+1)^2*(q^2+q+1)^3*(q-1)^4*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q^2+1)^2*(q^2+q+1)^3*(q+1)^4*(q-1)^4*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^6*(q+1)^4*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^4*(q+1)^2*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^2-q+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^6*(q+1)^2*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^4*(q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^2+q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	(q-1)^6*(q+1)^4*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^4-q^2+1),
	(q-1)^6*(q+1)^4*(q^2+q+1)^2*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1),
	-(q-1)*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q-1)^3*(q+1)*(q^2+q+1)^3*(q^2+1)^2*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q-1)^5*(q+1)*(q^2+q+1)^3*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q+1)^3*(q^2+q+1)^3*(q-1)^3*(q^2+1)*(q^2-q+1)^2*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q+1)^3*(q^4+q^3+q^2+q+1)*(q^2+1)^2*(q-1)^3*(q^2-q+1)^2*(q^4+1)*(q^2+q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	-(q-1)^5*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q^2+q+1)^2*(q^4+q^3+q^2+q+1)*(q^2+1)^2*(q+1)^3*(q-1)^5*(q^2-q+1)*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q-1)^5*(q+1)^3*(q^2+q+1)^3*(q^2+1)^2*(q^4+q^3+q^2+q+1)*(q^2-q+1)^2*(q^6+q^3+1)*(q^4-q^2+1),
	-(q-1)^5*(q^2+1)^2*(q^2+q+1)^3*(q+1)^3*(q^2-q+1)^2*(q^4+1)*(q^6+q^3+1)*(q^4-q^2+1),
	-(q-1)^5*(q+1)^3*(q^2+q+1)^3*(q^2+1)*(q^4+q^3+q^2+q+1)*(q^4+1)*(q^2-q+1)*(q^6+q^3+1)*(q^4-q^2+1)])

information = "- Information about the Green functions of \$E_6(3^n)\$.

- CHEVIE-name of the table: ``E6p3green``

"

TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

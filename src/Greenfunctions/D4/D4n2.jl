using ..GenericCharacterTables
import ..GenericCharacterTables: ExtendableMatrix, SimpleCharTable
using Oscar
R, q = polynomial_ring(QQ, "q")

order = q^12*(q-1)^4*(q+1)^4*(q^2+1)^2*(q^2+q+1)*(q^2-q+1)
table = QQPolyRingElem[[
	-(q+1)^3*(q^2+q+1)*(q-1)^3*(q^2+1)*(q^2-q+1),
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1)*(q^4+1),
	(q^2+1)*(q-1)^2*(q+1)^2,
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	(q^2+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	R(1),
	R(1)] [
	-(q+1)^3*(q^2+q+1)*(q-1)^3*(q^2+1)*(q^2-q+1),
	(q^2+1)*(q-1)^2*(q+1)^2,
	(q^2+1)*(q-1)^2*(q+1)^2,
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1)*(q^4+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	(q^2+1),
	-(q-1)*(q+1),
	R(1),
	R(1)] [
	-(q+1)^3*(q^2+q+1)*(q-1)^3*(q^2+1)*(q^2-q+1),
	(q^2+1)*(q-1)^2*(q+1)^2,
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1)*(q^4+1),
	(q^2+1)*(q-1)^2*(q+1)^2,
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	(q^2+1),
	R(1),
	R(1)] [
	(q^2+1)^2*(q-1)^2*(q+1)^4*(q^2-q+1),
	(q-1)*(q^3-2*q^2+q-1)*(q+1)^3,
	-(q-1)*(q+1)^2*(q^2+1),
	-(q-1)*(q+1)^2*(q^2+1),
	-(q-1)*(q+1)^2*(q^2+1),
	-(q-1)*(q+1)*(q^2+q+1),
	-(q-1)*(q+1)^2,
	-q^3+q^2+q+1,
	(q+1),
	(q+1),
	(q+1),
	(q+1),
	R(1)] [
	(q^2+q+1)*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1),
	-(q-1)*(q^2+1)^2*(q+1),
	(q^2+1)*(3*q^4+1),
	-(q-1)*(q^2+1)^2*(q+1),
	-(q-1)*(q^2+1)^2*(q+1),
	q^2+1+2*q^4,
	(2*q^2-q+1)*(q+1),
	-(q-1)*(q+1+2*q^2),
	3*q^2+1,
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	R(1),
	R(1)] [
	(q^2+q+1)*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1),
	-(q-1)*(q^2+1)^2*(q+1),
	-(q-1)*(q^2+1)^2*(q+1),
	-(q-1)*(q^2+1)^2*(q+1),
	(q^2+1)*(3*q^4+1),
	q^2+1+2*q^4,
	(2*q^2-q+1)*(q+1),
	-(q-1)*(q+1+2*q^2),
	-(q-1)*(q+1),
	3*q^2+1,
	-(q-1)*(q+1),
	R(1),
	R(1)] [
	(q^2+q+1)*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1),
	-(q-1)*(q^2+1)^2*(q+1),
	-(q-1)*(q^2+1)^2*(q+1),
	(q^2+1)*(3*q^4+1),
	-(q-1)*(q^2+1)^2*(q+1),
	q^2+1+2*q^4,
	(2*q^2-q+1)*(q+1),
	-(q-1)*(q+1+2*q^2),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	3*q^2+1,
	R(1),
	R(1)] [
	-(q-1)*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	-(2*q^5-q^4-2*q^2-1)*(q+1)^2,
	-(q^3-q^2-q-1)*(q+1)*(q^2+1),
	-(q^3-q^2-q-1)*(q+1)*(q^2+1),
	-(q^3-q^2-q-1)*(q+1)*(q^2+1),
	3*q^2+2*q+1,
	(q+1)^2,
	5*q^2+2*q+1,
	(q+1)^2,
	(q+1)^2,
	(q+1)^2,
	2*q+1,
	R(1)] [
	(q^2+q+1)*(q^2+1)^2*(q+1)^4*(q^2-q+1),
	(4*q^4+3*q^3+3*q^2+q+1)*(q+1)^3,
	(q+1)^2*(3*q^2+2*q+1)*(q^2+1),
	(q+1)^2*(3*q^2+2*q+1)*(q^2+1),
	(q+1)^2*(3*q^2+2*q+1)*(q^2+1),
	(q+1)*(2*q^3+6*q^2+3*q+1),
	(q+1)^2*(2*q+1),
	14*q^3+13*q^2+4*q+1,
	(3*q+1)*(q+1),
	(3*q+1)*(q+1),
	(3*q+1)*(q+1),
	4*q+1,
	R(1)] [
	(q-1)^4*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	-(q-1)^3*(4*q^4-3*q^3+3*q^2-q+1),
	(q-1)^2*(q^2+1)*(3*q^2-2*q+1),
	(q-1)^2*(q^2+1)*(3*q^2-2*q+1),
	(q-1)^2*(q^2+1)*(3*q^2-2*q+1),
	(q-1)*(2*q^3-6*q^2+3*q-1),
	-14*q^3+13*q^2-4*q+1,
	-(q-1)^2*(2*q-1),
	(q-1)*(3*q-1),
	(q-1)*(3*q-1),
	(q-1)*(3*q-1),
	-4*q+1,
	R(1)] [
	-(q-1)^3*(q+1)*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	(q-1)^2*(2*q^5+q^4+2*q^2+1),
	-(q-1)*(q^2+1)*(q^3+q^2-q+1),
	-(q-1)*(q^3+q^2-q+1)*(q^2+1),
	-(q-1)*(q^3+q^2-q+1)*(q^2+1),
	3*q^2-2*q+1,
	5*q^2-2*q+1,
	(q-1)^2,
	(q-1)^2,
	(q-1)^2,
	(q-1)^2,
	-2*q+1,
	R(1)] [
	(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2-q+1),
	-(q-1)^3*(q+1)^3,
	-(q-1)^3*(q+1)^3,
	-(q-1)^3*(q+1)^3,
	-(q-1)^3*(q+1)^3,
	(q-1)*(q+1)*(2*q^2-1),
	-(2*q-1)*(q+1)^2,
	(2*q+1)*(q-1)^2,
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	-(q-1)*(q+1),
	R(1),
	R(1)] [
	(q-1)^4*(q+1)^2*(q^2+q+1)*(q^2+1)^2,
		-(q-1)^3*(q+1)*(q^3+2*q^2+q+1),
	(q-1)^2*(q+1)*(q^2+1),
	(q-1)^2*(q+1)*(q^2+1),
	(q-1)^2*(q+1)*(q^2+1),
	-(q-1)*(q+1)*(q^2-q+1),
	q^3+q^2-q+1,
	(q-1)^2*(q+1),
	-q+1,
	-q+1,
	-q+1,
	-q+1,
	R(1)]]
classinfo = Vector{Any}[[], [], [], [], [], [], [], [], [], [], [], [], []]
classlength = R.([
	1,
	(q-1)*(q+1)*(q^2+1)^2*(q^2+q+1)*(q^2-q+1),
	(q-1)^2*(q+1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^2,
	(q-1)^2*(q+1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^2,
	(q-1)^2*(q+1)^2*(q^2+1)*(q^2+q+1)*(q^2-q+1)*q^2,
	q^2*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	1//2*q^4*(q-1)^4*(q+1)^2*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	1//2*q^4*(q-1)^2*(q+1)^4*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	q^6*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	q^6*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	q^6*(q-1)^3*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	q^6*(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	q^8*(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2+1)^2*(q^2-q+1)])
classtypeorder = R.([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
charinfo = Vector{Any}[
	[[[4],["+"]]],
	[[[4],["-"]]],
	[[[1],[2,1]]],
	[[[3,1],[]]],
	[[[2,2],["+"]]],
	[[[2,2],["-"]]],
	[[[1,1],[1,1]]],
	[[[2,1,1],[]]],
	[[[1,1,1,1],[]]],
	[[[],[1,1,1,1]]],
	[[[2],[1,1]]],
	[[[],[2,2]]],
	[[[],[3,1]]]]
chardegree = R.([
	-(q+1)^3*(q^2+q+1)*(q-1)^3*(q^2+1)*(q^2-q+1),
	-(q+1)^3*(q^2+q+1)*(q-1)^3*(q^2+1)*(q^2-q+1),
	-(q+1)^3*(q^2+q+1)*(q-1)^3*(q^2+1)*(q^2-q+1),
	(q^2+1)^2*(q-1)^2*(q+1)^4*(q^2-q+1),
	(q^2+q+1)*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1),
	(q^2+q+1)*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1),
	(q^2+q+1)*(q^2+1)^2*(q-1)^2*(q+1)^2*(q^2-q+1),
	-(q-1)*(q+1)^3*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	(q^2+q+1)*(q^2+1)^2*(q+1)^4*(q^2-q+1),
	(q-1)^4*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	-(q-1)^3*(q+1)*(q^2+q+1)*(q^2+1)^2*(q^2-q+1),
	(q-1)^4*(q+1)^4*(q^2+q+1)*(q^2-q+1),
	(q-1)^4*(q+1)^2*(q^2+q+1)*(q^2+1)^2])

information = ""
TABLE=SimpleCharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)

using ..GenericCharacterTables
import ..GenericCharacterTables: Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac
using Oscar
R = universal_polynomial_ring(QQ; cached=false)
q = gen(R, "q")
S = generic_cyclotomic_ring(R)
a,b,c,l,m,n, _...=gens(R, ["a", "b", "c", "l", "m", "n", "a1", "b1", "c1", "l1", "m1", "n1", "a2", "b2", "c2", "l2", "m2", "n2", "a3", "b3", "c3", "l3", "m3", "n3", "at1", "bt1", "ct1", "lt1", "mt1", "nt1", "at2", "bt2", "ct2", "lt2", "mt2", "nt2"])

order = q^3*(q-1)^3*(q+1)*(q^2+q+1)
table = GenericCyclo[[
	S(1, exponent=(3*n*a)*1//R((q-1))),
	S(1, exponent=(3*n*a)*1//R((q-1))),
	S(1, exponent=(3*n*a)*1//R((q-1))),
	S(1, exponent=(2*n*a+n*b)*1//R((q-1))),
	S(1, exponent=(2*n*a+n*b)*1//R((q-1))),
	S(1, exponent=(n*a+n*b+n*c)*1//R((q-1))),
	S(1, exponent=(n*a+n*b)*1//R((q-1))),
	S(1, exponent=(n*a)*1//R((q-1)))] [
	(q^2+q)*S(1, exponent=(3*n*a)*1//R((q-1))),
	q*S(1, exponent=(3*n*a)*1//R((q-1))),
	S(0),
	(q+1)*S(1, exponent=(2*n*a+n*b)*1//R((q-1))),
	S(1, exponent=(2*n*a+n*b)*1//R((q-1))),
	2*S(1, exponent=(n*a+n*b+n*c)*1//R((q-1))),
	S(0),
	-S(1, exponent=(n*a)*1//R((q-1)))] [
	q^3*S(1, exponent=(3*n*a)*1//R((q-1))),
	S(0),
	S(0),
	q*S(1, exponent=(2*n*a+n*b)*1//R((q-1))),
	S(0),
	S(1, exponent=(n*a+n*b+n*c)*1//R((q-1))),
	-S(1, exponent=(n*a+n*b)*1//R((q-1))),
	S(1, exponent=(n*a)*1//R((q-1)))] [
	(q^2+q+1)*S(1, exponent=(m*a+2*n*a)*1//R((q-1))),
	(q+1)*S(1, exponent=(m*a+2*n*a)*1//R((q-1))),
	S(1, exponent=(m*a+2*n*a)*1//R((q-1))),
	(q+1)*S(1, exponent=(m*a+n*a+n*b)*1//R((q-1)))+S(1, exponent=(2*n*a+m*b)*1//R((q-1))),
	S(1, exponent=(m*a+n*a+n*b)*1//R((q-1)))+S(1, exponent=(2*n*a+m*b)*1//R((q-1))),
	S(1, exponent=(m*a+n*b+n*c)*1//R((q-1)))+S(1, exponent=(m*b+n*a+n*c)*1//R((q-1)))+S(1, exponent=(m*c+n*a+n*b)*1//R((q-1))),
	S(1, exponent=(m*a+n*b)*1//R((q-1))),
	S(0)] [
	q*(q^2+q+1)*S(1, exponent=(m*a+2*n*a)*1//R((q-1))),
	q*S(1, exponent=(m*a+2*n*a)*1//R((q-1))),
	S(0),
	(q+1)*S(1, exponent=(m*a+n*a+n*b)*1//R((q-1)))+q*S(1, exponent=(2*n*a+m*b)*1//R((q-1))),
	S(1, exponent=(m*a+n*a+n*b)*1//R((q-1))),
	S(1, exponent=(m*a+n*b+n*c)*1//R((q-1)))+S(1, exponent=(m*b+n*a+n*c)*1//R((q-1)))+S(1, exponent=(m*c+n*a+n*b)*1//R((q-1))),
	-S(1, exponent=(m*a+n*b)*1//R((q-1))),
	S(0)] [
	(q+1)*(q^2+q+1)*S(1, exponent=(l*a+m*a+n*a)*1//R((q-1))),
	(2*q+1)*S(1, exponent=(l*a+m*a+n*a)*1//R((q-1))),
	S(1, exponent=(l*a+m*a+n*a)*1//R((q-1))),
	(q+1)*(S(1, exponent=(l*a+m*a+n*b)*1//R((q-1)))+S(1, exponent=(m*a+n*a+l*b)*1//R((q-1)))+S(1, exponent=(l*a+n*a+m*b)*1//R((q-1)))),
	S(1, exponent=(l*a+m*a+n*b)*1//R((q-1)))+S(1, exponent=(l*a+n*a+m*b)*1//R((q-1)))+S(1, exponent=(m*a+n*a+l*b)*1//R((q-1))),
	S(1, exponent=(l*a+m*b+n*c)*1//R((q-1)))+S(1, exponent=(l*a+n*b+m*c)*1//R((q-1)))+S(1, exponent=(m*a+n*b+l*c)*1//R((q-1)))+S(1, exponent=(m*a+l*b+n*c)*1//R((q-1)))+S(1, exponent=(n*a+m*b+l*c)*1//R((q-1)))+S(1, exponent=(n*a+l*b+m*c)*1//R((q-1))),
	S(0),
	S(0)] [
	(q-1)*(q^2+q+1)*S(1, exponent=(m*a+n*a)*1//R((q-1))),
	-S(1, exponent=(m*a+n*a)*1//R((q-1))),
	-S(1, exponent=(m*a+n*a)*1//R((q-1))),
	(q-1)*S(1, exponent=(n*a+m*b)*1//R((q-1))),
	-S(1, exponent=(n*a+m*b)*1//R((q-1))),
	S(0),
	-S(1, exponent=(m*a*q+m*a+n*b)*1//R((q^2-1)))-S(1, exponent=(m*a*q+m*a+n*b*q)*1//R((q^2-1))),
	S(0)] [
	(q-1)^2*(q+1)*S(1, exponent=(n*a)*1//R((q-1))),
	-(q-1)*S(1, exponent=(n*a)*1//R((q-1))),
	S(1, exponent=(n*a)*1//R((q-1))),
	S(0),
	S(0),
	S(0),
	S(0),
	S(1, exponent=(n*a)*1//R((q^3-1)))+S(1, exponent=(n*a*q)*1//R((q^3-1)))+S(1, exponent=(n*a*q^2)*1//R((q^3-1)))]]
classinfo = Vector{Any}[
	[[1,0],["A_2",[1,1,1]]],
	[[1,1],["A_2",[2,1]]],
	[[1,2],["A_2",[3]]],
	[[2,0],["A_1",[1,1]]],
	[[2,1],["A_1",[2]]],
	[[3,0],["A_0",[1]]],
	[[4,0],["A_0",[1]]],
	[[5,0],["A_0",[1]]]]
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
	[[1,0],["A_2",[3]]],
	[[1,1],["A_2",[2,1]]],
	[[1,2],["A_2",[1,1,1]]],
	[[2,0],["A_1",[2]]],
	[[2,1],["A_1",[1,1]]],
	[[3,0],["A_0",[1]]],
	[[4,0],["A_0",[1]]],
	[[5,0],["A_0",[1]]]]
chardegree = R.([1, q^2+q, q^3, q^2+q+1, q*(q^2+q+1), (q+1)*(q^2+q+1), (q-1)*(q^2+q+1), (q-1)^2*(q+1)])

classsums=[
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, a, 0, q-2)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, a, 0, q-2)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, a, 0, q-2)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt1=eesubs(tt, [b], [a])
	ss4=nesum(tt, b, 0, q-2)
	ss5=ss4-tt1
	ss5=nesum(ss5, a, 0, q-2)
	ss5
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt1=eesubs(tt, [b], [a])
	ss4=nesum(tt, b, 0, q-2)
	ss5=ss4-tt1
	ss5=nesum(ss5, a, 0, q-2)
	ss5
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	ss6a=nesum(tt, a, 0, q-2)
	ss6b=nesum(ss6a, b, 0, q-2)
	ss6=nesum(ss6b, c, 0, q-2)
	tt1=eesubs(tt, [b], [a])
	ss7a=nesum(tt1, a, 0, q-2)
	ss7=nesum(ss7a, c, 0, q-2)
	tt2=eesubs(tt, [c], [b])
	ss8a=nesum(tt2, a, 0, q-2)
	ss8=nesum(ss8a, b, 0, q-2)
	tt3=eesubs(tt, [c], [a])
	ss9a=nesum(tt3, a, 0, q-2)
	ss9=nesum(ss9a, b, 0, q-2)
	tt4a=eesubs(tt, [b], [a])
	tt4=eesubs(tt4a, [c], [a])
	ss10=nesum(tt4, a, 0, q-2)
	1//6*ss6-1//6*ss7-1//6*ss8-1//6*ss9+1//3*ss10
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	ss7=nesum(tt, b, 0, q^2-2)
	tt1=eesubs(tt, [b], [(q+1)*b])
	ss8=nesum(tt1, b, 0, q-2)
	tt1=ss7-ss8
	ss9=nesum(tt1, a, 0, q-2)
	1//2*ss9
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	ss8=nesum(tt, a, 0, q^3-2)
	tt1=eesubs(tt, [a], [(q^2+q+1)*a])
	ss9=nesum(tt1, a, 0, q-2)
	1//3*ss8-1//3*ss9
end
]

charsums=[
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, n, 0, q-2)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, n, 0, q-2)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	nesum(tt, n, 0, q-2)
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt1=eesubs(tt, [m], [n])
	ss4=nesum(tt, m, 0, q-2)
	ss5=ss4-tt1
	ss5=nesum(ss5, n, 0, q-2)
	ss5
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	tt1=eesubs(tt, [m], [n])
	ss4=nesum(tt, m, 0, q-2)
	ss5=ss4-tt1
	ss5=nesum(ss5, n, 0, q-2)
	ss5
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	ss6a=nesum(tt, n, 0, q-2)
	ss6b=nesum(ss6a, m, 0, q-2)
	ss6=nesum(ss6b, l, 0, q-2)
	tt1=eesubs(tt, [m], [n])
	ss7a=nesum(tt1, n, 0, q-2)
	ss7=nesum(ss7a, l, 0, q-2)
	tt2=eesubs(tt, [l], [m])
	ss8a=nesum(tt2, n, 0, q-2)
	ss8=nesum(ss8a, m, 0, q-2)
	tt3=eesubs(tt, [l], [n])
	ss9a=nesum(tt3, n, 0, q-2)
	ss9=nesum(ss9a, m, 0, q-2)
	tt4a=eesubs(tt, [m], [n])
	tt4=eesubs(tt4a, [l], [n])
	ss10=nesum(tt4, n, 0, q-2)
	1//6*ss6-1//6*ss7-1//6*ss8-1//6*ss9+1//3*ss10
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	ss7=nesum(tt, n, 0, q^2-2)
	tt1=eesubs(tt, [n], [(q+1)*n])
	ss8=nesum(tt1, n, 0, q-2)
	tt1=ss7-ss8
	ss9=nesum(tt1, m, 0, q-2)
	1//2*ss9
end,
function (tt::Union{GenericCyclo, GenericCycloFrac})
	ss8=nesum(tt, n, 0, q^3-2)
	tt1=eesubs(tt, [n], [(q^2+q+1)*n])
	ss9=nesum(tt1, n, 0, q-2)
	1//3*ss8-1//3*ss9
end
]

classparams=[
Parameters([Parameter(a, q-1)]),
Parameters([Parameter(a, q-1)]),
Parameters([Parameter(a, q-1)]),
Parameters([Parameter(a, q-1), Parameter(b, q-1)], [((a-b)*1//(q-1))]),
Parameters([Parameter(a, q-1), Parameter(b, q-1)], [((a-b)*1//(q-1))]),
Parameters([Parameter(a, q-1), Parameter(b, q-1), Parameter(c, q-1)], [((a-b)*1//(q-1)), ((a-c)*1//(q-1)), ((b-c)*1//(q-1))]),
Parameters([Parameter(a, q-1), Parameter(b, q^2-1)], [((b)*1//(q+1))]),
Parameters([Parameter(a, q^3-1)], [((a)*1//(q^2+q+1))])
]

charparams=[
Parameters([Parameter(n, q-1)]),
Parameters([Parameter(n, q-1)]),
Parameters([Parameter(n, q-1)]),
Parameters([Parameter(n, q-1), Parameter(m, q-1)], [((n-m)*1//(q-1))]),
Parameters([Parameter(n, q-1), Parameter(m, q-1)], [((n-m)*1//(q-1))]),
Parameters([Parameter(n, q-1), Parameter(m, q-1), Parameter(l, q-1)], [((n-m)*1//(q-1)), ((n-l)*1//(q-1)), ((m-l)*1//(q-1))]),
Parameters([Parameter(m, q-1), Parameter(n, q^2-1)], [((n)*1//(q+1))]),
Parameters([Parameter(n, q^3-1)], [((n)*1//(q^2+q+1))])
]

classparamindex=var_index.([a,b,c])
charparamindex=var_index.([l,m,n])


information = raw"""- Information about the generic character table of $GL_3(q)$.

- CHEVIE-name of the table: ``GL3``

- The table was first computed in:
  {\sc R.~Steinberg}, The representations of $GL(3,q)$, $GL(4,q)$, $PGL(3,q)$
  and $PGL(4,q)$, {\em Can.\ J.~Math.} {\bf 3} (1951), 225--235.

- See also:
  {\sc J.~A.~Green}, The characters of the finite general linear groups,
  {\em Trans.\ Amer.\ Math.\ Soc.} {\bf 80} (1955), 402--447.
"""

TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,S,information,splitext(basename(@__FILE__))[1])

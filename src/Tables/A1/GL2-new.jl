using ..GenericCharacterTables
import ..GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ParameterSubstitution, ExtendableMatrix, CharTable
using Oscar
using JSON
path=@__DIR__
R, q = PolynomialRing(QQ, "q")
Q = FractionField(R)
S = UniversalPolynomialRing(Q, cached=false)
i,j,l,k, _...=gens(S, ["i", "j", "l", "k", "i1", "j1", "l1", "k1", "i2", "j2", "l2", "k2", "i3", "j3", "l3", "k3", "it1", "jt1", "lt1", "kt1", "it2", "jt2", "lt2", "kt2"])

parsed = JSON.parsefile(path*"/GL2-new.json")
io = IOBuffer()
JSON.print(io, parsed["order"])
seekstart(io)
order = load(io,parent=R)

io = IOBuffer()
JSON.print(io, parsed["chardegree"])
seekstart(io)
chardegree = load(io,parent=R)

io = IOBuffer()
JSON.print(io, parsed["classlength"])
seekstart(io)
classlength = load(io,parent=R)


table = Cyclotomic{QQPolyRingElem}[[
	e2p((2*k*i)*S(1//(q-1))),
	e2p((2*k*i)*S(1//(q-1))),
	e2p((k*i+k*j)*S(1//(q-1))),
	e2p((k*i)*S(1//(q-1)))] [
	q*e2p((2*k*i)*S(1//(q-1))),
	(0)*e2p(S(0)),
	e2p((k*i+k*j)*S(1//(q-1))),
	-e2p((k*i)*S(1//(q-1)))] [
	(q+1)*e2p((l*i+k*i)*S(1//(q-1))),
	e2p((l*i+k*i)*S(1//(q-1))),
	e2p((l*i+k*j)*S(1//(q-1)))+e2p((k*i+l*j)*S(1//(q-1))),
	(0)*e2p(S(0))] [
	(q-1)*e2p((k*i)*S(1//(q-1))),
	-e2p((k*i)*S(1//(q-1))),
	(0)*e2p(S(0)),
	-e2p((k*i)*S(1//(q^2-1)))-e2p((k*i*q)*S(1//(q^2-1)))]]
classinfo = Vector{Any}[["",[1,0],["A_1",[1,1]]], ["",[1,1],["A_1",[2]]], ["",[2,0],["A_0",[1]]], ["",[3,0],["A_0",[1]]]]
charinfo = Vector{Any}[["",[1,0],["A_1",[2]]], ["",[1,1],["A_1",[1,1]]], ["",[2,0],["A_0",[1]]], ["",[3,0],["A_0",[1]]]]

classsums=[
function (tt::Cyclotomic)
	nesum(tt, i, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, i, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [j], [i])
	s2,e1=nesum(tt, j, 0, q-2, congruence)
	s1=s2-s1
	s2,e2=nesum(s1, i, 0, q-2, congruence)
	(1//2*s2, union(e1,e2))
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [i], [(q+1)*i])
	s1,e1=nesum(s1, i, 0, q-2, congruence)
	s2,e2=nesum(tt, i, 0, q^2-2, congruence)
	(1//2*s2-1//2*s1, union(e1,e2))
end
]

charsums=[
function (tt::Cyclotomic)
	nesum(tt, k, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	nesum(tt, k, 0, q-2, congruence)
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [l], [k])
	s2,e1=nesum(tt, l, 0, q-2, congruence)
	s1=s2-s1
	s2,e2=nesum(s1, k, 0, q-2, congruence)
	(1//2*s2, union(e1,e2))
end,
function (tt::Cyclotomic)
	s1=eesubs(tt, [k], [(q+1)*k])
	s1,e1=nesum(s1, k, 0, q-2, congruence)
	s2,e2=nesum(tt, k, 0, q^2-2, congruence)
	(1//2*s2-1//2*s1, union(e1,e2))
end
]

classparams=[
Parameters([Parameter(i, q-1)], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(i, q-1)], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(i, q-1), Parameter(j, q-1)], [ParameterException((i-j)*1//(q-1))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(i, q^2-1)], [ParameterException((i)*1//(q+1))], ParameterSubstitution{QQPolyRingElem}[])
]

charparams=[
Parameters([Parameter(k, q-1)], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(k, q-1)], ParameterException{QQPolyRingElem}[], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(k, q-1), Parameter(l, q-1)], [ParameterException((k-l)*1//(q-1))], ParameterSubstitution{QQPolyRingElem}[]),
Parameters([Parameter(k, q^2-1)], [ParameterException((k)*1//(q+1))], ParameterSubstitution{QQPolyRingElem}[])
]

classparamindex=var_index.([i,j])
charparamindex=var_index.([l,k])
congruence=nothing

information = join(parsed["information"],"\n")

TABLE=CharTable(order,ExtendableMatrix(permutedims(table)),classinfo,classlength,charinfo,chardegree,
	classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)

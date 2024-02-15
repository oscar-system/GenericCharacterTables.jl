using GenericCharacterTables
using GenericCharacterTables.Oscar
using Test

include("Aqua.jl")

@testset "Cyclotomic" begin
	R, q = polynomial_ring(QQ, "q")
	Q = fraction_field(R)
	S = UniversalPolynomialRing(Q)
	i, j = gens(S, ["i", "j"])

	a=e2p(1//(q-1)*i+2//(q-1)*j+q^2//(q+1)*i)
	b=e2p(2*q//(q^2-1)*i+2//(q-1)*j)
	@test a==b

	c=e2p(1//q*j)
	@test (a+c)==(c+a)
	@test iszero(-c+c)

	@test a-1+e2p(S(0))==a
	@test a*1==a
	@test 2*a-a==a
	@test 2*a+a==3*a

	@test isone(a//a)
	@test isone((a//c)*(c//a))
end

@testset "Shifts" begin
	g=genchartab("GL2")
	a=GenericCharacterTables.shift_class_parameters(g, g.table[1,1], 1)
	q,(i,j,l,k)=params(g)
	@test a==eesubs(a,[i],[0])
end

@testset "Congruence" begin
	g=genchartab("SL3.1")
	q,(a,b,m,n)=params(g)
	a=e2p((q-1)//3*a)
	@test isone(GenericCharacterTables.simplify(a, g))
end

@testset "Import green functions" begin
	list=greenfuntab()
	for green in list
		g=greenfuntab(green)
		@test g!=nothing
	end
end

@testset "Import tables" begin
	list=genchartab()
	for table in list
		g=genchartab(table)
		@test g!=nothing
	end
end

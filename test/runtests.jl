using GenericCharacterTables
using GenericCharacterTables.Oscar
using Test

include("Aqua.jl")

@testset "Cyclotomic" begin
	R, q = polynomial_ring(QQ, "q")
	Q = fraction_field(R)
	S = universal_polynomial_ring(Q)
	i, j = gens(S, ["i", "j"])

	a=CycloSum(R(1), 1//(q-1)*i+2//(q-1)*j+q^2//(q+1)*i)
	b=CycloSum(R(1), 2*q//(q^2-1)*i+2//(q-1)*j)
	@test a==b

	c=CycloSum(R(1), 1//q*j)
	@test (a+c)==(c+a)
	@test iszero(-c+c)

	@test a-1+CycloSum(R(1), S(0))==a
	@test a*1==a
	@test 2*a-a==a
	@test 2*a+a==3*a

	@test isone(a//a)
	@test isone((a//c)*(c//a))

	d=CycloSum(R(1), 1//(q-1)*i)
	@test nesum(a, i, 1, q-1)-eesubs(a, [1], [1])==nesum(a, i, 2, q-1)
end

@testset "Shifts" begin
	g=genchartab("GL2")
	a=GenericCharacterTables.shift_class_parameters(g, g[1,1], 1)
	q,(i,j,l,k)=params(g)
	@test a==eesubs(a,[i],[0])
end

@testset "Congruence" begin
	g=genchartab("SL3.1")
	q,(a,b,m,n)=params(g)
	a=CycloSum(g.modulusring(1), (q-1)//3*a)
	@test isone(GenericCharacterTables.simplify(a, g))
end

@testset "setcongruence(table)" begin
	g=genchartab("SL3.n1")
	h=tensor!(g,2,2)
	@test iszero(scalar_product(g,6,h), ignore_exceptions=true)
	q,(a,b,m,n)=params(g)
	x=param(g,"x")
	g2=setcongruence(g, (0,2))
	speccharparam!(g2, 6, n, -m+(q-1)*x)
	@test isone(scalar_product(g2,6,h))
end

@testset "Import green functions" begin
	list=greenfuntab()
	for green in list
		g=greenfuntab(green)
		@test g!=nothing
		@test g.importname==green
	end
end

@testset "Import tables" begin
	list=genchartab()
	for table in list
		g=genchartab(table)
		@test g!=nothing
		@test g.importname==table
	end
end

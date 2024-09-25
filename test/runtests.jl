using GenericCharacterTables
using GenericCharacterTables.Oscar
using Test
include(joinpath(pathof(GenericCharacterTables.Oscar.AbstractAlgebra), "..", "..", "test", "Rings-conformance-tests.jl"))

include("Aqua.jl")

R = universal_polynomial_ring(QQ)
q,i,j = gens(R, ["q", "i", "j"])
S = generic_cyclotomic_ring(R)

function test_elem(R::GenericCharacterTables.GenericCycloRing)
	return rand(R, -999:999)
end

test_Ring_interface(S)

@testset "GenericCyclo" begin
	R = universal_polynomial_ring(QQ)
	q, i, j = gens(R, [:q, :i, :j])
	S = generic_cyclotomic_ring(R)

	a=S(Dict(1//(q-1)*i+2//(q-1)*j+q^2//(q+1)*i => R(1)))
	b=S(Dict(2*q//(q^2-1)*i+2//(q-1)*j => R(1)))
	@test a==b

	c=S(Dict(1//q*j => R(1)))
	@test (a+c)==(c+a)
	@test iszero(-c+c)

	@test a-1+S(Dict(0//R(1) => R(1)))==a
	@test a*1==a
	@test 2*a-a==a
	@test 2*a+a==3*a

	@test isone(a//a)
	@test isone((a//c)*inv(a//c))

	d=S(Dict(1//R(3) => R(-1)))
	@test isone(d+conj(d))

	e=evaluate(a, [1, 2], [2, 6//5])
	f=S(Dict(1//R(5) => R(1)))^3
	@test e==f

	g=evaluate(a//f, [1, 2], [2, 6//5])
	@test isone(g)

	@test iszero(S(0)//S(2))
	@test iszero(zero(S(1)//S(1)))
	@test isone(one(S(0)//S(1)))
	@test iszero(1//S(1)-1)
	@test iszero(1-S(1)//1)
	@test 1//(S(1)//S(1)) == (S(1)//S(1))//1
	@test isone((S(1)//S(2))//(S(1)//S(2)))
	@test iszero((S(1)//S(2))-(S(1)//S(2)))
	@test isone((S(1)//S(2))+(S(1)//S(2)))
	@test (S(1)//S(3))+(S(1)//S(6)) == 1//2
	@test 1//3+1//6 == S(1)//S(2)
	@test isone((S(1)//S(2))*2)

	@test conj(a//c) == conj(a)//conj(c)
end

@testset "Shifts" begin
	g=genchartab("GL2")
	a=GenericCharacterTables.shift_class_parameters(g, g[1,1], 1)
	q,(i,j,l,k)=params(g)
	@test a==evaluate(a,[i],[0])
end

@testset "Congruence" begin
	g=genchartab("SL3.1")
	q,(a,b,m,n)=params(g)
	R=parent(q)
	S=g.ring
	@test isone(S(Dict(a*(q-1)//R(3) => R(1))))
end

@testset "setcongruence(table)" begin
	g=genchartab("SL3.n1")
	h=tensor_product(g[2],g[2])
	@test iszero(scalar_product(g[6],h), ignore_exceptions=true)
	q,(a,b,m,n)=params(g)
	x=param(g,"x")
	g2=setcongruence(g; remainder=0, modulus=2)
	j=specialize(g2[6], n, -m+(q-1)*x)
	@test isone(scalar_product(j,g2(h)))

	g3=setcongruence(g2; remainder=2, modulus=3)
	S=g3.ring
	@test isone(S(1, exponent=(q-2)//6))
end

@testset "Import green functions" begin
	list=greenfuntab()
	for green in list
		g=greenfuntab(green)
		@test g!=nothing
		@test g.importname==green
	end
end

@testset "Import tables with consistency checks" begin
	for table in genchartab()
		g=genchartab(table)
		@test g!=nothing
		@test g.importname==table

		# workaround issue #117
		startswith(table, "2F4") && continue
		startswith(table, "Ree") && continue

		# skip tables containing only unipotent character types
		startswith(table, "uni") && continue

		@test order(g) == sum(number_of_characters(c)*degree(c)^2 for c in g)
	end
end

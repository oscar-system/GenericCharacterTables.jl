using GenericCharacterTables
using GenericCharacterTables.Oscar
using Test
include(
  joinpath(
    pathof(GenericCharacterTables.Oscar.AbstractAlgebra),
    "..",
    "..",
    "test",
    "Rings-conformance-tests.jl",
  ),
)

include("Aqua.jl")

R = universal_polynomial_ring(QQ)
q, i, j = gens(R, ["q", "i", "j"])
S = generic_cyclotomic_ring(R)

function test_elem(R::GenericCharacterTables.GenericCycloRing)
  return rand(R, -999:999)
end

test_Ring_interface(S)

@testset "GenericCyclo" begin
  R = universal_polynomial_ring(QQ)
  q, i, j = gens(R, [:q, :i, :j])
  S = generic_cyclotomic_ring(R)
  S1 = generic_cyclotomic_ring(R)

  a = S(Dict(1//(q - 1) * i + 2//(q - 1) * j + q^2//(q + 1) * i => R(1)))
  b = S(Dict(2 * q//(q^2 - 1) * i + 2//(q - 1) * j => R(1)))
  @test a == b

  b1 = S1(Dict(2 * q//(q^2 - 1) * i + 2//(q - 1) * j => R(1)))
  @test b != b1

  c = S(Dict(1//q * j => R(1)))
  @test (a + c) == (c + a)
  @test iszero(-c + c)

  @test a - 1 + S(Dict(0//R(1) => R(1))) == a
  @test a * 1 == a
  @test 2 * a - a == a
  @test 2 * a + a == 3 * a

  @test isone(a//a)
  @test isone((a//c) * inv(a//c))

  d = S(Dict(1//R(3) => R(-1)))
  @test isone(d + conj(d))

  e = evaluate(a, [1, 2], [2, 6//5])
  f = S(Dict(1//R(5) => R(1)))^3
  @test e == f

  g = evaluate(a//f, [1, 2], [2, 6//5])
  @test isone(g)

  @test iszero(S(0)//S(2))
  @test iszero(zero(S(1)//S(1)))
  @test isone(one(S(0)//S(1)))
  @test iszero(1//S(1) - 1)
  @test iszero(1 - S(1)//1)
  @test 1//(S(1)//S(1)) == (S(1)//S(1))//1
  @test isone((S(1)//S(2))//(S(1)//S(2)))
  @test iszero((S(1)//S(2)) - (S(1)//S(2)))
  @test isone((S(1)//S(2)) + (S(1)//S(2)))
  @test (S(1)//S(3)) + (S(1)//S(6)) == 1//2
  @test 1//3 + 1//6 == S(1)//S(2)
  @test isone((S(1)//S(2)) * 2)

  @test conj(a//c) == conj(a)//conj(c)

  x = deepcopy(a)
  y = deepcopy(b)
  ab = a + b
  @test add!(y, a, y) == ab
  @test y == ab
  @test a == x

  add!(a, a, a)
  @test a == 2 * x

  y = deepcopy(b)
  z = deepcopy(c)
  cb = c + b
  add!(a, c, b)
  @test a == cb
  @test b == y
  @test c == z

  a = S(1; exponent=(2 * i * j) * 1//R((q - 1)))
  @test isone(a^(q-1))
  @test a == a^q
end

@testset "Shifts" begin
  g = generic_character_table("GL2")
  a = GenericCharacterTables.shift_class_parameters(g, g[1, 1], 1)
  q, (i, j, l, k) = parameters(g)
  @test a == evaluate(a, [i], [0])
end

@testset "Congruence" begin
  g = generic_character_table("SL3.1")
  q, (a, b, m, n) = parameters(g)
  R = parent(q)
  S = g.ring
  @test isone(S(Dict(a * (q - 1)//R(3) => R(1))))
end

@testset "set_congruence(table)" begin
  g = generic_character_table("SL3.n1")
  h = tensor_product(g[2], g[2])
  @test iszero(scalar_product(g[6], h), ignore_exceptions=true)
  q, (a, b, m, n) = parameters(g)
  x = parameter(g, "x")
  g2 = set_congruence(g; remainder=0, modulus=2)
  j = specialize(g2[6], n, -m + (q - 1) * x)
  @test isone(scalar_product(j, g2(h)))

  g3 = set_congruence(g2; remainder=2, modulus=3)
  S = g3.ring
  @test isone(S(1; exponent=(q - 2)//6))
end

@testset "linear_combination" begin
  g = generic_character_table("GL2")
  h = linear_combination([1, 1], [g[1], g[1]])
  @test_throws ErrorException("Characters are not all irreducible.") linear_combination(
    [1, 1], [h, g[1]]
  )

  g = generic_character_table("uniGL2")
  h = linear_combination([1, 1], [g[1], g[1]])
  @test_throws ErrorException("Characters are not all irreducible.") linear_combination(
    [1, 1], [h, g[1]]
  )
end

@testset "Import green functions" begin
  list = green_function_table()
  for green in list
    g = green_function_table(green)
    @test g != nothing
    @test g.importname == green
  end
end

@testset "Import tables with consistency checks" begin
  for table in generic_character_table()
    g = generic_character_table(table)
    @test g != nothing
    @test g.importname == table

    # workaround issue #117
    startswith(table, "2F4") && continue
    startswith(table, "Ree") && continue

    # skip tables containing only unipotent character types
    startswith(table, "uni") && continue

    # Workaround that may be needed in Julia >= 1.12. Can be removed
    # when we manage to remove the need for `eval` when loading tables.
    Base.invokelatest() do
      @test order(g) == sum(number_of_characters(c) * degree(c)^2 for c in g)
    end
  end
end

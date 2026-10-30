using GenericCharacterTables
using GenericCharacterTables.Oscar
using Test

include("Aqua.jl")
include("CentralQuotient.jl")

@testset "Conformance tests" begin
  S, E, q = generic_cyclotomic_ring()
  i, j = params(S, [:i, :j])
  ConformanceTests.test_Ring_interface(S)
end

@testset "GenericCyclo" begin
  S, E, q = generic_cyclotomic_ring()
  i, j = params(S, [:i, :j])
  R = base_ring(S)

  a = S(Dict(1//(q - 1) * i + 2//(q - 1) * j + q^2//(q + 1) * i => R(1)))
  b = S(Dict(2 * q//(q^2 - 1) * i + 2//(q - 1) * j => R(1)))
  @test a == b

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

  @test E(1)^(1//2) == E(2)
  @test E(2)^(1//3) == E(6)
  @test E(3)^(1//2) == E(6)
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

@testset "PSL3.1 type 11" begin
  g = generic_character_table("PSL3.1")
  q, (a, b, m, n) = parameters(g)
  M = (q^2 + q + 1) * 1//3

  # the character sum runs over n mod M
  @test only(parameters(g[11])).modulus == M

  # the sums omit n ∈ Mℤ and a ∈ Mℤ
  @test collect(parameters(g[11]).exceptions) == [n//M]
  @test collect(parameters(g[:, 11]).exceptions) == [a//M]
end

@testset "SL3.1 and PSL3.1 type 10 on the mixed torus" begin
  # The generic scalar products of types 4 and 5 with type 10 list
  # 2n1 + n2 ∈ (q - 1)ℤ (6n1 + 3n2 in PSL3.1) as an exception; check that case.
  for (table, d) in [("SL3.1", 1), ("PSL3.1", 3)]
    g = generic_character_table(table)
    q, (a, b, m, n) = parameters(g)
    x = parameter(g, "x")
    y = parameter(g, "y")
    ψ = specialize(g[10], n, -2 * x + (q - 1) * 1//d * y)
    Base.invokelatest() do
      for t in (4, 5)
        @test iszero(scalar_product(specialize(g[t], n, x), ψ); ignore_exceptions=true)
      end
    end
  end
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

@testset "GU2 type 3 with eigenvalue 1" begin
  g = generic_character_table("GU2")
  q, (k, l, u, v) = parameters(g)
  l1 = parameter(g, "l1")
  @test isone(norm(specialize(g[3], u, zero(q))))

  # diag(ζ, ζ^l1) is conjugate to diag(1, ζ) for l1 ∈ (q + 1)ℤ
  c = conjugacy_class_type(g, 3)
  sp = scalar_product(specialize(c, k, 1), specialize(specialize(c, k, 0), l, 1))
  @test l1//(q + 1) in sp.exceptions
end

@testset "PSL2 involutions" begin
  # The characters of degree (q^2 ± 1)/2 on the involutions (class type 6),
  # by q^2 mod 8. CTblLib: A6 = L2(9), A5 = L2(5), L2(11), L2(7).
  for (table, remainder, value) in
      [("PSL2.1", 1, 1), ("PSL2.1", 5, -1), ("PSL2.3", 3, 1), ("PSL2.3", 7, -1)]
    g = set_congruence(generic_character_table(table); remainder, modulus=8)
    @test g[3, 6] == value
    @test g[4, 6] == value

    Base.invokelatest() do
      for a in 1:length(g), b in (a + 1):length(g)
        @test iszero(scalar_product(g[a], g[b]); ignore_exceptions=true)
      end
      n = number_of_conjugacy_class_types(g)
      for a in 1:n, b in (a + 1):n
        @test iszero(scalar_product(g[:, a], g[:, b]); ignore_exceptions=true)
      end
    end
  end
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

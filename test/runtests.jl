using GenericCharacterTables
using GenericCharacterTables.Oscar
using Test

include("Aqua.jl")

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

@testset "2A2 types of the torus of order (q + 1)^2" begin
  # Class type (a, b) is diag(ζ^a, ζ^b, ζ^(-a-b)) with ζ of order q + 1; it
  # is excluded exactly when two eigenvalues agree.
  for (name, i) in [("SU3.2", 8), ("SU3.n2", 6), ("PSU3.2", 9)]
    g = generic_character_table(name)
    q, (a, b) = parameters(g)
    e = parameters(conjugacy_class_type(g, i)).exceptions
    excludes(x, y) =
      try
        evaluate(e, var_index.([a, b]), parent(q).([x, y]))
        false
      catch err
        err isa ArgumentError || rethrow()
        true
      end
    @test !excludes(0, 1)
    @test excludes(1, 1)
    @test excludes(1, -2)
    @test excludes(-2, 1)
  end

  g = generic_character_table("SU3.2")
  q, (a, b) = parameters(g)
  b1 = parameter(g, "b1")
  c = conjugacy_class_type(g, 8)
  # (1, b1) and (0, 1) are conjugate for b1 ∈ (q + 1)ℤ
  sp = scalar_product(specialize(c, a, 1), specialize(specialize(c, a, 0), b, 1))
  @test b1//(q + 1) in sp.exceptions

  # character type (m, n) is reducible for m or n in (q + 1)ℤ
  g = generic_character_table("SU3.n2")
  q, (a, b, m, n) = parameters(g)
  @test_throws ArgumentError specialize(g[6], m, zero(q))
  @test_throws ArgumentError specialize(g[6], n, zero(q))
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

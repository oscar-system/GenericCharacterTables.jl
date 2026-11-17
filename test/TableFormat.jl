# The TOML tables against the Julia tables they were converted from. Every
# field has to agree exactly, including the order of the terms of each value,
# which shows when a value is printed.

import GenericCharacterTables:
  loadtab, load_table_data, ExprReader, read_poly, read_fraction, read_value

const TABLE_DIR = joinpath(pkgdir(GenericCharacterTables), "data", "Tables")

raw_fraction(e) = (string(numerator(e, false)), string(denominator(e, false)))
raw_terms(x) = [(raw_fraction(k)..., string(c)) for (k, c) in x.f]
raw_parameters(p) = (
  [(string(x.var), string(x.modulus)) for x in p.params],
  raw_fraction.(p.exceptions.exceptions),
)

# The tables live in different rings, so their parts are compared as strings.
# `repr` of an info includes the element types of its vectors.
function table_differences(a, b)
  d = String[]
  check(what, x, y) = x == y || push!(d, "$what: $(repr(x)) != $(repr(y))")
  check("order", string(a.order), string(b.order))
  variables(t) = string.(symbols(base_ring(t.ring)))
  check("variables", variables(a), variables(b))
  check("congruence", a.ring.congruence, b.ring.congruence)
  check("power", a.ring.power, b.ring.power)
  check("importname", a.importname, b.importname)
  check("information", a.information, b.information)
  check("classparamindex", a.classparamindex, b.classparamindex)
  check("charparamindex", a.charparamindex, b.charparamindex)
  check("class types", length(a.classlength), length(b.classlength))
  check("character types", length(a.chars), length(b.chars))
  check("classinfo type", typeof(a.classinfo), typeof(b.classinfo))
  for j in eachindex(a.classlength)
    check("classinfo $j", repr(a.classinfo[j]), repr(b.classinfo[j]))
    check("classlength $j", string(a.classlength[j]), string(b.classlength[j]))
    check("classparams $j", raw_parameters.((a.classparams[j], b.classparams[j]))...)
  end
  for (i, (x, y)) in enumerate(zip(a.chars, b.chars))
    check("charinfo $i", repr(x.info), repr(y.info))
    check("degree $i", string(x.degree), string(y.degree))
    check("charparams $i", raw_parameters(x.params), raw_parameters(y.params))
    check("substitutions $i", x.substitutions, y.substitutions)
    for j in eachindex(x.values)
      check("value $i, $j", raw_terms(x.values[j]), raw_terms(y.values[j]))
    end
  end
  return d
end

@testset "Table data format" begin
  @testset "Expressions" begin
    S, E, q = generic_cyclotomic_ring()
    R = base_ring(S)
    i = param(S, :i)
    r = ExprReader(R, Dict("q" => q, "i" => i))

    @test read_poly(r, "1//2*q^2 - (q - 1) * (q + 1)") == 1//2 * q^2 - (q - 1) * (q + 1)
    @test read_value(r, S, "q^2 + 1 - q*E(4)^(i) + E(3)") == q^2 + 1 - q * E(4)^i + E(3)
    @test iszero(read_value(r, S, "0"))

    # fractions are not cancelled
    @test raw_fraction(read_fraction(r, "(2*i)//(2*q - 2)")) == ("2*i", "2*q - 2")
    @test raw_terms(read_value(r, S, "E(2*q - 2)^(2*i)")) == [("2*i", "2*q - 2", "1")]

    @test_throws ErrorException read_value(r, S, "j*E(4)")
    @test_throws ErrorException read_poly(r, "q +")
  end

  # name => (character types to check norms of, pairs to check scalar products of)
  for (dir, name, chars, pairs) in [
    ("A1", "GL2", 1:4, [(i, k) for i in 1:4 for k in 1:4 if i < k]),
    ("C3", "CSp6.1", [1, 13, 40, 100], [(1, 2), (40, 41)]),
    ("A4", "GL5", [1, 8, 36], [(1, 2)]),
  ]
    @testset "$name" begin
      t = load_table_data(joinpath(TABLE_DIR, dir, name * ".toml"))
      @test order(t) == sum(number_of_characters(c) * degree(c)^2 for c in t)
      @test all(norm(t[i]) == 1 for i in chars)
      # `iszero` is false for a zero with exceptions
      @test all(scalar_product(t[i], t[k]) == 0 for (i, k) in pairs)

      jl = joinpath(TABLE_DIR, dir, name * ".jl")
      isfile(jl) || continue
      s = loadtab(jl)
      @test table_differences(s, t) == String[]
      Base.invokelatest() do
        @test [string(norm(s[i])) for i in chars] == [string(norm(t[i])) for i in chars]
      end
    end
  end
end

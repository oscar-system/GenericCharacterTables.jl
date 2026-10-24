using GenericCharacterTables
import GenericCharacterTables:
  CharTable, GenericCyclo, GenericCycloFrac, UPoly, UPolyFrac, ParameterExceptions,
  classsum, charsum, exceptions, shift_class_parameters, shift_char_parameters
using GenericCharacterTables.Oscar
import GenericCharacterTables.Oscar.AbstractAlgebra: exponent_vectors
using Test

# Map the elements of the ring of the stored table `s` to the ring of the derived
# table `d`, by variable name.
struct RingMap
  vals::Vector{UPoly}
  d::CharTable
end

function RingMap(s::CharTable, d::CharTable; rename=Dict{Symbol,Symbol}())
  B = base_ring(d.ring)
  return RingMap([gen(B, get(rename, x, x)) for x in symbols(base_ring(s.ring))], d)
end

(f::RingMap)(x::UPoly) = base_ring(f.d.ring)(evaluate(x, f.vals))
(f::RingMap)(x::UPolyFrac) = f(numerator(x, false))//f(denominator(x, false))
(f::RingMap)(x::GenericCyclo) =
  f.d.ring(Dict{UPolyFrac,UPoly}(f(k) => f(v) for (k, v) in x.f))
(f::RingMap)(x::GenericCycloFrac) = GenericCycloFrac(
  f(x.numerator), f(x.denominator), ParameterExceptions(f.(x.exceptions.exceptions)))

# exceptions are normalised up to a sign, which depends on the variable order
same_exceptions(x, y) =
  length(x) == length(y) && all(e -> any(f -> e == f || e == -f, y), x)

# Numerical evaluation at `vals`, one value per variable of the base ring.
function numeric(x::UPoly, vals::Vector{BigFloat})
  s = big(0.0)
  for (c, e) in zip(coefficients(x), exponent_vectors(x))
    s +=
      BigFloat(Rational{BigInt}(c)) *
      prod(vals[k]^e[k] for k in eachindex(e); init=big(1.0))
  end
  return s
end
numeric(x::UPolyFrac, vals) =
  numeric(numerator(x, false), vals) / numeric(denominator(x, false), vals)
numeric(x::GenericCyclo, vals) =
  sum(
    (numeric(c, vals) * cispi(2 * numeric(e, vals)) for (e, c) in x.f);
    init=Complex(big(0.0)),
  )
numeric(x::GenericCycloFrac, vals) =
  numeric(x.numerator, vals) / numeric(x.denominator, vals)

is_integral(x::BigFloat) = abs(x - round(x)) < 1e-30
excluded(x::GenericCyclo, vals) = false
excluded(x::GenericCycloFrac, vals) = any(e -> is_integral(numeric(e, vals)), x.exceptions)

# Field sizes satisfying the congruence of `t`, and the corresponding values of `q`.
function sample_q(t::CharTable)
  r, m = something(t.ring.congruence, ZZ.((0, 1)))
  sizes = filter(
    Q -> mod(Q - r, m) == 0,
    [5, 7, 8, 9, 11, 13, 16, 17, 19, 23, 25, 27, 29, 31, 32, 37, 49],
  )
  return [BigFloat(Q)^(1 // t.ring.power) for Q in sizes]
end

@doc raw"""
    agree_numerically(t, x, y; samples)

Return whether `x` and `y`, generic cyclotomics of `t` possibly with exceptions,
agree at all sampled points where neither has an exception.
"""
function agree_numerically(t::CharTable, x, y; samples=3)
  n = nvars(base_ring(t.ring))
  for q in sample_q(t), k in 1:samples
    # deterministic parameter values in -50:50
    vals = [q; BigFloat.(mod.(37 .* (1:(n - 1)) .+ 11 * k, 101) .- 50)]
    (excluded(x, vals) || excluded(y, vals)) && continue
    a, b = numeric(x, vals), numeric(y, vals)
    abs(a - b) < 1e-20 * (1 + abs(a)) || return false
  end
  return true
end

# Whether the exceptions `x` and `y` of a type with parameters `params` exclude
# the same parameter values.
function same_excluded(t::CharTable, params, x, y; limit=20000)
  n = nvars(base_ring(t.ring))
  for q in sample_q(t)
    vals = [q; zeros(BigFloat, n - 1)]
    ranges = [0:(Int(round(numeric(p.modulus, vals))) - 1) for p in params]
    prod(length, ranges; init=1) > limit && continue
    for point in Iterators.product(ranges...)
      for (p, v) in zip(params, point)
        vals[var_index(p.var)] = v
      end
      any(e -> is_integral(numeric(e, vals)), x) ==
      any(e -> is_integral(numeric(e, vals)), y) ||
        return false
    end
  end
  return true
end

# `x` with the class (or character) parameters shifted to the `k`-th batch
shift_classes(t, x, k) = shift_class_parameters(t, x, k)
shift_chars(t, x, k) = shift_char_parameters(t, x, k)

@doc raw"""
    compare_tables(d, s; rename, charsums)

Compare the derived table `d` with the stored table `s`. Return the differences,
and the notes: entries that differ symbolically but agree numerically, where neither
side has an exception.

The character sums are compared on products of two values if `charsums` is
`:products`, on single values if it is `:values`, and only on `1` otherwise.
"""
function compare_tables(d::CharTable, s::CharTable; rename=Dict{Symbol,Symbol}(),
  charsums::Symbol=:products)
  f = RingMap(s, d; rename)
  diffs, notes = String[], String[]

  function compare(what, x, y)
    x == y && return nothing
    push!(agree_numerically(d, x, y) ? notes : diffs, what)
  end
  function compare_exceptions(what, params, x, y)
    same_exceptions(x, y) && return nothing
    push!(same_excluded(d, params, x, y) ? notes : diffs, what)
  end

  f(order(s)) == order(d) || push!(diffs, "order")
  length(d) == length(s) || return push!(diffs, "number of character types"), notes
  number_of_conjugacy_class_types(d) == number_of_conjugacy_class_types(s) ||
    return push!(diffs, "number of class types"), notes
  nchars, nclasses = length(d), number_of_conjugacy_class_types(d)

  for i in 1:nchars
    f(degree(s[i])) == degree(d[i]) || push!(diffs, "degree of character $i")
    ps, pd = parameters(s[i]), parameters(d[i])
    [(f(p.var), f(p.modulus)) for p in ps] == [(p.var, p.modulus) for p in pd] ||
      push!(diffs, "parameters of character $i")
    compare_exceptions("exceptions of character $i", pd.params,
      f.(exceptions(ps).exceptions), exceptions(pd).exceptions)
  end
  for j in 1:nclasses
    f(s.classlength[j]) == d.classlength[j] || push!(diffs, "length of class $j")
    ps, pd = s.classparams[j], d.classparams[j]
    [(f(p.var), f(p.modulus)) for p in ps] == [(p.var, p.modulus) for p in pd] ||
      push!(diffs, "parameters of class $j")
    compare_exceptions("exceptions of class $j", pd.params,
      f.(exceptions(ps).exceptions), exceptions(pd).exceptions)
  end
  for i in 1:nchars, j in 1:nclasses
    compare("value of character $i on class $j", f(s[i, j]), d[i, j])
  end

  # The sums, on the products of values the scalar products need.
  for i in 1:nchars
    compare("number of characters of type $i",
      f(number_of_characters(s[i])), number_of_characters(d[i]))
    if charsums == :products
      for j in 1:nclasses, k in j:nclasses
        xs = shift_classes(s, s[i, j], 1) * conj(shift_classes(s, s[i, k], 2))
        xd = shift_classes(d, d[i, j], 1) * conj(shift_classes(d, d[i, k], 2))
        compare("character sum of type $i on classes $j, $k",
          f(charsum(s[i], xs)), charsum(d[i], xd))
      end
    elseif charsums == :values
      for j in 1:nclasses
        compare("character sum of type $i on class $j",
          f(charsum(s[i], shift_classes(s, s[i, j], 1))),
          charsum(d[i], shift_classes(d, d[i, j], 1)))
      end
    end
  end
  for j in 1:nclasses
    compare("number of classes of type $j",
      f(number_of_conjugacy_classes(s, j)), number_of_conjugacy_classes(d, j))
    for i in 1:nchars, k in i:nchars
      xs = shift_chars(s, s[i, j], 1) * conj(shift_chars(s, s[k, j], 2))
      xd = shift_chars(d, d[i, j], 1) * conj(shift_chars(d, d[k, j], 2))
      compare("class sum of type $j on characters $i, $k",
        f(classsum(s, j, xs)), classsum(d, j, xd))
    end
  end
  return diffs, notes
end

# The orthogonality relations of `d` on its own.
function check_orthogonality(d::CharTable)
  @test order(d) == sum(number_of_characters(c) * degree(c)^2 for c in d)
  @test order(d) == sum(
    number_of_conjugacy_classes(d, j) * d.classlength[j]
    for j in 1:number_of_conjugacy_class_types(d)
  )
  @test number_of_characters(d) == number_of_conjugacy_classes(d)
  for (i, c) in enumerate(d)
    @test isone(norm(c))
    for c2 in d[(i + 1):end]
      @test iszero(scalar_product(c, c2); ignore_exceptions=true)
    end
  end
end

derived_table(name::String) = GenericCharacterTables.gentab(name, "Quotients")

@testset "Central quotients" begin
  # The stored PSL3.1 gives character type 11 the modulus (q^2+q-2)/3 instead of
  # (q^2+q+1)/3, and omits the exceptions its sums apply.
  psl3_defects = ["parameters of character 11", "exceptions of character 11",
    "exceptions of class 11"]

  # The character sums of PGL3.1 and PGU3.2 run through a filter whose geometric sums
  # do not cancel, which makes products of values too slow.
  @testset "$name" for (name, charsums, defects) in [
    ("PGL2.1", :products, String[]),
    ("PGL3.1", :values, String[]),
    ("PGU3.2", :values, String[]),
    ("PSL3.1", :products, psl3_defects),
    ("PSU3.2", :products, String[]),
  ]
    # the sums of freshly loaded tables are too new for code compiled before
    d, s = derived_table(name), generic_character_table(name)
    diffs, _ = Base.invokelatest(compare_tables, d, s; charsums)
    @test diffs == defects
    Base.invokelatest(check_orthogonality, d)
  end

  # SL2.1 labels the characters of degree (q ± 1)/2 by the value (±1 + √q i^((q-1)/2))/2
  # on the unipotent class, the stored PSL2 tables by a fixed square root, so they agree
  # only for q congruent to 1 and 3 modulo 8. The stored tables put the congruence on
  # √q rather than q, which breaks their values on the class with stabilizer of order 2.
  psl23_defects = [
    ["value of character $i on class 6" for i in 3:4];
    ["character sum of type $i on classes $j, 6" for i in (3, 4, 6) for j in (1, 2, 3, 5)];
    [
      "class sum of type $j on characters $i, $k" for j in 5:6
      for (i, k) in ((1, 3), (1, 4), (2, 3), (2, 4), (3, 6), (4, 6))
    ]
  ]
  @testset "$name" for (name, remainder, defects) in [
    ("PSL2.1", 1, String[]),
    ("PSL2.3", 3, psl23_defects),
  ]
    d, s = derived_table(name), generic_character_table(name)
    d8 = set_congruence(d; remainder, modulus=8)
    diffs, _ = Base.invokelatest(compare_tables, d8, s; rename=Dict(:q => :q0))
    @test sort(diffs) == sort(defects)
    Base.invokelatest(check_orthogonality, d)
  end

  # The characters of degree 3 of PSL2(5) = A5 and PSL2(7) are -1 on the involutions.
  @testset "PSL2 on involutions" begin
    for (name, Q) in [("PSL2.1", 5), ("PSL2.3", 7)]
      d = derived_table(name)
      vals = [sqrt(BigFloat(Q)); zeros(BigFloat, nvars(base_ring(d.ring)) - 1)]
      @test numeric(degree(d[3]), vals) ≈ 3
      @test numeric(d[3, 6], vals) ≈ -1
    end
  end
end

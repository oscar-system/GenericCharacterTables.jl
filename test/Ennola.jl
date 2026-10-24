# Compare `ennola_dual` of the tables of GL_n(q) with the stored tables of
# GU_n(q). The two use different rings, so values of the stored table are
# transported into the ring of the derived one, renaming its parameters.

using GenericCharacterTables: UPoly, UPolyFrac, GenericCyclo, GenericCycloFrac,
  CharTable, Parameters, classsum, charsum, ennola, lead_sign, ennola_dual,
  parameter_exceptions, var_index

transport(p::UPoly, vals) = parent(vals[1])(evaluate(p, vals))
transport(p::UPolyFrac, vals) = transport(numerator(p), vals)//transport(denominator(p), vals)

function transport(x::GenericCyclo, S, vals)
  f = Dict{UPolyFrac,UPoly}()
  for (e, c) in x.f
    e = transport(e, vals)
    f[e] = get(f, e, zero(vals[1])) + transport(c, vals)
  end
  return S(f)
end

transport(x::GenericCycloFrac, S, vals) = GenericCycloFrac(
  transport(x.numerator, S, vals), transport(x.denominator, S, vals), parameter_exceptions()
)

# The stored tables negate some parameters relative to `ennola_dual`: GU2 and
# GU3 the class parameters whose modulus changes sign under q -> -q, the tables
# by Lübeck all parameters whose modulus keeps its sign.
function parameter_sign(convention::Symbol, modulus::UPoly, is_class::Bool)
  flips = lead_sign(ennola(modulus)) < 0
  convention == :chevie && return is_class && flips ? -1 : 1
  convention == :luebeck && return flips ? 1 : -1
  error("unknown convention $convention")
end

# Pair the parameters of a stored type with those of the derived type, by
# modulus where the moduli are distinct: GU6 lists some Levi factors, and with them
# the parameters, in the opposite order.
function paired_parameters(s::Parameters, d::Parameters)
  ms = [string(p.modulus) for p in s.params]
  md = [string(p.modulus) for p in d.params]
  @assert sort(ms) == sort(md)
  order = allunique(ms) ? [findfirst(==(m), md) for m in ms] : eachindex(ms)
  return [(p.var, d.params[k].var, p.modulus) for (p, k) in zip(s.params, order)]
end

# Values for the variables of the stored table, as elements of the ring of
# the derived table, renaming the parameters of class type `c` and character
# type `chi`. Other variables keep their index.
function renaming(d::CharTable, s::CharTable, c::Int, chi::Int, perm, convention)
  R = base_ring(d.ring)
  vals = [gen(R, min(j, ngens(R))) for j in 1:ngens(base_ring(s.ring))]
  for (v, w, m) in paired_parameters(s.classparams[c], d.classparams[perm[c]])
    vals[var_index(v)] = parameter_sign(convention, m, true) * w
  end
  for (v, w, m) in paired_parameters(s[chi].params, d[perm[chi]].params)
    vals[var_index(v)] = parameter_sign(convention, m, false) * w
  end
  return vals
end

# `swap` maps stored type indices to derived ones; the Levi factors of the
# types in `reordered` are listed in the opposite order. `max_sums` is the
# largest n for which the sums of all entries are compared.
function compare_ennola_dual(g::CharTable, s::CharTable, n::Int, convention::Symbol;
  swap=Pair{Int,Int}[], reordered=1:0, max_sums=4)
  d = ennola_dual(g)
  nc = number_of_conjugacy_class_types(s)
  nchi = number_of_character_types(s)
  @test number_of_conjugacy_class_types(d) == nc
  @test number_of_character_types(d) == nchi
  perm = collect(1:max(nc, nchi))
  for (i, j) in swap
    perm[i] = j
  end

  R = base_ring(d.ring)
  qvals = [gen(R, min(j, ngens(R))) for j in 1:ngens(base_ring(s.ring))]
  @test order(d) == transport(order(s), qvals)
  @test order(d) == sum(number_of_characters(c) * degree(c)^2 for c in d)
  @test all(d.classlength[perm[c]] == transport(s.classlength[c], qvals) for c in 1:nc)
  @test all(degree(d[perm[chi]]) == transport(degree(s[chi]), qvals) for chi in 1:nchi)

  @test all(
    string(d.classinfo[perm[c]]) == string(s.classinfo[c]) for c in 1:nc if !(c in reordered)
  )
  # The infos of GL5 call the characters "almost character", those of GU5
  # "irreducible ".
  @test all(
    string(d[perm[chi]].info) == string(s[chi].info) for chi in 1:nchi if !(chi in reordered)
  ) broken = n == 5

  if n <= 5
    @test all(
      number_of_conjugacy_classes(d, perm[c]) ==
      transport(number_of_conjugacy_classes(s, c), d.ring, qvals) for c in 1:nc
    )
    @test all(
      number_of_characters(d[perm[chi]]) ==
      transport(number_of_characters(s[chi]), d.ring, qvals) for chi in 1:nchi
    )
  end

  for c in 1:nc, chi in 1:nchi
    vals = renaming(d, s, c, chi, perm, convention)
    x = d[perm[chi]][perm[c]]
    y = s[chi][c]
    @test x == transport(y, d.ring, vals)
    n <= max_sums || continue
    @test classsum(d, perm[c], x) == transport(classsum(s, c, y), d.ring, vals)
    @test charsum(d[perm[chi]], x) == transport(charsum(s[chi], y), d.ring, vals)
  end
end

@testset "Ennola duality" begin
  @testset "involution" begin
    g = generic_character_table("GL3")
    h = ennola_dual(ennola_dual(g))
    @test order(h) == order(g)
    @test all(h[chi][c] == g[chi][c] for chi in 1:8, c in 1:8)
    @test h.classsums == g.classsums
    @test h.classinfo == g.classinfo
  end

  available = generic_character_table()
  for (n, convention) in [(2, :chevie), (3, :chevie), (4, :luebeck), (5, :luebeck), (6, :luebeck)]
    gl, gu = "GL$n", "GU$n"
    gl in available && gu in available || continue
    @testset "$gl -> $gu" begin
      g = generic_character_table(gl)
      s = generic_character_table(gu)
      # GU6 orders the Levi factors of class types 65-68 the other way round,
      # which swaps 66 and 67.
      swap = n == 6 ? [66 => 67, 67 => 66] : Pair{Int,Int}[]
      reordered = n == 6 ? (65:68) : (1:0)
      Base.invokelatest(compare_ennola_dual, g, s, n, convention; swap, reordered)
    end
  end
end

# The almost characters are converted from Frank Lübeck's CHEVIE3 Maple table
# `sl4` (D4001) by extra/Convert/MapleTable.jl; `information` says how those
# that are not irreducible were decomposed.
using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q0 = generic_cyclotomic_ring(; congruence=ZZ.((1, 4)), variable=:q0, power=2)
R = base_ring(S)
q = q0^2
i1, i2, i3, k1, k2, k3, _... = params(
  S,
  [
    "i1",
    "i2",
    "i3",
    "k1",
    "k2",
    "k3",
    "i11",
    "i21",
    "i31",
    "k11",
    "k21",
    "k31",
    "i12",
    "i22",
    "i32",
    "k12",
    "k22",
    "k32",
    "i13",
    "i23",
    "i33",
    "k13",
    "k23",
    "k33",
    "i1t1",
    "i2t1",
    "i3t1",
    "k1t1",
    "k2t1",
    "k3t1",
    "i1t2",
    "i2t2",
    "i3t2",
    "k1t2",
    "k2t2",
    "k3t2",
  ],
)

order = q^6 * (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^3
chars = Vector{GenericCyclo}[]
push!(
  chars,
  GenericCyclo[
    S(q^6),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^3),
    S(0),
    S(0),
    S(q^2),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^2),
    S(0),
    S(0),
    S(q),
    S(0),
    S(-q),
    S(0),
    S(1),
    S(-1),
    S(1),
    S(1),
    S(-1),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(q^5 + q^4 + q^3),
    S(q^3),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^3 + q^2 + q),
    S(q),
    S(0),
    S(q^2 + 2*q),
    S(q),
    S(q),
    S(0),
    S(0),
    S(-q^2),
    S(0),
    S(0),
    S(2*q + 1),
    S(1),
    S(-1),
    S(-1),
    S(3),
    S(-1),
    S(-1),
    S(0),
    S(1),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(q^4 + q^2),
    S(q^2),
    S(q^2),
    S(q^2),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^2 + q),
    S(q),
    S(0),
    S(q^2 + 1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(q^2 + 1),
    S(1),
    S(1),
    S(q + 1),
    S(1),
    S(-q + 1),
    S(1),
    S(2),
    S(0),
    S(2),
    S(-1),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(q^3 + q^2 + q),
    S(q^2 + q),
    S(q),
    S(q),
    S(q),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^2 + q + 1),
    S(q + 1),
    S(1),
    S(2*q + 1),
    S(q + 1),
    S(q + 1),
    S(1),
    S(1),
    S(-1),
    S(-1),
    S(-1),
    S(q + 2),
    S(2),
    S(q),
    S(0),
    S(3),
    S(1),
    S(-1),
    S(0),
    S(-1),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
    S(1),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^6 + q^5 + q^4 + q^3)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^3)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(R(-i1*k1)//R(q - 1) => R(q^3 + q^2 + q), R(3*i1*k1)//R(q - 1) => R(q^3));
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q^2 + q),
        R(i1*k1)//R(q - 1) => R(q^2 + q),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1)//R(q - 1) => R(q)); simplify=false),
    S(Dict(R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 - i2*k1)//R(q - 1) => R(q),
        R(i2*k1)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-q - 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1)//R(q - 1) => R(1),
        R(i2*k1 - i3*k1)//R(q - 1) => R(1),
        R(i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k1 - i2*k1)//R(q - 1) => R(-1), R(i2*k1)//R(q - 1) => R(-1)); simplify=false
    ),
    S(0),
    S(Dict(R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^5 + 2*q^4 + 2*q^3 + 2*q^2 + q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^3 + 2*q^2 + q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^2 + q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^2 + q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1), R(3*i1*k1)//R(q - 1) => R(q^2 + q)
      );
      simplify=false,
    ),
    S(
      Dict(R(-i1*k1)//R(q - 1) => R(2*q + 1), R(3*i1*k1)//R(q - 1) => R(q)); simplify=false
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k1)//R(q - 1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(i1*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(i1*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(2*q + 2),
        R(2*i1*k1 - i2*k1)//R(q - 1) => R(q + 1),
        R(i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(2),
        R(2*i1*k1 - i2*k1)//R(q - 1) => R(1),
        R(i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(2),
        R(i1*k1 - i2*k1)//R(q - 1) => R(2),
        R(i2*k1 - i3*k1)//R(q - 1) => R(2),
        R(i3*k1)//R(q - 1) => R(2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(Dict(R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^3 + q^2 + q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^2 + q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(R(-i1*k1)//R(q - 1) => R(q^2 + q + 1), R(3*i1*k1)//R(q - 1) => R(1));
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q + 1), R(3*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1), R(3*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(i1*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(i1*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(i1*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 - i2*k1)//R(q - 1) => R(1),
        R(i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(1),
        R(2*i1*k1 - i2*k1)//R(q - 1) => R(1),
        R(i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1)//R(q - 1) => R(1),
        R(i2*k1 - i3*k1)//R(q - 1) => R(1),
        R(i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 - i2*k1)//R(q - 1) => R(1), R(i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(Dict(R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^6 + q^5 + 2*q^4 + q^3 + q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^3 + q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q^3 + q^2 + q), R(2*i1*k1)//R(q - 1) => R(q^3 + q^2 + q)
      );
      simplify=false,
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(q), R(2*i1*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q^2),
        R(2*i1*k1)//R(q - 1) => R(q^2),
        R(1//2*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i2*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q),
        R(-i1*k1 + i2*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1)//R(q - 1) => R(q),
        R(i1*k1 - i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(R(-i1*k1 + i2*k1)//R(q - 1) => R(1), R(i1*k1 - i2*k1)//R(q - 1) => R(1));
      simplify=false,
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(-q), R(2*i1*k1)//R(q - 1) => R(-q)); simplify=false),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i2*k1 - i3*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i3*k1)//R(q - 1) => R(1),
        R(-i2*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 - i3*k1)//R(q - 1) => R(1),
        R(i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1), R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^5 + q^4 + 2*q^3 + q^2 + q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^3 + q^2 + q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q^2 + q + 1), R(2*i1*k1)//R(q - 1) => R(q^3 + q^2 + q)
      );
      simplify=false,
    ),
    S(
      Dict(R(-2*i1*k1)//R(q - 1) => R(q + 1), R(2*i1*k1)//R(q - 1) => R(q)); simplify=false
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q),
        R(2*i1*k1)//R(q - 1) => R(q),
        R(1//2*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q), R(1//2*i2*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(q), R(1//2*i2*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-q^2 - 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i2*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1)//R(q - 1) => R(q),
        R(i1*k1 - i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i2*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(-1), R(2*i1*k1)//R(q - 1) => R(q)); simplify=false),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-i1*k1 + i2*k1 - i3*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i3*k1)//R(q - 1) => R(1),
        R(-i2*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 - i3*k1)//R(q - 1) => R(1),
        R(i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1), R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^5 + q^4 + 2*q^3 + q^2 + q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^3 + q^2 + q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q^3 + q^2 + q), R(2*i1*k1)//R(q - 1) => R(q^2 + q + 1)
      );
      simplify=false,
    ),
    S(
      Dict(R(-2*i1*k1)//R(q - 1) => R(q), R(2*i1*k1)//R(q - 1) => R(q + 1)); simplify=false
    ),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q),
        R(2*i1*k1)//R(q - 1) => R(q),
        R(1//2*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(q), R(1//2*i2*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q), R(1//2*i2*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-q^2 - 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(q),
        R(-i1*k1 + i2*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1 + i2*k1)//R(q - 1) => R(1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(q), R(2*i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-i1*k1 + i2*k1 - i3*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i3*k1)//R(q - 1) => R(1),
        R(-i2*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 - i3*k1)//R(q - 1) => R(1),
        R(i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1), R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1), R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^4 + q^3 + 2*q^2 + q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(2*q^2 + q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 + q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 + q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(R(-2*i1*k1)//R(q - 1) => R(q^2 + q + 1), R(2*i1*k1)//R(q - 1) => R(q^2 + q + 1));
      simplify=false,
    ),
    S(
      Dict(R(-2*i1*k1)//R(q - 1) => R(q + 1), R(2*i1*k1)//R(q - 1) => R(q + 1));
      simplify=false,
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(1), R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(1//2*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(1//2*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(1//2*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(1//2*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(1//2*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i2*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i2*k1)//R(q - 1) => R(1),
        R(2*i1*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(1), R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(-2*i1*k1)//R(q - 1) => R(1), R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-i1*k1 + i2*k1 - i3*k1)//R(q - 1) => R(1),
        R(-i1*k1 + i3*k1)//R(q - 1) => R(1),
        R(-i2*k1)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 - i3*k1)//R(q - 1) => R(1),
        R(i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1), R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^6 - q^5 - q^3 + q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-q^3 + q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(q^2 - 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(-i1*k1)//R(q + 1) => R(q^2),
        R(i1*k1)//R(q + 1) => R(q^2),
        R(1//2*i1*k1)//R(1) => R(q^2 + 1),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i2*k1)//R(q + 1) => R(-q + 1), R(i1*k1 - i2*k1)//R(q + 1) => R(-q + 1)
      );
      simplify=false,
    ),
    S(
      Dict(R(-i1*k1 + i2*k1)//R(q + 1) => R(1), R(i1*k1 - i2*k1)//R(q + 1) => R(1));
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i2*k1)//R(q + 1) => R(1),
        R(-i2*k1)//R(q + 1) => R(1),
        R(i1*k1 - i2*k1)//R(q + 1) => R(1),
        R(i2*k1)//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(Dict(R(-i1*k1)//R(q + 1) => R(-1), R(i1*k1)//R(q + 1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^4 - q^3 - q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 - q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 - q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(q^2 - 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(-i1*k1)//R(q + 1) => R(1),
        R(i1*k1)//R(q + 1) => R(1),
        R(1//2*i1*k1)//R(1) => R(q^2 + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1)//R(q + 1) => R(1), R(i1*k1)//R(q + 1) => R(1), R(1//2*i1*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1)//R(q + 1) => R(1), R(i1*k1)//R(q + 1) => R(1), R(1//2*i1*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i2*k1)//R(q + 1) => R(-q + 1), R(i1*k1 - i2*k1)//R(q + 1) => R(-q + 1)
      );
      simplify=false,
    ),
    S(
      Dict(R(-i1*k1 + i2*k1)//R(q + 1) => R(1), R(i1*k1 - i2*k1)//R(q + 1) => R(1));
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i2*k1)//R(q + 1) => R(1),
        R(-i2*k1)//R(q + 1) => R(1),
        R(i1*k1 - i2*k1)//R(q + 1) => R(1),
        R(i2*k1)//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(Dict(R(-i1*k1)//R(q + 1) => R(1), R(i1*k1)//R(q + 1) => R(1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(1//2*q^6 + 1//2*q^5 + q^4 + 1//2*q^3 + 1//2*q^2),
    S(1//2*q^3 + 1//2*q^2),
    S(1//2*q^3 + 1//2*q^2),
    S(-1//2*q^3 + 1//2*q^2),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^3 + q^2 + q),
    S(q),
    S(0),
    S(3//2*q^2 + q + 1//2),
    S(1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(1//2*q^2 + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(
      Dict(R(0)//R(1) => R(q), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(q + 1)); simplify=false
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(-q),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(q^5 + q^4 + 2*q^3 + q^2 + q),
    S(q^3 + q^2 + q),
    S(q),
    S(q),
    S(q),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^3 + 2*q^2 + 2*q + 1),
    S(2*q + 1),
    S(1),
    S(q^2 + 4*q + 1),
    S(2*q + 1),
    S(2*q + 1),
    S(1),
    S(1),
    S(-q^2 - 1),
    S(-1),
    S(-1),
    S(
      Dict(R(0)//R(1) => R(q + 1), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(2*q + 2));
      simplify=false,
    ),
    S(Dict(R(0)//R(1) => R(1), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(2)); simplify=false),
    S(q - 1),
    S(-1),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2*k1 + 1//2*i3*k1)//R(1) => R(2),
        R(1//2*i1*k1 + 1//2*i3*k1)//R(1) => R(2),
        R(1//2*i2*k1)//R(1) => R(2),
      );
      simplify=false,
    ),
    S(0),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-2)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(1//2*q^6 + 1//2*q^5 + q^4 + 1//2*q^3 + 1//2*q^2),
    S(1//2*q^3 + 1//2*q^2),
    S(-1//2*q^3 + 1//2*q^2),
    S(1//2*q^3 + 1//2*q^2),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(q^3 + q^2 + q),
    S(q),
    S(0),
    S(3//2*q^2 + q + 1//2),
    S(1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(1//2*q^2 + 1//2),
    S(-1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(
      Dict(R(0)//R(1) => R(q), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(q + 1)); simplify=false
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(-q),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(1//2*q^4 + 1//2*q^3 + q^2 + 1//2*q + 1//2),
    S(q^2 + 1//2*q + 1//2),
    S(q^2 + 1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(q^2 + q + 1),
    S(q + 1),
    S(1),
    S(1//2*q^2 + q + 3//2),
    S(1//2*q + 3//2),
    S(1//2*q + 3//2),
    S(1//2*q + 3//2),
    S(-1//2*q + 3//2),
    S(1//2*q^2 + 1//2),
    S(-1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(
      Dict(R(0)//R(1) => R(1), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(q + 1)); simplify=false
    ),
    S(Dict(R(0)//R(1) => R(1), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(1),
    S(1),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(1//2*q^4 + 1//2*q^3 + q^2 + 1//2*q + 1//2),
    S(q^2 + 1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(q^2 + 1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(1//2*q + 1//2),
    S(q^2 + q + 1),
    S(q + 1),
    S(1),
    S(1//2*q^2 + q + 3//2),
    S(1//2*q + 3//2),
    S(1//2*q + 3//2),
    S(-1//2*q + 3//2),
    S(1//2*q + 3//2),
    S(1//2*q^2 + 1//2),
    S(1//2*q + 1//2),
    S(-1//2*q + 1//2),
    S(
      Dict(R(0)//R(1) => R(1), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(q + 1)); simplify=false
    ),
    S(Dict(R(0)//R(1) => R(1), R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(1),
    S(1),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^6 - 1//2*q^5 - 1//2*q^3 + 1//2*q^2));
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^3 + 1//2*q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(3//2*q^2 + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(1//2*i2*k1)//R(1) => R(1));
      simplify=false,
    ),
    S(0),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^4 - 1//2*q^3 - 1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 - 1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^2 + 3//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 3//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 3//2)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(1//2*i2*k1)//R(1) => R(1));
      simplify=false,
    ),
    S(0),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^6 - 1//2*q^5 - 1//2*q^3 + 1//2*q^2));
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^3 + 1//2*q^2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(3//2*q^2 + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(1//2*i2*k1)//R(1) => R(1));
      simplify=false,
    ),
    S(0),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^4 - 1//2*q^3 - 1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^2 - 1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q^2 + 3//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1//2*q + 3//2)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(-1//2*q + 3//2)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(1//2*i2*k1)//R(1) => R(1));
      simplify=false,
    ),
    S(0),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q^6 + 2*q^5 + 3*q^4 + 3*q^3 + 2*q^2 + q));
      simplify=false,
    ),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(2*q^3 + 2*q^2 + q)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q^2 + q)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q^2 + q)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + 2*i1*k2)//R(q - 1) => R(q^3 + q^2 + q),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(3*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^3 + q^2 + q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1 + 2*i1*k2)//R(q - 1) => R(q),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(2*q + 1),
        R(3*i1*k1 + 2*i1*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(q^2 + 2*q + 1),
        R(1//2*q*i2*k1 - i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(q^2 + q),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k1 + 2*i1*k2)//R(q - 1) => R(q^2 + q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(q + 1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + 2*i1*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(q + 1),
        R(1//2*q*i2*k1 - i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(q),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i1*k2 - i2*k2)//R(q - 1) => R(q + 1),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(q + 1),
        R(-i1*k1 - i1*k2 + i2*k2)//R(q - 1) => R(q + 1),
        R(-i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + 2*i1*k2 - i2*k1)//R(q - 1) => R(q),
        R(2*i1*k1 + i1*k2 - i2*k1 - i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + i2*k1)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1 + i1*k2 - i2*k2)//R(q - 1) => R(1),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 + i2*k2)//R(q - 1) => R(1),
        R(-i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i1*k2 - i2*k1 - i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(-q - 1)); simplify=false),
    S(Dict(R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-i1*k1 - i1*k2 + i2*k2 - i3*k2)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 + i3*k2)//R(q - 1) => R(1),
        R(-i1*k1 - i2*k2)//R(q - 1) => R(1),
        R(-i1*k2 + i2*k1 + i2*k2 - i3*k1 - i3*k2)//R(q - 1) => R(1),
        R(-i1*k2 + i3*k1 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 - i2*k1 - i2*k2 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 - i2*k1 - i3*k2)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1 - i2*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 - i3*k1 - i3*k2)//R(q - 1) => R(1),
        R(i1*k2 - i2*k2 + i3*k1 + i3*k2)//R(q - 1) => R(1),
        R(i2*k1 + i2*k2 - i3*k1)//R(q - 1) => R(1),
        R(i2*k2 + i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 - i2*k1)//R(q - 1) => R(-1), R(i1*k2 + i2*k1)//R(q - 1) => R(-1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q^5 + 2*q^4 + 3*q^3 + 3*q^2 + 2*q + 1));
      simplify=false,
    ),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q^3 + 3*q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(2*q + 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//2*i1*k2)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(-i1*k1 + 2*i1*k2)//R(q - 1) => R(q^2 + q + 1),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(3*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^2 + q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1 + 2*i1*k2)//R(q - 1) => R(q + 1),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(2*q + 1),
        R(3*i1*k1 + 2*i1*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1 + 2*i1*k2)//R(q - 1) => R(1),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(1),
        R(3*i1*k1 + 2*i1*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(q^2 + 2*q + 1),
        R(1//2*q*i2*k1 - i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k1 + 2*i1*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(q + 1),
        R(1//2*q*i2*k1 - i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + 2*i1*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(q + 1),
        R(1//2*q*i2*k1 - i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + 2*i1*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(i1*k1 + 2*i1*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 - i1*k1 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k2 + i1*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(i1*k1 + 2*i1*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i1*k2 - i2*k2)//R(q - 1) => R(q + 1),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(q + 1),
        R(-i1*k1 - i1*k2 + i2*k2)//R(q - 1) => R(q + 1),
        R(-i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + 2*i1*k2 - i2*k1)//R(q - 1) => R(1),
        R(2*i1*k1 + i1*k2 - i2*k1 - i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1 + i1*k2 - i2*k2)//R(q - 1) => R(1),
        R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 + i2*k2)//R(q - 1) => R(1),
        R(-i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + 2*i1*k2 - i2*k1)//R(q - 1) => R(1),
        R(2*i1*k1 + i1*k2 - i2*k1 - i2*k2)//R(q - 1) => R(1),
        R(2*i1*k2 + i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(-i1*k1 - 2*i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-i1*k1 - i1*k2 + i2*k2 - i3*k2)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 + i3*k2)//R(q - 1) => R(1),
        R(-i1*k1 - i2*k2)//R(q - 1) => R(1),
        R(-i1*k2 + i2*k1 + i2*k2 - i3*k1 - i3*k2)//R(q - 1) => R(1),
        R(-i1*k2 + i3*k1 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 - i2*k1 - i2*k2 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 - i2*k1 - i3*k2)//R(q - 1) => R(1),
        R(i1*k1 - i2*k1 - i2*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 - i3*k1 - i3*k2)//R(q - 1) => R(1),
        R(i1*k2 - i2*k2 + i3*k1 + i3*k2)//R(q - 1) => R(1),
        R(i2*k1 + i2*k2 - i3*k1)//R(q - 1) => R(1),
        R(i2*k2 + i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k1 + i1*k2 - i2*k1)//R(q - 1) => R(1), R(i1*k2 + i2*k1)//R(q - 1) => R(1));
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^6 + q^4 - q^3 - q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^2 - q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^2 - q)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-q)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q^3 - 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q^2 - q),
        R(i1*k1)//R(q - 1) => R(q^2 - q),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1)//R(q - 1) => R(-q)); simplify=false),
    S(Dict(R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-q)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(q^2 + 1), R(1//2*q*i1*k1)//R(q + 1) => R(q^2 + 1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(1), R(1//2*q*i1*k1)//R(q + 1) => R(1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(1), R(1//2*q*i1*k1)//R(q + 1) => R(1));
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q - 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(-q + 1),
        R(2*q*i1*k1 - q*i2*k1 + i2*k1)//R(q^2 - 1) => R(-q),
        R(q*i2*k1 + 2*i1*k1 - i2*k1)//R(q^2 - 1) => R(-q),
      );
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(
      Dict(R(-i1*k1)//R(q^2 - 1) => R(-1), R(-q*i1*k1)//R(q^2 - 1) => R(-1)); simplify=false
    ),
    S(
      Dict(
        R(-q*i1*k1 + q*i2*k1 - i2*k1)//R(q^2 - 1) => R(1),
        R(-q*i2*k1 - i1*k1 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k1)//R(q^2 - 1) => R(1),
        R(q*i1*k1)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^5 + q^3 - q^2 - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^3 - q^2 - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-q^2 - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-q^2 - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q^3 - 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q - 1),
        R(i1*k1)//R(q - 1) => R(q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q - 1),
        R(i1*k1)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1),
        R(i1*k1)//R(q - 1) => R(q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1), R(i1*k1)//R(q - 1) => R(-1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1), R(i1*k1)//R(q - 1) => R(-1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(q + 1) => R(-q^2 - 1), R(1//2*q*i1*k1)//R(q + 1) => R(-q^2 - 1)
      );
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(-1), R(1//2*q*i1*k1)//R(q + 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(-1), R(1//2*q*i1*k1)//R(q + 1) => R(-1));
      simplify=false,
    ),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q - 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(q - 1),
        R(2*q*i1*k1 - q*i2*k1 + i2*k1)//R(q^2 - 1) => R(-1),
        R(q*i2*k1 + 2*i1*k1 - i2*k1)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k1)//R(q - 1) => R(-1),
        R(2*q*i1*k1 - q*i2*k1 + i2*k1)//R(q^2 - 1) => R(-1),
        R(q*i2*k1 + 2*i1*k1 - i2*k1)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(
      Dict(R(-i1*k1)//R(q^2 - 1) => R(-1), R(-q*i1*k1)//R(q^2 - 1) => R(-1)); simplify=false
    ),
    S(
      Dict(
        R(-q*i1*k1 + q*i2*k1 - i2*k1)//R(q^2 - 1) => R(-1),
        R(-q*i2*k1 - i1*k1 + i2*k1)//R(q^2 - 1) => R(-1),
        R(i1*k1)//R(q^2 - 1) => R(-1),
        R(q*i1*k1)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) =>
          R(q^6 + 3*q^5 + 5*q^4 + 6*q^3 + 5*q^2 + 3*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(3*q^3 + 5*q^2 + 3*q + 1));
      simplify=false,
    ),
    S(
      Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(2*q^2 + 3*q + 1));
      simplify=false,
    ),
    S(
      Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(2*q^2 + 3*q + 1));
      simplify=false,
    ),
    S(Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(3*q + 1)); simplify=false),
    S(Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//4*i1*k1 + 1//2*i1*k2 + 3//4*i1*k3)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(-3*i1*k1 - 2*i1*k2 - i1*k3)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(i1*k1 + 2*i1*k2 + 3*i1*k3)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(i1*k1 + 2*i1*k2 - i1*k3)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(i1*k1 - 2*i1*k2 - i1*k3)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-3*i1*k1 - 2*i1*k2 - i1*k3)//R(q - 1) => R(2*q + 1),
        R(i1*k1 + 2*i1*k2 + 3*i1*k3)//R(q - 1) => R(2*q + 1),
        R(i1*k1 + 2*i1*k2 - i1*k3)//R(q - 1) => R(2*q + 1),
        R(i1*k1 - 2*i1*k2 - i1*k3)//R(q - 1) => R(2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-3*i1*k1 - 2*i1*k2 - i1*k3)//R(q - 1) => R(1),
        R(i1*k1 + 2*i1*k2 + 3*i1*k3)//R(q - 1) => R(1),
        R(i1*k1 + 2*i1*k2 - i1*k3)//R(q - 1) => R(1),
        R(i1*k1 - 2*i1*k2 - i1*k3)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + 1//2*q*i2*k3 + i1*k1 - i1*k3 - 1//2*i2*k1 -
          1//2*i2*k2 - 1//2*i2*k3,
        )//R(q - 1) => R(q^2 + 2*q + 1),
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k1 + i1*k3 - 1//2*i2*k1 - 1//2*i2*k2
        )//R(q - 1) => R(q^2 + 2*q + 1),
        R(1//2*q*i2*k1 + i1*k1 + 2*i1*k2 + i1*k3 - 1//2*i2*k1)//R(q - 1) =>
          R(q^2 + 2*q + 1),
        R(
          1//2*q*i2*k2 + 1//2*q*i2*k3 - i1*k1 - i1*k3 - 1//2*i2*k2 - 1//2*i2*k3
        )//R(q - 1) => R(q^2 + 2*q + 1),
        R(1//2*q*i2*k2 - i1*k1 + i1*k3 - 1//2*i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(1//2*q*i2*k3 - i1*k1 - 2*i1*k2 - i1*k3 - 1//2*i2*k3)//R(q - 1) =>
          R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + 1//2*q*i2*k3 + i1*k1 - i1*k3 - 1//2*i2*k1 -
          1//2*i2*k2 - 1//2*i2*k3,
        )//R(q - 1) => R(q + 1),
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k1 + i1*k3 - 1//2*i2*k1 - 1//2*i2*k2
        )//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k1 + i1*k1 + 2*i1*k2 + i1*k3 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(
          1//2*q*i2*k2 + 1//2*q*i2*k3 - i1*k1 - i1*k3 - 1//2*i2*k2 - 1//2*i2*k3
        )//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k2 - i1*k1 + i1*k3 - 1//2*i2*k2)//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k3 - i1*k1 - 2*i1*k2 - i1*k3 - 1//2*i2*k3)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + 1//2*q*i2*k3 + i1*k1 - i1*k3 - 1//2*i2*k1 -
          1//2*i2*k2 - 1//2*i2*k3,
        )//R(q - 1) => R(q + 1),
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k1 + i1*k3 - 1//2*i2*k1 - 1//2*i2*k2
        )//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k1 + i1*k1 + 2*i1*k2 + i1*k3 - 1//2*i2*k1)//R(q - 1) => R(q + 1),
        R(
          1//2*q*i2*k2 + 1//2*q*i2*k3 - i1*k1 - i1*k3 - 1//2*i2*k2 - 1//2*i2*k3
        )//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k2 - i1*k1 + i1*k3 - 1//2*i2*k2)//R(q - 1) => R(q + 1),
        R(1//2*q*i2*k3 - i1*k1 - 2*i1*k2 - i1*k3 - 1//2*i2*k3)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + 1//2*q*i2*k3 + i1*k1 - i1*k3 - 1//2*i2*k1 -
          1//2*i2*k2 - 1//2*i2*k3,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k1 + i1*k3 - 1//2*i2*k1 - 1//2*i2*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k1 + 2*i1*k2 + i1*k3 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(
          1//2*q*i2*k2 + 1//2*q*i2*k3 - i1*k1 - i1*k3 - 1//2*i2*k2 - 1//2*i2*k3
        )//R(q - 1) => R(1),
        R(1//2*q*i2*k2 - i1*k1 + i1*k3 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k3 - i1*k1 - 2*i1*k2 - i1*k3 - 1//2*i2*k3)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + 1//2*q*i2*k3 + i1*k1 - i1*k3 - 1//2*i2*k1 -
          1//2*i2*k2 - 1//2*i2*k3,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k1 + i1*k3 - 1//2*i2*k1 - 1//2*i2*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k1 + 2*i1*k2 + i1*k3 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(
          1//2*q*i2*k2 + 1//2*q*i2*k3 - i1*k1 - i1*k3 - 1//2*i2*k2 - 1//2*i2*k3
        )//R(q - 1) => R(1),
        R(1//2*q*i2*k2 - i1*k1 + i1*k3 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k3 - i1*k1 - 2*i1*k2 - i1*k3 - 1//2*i2*k3)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-2*i1*k1 - 2*i1*k2 - i1*k3 + i2*k1)//R(q - 1) => R(q + 1),
        R(-2*i1*k1 - i1*k2 + i2*k1 + i2*k2 + i2*k3)//R(q - 1) => R(q + 1),
        R(-2*i1*k1 - i1*k2 - i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(-2*i1*k2 - i1*k3 - i2*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + 2*i1*k2 + 2*i1*k3 - i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + 2*i1*k2 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + 2*i1*k3 - i2*k2 - i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 - i1*k3 - i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 - i1*k2 + i2*k2 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 - i1*k2 - i1*k3 + i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k2 + 2*i1*k3 - i2*k1 - i2*k2 - i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k2 - i1*k3 - i2*k1 - i2*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k1 - 2*i1*k2 - i1*k3 + i2*k1)//R(q - 1) => R(1),
        R(-2*i1*k1 - i1*k2 + i2*k1 + i2*k2 + i2*k3)//R(q - 1) => R(1),
        R(-2*i1*k1 - i1*k2 - i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(-2*i1*k2 - i1*k3 - i2*k1)//R(q - 1) => R(1),
        R(i1*k1 + 2*i1*k2 + 2*i1*k3 - i2*k3)//R(q - 1) => R(1),
        R(i1*k1 + 2*i1*k2 + i2*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + 2*i1*k3 - i2*k2 - i2*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 - i1*k3 - i2*k2)//R(q - 1) => R(1),
        R(i1*k1 - i1*k2 + i2*k2 + i2*k3)//R(q - 1) => R(1),
        R(i1*k1 - i1*k2 - i1*k3 + i2*k2)//R(q - 1) => R(1),
        R(i1*k2 + 2*i1*k3 - i2*k1 - i2*k2 - i2*k3)//R(q - 1) => R(1),
        R(i1*k2 - i1*k3 - i2*k1 - i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1 + i2*k1 + i2*k2 + i2*k3 - i3*k3)//R(q - 1) => R(1),
        R(-i1*k1 + i2*k1 + i2*k2 + i3*k3)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 + i2*k1 + i2*k2 + i2*k3 - i3*k2 - i3*k3)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 + i2*k1 + i3*k2 + i3*k3)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 - i1*k3 + i2*k1 + i2*k2 - i3*k2)//R(q - 1) => R(1),
        R(-i1*k1 - i1*k2 - i1*k3 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(-i1*k2 + i2*k2 + i2*k3 - i3*k1 - i3*k2 - i3*k3)//R(q - 1) => R(1),
        R(-i1*k2 - i1*k3 + i2*k2 - i3*k1 - i3*k2)//R(q - 1) => R(1),
        R(-i1*k2 - i1*k3 - i2*k1 + i3*k1 + i3*k2)//R(q - 1) => R(1),
        R(-i1*k2 - i2*k1 + i3*k1 + i3*k2 + i3*k3)//R(q - 1) => R(1),
        R(-i1*k3 - i2*k1 - i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(-i1*k3 - i2*k2 - i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i1*k3 - i2*k2 - i2*k3 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i1*k3 - i2*k3 - i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k3 - i3*k2 - i3*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 - i2*k2 + i3*k2 + i3*k3)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i2*k3 - i3*k3)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 - i2*k1 - i2*k2 - i2*k3 + i3*k1 + i3*k2)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 - i2*k3 - i3*k1 - i3*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k3 - i3*k1 - i3*k2 - i3*k3)//R(q - 1) => R(1),
        R(i1*k2 - i2*k1 - i2*k2 + i3*k1 + i3*k2 + i3*k3)//R(q - 1) => R(1),
        R(i1*k3 - i2*k1 - i2*k2 - i2*k3 + i3*k1)//R(q - 1) => R(1),
        R(i1*k3 - i2*k2 - i2*k3 - i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(q^6 + q^5 + q^4 - q^2 - q - 1));
      simplify=false,
    ),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(q^3 - q^2 - q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(-q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(-q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(-q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1 + 1//4*i1*k2)//R(1) => R(-1)); simplify=false),
    S(
      Dict(
        R(-i1*k1 + i1*k2)//R(q - 1) => R(q^3 - 1),
        R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^3 - 1),
      );
      simplify=false,
    ),
    S(
      Dict(R(-i1*k1 + i1*k2)//R(q - 1) => R(-1), R(3*i1*k1 + i1*k2)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(R(-i1*k1 + i1*k2)//R(q - 1) => R(-1), R(3*i1*k1 + i1*k2)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(q^2 - 1),
        R(1//2*q*i2*k2 + i1*k1 + i1*k2 - 1//2*i2*k2)//R(q - 1) => R(q^2 - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-q - 1),
        R(1//2*q*i2*k2 + i1*k1 + i1*k2 - 1//2*i2*k2)//R(q - 1) => R(q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(q - 1),
        R(1//2*q*i2*k2 + i1*k1 + i1*k2 - 1//2*i2*k2)//R(q - 1) => R(-q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1),
        R(1//2*q*i2*k2 + i1*k1 + i1*k2 - 1//2*i2*k2)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1),
        R(1//2*q*i2*k2 + i1*k1 + i1*k2 - 1//2*i2*k2)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(2*i1*k1 + i1*k2 - i2*k1)//R(q - 1) => R(q - 1),
        R(i1*k2 + i2*k1)//R(q - 1) => R(q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i1*k2 - i2*k1)//R(q - 1) => R(-1), R(i1*k2 + i2*k1)//R(q - 1) => R(-1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-q*i1*k1 - 2*q*i1*k2 + q*i2*k2 - i1*k1 - i2*k2)//R(q^2 - 1) => R(-q - 1),
        R(-q*i1*k1 - q*i2*k2 - i1*k1 - 2*i1*k2 + i2*k2)//R(q^2 - 1) => R(-q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-q*i1*k1 - 2*q*i1*k2 + q*i2*k2 - i1*k1 - i2*k2)//R(q^2 - 1) => R(-1),
        R(-q*i1*k1 - q*i2*k2 - i1*k1 - 2*i1*k2 + i2*k2)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(
      Dict(
        R(q*i1*k1 + q*i1*k2 - q*i2*k1 + i1*k1 - i2*k1)//R(q^2 - 1) => R(-1),
        R(q*i1*k1 - q*i2*k1 + i1*k1 + i1*k2 - i2*k1)//R(q^2 - 1) => R(-1),
        R(q*i1*k2 + q*i2*k1 + i2*k1)//R(q^2 - 1) => R(-1),
        R(q*i2*k1 + i1*k2 + i2*k1)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(q^6 - q^5 + q^4 - 2*q^3 + q^2 - q + 1));
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(-q^3 + q^2 - q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(2*q^2 - q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(2*q^2 - q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//4*i1*k2)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k2 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(q^2 - 2*q + 1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(q^2 - 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k2 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(-q + 1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k2 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) =>
          R(-q + 1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k2 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 1//2*q*i2*k2 + i1*k2 - 1//2*i2*k1 - 1//2*i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 - 1//2*i1*k2)//R(q + 1) => R(q^2 + 1),
        R(1//2*q*i1*k1 + 1//2*q*i1*k2 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(q^2 + 1),
        R(1//2*q*i1*k2 - i1*k1 + i1*k2)//R(q + 1) => R(q^2 + 1),
        R(i1*k1 - 1//2*i1*k2)//R(q + 1) => R(q^2 + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 - 1//2*i1*k2)//R(q + 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i1*k2 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(1),
        R(1//2*q*i1*k2 - i1*k1 + i1*k2)//R(q + 1) => R(1),
        R(i1*k1 - 1//2*i1*k2)//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 - 1//2*i1*k2)//R(q + 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i1*k2 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(1),
        R(1//2*q*i1*k2 - i1*k1 + i1*k2)//R(q + 1) => R(1),
        R(i1*k1 - 1//2*i1*k2)//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(-q*i1*k1 + q*i1*k2 + q*i2*k1 + i1*k1 + i1*k2 - i2*k1)//R(q^2 - 1) => R(-q + 1),
        R(-q*i1*k1 + q*i2*k1 - q*i2*k2 + i1*k1 - 2*i1*k2 - i2*k1 + i2*k2)//R(q^2 - 1) =>
          R(-q + 1),
        R(q*i1*k1 + q*i1*k2 - q*i2*k1 - i1*k1 + i1*k2 + i2*k1)//R(q^2 - 1) => R(-q + 1),
        R(q*i1*k1 - 2*q*i1*k2 - q*i2*k1 + q*i2*k2 - i1*k1 + i2*k1 - i2*k2)//R(q^2 - 1) =>
          R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-q*i1*k1 + q*i1*k2 + q*i2*k1 + i1*k1 + i1*k2 - i2*k1)//R(q^2 - 1) => R(1),
        R(-q*i1*k1 + q*i2*k1 - q*i2*k2 + i1*k1 - 2*i1*k2 - i2*k1 + i2*k2)//R(q^2 - 1) =>
          R(1),
        R(q*i1*k1 + q*i1*k2 - q*i2*k1 - i1*k1 + i1*k2 + i2*k1)//R(q^2 - 1) => R(1),
        R(q*i1*k1 - 2*q*i1*k2 - q*i2*k1 + q*i2*k2 - i1*k1 + i2*k1 - i2*k2)//R(q^2 - 1) =>
          R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(-q*i1*k1 + q*i1*k2 + q*i2*k1 - q*i2*k2 + i1*k1 - i2*k1 + i2*k2)//R(q^2 - 1) =>
          R(1),
        R(-q*i1*k1 + q*i2*k1 + i1*k1 - i1*k2 - i2*k1)//R(q^2 - 1) => R(1),
        R(-q*i1*k2 + q*i2*k1 - i2*k1)//R(q^2 - 1) => R(1),
        R(-q*i2*k1 + q*i2*k2 + i1*k2 + i2*k1 - i2*k2)//R(q^2 - 1) => R(1),
        R(-q*i2*k1 - i1*k2 + i2*k1)//R(q^2 - 1) => R(1),
        R(q*i1*k1 - q*i1*k2 - q*i2*k1 - i1*k1 + i2*k1)//R(q^2 - 1) => R(1),
        R(q*i1*k1 - q*i2*k1 + q*i2*k2 - i1*k1 + i1*k2 + i2*k1 - i2*k2)//R(q^2 - 1) => R(1),
        R(q*i1*k2 + q*i2*k1 - q*i2*k2 - i2*k1 + i2*k2)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(1//4*i1*k1)//R(1) => R(q^6 - q^4 - q^2 + 1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(-q^2 + 1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(-q^2 + 1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(-q^2 + 1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//4*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(q^3 - q^2 - q + 1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1)//R(q^3 - 1) => R(1),
        R(q*i1*k1)//R(q^3 - 1) => R(1),
        R(q^2*i1*k1)//R(q^3 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3//4*i1*k1)//R(1) => R(q^6 - q^5 - q^4 + q^2 + q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-q^3 + q^2 + q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(q - 1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(q^2 - 1), R(1//2*q*i1*k1)//R(q + 1) => R(q^2 - 1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(-1), R(1//2*q*i1*k1)//R(q + 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1)//R(q + 1) => R(-1), R(1//2*q*i1*k1)//R(q + 1) => R(-1));
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k1)//R(q^3 + q^2 + q + 1) => R(-1),
        R(-q*i1*k1)//R(q^3 + q^2 + q + 1) => R(-1),
        R(-q^2*i1*k1)//R(q^3 + q^2 + q + 1) => R(-1),
        R(q^2*i1*k1 + q*i1*k1 + i1*k1)//R(q^3 + q^2 + q + 1) => R(-1),
      );
      simplify=false,
    ),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//2*i1*k2)//R(1) =>
          R(1//2*q^6 + 3//2*q^5 + 5//2*q^4 + 3*q^3 + 5//2*q^2 + 3//2*q + 1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k2)//R(1) => R(3//2*q^3 + 5//2*q^2 + 3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(1//2*q^3 + 3//2*q^2 + 3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 + 3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(2*i1*k2)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(R(-2*i1*k2)//R(q - 1) => R(2*q + 1), R(2*i1*k2)//R(q - 1) => R(2*q + 1));
      simplify=false,
    ),
    S(Dict(R(-2*i1*k2)//R(q - 1) => R(1), R(2*i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q^2 + q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q^2 + q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2*q^2 + 4*q + 2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2*q + 2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2*q + 2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(-1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k2 + i2*k2)//R(q - 1) => R(q + 1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(q + 1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1 - i2*k2
        )//R(q - 1) => R(q + 1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(q + 1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1 + i2*k2
        )//R(q - 1) => R(q + 1),
        R(i1*k2 - i2*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k2 + i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1 - i2*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1 + i2*k2
        )//R(q - 1) => R(1),
        R(i1*k2 - i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1 -
          1//2*i3*k1 - i3*k2,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - 1//2*i2*k1 + i2*k2 -
          1//2*i3*k1,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - 1//2*i2*k1 - i2*k2 -
          1//2*i3*k1,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1 -
          1//2*i3*k1 + i3*k2,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 + i1*k2 - i2*k2 - 1//2*i3*k1 + i3*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 + i2*k2 - 1//2*i3*k1)//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - i1*k2 + i2*k2 - 1//2*i3*k1 - i3*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - i2*k2 - 1//2*i3*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 - 1//2*i2*k1 - i2*k2 + i3*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 - 1//2*i2*k1 - i3*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1 + i2*k2 - i3*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//2*i1*k2)//R(1) =>
          R(1//2*q^6 + 3//2*q^5 + 5//2*q^4 + 3*q^3 + 5//2*q^2 + 3//2*q + 1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k2)//R(1) => R(3//2*q^3 + 5//2*q^2 + 3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 + 3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(1//2*q^3 + 3//2*q^2 + 3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(3//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(2*i1*k2)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(R(-2*i1*k2)//R(q - 1) => R(2*q + 1), R(2*i1*k2)//R(q - 1) => R(2*q + 1));
      simplify=false,
    ),
    S(Dict(R(-2*i1*k2)//R(q - 1) => R(1), R(2*i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q^2 + q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q^2 + q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2*q^2 + 4*q + 2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2*q + 2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2*q + 2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(-1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(2*i1*k2)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*i2*k2)//R(1) => R(2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(-i1*k2 + i2*k2)//R(q - 1) => R(q + 1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(q + 1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1 - i2*k2
        )//R(q - 1) => R(q + 1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(q + 1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1 + i2*k2
        )//R(q - 1) => R(q + 1),
        R(i1*k2 - i2*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(-i1*k2 + i2*k2)//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1 - i2*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1 + i2*k2
        )//R(q - 1) => R(1),
        R(i1*k2 - i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1 -
          1//2*i3*k1 - i3*k2,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - 1//2*i2*k1 + i2*k2 -
          1//2*i3*k1,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - 1//2*i2*k1 - i2*k2 -
          1//2*i3*k1,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1 -
          1//2*i3*k1 + i3*k2,
        )//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 + i1*k2 - i2*k2 - 1//2*i3*k1 + i3*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 + i2*k2 - 1//2*i3*k1)//R(q - 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - i1*k2 + i2*k2 - 1//2*i3*k1 - i3*k2
        )//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i3*k1 - 1//2*i1*k1 - i2*k2 - 1//2*i3*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 - 1//2*i2*k1 - i2*k2 + i3*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 - 1//2*i2*k1 - i3*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1 + i2*k2 - i3*k2)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(3//4*i1*k1)//R(1) => R(1//2*q^6 + 1//2*q^5 + 1//2*q^4 - 1//2*q^2 - 1//2*q - 1//2)
      );
      simplify=false,
    ),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^3 - 1//2*q^2 - 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q^3 - 1//2*q^2 - 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^3 + 1//2*q^2 - 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q^3 - 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1//2*q^2 - 1//2),
        R(i1*k1)//R(q - 1) => R(1//2*q^2 - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(-1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(-1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 3//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q - 1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 3//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-q - 1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1),
        R(1//2*q*i2*k1 - 1//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(3//4*i1*k1)//R(1) => R(1//2*q^6 + 1//2*q^5 + 1//2*q^4 - 1//2*q^2 - 1//2*q - 1//2)
      );
      simplify=false,
    ),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^3 - 1//2*q^2 - 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^3 + 1//2*q^2 - 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q^3 - 1//2*q^2 - 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(q^3 - 1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(-i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1//2*q^2 - 1//2),
        R(i1*k1)//R(q - 1) => R(1//2*q^2 - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(-1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q - 1//2),
        R(i1*k1)//R(q - 1) => R(-1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 3//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(q - 1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 3//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-q - 1));
      simplify=false,
    ),
    S(
      Dict(R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1),
        R(1//2*q*i2*k1 - 1//2*i1*k1 - 1//2*i2*k1)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(3//4*i1*k1)//R(1) => R(1//2*q^6 - 1//2*q^5 - 1//2*q^4 + 1//2*q^2 + 1//2*q - 1//2)
      );
      simplify=false,
    ),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2 + 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^3 - 1//2*q^2 + 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2 + 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1)//R(q + 1) => R(1//2*q^2 - 1//2),
        R(1//2*q*i1*k1)//R(q + 1) => R(1//2*q^2 - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(q + 1) => R(1//2*q - 1//2),
        R(1//2*q*i1*k1)//R(q + 1) => R(1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(q + 1) => R(-1//2*q - 1//2),
        R(1//2*q*i1*k1)//R(q + 1) => R(-1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(R(-1//2*i1*k1)//R(q + 1) => R(-1), R(1//2*q*i1*k1 + i1*k1)//R(q + 1) => R(-1));
      simplify=false,
    ),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(3//4*i1*k1)//R(1) => R(1//2*q^6 - 1//2*q^5 - 1//2*q^4 + 1//2*q^2 + 1//2*q - 1//2)
      );
      simplify=false,
    ),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2 + 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q^3 + 1//2*q^2 + 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^3 - 1//2*q^2 + 1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1)//R(q + 1) => R(1//2*q^2 - 1//2),
        R(1//2*q*i1*k1)//R(q + 1) => R(1//2*q^2 - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(q + 1) => R(-1//2*q - 1//2),
        R(1//2*q*i1*k1)//R(q + 1) => R(-1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(q + 1) => R(1//2*q - 1//2),
        R(1//2*q*i1*k1)//R(q + 1) => R(1//2*q - 1//2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(R(-1//2*i1*k1)//R(q + 1) => R(-1), R(1//2*q*i1*k1 + i1*k1)//R(q + 1) => R(-1));
      simplify=false,
    ),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) =>
          R(1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 3//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(q^2 - 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(1//2*q^2 + 1//2),
        R(1//2*q*i1*k1 + 1//2*i1*k1 - i1*k2)//R(q + 1) => R(1//2*q^2 + 1//2),
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(q^2 + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(-1//2*q + 1//2),
        R(1//2*q*i1*k1 + 1//2*i1*k1 - i1*k2)//R(q + 1) => R(-1//2*q + 1//2),
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(1//2*q + 1//2),
        R(1//2*q*i1*k1 + 1//2*i1*k1 - i1*k2)//R(q + 1) => R(1//2*q + 1//2),
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + i1*k2 + 1//2*i2*k1 - i2*k2
        )//R(q + 1) => R(-q + 1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - i1*k2 + 1//2*i2*k1 + i2*k2
        )//R(q + 1) => R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + i1*k2 + 1//2*i2*k1 - i2*k2
        )//R(q + 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - i1*k2 + 1//2*i2*k1 + i2*k2
        )//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + 1//2*i2*k1 + i2*k2)//R(q + 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + 1//2*i2*k1 - i2*k2)//R(q + 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 + 1//2*i2*k1 - i2*k2)//R(q + 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 + 1//2*i2*k1 + i2*k2)//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) =>
          R(1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 3//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(q^2 - 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//2*i2*k1 + 1//2*i2*k2)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(1//2*q^2 + 1//2),
        R(1//2*q*i1*k1 + 1//2*i1*k1 - i1*k2)//R(q + 1) => R(1//2*q^2 + 1//2),
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(q^2 + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(1//2*q + 1//2),
        R(1//2*q*i1*k1 + 1//2*i1*k1 - i1*k2)//R(q + 1) => R(1//2*q + 1//2),
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*i1*k1 + i1*k2)//R(q + 1) => R(-1//2*q + 1//2),
        R(1//2*q*i1*k1 + 1//2*i1*k1 - i1*k2)//R(q + 1) => R(-1//2*q + 1//2),
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + i1*k2 + 1//2*i2*k1 - i2*k2
        )//R(q + 1) => R(-q + 1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - i1*k2 + 1//2*i2*k1 + i2*k2
        )//R(q + 1) => R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + i1*k2 + 1//2*i2*k1 - i2*k2
        )//R(q + 1) => R(1),
        R(
          1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 - i1*k2 + 1//2*i2*k1 + i2*k2
        )//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + 1//2*i2*k1 + i2*k2)//R(q + 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 + 1//2*i1*k1 + 1//2*i2*k1 - i2*k2)//R(q + 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 + 1//2*i2*k1 - i2*k2)//R(q + 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 + 1//2*i2*k1 + i2*k2)//R(q + 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) =>
          R(1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q^3 + 3//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q^2 - q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q^2 - q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(2*q^2 + 2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(2)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(-q + 1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i1*k2)//R(1) =>
          R(1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q^3 + 1//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(
      Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q^3 + 3//2*q^2 - 1//2*q + 1//2));
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(1//2*q + 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q^2 - q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q^2 - q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(-1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i2*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q + 1//2),
        R(1//2*q*i2*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1//2*q + 1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(2*q^2 + 2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i1*k2)//R(1) => R(2)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(-q + 1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - 2*i1*k2 - 1//2*i2*k1)//R(q - 1) =>
          R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 + i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i1*k1 + 1//2*q*i2*k1 - 1//2*i1*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 + i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
        R(1//2*q*i2*k1 - i1*k2 - 1//2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q^3 + 5//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(1//4*q^3 + 3//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^3 + 2*q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q^2 + q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(q + 1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(q + 1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1 + 1//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 3//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//2*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//4*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//2*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 3//4*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q^3 + 5//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(1//4*q^3 + 3//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q + 1//4)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^3 + 2*q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q^2 + q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(q + 1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(q + 1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1 + 1//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 3//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//2*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//4*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//2*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 3//4*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q^3 + 5//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(1//4*q^3 + 3//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^3 + 2*q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q^2 + q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(q + 1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(q + 1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1 + 1//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 3//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//2*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//4*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//2*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 3//4*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q^3 + 5//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(1//4*q^3 + 3//4*q^2 + 3//4*q + 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(3//4*q + 1//4)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 - 1//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 4 * q + 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//2*i1*k1)//R(1) => R(q^3 + 2*q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(2*q + 1)); simplify=false),
    S(Dict(R(1//2*i1*k1)//R(1) => R(1)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q^2 + q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2),
        R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(-1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1)//R(1) => R(1//2*q + 1//2), R(1//8*q*i2*k1 - 1//8*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(q + 1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(q + 1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i2*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 3//4*i2*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//4*i2*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(1//2*i1*k1 + 1//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//2*i1*k1 + 3//4*i2*k1 + 1//2*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//2*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
        R(1//4*i1*k1 + 1//4*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 1//2*i2*k1 + 1//4*i3*k1)//R(1) => R(1),
        R(3//4*i1*k1 + 3//4*i2*k1 + 3//4*i3*k1)//R(1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q^3 - 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^2 - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//4*i1*k1)//R(1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q^3 - 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^2 - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//4*i1*k1)//R(1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q^3 - 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^2 - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//4*i1*k1)//R(1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q^3 - 1//4*q^2 + 1//4*q - 1//4));
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 1//8*i1*k1)//R(1) => R(1//4*q - 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 4 * q - 1 // 4)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 1 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q^2 - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(-1//2*q - 1//2)); simplify=false),
    S(Dict(R(3//4*i1*k1)//R(1) => R(1//2*q - 1//2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//4*i1*k1)//R(1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 - 1//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(1//4*q^3 + 1//4*q^2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q^3 - 1//4*q^2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(-1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(1//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(3//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 - 1//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q^3 - 1//4*q^2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(1//4*q^3 + 1//4*q^2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(-1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(1//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(3//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 - 1//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(1//4*q^3 + 1//4*q^2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q^3 - 1//4*q^2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(-1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(1//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(3//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) =>
          R(1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4),
      );
      simplify=false,
    ),
    S(
      Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q^3 + 1//4*q^2 - 1//4*q + 1//4));
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q^3 - 1//4*q^2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//2*q^2 - 1//4*q + 1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(1//4*q^3 + 1//4*q^2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(-1//4*q + 1//4)); simplify=false),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(-1 // 2 * q) * q0);
      simplify=false,
    ),
    S(
      Dict(
        R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1//4),
        R(1//8*q*i1*k1 - 1//8*i1*k1 + 1//2*i1)//R(1) => R(-1//4*q),
      );
      simplify=false,
    ),
    S(Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 4), R(1 // 8 * q * i1 * k1 - 1 // 8 * i1 * k1 + 1 // 2 * i1) // R(1) => R(1 // 4 * q)); simplify=false) + S(
      Dict(R(1 // 8 * q * i1 * k1 + 3 // 8 * i1 * k1) // R(1) => R(1 // 2 * q) * q0);
      simplify=false,
    ),
    S(0),
    S(0),
    S(0),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2*q^2 - q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(Dict(R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(-1//2*q + 1//2)); simplify=false),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(-1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(1//2*i1*k1 + 1//2*i2)//R(1) => R(1//2*q),
        R(1//2*i1*k1 + 1//2*i2*k1)//R(1) => R(1//2),
      );
      simplify=false,
    ),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(Dict(R(1//8*q*i1*k1 + 3//8*i1*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(1//2*i2*k1)//R(1) => R(-q + 1)); simplify=false),
    S(Dict(R(1//2*i2*k1)//R(1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(1//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1), R(3//4*i1*k1 + 1//2*i2*k1)//R(1) => R(1)
      );
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
table = reduce(hcat, chars)
classinfo = Vector{Any}[
  [[1, 1, 1], "A_3(q)", 1, [[[1, 1, 1, 1]], 1]],
  [[1, 1, 1], "A_3(q)", 1, [[[2, 1, 1]], 1]],
  [[1, 1, 1], "A_3(q)", 1, [[[2, 2]], 1]],
  [[1, 1, 1], "A_3(q)", 1, [[[2, 2]], 2]],
  [[1, 1, 1], "A_3(q)", 1, [[[3, 1]], 1]],
  [[1, 1, 1], "A_3(q)", 1, [[[4]], 1]],
  [[1, 1, 1], "A_3(q)", 1, [[[4]], 2]],
  [[1, 1, 1], "A_3(q)", 1, [[[4]], 3]],
  [[1, 1, 1], "A_3(q)", 1, [[[4]], 4]],
  [[2, 1, 1], "A_2(q)", q - 1, [[[1, 1, 1]], 1]],
  [[2, 1, 1], "A_2(q)", q - 1, [[[2, 1]], 1]],
  [[2, 1, 1], "A_2(q)", q - 1, [[[3]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[[1, 1], [1, 1]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[[1, 1], [2]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[[2], [1, 1]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[[2], [2]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[[2], [2]], 2]],
  [[3, 1, 2], "A_1(q^2)", q + 1, [[[1, 1]], 1]],
  [[3, 1, 2], "A_1(q^2)", q + 1, [[[2]], 1]],
  [[3, 1, 2], "A_1(q^2)", q + 1, [[[2]], 2]],
  [[4, 1, 1], "A_1(q)", (q - 1)^2, [[[1, 1]], 1]],
  [[4, 1, 1], "A_1(q)", (q - 1)^2, [[[2]], 1]],
  [[4, 1, 2], "A_1(q)", (q - 1) * (q + 1), [[[1, 1]], 1]],
  [[4, 1, 2], "A_1(q)", (q - 1) * (q + 1), [[[2]], 1]],
  [[5, 1, 1], "A_0(q)", (q - 1)^3, [[1], 1]],
  [[5, 1, 2], "A_0(q)", (q + 1) * (q - 1)^2, [[1], 1]],
  [[5, 1, 3], "A_0(q)", (q + 1)^2 * (q - 1), [[1], 1]],
  [[5, 1, 4], "A_0(q)", (q - 1) * (q^2 + q + 1), [[1], 1]],
  [[5, 1, 5], "A_0(q)", (q + 1) * (q^2 + 1), [[1], 1]],
]
classlength = R.([
  1,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1),
  1 * 1//2 * q * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q - 1)^2,
  1 * 1//2 * q * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q - 1)^2,
  q^2 * (q^2 + q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  1 * 1//4 * q^3 * (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^3,
  1 * 1//4 * q^3 * (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^3,
  1 * 1//4 * q^3 * (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^3,
  1 * 1//4 * q^3 * (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^3,
  (q + 1) * (q^2 + 1) * q^3,
  (q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * q^3,
  (q + 1)^2 * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1) * q^4,
  (q^2 + 1) * (q^2 + q + 1) * q^4,
  (q - 1) * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^4,
  (q - 1) * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^4,
  1 * 1//2 * (q + 1)^2 * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1) * q^4,
  1 * 1//2 * (q + 1)^2 * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1) * q^4,
  (q^2 + q + 1) * (q - 1)^2 * q^4,
  1 * 1//2 * (q - 1)^3 * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^4,
  1 * 1//2 * (q - 1)^3 * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^4,
  (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^5,
  (q - 1) * (q + 1)^2 * (q^2 + 1) * (q^2 + q + 1) * q^5,
  (q - 1) * (q^2 + 1) * (q^2 + q + 1) * q^5,
  (q - 1)^2 * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^5,
  (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * q^6,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * q^6,
  (q^2 + 1) * (q^2 + q + 1) * (q - 1)^2 * q^6,
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2 * q^6,
  (q + 1) * (q^2 + q + 1) * (q - 1)^3 * q^6,
])
charinfo = Vector{Any}[
  [[1, 1, 1], "A_3(q)", 1, [[1, 1, 1, 1]], [1, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", 1, [[2, 1, 1]], [2, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", 1, [[2, 2]], [3, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", 1, [[3, 1]], [4, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", 1, [[4]], [5, 1], "irreducible "],
  [[2, 1, 1], "A_2(q)", q - 1, [[1, 1, 1]], [1, 1], "irreducible "],
  [[2, 1, 1], "A_2(q)", q - 1, [[2, 1]], [2, 1], "irreducible "],
  [[2, 1, 1], "A_2(q)", q - 1, [[3]], [3, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[1, 1], [1, 1]], [1, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[1, 1], [2]], [2, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[2], [1, 1]], [3, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", q - 1, [[2], [2]], [4, 1], "irreducible "],
  [[3, 1, 2], "A_1(q^2)", q + 1, [[1, 1]], [1, 1], "irreducible "],
  [[3, 1, 2], "A_1(q^2)", q + 1, [[2]], [2, 1], "irreducible "],
  [
    [3, 2, 1],
    "(A_1(q) + A_1(q)).2",
    1,
    [[1, 1], [1, 1]],
    [1, 1],
    "constituent 1 of 2 of the almost character 15",
  ],
  [
    [3, 2, 1],
    "(A_1(q) + A_1(q)).2",
    1,
    [[1, 1], [2]],
    [2, 1],
    "irreducible, equal to the almost character 17",
  ],
  [
    [3, 2, 1],
    "(A_1(q) + A_1(q)).2",
    1,
    [[1, 1], [1, 1]],
    [1, 1],
    "constituent 2 of 2 of the almost character 15",
  ],
  [
    [3, 2, 1],
    "(A_1(q) + A_1(q)).2",
    1,
    [[2], [2]],
    [4, 1],
    "constituent 1 of 2 of the almost character 18",
  ],
  [
    [3, 2, 1],
    "(A_1(q) + A_1(q)).2",
    1,
    [[2], [2]],
    [4, 1],
    "constituent 2 of 2 of the almost character 18",
  ],
  [
    [3, 2, 2],
    "A_1(q^2).2",
    1,
    [[1, 1]],
    [1, 1],
    "constituent 1 of 2 of the almost character 20",
  ],
  [
    [3, 2, 2],
    "A_1(q^2).2",
    1,
    [[2]],
    [2, 1],
    "constituent 1 of 2 of the almost character 21",
  ],
  [
    [3, 2, 2],
    "A_1(q^2).2",
    1,
    [[1, 1]],
    [1, 1],
    "constituent 2 of 2 of the almost character 20",
  ],
  [
    [3, 2, 2],
    "A_1(q^2).2",
    1,
    [[2]],
    [2, 1],
    "constituent 2 of 2 of the almost character 21",
  ],
  [[4, 1, 1], "A_1(q)", q^2 - 2*q + 1, [[1, 1]], [1, 1], "irreducible "],
  [[4, 1, 1], "A_1(q)", q^2 - 2*q + 1, [[2]], [2, 1], "irreducible "],
  [[4, 1, 2], "A_1(q)", q^2 - 1, [[1, 1]], [1, 1], "irreducible "],
  [[4, 1, 2], "A_1(q)", q^2 - 1, [[2]], [2, 1], "irreducible "],
  [[5, 1, 1], "A_0(q)", q^3 - 3*q^2 + 3*q - 1, [[1]], [1, 1], "irreducible "],
  [[5, 1, 2], "A_0(q)", q^3 - q^2 - q + 1, [[1]], [1, 1], "irreducible "],
  [[5, 1, 3], "A_0(q)", q^3 + q^2 - q - 1, [[1]], [1, 1], "irreducible "],
  [[5, 1, 4], "A_0(q)", q^3 - 1, [[1]], [1, 1], "irreducible "],
  [[5, 1, 5], "A_0(q)", q^3 + q^2 + q + 1, [[1]], [1, 1], "irreducible "],
  [
    [5, 2, 1],
    "A_0(q).2",
    q - 1,
    [[1]],
    [1, 1],
    "constituent 1 of 2 of the almost character 33",
  ],
  [
    [5, 2, 1],
    "A_0(q).2",
    q - 1,
    [[1]],
    [1, 1],
    "constituent 2 of 2 of the almost character 33",
  ],
  [
    [5, 2, 2],
    "A_0(q).2",
    q - 1,
    [[1]],
    [1, 1],
    "constituent 1 of 2 of the almost character 35",
  ],
  [
    [5, 2, 2],
    "A_0(q).2",
    q - 1,
    [[1]],
    [1, 1],
    "constituent 2 of 2 of the almost character 35",
  ],
  [
    [5, 2, 3],
    "A_0(q).2",
    q + 1,
    [[1]],
    [1, 1],
    "constituent 1 of 2 of the almost character 37",
  ],
  [
    [5, 2, 3],
    "A_0(q).2",
    q + 1,
    [[1]],
    [1, 1],
    "constituent 2 of 2 of the almost character 37",
  ],
  [
    [5, 2, 4],
    "A_0(q).2",
    q + 1,
    [[1]],
    [1, 1],
    "constituent 1 of 2 of the almost character 39",
  ],
  [
    [5, 2, 4],
    "A_0(q).2",
    q + 1,
    [[1]],
    [1, 1],
    "constituent 2 of 2 of the almost character 39",
  ],
  [
    [5, 2, 5],
    "A_0(q).2",
    q - 1,
    [[1]],
    [1, 1],
    "constituent 1 of 2 of the almost character 41",
  ],
  [
    [5, 2, 5],
    "A_0(q).2",
    q - 1,
    [[1]],
    [1, 1],
    "constituent 2 of 2 of the almost character 41",
  ],
  [
    [5, 3, 1], "A_0(q).4", 1, [[1]], [1, 1], "constituent 1 of 4 of the almost character 43"
  ],
  [
    [5, 3, 1], "A_0(q).4", 1, [[1]], [1, 1], "constituent 2 of 4 of the almost character 43"
  ],
  [
    [5, 3, 1], "A_0(q).4", 1, [[1]], [1, 1], "constituent 3 of 4 of the almost character 43"
  ],
  [
    [5, 3, 1], "A_0(q).4", 1, [[1]], [1, 1], "constituent 4 of 4 of the almost character 43"
  ],
  [
    [5, 3, 2], "A_0(q).4", 1, [[1]], [1, 1], "constituent 1 of 4 of the almost character 47"
  ],
  [
    [5, 3, 2], "A_0(q).4", 1, [[1]], [1, 1], "constituent 2 of 4 of the almost character 47"
  ],
  [
    [5, 3, 2], "A_0(q).4", 1, [[1]], [1, 1], "constituent 3 of 4 of the almost character 47"
  ],
  [
    [5, 3, 2], "A_0(q).4", 1, [[1]], [1, 1], "constituent 4 of 4 of the almost character 47"
  ],
  [
    [5, 3, 3], "A_0(q).4", 1, [[1]], [1, 1], "constituent 1 of 4 of the almost character 51"
  ],
  [
    [5, 3, 3], "A_0(q).4", 1, [[1]], [1, 1], "constituent 2 of 4 of the almost character 51"
  ],
  [
    [5, 3, 3], "A_0(q).4", 1, [[1]], [1, 1], "constituent 3 of 4 of the almost character 51"
  ],
  [
    [5, 3, 3], "A_0(q).4", 1, [[1]], [1, 1], "constituent 4 of 4 of the almost character 51"
  ],
]
chardegree = R.([
  q^6,
  q^5 + q^4 + q^3,
  q^4 + q^2,
  q^3 + q^2 + q,
  1,
  q^6 + q^5 + q^4 + q^3,
  q^5 + 2*q^4 + 2*q^3 + 2*q^2 + q,
  q^3 + q^2 + q + 1,
  q^6 + q^5 + 2*q^4 + q^3 + q^2,
  q^5 + q^4 + 2*q^3 + q^2 + q,
  q^5 + q^4 + 2*q^3 + q^2 + q,
  q^4 + q^3 + 2*q^2 + q + 1,
  q^6 - q^5 - q^3 + q^2,
  q^4 - q^3 - q + 1,
  1//2*q^6 + 1//2*q^5 + q^4 + 1//2*q^3 + 1//2*q^2,
  q^5 + q^4 + 2*q^3 + q^2 + q,
  1//2*q^6 + 1//2*q^5 + q^4 + 1//2*q^3 + 1//2*q^2,
  1//2*q^4 + 1//2*q^3 + q^2 + 1//2*q + 1//2,
  1//2*q^4 + 1//2*q^3 + q^2 + 1//2*q + 1//2,
  1//2*q^6 - 1//2*q^5 - 1//2*q^3 + 1//2*q^2,
  1//2*q^4 - 1//2*q^3 - 1//2*q + 1//2,
  1//2*q^6 - 1//2*q^5 - 1//2*q^3 + 1//2*q^2,
  1//2*q^4 - 1//2*q^3 - 1//2*q + 1//2,
  q^6 + 2*q^5 + 3*q^4 + 3*q^3 + 2*q^2 + q,
  q^5 + 2*q^4 + 3*q^3 + 3*q^2 + 2*q + 1,
  q^6 + q^4 - q^3 - q,
  q^5 + q^3 - q^2 - 1,
  q^6 + 3*q^5 + 5*q^4 + 6*q^3 + 5*q^2 + 3*q + 1,
  q^6 + q^5 + q^4 - q^2 - q - 1,
  q^6 - q^5 + q^4 - 2*q^3 + q^2 - q + 1,
  q^6 - q^4 - q^2 + 1,
  q^6 - q^5 - q^4 + q^2 + q - 1,
  1//2*q^6 + 3//2*q^5 + 5//2*q^4 + 3*q^3 + 5//2*q^2 + 3//2*q + 1//2,
  1//2*q^6 + 3//2*q^5 + 5//2*q^4 + 3*q^3 + 5//2*q^2 + 3//2*q + 1//2,
  1//2*q^6 + 1//2*q^5 + 1//2*q^4 - 1//2*q^2 - 1//2*q - 1//2,
  1//2*q^6 + 1//2*q^5 + 1//2*q^4 - 1//2*q^2 - 1//2*q - 1//2,
  1//2*q^6 - 1//2*q^5 - 1//2*q^4 + 1//2*q^2 + 1//2*q - 1//2,
  1//2*q^6 - 1//2*q^5 - 1//2*q^4 + 1//2*q^2 + 1//2*q - 1//2,
  1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2,
  1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2,
  1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2,
  1//2*q^6 - 1//2*q^5 + 1//2*q^4 - q^3 + 1//2*q^2 - 1//2*q + 1//2,
  1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4,
  1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4,
  1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4,
  1//4*q^6 + 3//4*q^5 + 5//4*q^4 + 3//2*q^3 + 5//4*q^2 + 3//4*q + 1//4,
  1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4,
  1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4,
  1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4,
  1//4*q^6 - 1//4*q^5 - 1//4*q^4 + 1//4*q^2 + 1//4*q - 1//4,
  1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4,
  1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4,
  1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4,
  1//4*q^6 - 1//4*q^5 + 1//4*q^4 - 1//2*q^3 + 1//4*q^2 - 1//4*q + 1//4,
])

# The sums over a class or character type are built from sums over the
# centralizer types of the Maple source, which call each other.
class_center_sums = Dict{Tuple{Int,Int,Int},Function}()
class_center_sums[(3, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, 1)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(tt, [i1, i2], R.([3 * i1 * (q - 1) * 1//4, -i1]))
  )
  erg - ss1n1
end
class_center_sums[(5, 1, 3)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^2 - 2)
  erg = nesum(erg, i2, 0, q)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(tt, [i1, i2], R.([3 * i1 * (q - 1) * (q + 1) * 1//4, -i1 * (q + 1) * 1//2]))
  )
  ss2n1 = class_center_sums[(3, 1, 1)](
    evaluate(tt, [i2, i1], R.([(q + 1) * i2 * 1//2, i1 * (q + 1)]))
  )
  ss3n1 = class_center_sums[(3, 1, 2)](
    evaluate(tt, [i1, i2], R.([i1 * (q - 1) * 1//2, -i1 * (q + 1) * 1//2]))
  )
  ss3n2 = class_center_sums[(3, 1, 2)](
    evaluate(tt, [i2, i1], R.([-i1, i1 * (q - 1) * 1//2]))
  )
  ss4n1 = class_center_sums[(4, 1, 2)](
    evaluate(tt, [i2, i1], R.([i1 - i2, i2 * q - i2 + 2 * i1]))
  )
  ss4n2 = class_center_sums[(4, 1, 2)](
    evaluate(tt, [i2, i1], R.([-i1 + i2, -i1 * (q + 1)]))
  )
  erg - ss1n1 - ss2n1 - ss3n1 - ss3n2 - ss4n1 - ss4n2
end
class_center_sums[(5, 1, 5)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^3 + q^2 + q)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(tt, [i1], R.([i1 * (q + 1) * (q^2 + 1) * 1//4]))
  )
  ss2n1 = class_center_sums[(3, 1, 2)](evaluate(tt, [i1], R.([-q * i1 * (q^2 + 1) * 1//2])))
  erg - ss1n1 - ss2n1
end
class_center_sums[(5, 1, 4)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^3 - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(tt, [i1], R.([i1 * (q - 1) * (q^2 + q + 1) * 1//4]))
  )
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i1], R.([i1 * (q^2 + q + 1)])))
  erg - ss1n1 - ss2n1
end
class_center_sums[(4, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(tt, [i2, i1], R.([3 * i1 * (q - 1) * 1//4, i1 * (q - 1) * 1//4]))
  )
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i1, i2], R.([i1, 3 * i1])))
  ss2n2 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i1], R.([-i1, i1])))
  ss3n1 = class_center_sums[(3, 1, 1)](
    evaluate(tt, [i1, i2], R.([1 * 1//2 * i2 * q - 1 * 1//2 * i2 + i1, i1]))
  )
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1
end
class_center_sums[(3, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, 2 * q + 1)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i1], R.([3 * i1 * (q + 1) * 1//2])))
  erg - ss1n1
end
class_center_sums[(1, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, 3)
  erg
end
class_center_sums[(4, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(tt, [i2, i1], R.([(3 * q + 1) * i1 * 1//4, i1 * (q - 1) * 1//4]))
  )
  ss2n1 = class_center_sums[(3, 1, 1)](
    evaluate(tt, [i2, i1], R.([i1 - i2, 1 * 1//2 * i2 * q - 1 * 1//2 * i2 + i1]))
  )
  erg - ss1n1 - ss2n1
end
class_center_sums[(5, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q - 2)
  erg = nesum(erg, i3, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(
      tt,
      [i2, i3, i1],
      R.([i1 * (q - 1) * 1//2, 3 * i1 * (q - 1) * 1//4, i1 * (q - 1) * 1//4]),
    ),
  )
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i1, i3, i2], R.([i1, 3 * i1, 2 * i1])))
  ss2n2 = class_center_sums[(2, 1, 1)](evaluate(tt, [i1, i2, i3], R.([i1, 2 * i1, -i1])))
  ss2n3 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i1, i3], R.([-2 * i1, i1, -i1])))
  ss2n4 = class_center_sums[(2, 1, 1)](
    evaluate(tt, [i2, i1, i3], R.([-2 * i1, -3 * i1, -i1]))
  )
  ss3n1 = class_center_sums[(3, 1, 1)](
    evaluate(tt, [i2, i3, i1], R.([2 * i1, i1, 1 * 1//2 * i2 * q - 1 * 1//2 * i2 + i1]))
  )
  ss3n2 = class_center_sums[(3, 1, 1)](
    evaluate(
      tt,
      [i2, i3, i1],
      R.([i2 * (q - 1) * 1//2, i1, 1 * 1//2 * i2 * q - 1 * 1//2 * i2 + i1]),
    ),
  )
  ss3n3 = class_center_sums[(3, 1, 1)](
    evaluate(tt, [i2, i3, i1], R.([i2 * (q - 1) * 1//2, i1, -i1]))
  )
  ss4n1 = class_center_sums[(4, 1, 1)](evaluate(tt, [i1, i2, i3], R.([i1, 2 * i1, i2])))
  ss4n2 = class_center_sums[(4, 1, 1)](evaluate(tt, [i2, i1, i3], R.([-i1 + i2, i1, i2])))
  ss4n3 = class_center_sums[(4, 1, 1)](
    evaluate(tt, [i2, i3, i1], R.([-i1 + i2, i2, -2 * i1 + i2]))
  )
  ss4n4 = class_center_sums[(4, 1, 1)](evaluate(tt, [i2, i1, i3], R.([-i1 + i2, i1, -i1])))
  ss4n5 = class_center_sums[(4, 1, 1)](
    evaluate(tt, [i2, i1, i3], R.([-i1 + i2, -2 * i1 + i2, -i1]))
  )
  ss4n6 = class_center_sums[(4, 1, 1)](
    evaluate(tt, [i2, i1, i3], R.([-2 * i1, -2 * i1 + i2, -i1]))
  )
  erg - ss1n1 - ss2n1 - ss2n2 - ss2n3 - ss2n4 - ss3n1 - ss3n2 - ss3n3 - ss4n1 - ss4n2 -
  ss4n3 - ss4n4 - ss4n5 - ss4n6
end
class_center_sums[(2, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i1], R.([i1 * (q - 1) * 1//4])))
  erg - ss1n1
end
class_center_sums[(5, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^2 - 2)
  erg = nesum(erg, i2, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](
    evaluate(tt, [i2, i1], R.([3 * i1 * (q - 1) * 1//4, i1 * (q - 1) * (q + 1) * 1//4]))
  )
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i1], R.([3 * i1, i1 * (q + 1)])))
  ss2n2 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i1], R.([-i1, i1 * (q + 1)])))
  ss3n1 = class_center_sums[(3, 1, 1)](
    evaluate(tt, [i2, i1], R.([i1, (i2 * q - i2 + 2 * i1) * (q + 1) * 1//2]))
  )
  ss4n1 = class_center_sums[(4, 1, 1)](evaluate(tt, [i2, i1], R.([i2, i1 * (q + 1)])))
  ss5n1 = class_center_sums[(4, 1, 2)](
    evaluate(tt, [i2, i1], R.([-i1, -2 * i1 * q + i2 * q - i2]))
  )
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1 - ss4n1 - ss5n1
end

char_center_sums = Dict{Tuple{Int,Int,Int},Function}()
char_center_sums[(3, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 2, 1)](evaluate(tt, [k1], R.([k1 * (q - 1) * 1//2])))
  erg - ss1n1 - ss2n1
end
char_center_sums[(5, 1, 3)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q)
  erg = nesum(erg, k2, 0, q^2 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k2, k1], R.([0, 0])))
  ss2n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k1], R.([k1 * (q + 1), 0])))
  ss3n1 = char_center_sums[(3, 1, 2)](evaluate(tt, [k1, k2], R.([k1, -k1 * (q - 1)])))
  ss3n2 = char_center_sums[(3, 1, 2)](evaluate(tt, [k2, k1], R.([0, k1])))
  ss4n1 = char_center_sums[(3, 2, 1)](
    evaluate(tt, [k2, k1], R.([k1 * (q - 1) * (q + 1) * 1//2, 0]))
  )
  ss5n1 = char_center_sums[(3, 2, 2)](
    evaluate(tt, [k1, k2], R.([k1 * (q + 1) * 1//2, -k1 * (q - 1) * (q + 1) * 1//2]))
  )
  ss5n2 = char_center_sums[(3, 2, 2)](evaluate(tt, [k1, k2], R.([k1 * (q + 1) * 1//2, 0])))
  ss6n1 = char_center_sums[(4, 1, 2)](evaluate(tt, [k2, k1], R.([k1, k1])))
  ss6n2 = char_center_sums[(4, 1, 2)](evaluate(tt, [k1, k2], R.([0, -k1 * q])))
  ss7n1 = char_center_sums[(5, 2, 4)](
    evaluate(tt, [k1, k2], R.([k2 - 1 * 1//2 * k1 * q - 1 * 1//2 * k1, -k2 * (q - 1)]))
  )
  ss7n2 = char_center_sums[(5, 2, 4)](
    evaluate(
      tt,
      [k2, k1],
      R.([k1 * (q - 1) * (q + 1) * 1//2, k2 - 1 * 1//2 * k1 * q - 1 * 1//2 * k1]),
    ),
  )
  ss8n1 = char_center_sums[(5, 2, 5)](
    evaluate(tt, [k2, k1], R.([k2 * (q + 1), -k1 * (q + 1) * 1//2]))
  )
  ss9n1 = char_center_sums[(5, 3, 3)](
    evaluate(tt, [k2, k1], R.([-k1 * (q - 1) * (q + 1) * 1//4, -k1 * (q + 1) * 1//2]))
  )
  ss10n1 = char_center_sums[(5, 3, 5)](
    evaluate(tt, [k2, k1], R.([k1 * (q - 1) * (q + 1) * 1//2, -k1 * (q + 1) * 1//2]))
  )
  ss10n2 = char_center_sums[(5, 3, 5)](evaluate(tt, [k1, k2], R.([k1 * (q + 1) * 1//2, 0])))
  erg - ss1n1 - ss2n1 - ss3n1 - ss3n2 - ss4n1 - ss5n1 - ss5n2 - ss6n1 - ss6n2 - ss7n1 -
  ss7n2 - ss8n1 - ss9n1 - ss10n1 - ss10n2
end
char_center_sums[(5, 3, 5)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  zero(tt)
end
char_center_sums[(5, 1, 5)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^3 + q^2 + q)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 1, 2)](evaluate(tt, [k1], R.([k1 * (q^2 + 1)])))
  ss3n1 = char_center_sums[(3, 2, 2)](
    evaluate(tt, [k1], R.([k1 * (q + 1) * (q^2 + 1) * 1//2]))
  )
  ss4n1 = char_center_sums[(5, 2, 3)](evaluate(tt, [k1], R.([k1 * (q^2 + 1) * 1//2])))
  ss5n1 = char_center_sums[(5, 3, 2)](
    evaluate(tt, [k1], R.([3 * k1 * (q + 1) * (q^2 + 1) * 1//4]))
  )
  erg - ss1n1 - ss2n1 - ss3n1 - ss4n1 - ss5n1
end
char_center_sums[(5, 2, 5)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 1)
  erg = nesum(erg, k2, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1, k2], R.([0, 0])))
  ss2n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k1, k2], R.([0, k1])))
  ss3n1 = char_center_sums[(3, 2, 1)](evaluate(tt, [k1, k2], R.([0, k1 * (q - 1) * 1//2])))
  ss4n1 = char_center_sums[(3, 2, 2)](
    evaluate(tt, [k1, k2], R.([k1, -k1 * (q - 1) * 1//2]))
  )
  ss4n2 = char_center_sums[(3, 2, 2)](evaluate(tt, [k2, k1], R.([0, k1])))
  ss5n1 = char_center_sums[(5, 3, 3)](
    evaluate(tt, [k1, k2], R.([k1, -k1 * (q - 1) * 1//4]))
  )
  erg - ss1n1 - ss2n1 - ss3n1 - ss4n1 - ss4n2 - ss5n1
end
char_center_sums[(3, 2, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 1)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  erg - ss1n1
end
char_center_sums[(5, 1, 4)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^3 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k1], R.([k1 * (q^2 + q + 1)])))
  erg - ss1n1 - ss2n1
end
char_center_sums[(4, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1, k2], R.([0, 0])))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k1, k2], R.([k1, 0])))
  ss2n2 = char_center_sums[(2, 1, 1)](evaluate(tt, [k1, k2], R.([-k1, k1])))
  ss3n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k1, k2], R.([0, k1])))
  ss4n1 = char_center_sums[(3, 2, 1)](evaluate(tt, [k1, k2], R.([0, k1 * (q - 1) * 1//2])))
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1 - ss4n1
end
char_center_sums[(3, 2, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 1)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  erg - ss1n1
end
char_center_sums[(3, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 2, 2)](evaluate(tt, [k1], R.([k1 * (q + 1) * 1//2])))
  erg - ss1n1 - ss2n1
end
char_center_sums[(1, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg
end
char_center_sums[(4, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^2 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k1], R.([k1 * (q + 1)])))
  ss3n1 = char_center_sums[(3, 2, 1)](
    evaluate(tt, [k1], R.([k1 * (q - 1) * (q + 1) * 1//2]))
  )
  erg - ss1n1 - ss2n1 - ss3n1
end
char_center_sums[(5, 3, 3)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 3)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 2, 1)](evaluate(tt, [k1], R.([2 * k1])))
  erg - ss1n1 - ss2n1
end
char_center_sums[(5, 3, 4)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  zero(tt)
end
char_center_sums[(5, 2, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 2 * q - 3)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k1], R.([2 * k1])))
  ss3n1 = char_center_sums[(3, 2, 1)](evaluate(tt, [k1], R.([k1 * (q - 1)])))
  ss4n1 = char_center_sums[(5, 3, 4)](evaluate(tt, [k1], R.([-k1 * (q - 1)])))
  erg - ss1n1 - ss2n1 - ss3n1 - ss4n1
end
char_center_sums[(5, 3, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 3)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 2, 2)](evaluate(tt, [k1], R.([2 * k1])))
  erg - ss1n1 - ss2n1
end
char_center_sums[(5, 2, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 1)
  erg = nesum(erg, k2, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k2, k1], R.([0, 0])))
  ss2n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k1], R.([k1, 0])))
  ss3n1 = char_center_sums[(3, 2, 1)](evaluate(tt, [k2, k1], R.([k1 * (q - 1) * 1//2, 0])))
  ss3n2 = char_center_sums[(3, 2, 1)](
    evaluate(tt, [k2, k1], R.([-k1 * (q - 1) * 1//2, k1]))
  )
  ss3n3 = char_center_sums[(3, 2, 1)](evaluate(tt, [k2, k1], R.([0, k1])))
  ss4n1 = char_center_sums[(5, 3, 1)](
    evaluate(tt, [k1, k2], R.([k1, -k1 * (q - 1) * 1//4]))
  )
  erg - ss1n1 - ss2n1 - ss3n1 - ss3n2 - ss3n3 - ss4n1
end
char_center_sums[(5, 3, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 3)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 2, 1)](evaluate(tt, [k1], R.([2 * k1])))
  erg - ss1n1 - ss2n1
end
char_center_sums[(5, 2, 4)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 1)
  erg = nesum(erg, k2, 0, q)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1, k2], R.([0, 0])))
  ss2n1 = char_center_sums[(3, 1, 2)](evaluate(tt, [k1, k2], R.([0, k1])))
  ss3n1 = char_center_sums[(3, 2, 1)](
    evaluate(tt, [k2, k1], R.([-k1 * (q + 1) * 1//2, k1]))
  )
  ss4n1 = char_center_sums[(3, 2, 2)](evaluate(tt, [k1, k2], R.([0, k1 * (q + 1) * 1//2])))
  ss4n2 = char_center_sums[(3, 2, 2)](evaluate(tt, [k2, k1], R.([0, k1])))
  ss5n1 = char_center_sums[(5, 3, 5)](
    evaluate(tt, [k1, k2], R.([2 * k1, -k1 * (q + 1) * 1//2]))
  )
  erg - ss1n1 - ss2n1 - ss3n1 - ss4n1 - ss4n2 - ss5n1
end
char_center_sums[(5, 2, 3)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, 2 * q + 1)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  ss2n1 = char_center_sums[(3, 1, 2)](evaluate(tt, [k1], R.([2 * k1])))
  ss3n1 = char_center_sums[(3, 2, 2)](evaluate(tt, [k1], R.([k1 * (q + 1)])))
  ss4n1 = char_center_sums[(5, 3, 2)](evaluate(tt, [k1], R.([-k1 * (q + 1) * 1//2])))
  erg - ss1n1 - ss2n1 - ss3n1 - ss4n1
end
char_center_sums[(5, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q - 2)
  erg = nesum(erg, k3, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1, k2, k3], R.([0, 0, 0])))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k1, k3, k2], R.([0, k1, 0])))
  ss2n2 = char_center_sums[(2, 1, 1)](evaluate(tt, [k1, k3, k2], R.([0, -k1, k1])))
  ss2n3 = char_center_sums[(2, 1, 1)](evaluate(tt, [k1, k3, k2], R.([k1, 0, -k1])))
  ss2n4 = char_center_sums[(2, 1, 1)](evaluate(tt, [k2, k3, k1], R.([0, 0, -k1])))
  ss3n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k1, k3, k2], R.([0, 0, k1])))
  ss3n2 = char_center_sums[(3, 1, 1)](evaluate(tt, [k1, k3, k2], R.([k1, k1, -k1])))
  ss3n3 = char_center_sums[(3, 1, 1)](evaluate(tt, [k3, k2, k1], R.([k1, 0, -k1])))
  ss4n1 = char_center_sums[(3, 2, 1)](
    evaluate(tt, [k1, k3, k2], R.([0, 0, k1 * (q - 1) * 1//2]))
  )
  ss4n2 = char_center_sums[(3, 2, 1)](
    evaluate(
      tt,
      [k1, k3, k2],
      R.([k1 * (q - 1) * 1//2, k1 * (q - 1) * 1//2, -k1 * (q - 1) * 1//2]),
    ),
  )
  ss4n3 = char_center_sums[(3, 2, 1)](
    evaluate(tt, [k2, k3, k1], R.([0, k1 * (q - 1) * 1//2, -k1 * (q - 1) * 1//2]))
  )
  ss5n1 = char_center_sums[(4, 1, 1)](evaluate(tt, [k1, k3, k2], R.([0, k1, k2])))
  ss5n2 = char_center_sums[(4, 1, 1)](evaluate(tt, [k1, k2, k3], R.([k2, -k2, k2 + k1])))
  ss5n3 = char_center_sums[(4, 1, 1)](evaluate(tt, [k2, k1, k3], R.([0, -k2, k2 + k1])))
  ss5n4 = char_center_sums[(4, 1, 1)](evaluate(tt, [k1, k3, k2], R.([k2, -k2 - k1, k1])))
  ss5n5 = char_center_sums[(4, 1, 1)](
    evaluate(tt, [k2, k1, k3], R.([k2 + k1, -k2, -k2 - k1]))
  )
  ss5n6 = char_center_sums[(4, 1, 1)](evaluate(tt, [k1, k2, k3], R.([k1, -k2 - k1, 0])))
  ss6n1 = char_center_sums[(5, 2, 1)](
    evaluate(tt, [k1, k3, k2], R.([k1 * (q - 1) * 1//2, -k1 * (q - 1) * 1//2, k2]))
  )
  ss6n2 = char_center_sums[(5, 2, 1)](
    evaluate(
      tt,
      [k2, k1, k3],
      R.([
        -k2,
        1 * 1//2 * k1 * q - 1 * 1//2 * k1 + k2,
        k2 - 1 * 1//2 * k1 * q + 1 * 1//2 * k1,
      ]),
    ),
  )
  ss6n3 = char_center_sums[(5, 2, 1)](
    evaluate(
      tt,
      [k1, k2, k3],
      R.([
        -1 * 1//2 * k1 * q + 1 * 1//2 * k1 - k2,
        k1 * (q - 1) * 1//2,
        k2 - 1 * 1//2 * k1 * q + 1 * 1//2 * k1,
      ]),
    ),
  )
  ss7n1 = char_center_sums[(5, 3, 1)](
    evaluate(
      tt,
      [k3, k1, k2],
      R.([-3 * k1 * (q - 1) * 1//4, k1 * (q - 1) * 1//4, k1 * (q - 1) * 1//4]),
    ),
  )
  ss7n2 = char_center_sums[(5, 3, 1)](
    evaluate(
      tt,
      [k1, k3, k2],
      R.([k1 * (q - 1) * 1//2, -k1 * (q - 1) * 1//2, -k1 * (q - 1) * 1//4]),
    ),
  )
  ss7n3 = char_center_sums[(5, 3, 1)](
    evaluate(
      tt,
      [k2, k3, k1],
      R.([-k1 * (q - 1) * 1//2, 3 * k1 * (q - 1) * 1//4, k1 * (q - 1) * 1//4]),
    ),
  )
  erg - ss1n1 - ss2n1 - ss2n2 - ss2n3 - ss2n4 - ss3n1 - ss3n2 - ss3n3 - ss4n1 - ss4n2 -
  ss4n3 - ss5n1 - ss5n2 - ss5n3 - ss5n4 - ss5n5 - ss5n6 - ss6n1 - ss6n2 - ss6n3 - ss7n1 -
  ss7n2 - ss7n3
end
char_center_sums[(2, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], R.([0])))
  erg - ss1n1
end
char_center_sums[(5, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q^2 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k2, k1], R.([0, 0])))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k2, k1], R.([0, k1])))
  ss2n2 = char_center_sums[(2, 1, 1)](evaluate(tt, [k1, k2], R.([-k1, k1 * (q + 1)])))
  ss3n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k1], R.([k1 * (q + 1), 0])))
  ss4n1 = char_center_sums[(3, 2, 1)](
    evaluate(tt, [k2, k1], R.([k1 * (q - 1) * (q + 1) * 1//2, 0]))
  )
  ss5n1 = char_center_sums[(4, 1, 1)](evaluate(tt, [k2, k1], R.([k2 * (q + 1), k1])))
  ss6n1 = char_center_sums[(4, 1, 2)](evaluate(tt, [k1, k2], R.([0, -k1 * q])))
  ss7n1 = char_center_sums[(5, 2, 2)](
    evaluate(tt, [k1, k2], R.([k1 * (q - 1) * 1//2, -k1 * (q + 1) * 1//2]))
  )
  ss8n1 = char_center_sums[(5, 3, 4)](
    evaluate(tt, [k1, k2], R.([0, -k1 * (q - 1) * (q + 1) * 1//2]))
  )
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1 - ss4n1 - ss5n1 - ss6n1 - ss7n1 - ss8n1
end

classsums = Function[
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(2, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(2, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    class_center_sums[(2, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(3, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(4, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(4, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(4, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * class_center_sums[(4, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//24 * class_center_sums[(5, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * class_center_sums[(5, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//8 * class_center_sums[(5, 1, 3)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//3 * class_center_sums[(5, 1, 4)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * class_center_sums[(5, 1, 5)](tt)
  end,
]

charsums = Function[
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(1, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(2, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(2, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(2, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(3, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(3, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(3, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(3, 2, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(4, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(4, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(4, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(4, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//24 * char_center_sums[(5, 1, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * char_center_sums[(5, 1, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//8 * char_center_sums[(5, 1, 3)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//3 * char_center_sums[(5, 1, 4)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * char_center_sums[(5, 1, 5)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * char_center_sums[(5, 2, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * char_center_sums[(5, 2, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 2, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 2, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 2, 3)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 2, 3)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 2, 4)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 2, 4)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * char_center_sums[(5, 2, 5)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//4 * char_center_sums[(5, 2, 5)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 1)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(5, 3, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(5, 3, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(5, 3, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    char_center_sums[(5, 3, 2)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 3)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 3)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 3)](tt)
  end,
  function (tt::Union{GenericCyclo,GenericCycloFrac})
    1//2 * char_center_sums[(5, 3, 3)](tt)
  end,
]

classparams = [
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, R(4))]),
  Parameters([Parameter(i1, q - 1)], [((i1) * 1//R(1 * 1//4 * q - 1 * 1//4))]),
  Parameters([Parameter(i1, q - 1)], [((i1) * 1//R(1 * 1//4 * q - 1 * 1//4))]),
  Parameters([Parameter(i1, q - 1)], [((i1) * 1//R(1 * 1//4 * q - 1 * 1//4))]),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, R(2))],
    [((i1 + 1//4*i2*q - 1//4*i2) * 1//R(1 * 1//2 * q - 1 * 1//2))],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, R(2))],
    [((i1 + 1//4*i2*q - 1//4*i2) * 1//R(1 * 1//2 * q - 1 * 1//2))],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, R(2))],
    [((i1 + 1//4*i2*q - 1//4*i2) * 1//R(1 * 1//2 * q - 1 * 1//2))],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, R(2))],
    [((i1 + 1//4*i2*q - 1//4*i2) * 1//R(1 * 1//2 * q - 1 * 1//2))],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, R(2))],
    [((i1 + 1//4*i2*q - 1//4*i2) * 1//R(1 * 1//2 * q - 1 * 1//2))],
  ),
  Parameters(
    [Parameter(i1, 2 * q + 2)], [((1//4*i1*q + 3//4*i1) * 1//R(1 * 1//2 * q + 1 * 1//2))]
  ),
  Parameters(
    [Parameter(i1, 2 * q + 2)], [((1//4*i1*q + 3//4*i1) * 1//R(1 * 1//2 * q + 1 * 1//2))]
  ),
  Parameters(
    [Parameter(i1, 2 * q + 2)], [((1//4*i1*q + 3//4*i1) * 1//R(1 * 1//2 * q + 1 * 1//2))]
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q - 1)],
    [
      ((3*i1 - i2) * 1//R(q - 1)),
      ((-i1 + i2) * 1//R(1 * 1//2 * q - 1 * 1//2)),
      ((i1 + i2) * 1//R(q - 1)),
    ],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q - 1)],
    [
      ((3*i1 - i2) * 1//R(q - 1)),
      ((-i1 + i2) * 1//R(1 * 1//2 * q - 1 * 1//2)),
      ((i1 + i2) * 1//R(q - 1)),
    ],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q + 1)],
    [
      ((3//4*i1*q + 1//4*i1 - 1//4*i2*q + 1//4*i2) * 1//R(1 * 1//4 * q^2 - 1 * 1//4)),
      ((-i1 + i2) * 1//R(1 * 1//2 * q + 1 * 1//2)),
    ],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q + 1)],
    [
      ((3//4*i1*q + 1//4*i1 - 1//4*i2*q + 1//4*i2) * 1//R(1 * 1//4 * q^2 - 1 * 1//4)),
      ((-i1 + i2) * 1//R(1 * 1//2 * q + 1 * 1//2)),
    ],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q - 1), Parameter(i3, q - 1)],
    [
      ((2*i1 - i2) * 1//R(q - 1)),
      ((-i1 + 2*i2 - i3) * 1//R(q - 1)),
      ((-i2 + 2*i3) * 1//R(q - 1)),
      ((i1 + i2 - i3) * 1//R(q - 1)),
      ((-i1 + i2 + i3) * 1//R(q - 1)),
      ((i1 + i3) * 1//R(q - 1)),
    ],
  ),
  Parameters(
    [Parameter(i1, q^2 - 1), Parameter(i2, q - 1)],
    [((-i1) * 1//R(q + 1)), ((-i1 + 2*i2) * 1//R(q - 1))],
  ),
  Parameters(
    [Parameter(i1, q^2 - 1), Parameter(i2, q + 1)],
    [
      ((-i1 + 2*i2) * 1//R(q + 1)),
      ((i1*q - 1//2*i2*q + 1//2*i2) * 1//R(1 * 1//2 * q^2 - 1 * 1//2)),
      ((-i1) * 1//R(q + 1)),
      ((1//2*i1*q + 1//2*i1 + 1//2*i2*q - 1//2*i2) * 1//R(1 * 1//2 * q^2 - 1 * 1//2)),
    ],
  ),
  Parameters([Parameter(i1, q^3 - 1)], [((-i1) * 1//R(q^2 + q + 1))]),
  Parameters(
    [Parameter(i1, q^3 + q^2 + q + 1)],
    [
      (
        (-1//4*i1*q + 1//4*i1) *
        1//R(1 * 1//4 * q^3 + 1 * 1//4 * q^2 + 1 * 1//4 * q + 1 * 1//4)
      ),
      ((-1//2*i1*q + 1//2*i1) * 1//R(1 * 1//2 * q^2 + 1 * 1//2)),
    ],
  ),
]

charparams = [
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters(Parameter[]),
  Parameters([Parameter(k1, q - 1)], [((k1) * 1//R(q - 1))]),
  Parameters([Parameter(k1, q - 1)], [((k1) * 1//R(q - 1))]),
  Parameters([Parameter(k1, q - 1)], [((k1) * 1//R(q - 1))]),
  Parameters(
    [Parameter(k1, q - 1)], [((k1) * 1//R(q - 1)), ((-k1) * 1//R(1 * 1//2 * q - 1 * 1//2))]
  ),
  Parameters(
    [Parameter(k1, q - 1)], [((k1) * 1//R(q - 1)), ((-k1) * 1//R(1 * 1//2 * q - 1 * 1//2))]
  ),
  Parameters(
    [Parameter(k1, q - 1)], [((k1) * 1//R(q - 1)), ((-k1) * 1//R(1 * 1//2 * q - 1 * 1//2))]
  ),
  Parameters(
    [Parameter(k1, q - 1)], [((k1) * 1//R(q - 1)), ((-k1) * 1//R(1 * 1//2 * q - 1 * 1//2))]
  ),
  Parameters(
    [Parameter(k1, q + 1)], [((k1) * 1//R(q + 1)), ((-k1) * 1//R(1 * 1//2 * q + 1 * 1//2))]
  ),
  Parameters(
    [Parameter(k1, q + 1)], [((k1) * 1//R(q + 1)), ((-k1) * 1//R(1 * 1//2 * q + 1 * 1//2))]
  ),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(2))], [((k1) * 1//R(2))]),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q - 1)],
    [((k2) * 1//R(q - 1)), ((k1) * 1//R(q - 1)), ((k1 + k2) * 1//R(q - 1))],
  ),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q - 1)],
    [((k2) * 1//R(q - 1)), ((k1) * 1//R(q - 1)), ((k1 + k2) * 1//R(q - 1))],
  ),
  Parameters([Parameter(k1, q^2 - 1)], [((k1) * 1//R(q^2 - 1)), ((k1) * 1//R(q + 1))]),
  Parameters([Parameter(k1, q^2 - 1)], [((k1) * 1//R(q^2 - 1)), ((k1) * 1//R(q + 1))]),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q - 1), Parameter(k3, q - 1)],
    [
      ((k1) * 1//R(q - 1)),
      ((k2) * 1//R(q - 1)),
      ((k3) * 1//R(q - 1)),
      ((k1 + k2) * 1//R(q - 1)),
      ((k2 + k3) * 1//R(q - 1)),
      ((k1 + k2 + k3) * 1//R(q - 1)),
    ],
  ),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q^2 - 1)],
    [((k2) * 1//R(q + 1)), ((k1) * 1//R(q - 1))],
  ),
  Parameters(
    [Parameter(k1, q + 1), Parameter(k2, q^2 - 1)],
    [
      ((-k1 + k2) * 1//R(q + 1)),
      ((k2) * 1//R(q^2 - 1)),
      ((k1) * 1//R(q + 1)),
      ((-k1*q + k1 + k2*q) * 1//R(q^2 - 1)),
    ],
  ),
  Parameters([Parameter(k1, q^3 - 1)], [((-k1*q) * 1//R(q^2 + q + 1))]),
  Parameters(
    [Parameter(k1, q^3 + q^2 + q + 1)],
    [((k1*q^2) * 1//R(q^3 + q^2 + q + 1)), ((-k1) * 1//R(q^2 + 1))],
  ),
  Parameters(
    [Parameter(k1, R(2)), Parameter(k2, q - 1)],
    [((k1) * 1//R(2)), ((k2) * 1//R(q - 1)), ((1//2*k1*q - 1//2*k1 + k2) * 1//R(q - 1))],
  ),
  Parameters(
    [Parameter(k1, R(2)), Parameter(k2, q - 1)],
    [((k1) * 1//R(2)), ((k2) * 1//R(q - 1)), ((1//2*k1*q - 1//2*k1 + k2) * 1//R(q - 1))],
  ),
  Parameters([Parameter(k1, 2 * q - 2)], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, 2 * q - 2)], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, 2 * q + 2)], [((k1) * 1//R(2))]),
  Parameters([Parameter(k1, 2 * q + 2)], [((k1) * 1//R(2))]),
  Parameters(
    [Parameter(k1, R(2)), Parameter(k2, q + 1)],
    [((k1) * 1//R(2)), ((k2) * 1//R(q + 1)), ((1//2*k1*q + 1//2*k1 + k2) * 1//R(q + 1))],
  ),
  Parameters(
    [Parameter(k1, R(2)), Parameter(k2, q + 1)],
    [((k1) * 1//R(2)), ((k2) * 1//R(q + 1)), ((1//2*k1*q + 1//2*k1 + k2) * 1//R(q + 1))],
  ),
  Parameters(
    [Parameter(k1, R(2)), Parameter(k2, q - 1)],
    [((k1) * 1//R(2)), ((k2) * 1//R(q - 1)), ((1//2*k1*q - 1//2*k1 + k2) * 1//R(q - 1))],
  ),
  Parameters(
    [Parameter(k1, R(2)), Parameter(k2, q - 1)],
    [((k1) * 1//R(2)), ((k2) * 1//R(q - 1)), ((1//2*k1*q - 1//2*k1 + k2) * 1//R(q - 1))],
  ),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
  Parameters([Parameter(k1, R(4))], [((k1) * 1//R(4)), ((k1) * 1//R(2))]),
]

# Exceptions of the Maple source left out above, each a set of conditions
# [coefficients..., modulus] that hold simultaneously:
#   character type 28, [k1, k2, k3]: [[-1, 1, 0, q - 1], [0, -1, 1, q - 1], [0, 0, -1, 1 * 1//4 * q - 1 * 1//4]]
#   character type 28, [k1, k2, k3]: [[-1, 0, 1, q - 1], [0, -2, -1, q - 1], [0, 1, 0, 1 * 1//4 * q - 1 * 1//4]]
#   character type 28, [k1, k2, k3]: [[-1, 0, 1, q - 1], [0, -1, -1, 1 * 1//2 * q - 1 * 1//2]]
#   character type 28, [k1, k2, k3]: [[-1, 1, 1, q - 1], [0, -3, -2, q - 1], [0, -1, -1, 1 * 1//4 * q - 1 * 1//4]]
#   character type 28, [k1, k2, k3]: [[1, 0, 1, q - 1], [0, 0, 1, 1 * 1//2 * q - 1 * 1//2]]
#   character type 28, [k1, k2, k3]: [[-1, 0, -1, q - 1], [0, -1, 0, 1 * 1//2 * q - 1 * 1//2]]
#   character type 29, [k1, k2]: [[1 * 1//2 * q + 1 * 1//2, -1 * 1//2 * q + 1 * 1//2, 1 * 1//2 * q^2 - 1 * 1//2], [-1 * 1//2 * q - 1 * 1//2, -1, 1 * 1//2 * q^2 - 1 * 1//2], [0, 1, 1 * 1//4 * q^2 - 1 * 1//4]]
#   character type 29, [k1, k2]: [[1 * 1//2 * q + 1 * 1//2, 1 * 1//2 * q - 1 * 1//2, 1 * 1//2 * q^2 - 1 * 1//2], [1, 0, 1 * 1//2 * q - 1 * 1//2]]
#   character type 30, [k1, k2]: [[q - 1, -q + 2, q^2 - 1], [q - 1, -1, q^2 - 1], [-2, 0, 1 * 1//2 * q + 1 * 1//2]]
#   character type 30, [k1, k2]: [[2, -1, q + 1], [-1 * 1//2 * q + 1 * 1//2, -1, 1 * 1//2 * q^2 - 1 * 1//2], [0, 1, 1 * 1//4 * q^2 - 1 * 1//4]]
#   character type 30, [k1, k2]: [[2, -1, q + 1], [-q + 1, -1, 1 * 1//2 * q^2 - 1 * 1//2]]
#   character type 30, [k1, k2]: [[2 * q - 2, -q + 2, q^2 - 1], [-2 * q + 2, -3, q^2 - 1], [-q + 1, -1, 1 * 1//4 * q^2 - 1 * 1//4]]
#   character type 30, [k1, k2]: [[0, 1, q + 1], [1, 0, 1 * 1//2 * q + 1 * 1//2]]
#   character type 30, [k1, k2]: [[0, -1, q + 1], [0, -1, 1 * 1//2 * q^2 - 1 * 1//2]]
#   character type 32, [k1]: [[-1 * 1//2 * q^2 - 1 * 1//4 * q - 1 * 1//4, 1 * 1//4 * q^3 + 1 * 1//4 * q^2 + 1 * 1//4 * q + 1 * 1//4], [1 * 1//4 * q^2 + 1 * 1//4 * q + 1 * 1//2, 1 * 1//4 * q^3 + 1 * 1//4 * q^2 + 1 * 1//4 * q + 1 * 1//4], [-1, 1 * 1//4 * q^3 + 1 * 1//4 * q^2 + 1 * 1//4 * q + 1 * 1//4]]
#   character type 32, [k1]: [[-1 * 1//2 * q + 1 * 1//2, 1 * 1//2 * q^2 + 1 * 1//2], [q, 1 * 1//2 * q^2 + 1 * 1//2]]
#   character type 33, [k1, k2]: [[0, 0, 1], [1 * 1//4 * q - 1 * 1//4, -1, 1 * 1//2 * q - 1 * 1//2], [0, 1, 1 * 1//4 * q - 1 * 1//4]]
#   character type 34, [k1, k2]: [[0, 0, 1], [1 * 1//4 * q - 1 * 1//4, -1, 1 * 1//2 * q - 1 * 1//2], [0, 1, 1 * 1//4 * q - 1 * 1//4]]
#   character type 35, [k1]: [[0, 1], [1 * 1//2 * q - 3 * 1//2, q - 1], [1, 1 * 1//2 * q - 1 * 1//2]]
#   character type 36, [k1]: [[0, 1], [1 * 1//2 * q - 3 * 1//2, q - 1], [1, 1 * 1//2 * q - 1 * 1//2]]
#   character type 37, [k1]: [[0, 1], [1 * 1//4 * q - 1 * 1//4, 1 * 1//2 * q + 1 * 1//2], [1, 1 * 1//2 * q + 1 * 1//2]]
#   character type 38, [k1]: [[0, 1], [1 * 1//4 * q - 1 * 1//4, 1 * 1//2 * q + 1 * 1//2], [1, 1 * 1//2 * q + 1 * 1//2]]
#   character type 39, [k1, k2]: [[0, 0, 1], [1 * 1//2 * q + 1 * 1//2, -2, q + 1], [0, 2, 1 * 1//2 * q + 1 * 1//2]]
#   character type 40, [k1, k2]: [[0, 0, 1], [1 * 1//2 * q + 1 * 1//2, -2, q + 1], [0, 2, 1 * 1//2 * q + 1 * 1//2]]
#   character type 41, [k1, k2]: [[0, 0, 1], [1 * 1//4 * q - 1 * 1//4, -1, 1 * 1//2 * q - 1 * 1//2], [0, 1, 1 * 1//4 * q - 1 * 1//4]]
#   character type 42, [k1, k2]: [[0, 0, 1], [1 * 1//4 * q - 1 * 1//4, -1, 1 * 1//2 * q - 1 * 1//2], [0, 1, 1 * 1//4 * q - 1 * 1//4]]

classparamindex = var_index.([i1, i2, i3])
charparamindex = var_index.([k1, k2, k3])

information = raw"""The generic character table of $\mathrm{SL}_4(q)$,
  $q$ congruent to $1$ modulo $4$.
  The variable $q_0$ represents $\sqrt{q}$, which the values of the sixteen
  characters in the Lusztig series of type $\mathrm{A}_0(q).4$ involve.

- Frank Lübeck computed the uniform almost characters with CHEVIE3; the
  almost characters are numbered as in his table, which [Rot21](@cite)
  follows.
- [Rot21](@cite), Tables 15 to 19, gives the differences between the two
  constituents of each almost character of norm 2. In Tables 18 and 19 the
  signs of the values on the classes 19 and 20 are reversed here.
- An almost character of norm 4 is the sum of four characters. Off the
  regular unipotent classes they follow from the differences of norm 2 at
  a parameter that Table 17 or 19 excludes; on the regular unipotent
  classes, from their multiplicities in the Gelfand-Graev characters,
  Table 10 of [Rot21](@cite).
"""

TABLE = CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

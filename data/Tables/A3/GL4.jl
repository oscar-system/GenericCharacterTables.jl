# Converted from the CHEVIE3 Maple table `GL4` (A3002)
# by extra/Convert/MapleTable.jl.
using ..GenericCharacterTables
import ..GenericCharacterTables:
  Parameters, Parameter, CharTable, GenericCyclo, GenericCycloFrac, nesum
using ..GenericCharacterTables.Oscar
S, E, q = generic_cyclotomic_ring()
R = base_ring(S)
i1, i2, i3, i4, k1, k2, k3, k4, _... = params(
  S,
  [
    "i1",
    "i2",
    "i3",
    "i4",
    "k1",
    "k2",
    "k3",
    "k4",
    "i11",
    "i21",
    "i31",
    "i41",
    "k11",
    "k21",
    "k31",
    "k41",
    "i12",
    "i22",
    "i32",
    "i42",
    "k12",
    "k22",
    "k32",
    "k42",
    "i13",
    "i23",
    "i33",
    "i43",
    "k13",
    "k23",
    "k33",
    "k43",
    "i1t1",
    "i2t1",
    "i3t1",
    "i4t1",
    "k1t1",
    "k2t1",
    "k3t1",
    "k4t1",
    "i1t2",
    "i2t2",
    "i3t2",
    "i4t2",
    "k1t2",
    "k2t2",
    "k3t2",
    "k4t2",
  ],
)

order = q^6 * (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^4
chars = Vector{GenericCyclo}[]
push!(
  chars,
  GenericCyclo[
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^6)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(q^3)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(q^2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q^2)); simplify=false),
    S(0),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(-q)); simplify=false),
    S(0),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^5 + q^4 + q^3)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^3)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(q^3 + q^2 + q)); simplify=false),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(q^2 + 2*q)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(-q^2)); simplify=false),
    S(0),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(2*q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(3)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(0),
    S(Dict(R(i1*k1)//R(q - 1) => R(1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^4 + q^2)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^2)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^2)); simplify=false),
    S(0),
    S(0),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(q^2 + q)); simplify=false),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(2)); simplify=false),
    S(0),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(2)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^3 + q^2 + q)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q^2 + q)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(q^2 + q + 1)); simplify=false),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(2*q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(q + 2)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(2)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(3)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(0),
    S(Dict(R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(4*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(4*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(3*i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2*i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1 + i3*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^6 + q^5 + q^4 + q^3)); simplify=false),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^3)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(3*i1*k1 + i2*k2)//R(q - 1) => R(q^3),
        R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q^3 + q^2 + q),
      );
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + q),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(q^2 + q),
      );
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(q)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i3*k2)//R(q - 1) => R(q),
        R(2*i1*k1 + i2*k2 + i3*k1)//R(q - 1) => R(q),
        R(i1*k1 + i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(-q - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k1 + i3*k2)//R(q - 1) => R(-1),
        R(i1*k1 + i2*k2 + i3*k1)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(Dict(R(i1*k1 + i2*k2)//R(q - 1) => R(1)); simplify=false),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^5 + 2*q^4 + 2*q^3 + 2*q^2 + q));
      simplify=false,
    ),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^3 + 2*q^2 + q)); simplify=false),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^2 + q)); simplify=false),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(
      Dict(
        R(3*i1*k1 + i2*k2)//R(q - 1) => R(q^2 + q),
        R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(3*i1*k1 + i2*k2)//R(q - 1) => R(q),
        R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(2*q + 1),
      );
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(2*q + 2),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(2),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(2),
        R(i1*k1 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(2),
        R(i1*k1 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(2),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(Dict(R(i1*k1 + i2*k2)//R(q - 1) => R(-1)); simplify=false),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^3 + q^2 + q + 1)); simplify=false),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q^2 + q + 1)); simplify=false),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(3*i1*k1 + i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(3*i1*k1 + i2*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q^2 + q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(3*i1*k1 + i2*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(3*i1*k1 + i2*k2)//R(q - 1) => R(1), R(2*i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + 2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(Dict(R(i1*k1 + i2*k2)//R(q - 1) => R(1)); simplify=false),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^6 + q^5 + 2*q^4 + q^3 + q^2));
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^3 + q^2)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^2)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q^3 + q^2 + q),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q^3 + q^2 + q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(0),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(q^2),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(q^2),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(q),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(2*i1*k2 + i2*k1)//R(q - 1) => R(-q), R(2*i1*k1 + i2*k2)//R(q - 1) => R(-q));
      simplify=false,
    ),
    S(0),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(-1),
        R(i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + i2*k1)//R(q - 1) => R(1), R(i1*k1 + i2*k2)//R(q - 1) => R(1));
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
      Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^5 + q^4 + 2*q^3 + q^2 + q)); simplify=false
    ),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^3 + q^2 + q)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q^2 + q + 1),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q^3 + q^2 + q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(q),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-q^2 - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(2*i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(2*i1*k2 + i2*k1)//R(q - 1) => R(-1), R(2*i1*k1 + i2*k2)//R(q - 1) => R(q));
      simplify=false,
    ),
    S(Dict(R(2*i1*k2 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + i2*k1)//R(q - 1) => R(-1), R(i1*k1 + i2*k2)//R(q - 1) => R(-1));
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
      Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^5 + q^4 + 2*q^3 + q^2 + q)); simplify=false
    ),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^3 + q^2 + q)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q^3 + q^2 + q),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q^2 + q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(q),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-q^2 - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(q),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(2*i1*k2 + i2*k1)//R(q - 1) => R(q), R(2*i1*k1 + i2*k2)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + i2*k2)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(-1),
        R(i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + i2*k1)//R(q - 1) => R(-1), R(i1*k1 + i2*k2)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^4 + q^3 + 2*q^2 + q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(2*q^2 + q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q^2 + q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + 2*i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q^2 + q + 1),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q^2 + q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + 2*i1*k2 + i2*k1)//R(q - 1) => R(1),
        R(2*i1*k1 + i1*k2 + i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(1),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(1),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(1),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + 2*i2*k2)//R(q - 1) => R(1),
        R(2*i1*k2 + 2*i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(q^2 + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(2*i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(2*i1*k2 + i2*k1)//R(q - 1) => R(1), R(2*i1*k1 + i2*k2)//R(q - 1) => R(1));
      simplify=false,
    ),
    S(
      Dict(R(2*i1*k2 + i2*k1)//R(q - 1) => R(1), R(2*i1*k1 + i2*k2)//R(q - 1) => R(1));
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + i2*k1)//R(q - 1) => R(1), R(i1*k1 + i2*k2)//R(q - 1) => R(1));
      simplify=false,
    ),
    S(0),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q^6 - q^5 - q^3 + q^2)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(-q^3 + q^2)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q^2)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(q^2 - 2*q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2 * i1 * k1 * q) // R(q ^ 2 - 1) => R(q ^ 2), R(2 * i1 * k1) // R(q ^ 2 - 1) => R(q ^ 2)); simplify=false) + S(
      Dict(R(i1 * k1) // R(q - 1) => R(q ^ 2 + 1)); simplify=false
    ),
    S(Dict(R(i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i2*k1)//R(q^2 - 1) => R(-q + 1),
        R(i1*k1*q + i2*k1*q + i1*k1)//R(q^2 - 1) => R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k1*q + i1*k1)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k1*q)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k1)//R(q^2 - 1) => R(1),
        R(i2*k1*q + i1*k1)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(Dict(R(i1*k1)//R(q^2 - 1) => R(-1), R(i1*k1*q)//R(q^2 - 1) => R(-1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q^4 - q^3 - q + 1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(q^2 - q + 1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(2*i1*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(q^2 - 2*q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(2 * i1 * k1 * q) // R(q ^ 2 - 1) => R(1), R(2 * i1 * k1) // R(q ^ 2 - 1) => R(1)); simplify=false) + S(
      Dict(R(i1 * k1) // R(q - 1) => R(q ^ 2 + 1)); simplify=false
    ),
    S(Dict(R(2 * i1 * k1 * q) // R(q ^ 2 - 1) => R(1), R(2 * i1 * k1) // R(q ^ 2 - 1) => R(1)); simplify=false) + S(
      Dict(R(i1 * k1) // R(q - 1) => R(1)); simplify=false
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i2*k1)//R(q^2 - 1) => R(-q + 1),
        R(i1*k1*q + i2*k1*q + i1*k1)//R(q^2 - 1) => R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k1*q + i1*k1)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k1*q)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k1)//R(q^2 - 1) => R(1),
        R(i2*k1*q + i1*k1)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(Dict(R(i1*k1)//R(q^2 - 1) => R(1), R(i1*k1*q)//R(q^2 - 1) => R(1)); simplify=false),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(
      Dict(
        R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q^6 + 2*q^5 + 3*q^4 + 3*q^3 + 2*q^2 + q)
      );
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(2*q^3 + 2*q^2 + q)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q^2 + q)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q)); simplify=false),
    S(0),
    S(
      Dict(
        R(2*i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(q^3 + q^2 + q),
        R(2*i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(q^3 + q^2 + q),
        R(i1*k1 + i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(q),
        R(2*i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(q),
        R(i1*k1 + i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(2*q + 1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k2 + i1*k3 + 2*i2*k1)//R(q - 1) => R(q^2 + q),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(2*i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(q^2 + q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(q),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k3 + 2*i2*k1)//R(q - 1) => R(q),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k3)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k3 + i2*k1 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k3 + i3*k2)//R(q - 1) => R(q),
        R(2*i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(q),
        R(i1*k1 + i1*k2 + i2*k3 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k3)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k3 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k1 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(-q - 1)); simplify=false),
    S(Dict(R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i3*k1 + i4*k3)//R(q - 1) => R(1),
        R(i1*k3 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k3 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k3)//R(q - 1) => R(1),
        R(i1*k2 + i2*k3 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k3 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k3 + i4*k1)//R(q - 1) => R(1),
        R(i1*k3 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k3 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k1 + i4*k3)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k3 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k3 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(-1),
        R(i1*k1 + i2*k3 + i3*k2)//R(q - 1) => R(-1),
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
        R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q^5 + 2*q^4 + 3*q^3 + 3*q^2 + 2*q + 1)
      );
      simplify=false,
    ),
    S(
      Dict(R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q^3 + 3*q^2 + 2*q + 1)); simplify=false
    ),
    S(Dict(R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q^2 + 2*q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(2*q + 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(2*i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(q^2 + q + 1),
        R(2*i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(q^2 + q + 1),
        R(i1*k1 + i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(2*i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k2 + i1*k3 + 2*i2*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(2*i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k3 + 2*i2*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k3 + 2*i2*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i2*k3)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 + 2*i2*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k1 + i2*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k3)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k3 + i2*k1 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(2*i1*k1 + i2*k3 + i3*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k3 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k1 + i3*k3)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 + i2*k1 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k3 + i3*k2)//R(q - 1) => R(1),
        R(2*i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k3 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k1 + i3*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(q + 1)); simplify=false),
    S(Dict(R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i3*k1 + i4*k3)//R(q - 1) => R(1),
        R(i1*k3 + i2*k1 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k3 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k2 + i4*k3)//R(q - 1) => R(1),
        R(i1*k2 + i2*k3 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k3 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k3 + i4*k1)//R(q - 1) => R(1),
        R(i1*k3 + i2*k1 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k3 + i2*k2 + i3*k1 + i4*k1)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k1 + i4*k3)//R(q - 1) => R(1),
        R(i1*k1 + i2*k1 + i3*k3 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k3 + i4*k1)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(1),
        R(i1*k1 + i2*k3 + i3*k2)//R(q - 1) => R(1),
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
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(q^6 + q^4 - q^3 - q)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(-q)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(q^2 - q)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(-q)); simplify=false),
    S(0),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q^3 - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k2 + 2*i2*k1)//R(q - 1) => R(q^2 - q),
        R(2*i1*k1 + i2*k2)//R(q - 1) => R(q^2 - q),
      );
      simplify=false,
    ),
    S(Dict(R(2*i1*k1 + i2*k2)//R(q - 1) => R(-q)); simplify=false),
    S(Dict(R(i1*k2 + 2*i2*k1)//R(q - 1) => R(-q)); simplify=false),
    S(0),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i1*k2)//R(q^2 - 1) => R(q^2 + 1),
        R(i1*k1*q + i1*k2*q + i1*k1)//R(q^2 - 1) => R(q^2 + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i1*k2)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i1*k2*q + i1*k1)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(q - 1)); simplify=false),
    S(Dict(R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(2 * i1 * k1 * q + 2 * i1 * k1 + i2 * k2) // R(q ^ 2 - 1) => R(-q), R(2 * i1 * k1 * q + i2 * k2 * q + 2 * i1 * k1) // R(q ^ 2 - 1) => R(-q)); simplify=false) + S(
      Dict(R(i1 * k2 + i2 * k1) // R(q - 1) => R(-q + 1)); simplify=false
    ),
    S(Dict(R(i1*k2 + i2*k1)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(
      Dict(
        R(i1*k2*q + i2*k1*q + i3*k1*q + i2*k1 + i3*k1)//R(q^2 - 1) => R(-1),
        R(i2*k1*q + i3*k1*q + i1*k2 + i2*k1 + i3*k1)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1*q + i2*k2*q + i1*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i1*k1 + i2*k2)//R(q^2 - 1) => R(1),
        R(i2*k1*q + i1*k2 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k2*q + i2*k1*q + i2*k1)//R(q^2 - 1) => R(1),
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
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(q^5 + q^3 - q^2 - 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(q^3 - q^2 - 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(-q^2 - 1)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(2*i1*k1 + i1*k2)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(q^3 - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i2*k1)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k2 + 2*i2*k1)//R(q - 1) => R(q - 1), R(2*i1*k1 + i2*k2)//R(q - 1) => R(q - 1)
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + 2*i2*k1)//R(q - 1) => R(q - 1), R(2*i1*k1 + i2*k2)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + 2*i2*k1)//R(q - 1) => R(-1), R(2*i1*k1 + i2*k2)//R(q - 1) => R(q - 1));
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + 2*i2*k1)//R(q - 1) => R(-1), R(2*i1*k1 + i2*k2)//R(q - 1) => R(-1));
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i1*k2)//R(q^2 - 1) => R(-q^2 - 1),
        R(i1*k1*q + i1*k2*q + i1*k1)//R(q^2 - 1) => R(-q^2 - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1*q + i1*k1 + i1*k2)//R(q^2 - 1) => R(-1),
        R(i1*k1*q + i1*k2*q + i1*k1)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(Dict(R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(q - 1)); simplify=false),
    S(Dict(R(i1*k2 + i2*k1 + i3*k1)//R(q - 1) => R(-1)); simplify=false),
    S(Dict(R(2 * i1 * k1 * q + i2 * k2 * q + 2 * i1 * k1) // R(q ^ 2 - 1) => R(-1), R(2 * i1 * k1 * q + 2 * i1 * k1 + i2 * k2) // R(q ^ 2 - 1) => R(-1)); simplify=false) + S(
      Dict(R(i1 * k2 + i2 * k1) // R(q - 1) => R(q - 1)); simplify=false
    ),
    S(Dict(R(2 * i1 * k1 * q + i2 * k2 * q + 2 * i1 * k1) // R(q ^ 2 - 1) => R(-1), R(2 * i1 * k1 * q + 2 * i1 * k1 + i2 * k2) // R(q ^ 2 - 1) => R(-1)); simplify=false) + S(
      Dict(R(i1 * k2 + i2 * k1) // R(q - 1) => R(-1)); simplify=false
    ),
    S(0),
    S(
      Dict(
        R(i1*k2*q + i2*k1*q + i3*k1*q + i2*k1 + i3*k1)//R(q^2 - 1) => R(-1),
        R(i2*k1*q + i3*k1*q + i1*k2 + i2*k1 + i3*k1)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i2*k1*q + i1*k2 + i2*k1)//R(q^2 - 1) => R(-1),
        R(i1*k2*q + i2*k1*q + i2*k1)//R(q^2 - 1) => R(-1),
        R(i1*k1*q + i2*k2*q + i1*k1)//R(q^2 - 1) => R(-1),
        R(i1*k1*q + i1*k1 + i2*k2)//R(q^2 - 1) => R(-1),
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
        R(i1*k1 + i1*k2 + i1*k3 + i1*k4)//R(q - 1) =>
          R(q^6 + 3*q^5 + 5*q^4 + 6*q^3 + 5*q^2 + 3*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k1 + i1*k2 + i1*k3 + i1*k4)//R(q - 1) => R(3*q^3 + 5*q^2 + 3*q + 1));
      simplify=false,
    ),
    S(
      Dict(R(i1*k1 + i1*k2 + i1*k3 + i1*k4)//R(q - 1) => R(2*q^2 + 3*q + 1)); simplify=false
    ),
    S(Dict(R(i1*k1 + i1*k2 + i1*k3 + i1*k4)//R(q - 1) => R(3*q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i1*k3 + i1*k4)//R(q - 1) => R(1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i1*k3 + i2*k4)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(i1*k1 + i1*k2 + i1*k4 + i2*k3)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(i1*k2 + i1*k3 + i1*k4 + i2*k1)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
        R(i1*k1 + i1*k3 + i1*k4 + i2*k2)//R(q - 1) => R(q^3 + 2*q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i1*k3 + i2*k4)//R(q - 1) => R(2*q + 1),
        R(i1*k1 + i1*k2 + i1*k4 + i2*k3)//R(q - 1) => R(2*q + 1),
        R(i1*k2 + i1*k3 + i1*k4 + i2*k1)//R(q - 1) => R(2*q + 1),
        R(i1*k1 + i1*k3 + i1*k4 + i2*k2)//R(q - 1) => R(2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i1*k3 + i2*k4)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i1*k4 + i2*k3)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 + i1*k4 + i2*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i1*k4 + i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i1*k3 + i2*k1 + i2*k4)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k1 + i1*k3 + i2*k2 + i2*k4)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k1 + i1*k4 + i2*k2 + i2*k3)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k3 + i1*k4 + i2*k1 + i2*k2)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k2 + i1*k4 + i2*k1 + i2*k3)//R(q - 1) => R(q^2 + 2*q + 1),
        R(i1*k1 + i1*k2 + i2*k3 + i2*k4)//R(q - 1) => R(q^2 + 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i1*k3 + i2*k1 + i2*k4)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k2 + i2*k4)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k4 + i2*k2 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k3 + i1*k4 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k4 + i2*k1 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + i2*k3 + i2*k4)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i1*k3 + i2*k1 + i2*k4)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k2 + i2*k4)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k4 + i2*k2 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k3 + i1*k4 + i2*k1 + i2*k2)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k4 + i2*k1 + i2*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + i2*k3 + i2*k4)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i1*k3 + i2*k1 + i2*k4)//R(q - 1) => R(1),
        R(i1*k1 + i1*k4 + i2*k2 + i2*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k2 + i2*k4)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k3 + i2*k4)//R(q - 1) => R(1),
        R(i1*k2 + i1*k4 + i2*k1 + i2*k3)//R(q - 1) => R(1),
        R(i1*k3 + i1*k4 + i2*k1 + i2*k2)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k2 + i1*k4 + i2*k1 + i3*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k4 + i2*k3 + i3*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + i2*k3 + i3*k4)//R(q - 1) => R(q + 1),
        R(i1*k3 + i1*k4 + i2*k2 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k4 + i3*k2)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k4 + i2*k3 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k3 + i1*k4 + i2*k1 + i3*k2)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k3 + i2*k2 + i3*k4)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k2 + i2*k4 + i3*k3)//R(q - 1) => R(q + 1),
        R(i1*k1 + i1*k4 + i2*k2 + i3*k3)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k3 + i2*k4 + i3*k1)//R(q - 1) => R(q + 1),
        R(i1*k2 + i1*k3 + i2*k1 + i3*k4)//R(q - 1) => R(q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k4 + i2*k3 + i3*k2)//R(q - 1) => R(1),
        R(i1*k2 + i1*k4 + i2*k1 + i3*k3)//R(q - 1) => R(1),
        R(i1*k3 + i1*k4 + i2*k2 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k3 + i3*k4)//R(q - 1) => R(1),
        R(i1*k2 + i1*k4 + i2*k3 + i3*k1)//R(q - 1) => R(1),
        R(i1*k3 + i1*k4 + i2*k1 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k4 + i3*k2)//R(q - 1) => R(1),
        R(i1*k1 + i1*k2 + i2*k4 + i3*k3)//R(q - 1) => R(1),
        R(i1*k1 + i1*k3 + i2*k2 + i3*k4)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 + i2*k4 + i3*k1)//R(q - 1) => R(1),
        R(i1*k1 + i1*k4 + i2*k2 + i3*k3)//R(q - 1) => R(1),
        R(i1*k2 + i1*k3 + i2*k1 + i3*k4)//R(q - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k3 + i2*k2 + i3*k1 + i4*k4)//R(q - 1) => R(1),
        R(i1*k3 + i2*k4 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k3 + i4*k4)//R(q - 1) => R(1),
        R(i1*k1 + i2*k4 + i3*k3 + i4*k2)//R(q - 1) => R(1),
        R(i1*k1 + i2*k4 + i3*k2 + i4*k3)//R(q - 1) => R(1),
        R(i1*k3 + i2*k4 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k3 + i2*k2 + i3*k4 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k3 + i3*k4 + i4*k2)//R(q - 1) => R(1),
        R(i1*k2 + i2*k3 + i3*k1 + i4*k4)//R(q - 1) => R(1),
        R(i1*k1 + i2*k3 + i3*k2 + i4*k4)//R(q - 1) => R(1),
        R(i1*k2 + i2*k4 + i3*k1 + i4*k3)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k4 + i4*k3)//R(q - 1) => R(1),
        R(i1*k2 + i2*k3 + i3*k4 + i4*k1)//R(q - 1) => R(1),
        R(i1*k1 + i2*k2 + i3*k4 + i4*k3)//R(q - 1) => R(1),
        R(i1*k2 + i2*k1 + i3*k3 + i4*k4)//R(q - 1) => R(1),
        R(i1*k2 + i2*k4 + i3*k3 + i4*k1)//R(q - 1) => R(1),
        R(i1*k3 + i2*k1 + i3*k4 + i4*k2)//R(q - 1) => R(1),
        R(i1*k4 + i2*k3 + i3*k2 + i4*k1)//R(q - 1) => R(1),
        R(i1*k4 + i2*k2 + i3*k3 + i4*k1)//R(q - 1) => R(1),
        R(i1*k3 + i2*k1 + i3*k2 + i4*k4)//R(q - 1) => R(1),
        R(i1*k4 + i2*k3 + i3*k1 + i4*k2)//R(q - 1) => R(1),
        R(i1*k4 + i2*k2 + i3*k1 + i4*k3)//R(q - 1) => R(1),
        R(i1*k4 + i2*k1 + i3*k2 + i4*k3)//R(q - 1) => R(1),
        R(i1*k4 + i2*k1 + i3*k3 + i4*k2)//R(q - 1) => R(1),
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
      Dict(R(i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q^6 + q^5 + q^4 - q^2 - q - 1));
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(q^3 - q^2 - q - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(-q - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(-q - 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2 + i1*k3)//R(q - 1) => R(-1)); simplify=false),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(q^3 - 1),
        R(i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(q^3 - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(-1),
        R(i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i1*k2 + i2*k3)//R(q - 1) => R(-1),
        R(i1*k1 + i1*k3 + i2*k2)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(q^2 - 1),
        R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(q^2 - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(q - 1),
        R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(-q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(-q - 1),
        R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i1*k3 + i2*k1)//R(q - 1) => R(-1),
        R(i1*k1 + i2*k2 + i2*k3)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(q - 1),
        R(i1*k1 + i2*k3 + i3*k2)//R(q - 1) => R(q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k1 + i2*k2 + i3*k3)//R(q - 1) => R(-1),
        R(i1*k1 + i2*k3 + i3*k2)//R(q - 1) => R(-1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2*q + i1*k3*q + i1*k2 + i1*k3 + i2*k1)//R(q^2 - 1) => R(-q - 1),
        R(i1*k2*q + i1*k3*q + i2*k1*q + i1*k2 + i1*k3)//R(q^2 - 1) => R(-q - 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2*q + i1*k3*q + i1*k2 + i1*k3 + i2*k1)//R(q^2 - 1) => R(-1),
        R(i1*k2*q + i1*k3*q + i2*k1*q + i1*k2 + i1*k3)//R(q^2 - 1) => R(-1),
      );
      simplify=false,
    ),
    S(0),
    S(
      Dict(
        R(i2*k3*q + i3*k2*q + i1*k1 + i2*k3 + i3*k2)//R(q^2 - 1) => R(-1),
        R(i1*k1*q + i2*k3*q + i3*k2*q + i2*k3 + i3*k2)//R(q^2 - 1) => R(-1),
        R(i1*k1*q + i2*k2*q + i3*k3*q + i2*k2 + i3*k3)//R(q^2 - 1) => R(-1),
        R(i2*k2*q + i3*k3*q + i1*k1 + i2*k2 + i3*k3)//R(q^2 - 1) => R(-1),
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
      Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(q^6 - q^5 + q^4 - 2*q^3 + q^2 - q + 1));
      simplify=false,
    ),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-q^3 + q^2 - q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(2*q^2 - q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k2 + i2*k1)//R(q - 1) => R(q^2 - 2*q + 1),
        R(i1*k1 + i2*k2)//R(q - 1) => R(q^2 - 2*q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i2*k1)//R(q - 1) => R(-q + 1), R(i1*k1 + i2*k2)//R(q - 1) => R(-q + 1)
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2 + i2*k1)//R(q - 1) => R(-q + 1), R(i1*k1 + i2*k2)//R(q - 1) => R(-q + 1)
      );
      simplify=false,
    ),
    S(
      Dict(R(i1*k2 + i2*k1)//R(q - 1) => R(1), R(i1*k1 + i2*k2)//R(q - 1) => R(1));
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2*q + i1*k1)//R(q^2 - 1) => R(q^2 + 1),
        R(i1*k1*q + i1*k2*q)//R(q^2 - 1) => R(q^2 + 1),
        R(i1*k1 + i1*k2)//R(q^2 - 1) => R(q^2 + 1),
        R(i1*k1*q + i1*k2)//R(q^2 - 1) => R(q^2 + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2*q + i1*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i1*k2*q)//R(q^2 - 1) => R(1),
        R(i1*k1 + i1*k2)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i1*k2)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k1*q + i2*k2*q + i1*k1)//R(q^2 - 1) => R(-q + 1),
        R(i1*k2*q + i2*k1*q + i1*k2)//R(q^2 - 1) => R(-q + 1),
        R(i1*k1*q + i1*k1 + i2*k2)//R(q^2 - 1) => R(-q + 1),
        R(i1*k2*q + i1*k2 + i2*k1)//R(q^2 - 1) => R(-q + 1),
      );
      simplify=false,
    ),
    S(
      Dict(
        R(i1*k2*q + i1*k2 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k2*q + i2*k1*q + i1*k2)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i1*k1 + i2*k2)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k2*q + i1*k1)//R(q^2 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
    S(0),
    S(
      Dict(
        R(i1*k2*q + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k2)//R(q^2 - 1) => R(1),
        R(i1*k2*q + i2*k1*q)//R(q^2 - 1) => R(1),
        R(i1*k1 + i2*k2)//R(q^2 - 1) => R(1),
        R(i2*k2*q + i1*k1)//R(q^2 - 1) => R(1),
        R(i2*k1*q + i1*k2)//R(q^2 - 1) => R(1),
        R(i1*k2 + i2*k1)//R(q^2 - 1) => R(1),
        R(i1*k1*q + i2*k2*q)//R(q^2 - 1) => R(1),
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
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(q^6 - q^4 - q^2 + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-q^2 + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(-q^2 + 1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i1*k2)//R(q - 1) => R(1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k2)//R(q - 1) => R(q^3 - q^2 - q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k2)//R(q - 1) => R(-q + 1)); simplify=false),
    S(Dict(R(i1*k1 + i2*k2)//R(q - 1) => R(1)); simplify=false),
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
        R(i2*k2*q^2 + i1*k1*q + i2*k2*q + i2*k2)//R(q^3 - 1) => R(1),
        R(i1*k1*q^2 + i2*k2*q^2 + i2*k2*q + i2*k2)//R(q^3 - 1) => R(1),
        R(i2*k2*q^2 + i2*k2*q + i1*k1 + i2*k2)//R(q^3 - 1) => R(1),
      );
      simplify=false,
    ),
    S(0),
  ],
)
push!(
  chars,
  GenericCyclo[
    S(Dict(R(i1*k1)//R(q - 1) => R(q^6 - q^5 - q^4 + q^2 + q - 1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(-q^3 + q^2 + q - 1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(q - 1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(q - 1)); simplify=false),
    S(Dict(R(i1*k1)//R(q - 1) => R(-1)); simplify=false),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(0),
    S(
      Dict(R(i1*k1)//R(q^2 - 1) => R(q^2 - 1), R(i1*k1*q)//R(q^2 - 1) => R(q^2 - 1));
      simplify=false,
    ),
    S(Dict(R(i1*k1)//R(q^2 - 1) => R(-1), R(i1*k1*q)//R(q^2 - 1) => R(-1)); simplify=false),
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
        R(i1*k1*q)//R(q^4 - 1) => R(-1),
        R(i1*k1)//R(q^4 - 1) => R(-1),
        R(i1*k1*q^3)//R(q^4 - 1) => R(-1),
        R(i1*k1*q^2)//R(q^4 - 1) => R(-1),
      );
      simplify=false,
    ),
  ],
)
table = reduce(hcat, chars)
classinfo = Vector{Any}[
  [[1, 1, 1], "A_3(q)", q - 1, [[[1, 1, 1, 1]], 1]],
  [[1, 1, 1], "A_3(q)", q - 1, [[[2, 1, 1]], 1]],
  [[1, 1, 1], "A_3(q)", q - 1, [[[2, 2]], 1]],
  [[1, 1, 1], "A_3(q)", q - 1, [[[3, 1]], 1]],
  [[1, 1, 1], "A_3(q)", q - 1, [[[4]], 1]],
  [[2, 1, 1], "A_2(q)", (q - 1)^2, [[[1, 1, 1]], 1]],
  [[2, 1, 1], "A_2(q)", (q - 1)^2, [[[2, 1]], 1]],
  [[2, 1, 1], "A_2(q)", (q - 1)^2, [[[3]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[[1, 1], [1, 1]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[[1, 1], [2]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[[2], [1, 1]], 1]],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[[2], [2]], 1]],
  [[3, 1, 2], "A_1(q^2)", (q - 1) * (q + 1), [[[1, 1]], 1]],
  [[3, 1, 2], "A_1(q^2)", (q - 1) * (q + 1), [[[2]], 1]],
  [[4, 1, 1], "A_1(q)", (q - 1)^3, [[[1, 1]], 1]],
  [[4, 1, 1], "A_1(q)", (q - 1)^3, [[[2]], 1]],
  [[4, 1, 2], "A_1(q)", (q + 1) * (q - 1)^2, [[[1, 1]], 1]],
  [[4, 1, 2], "A_1(q)", (q + 1) * (q - 1)^2, [[[2]], 1]],
  [[5, 1, 1], "A_0(q)", (q - 1)^4, [[1], 1]],
  [[5, 1, 2], "A_0(q)", (q + 1) * (q - 1)^3, [[1], 1]],
  [[5, 1, 3], "A_0(q)", (q - 1)^2 * (q + 1)^2, [[1], 1]],
  [[5, 1, 4], "A_0(q)", (q^2 + q + 1) * (q - 1)^2, [[1], 1]],
  [[5, 1, 5], "A_0(q)", (q - 1) * (q + 1) * (q^2 + 1), [[1], 1]],
]
classlength = R.([
  1,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1),
  q * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * (q - 1)^2,
  q^2 * (q^2 + q + 1) * (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  q^3 * (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * (q - 1)^3,
  (q + 1) * (q^2 + 1) * q^3,
  (q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * q^3,
  (q + 1)^2 * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1) * q^4,
  (q^2 + q + 1) * (q^2 + 1) * q^4,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * q^4,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * q^4,
  (q + 1)^2 * (q^2 + q + 1) * (q - 1)^2 * (q^2 + 1) * q^4,
  (q^2 + q + 1) * (q - 1)^2 * q^4,
  (q - 1)^3 * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^4,
  (q + 1) * (q^2 + q + 1) * (q^2 + 1) * q^5,
  (q - 1) * (q + 1)^2 * (q^2 + q + 1) * (q^2 + 1) * q^5,
  (q - 1) * (q^2 + 1) * (q^2 + q + 1) * q^5,
  (q - 1)^2 * (q + 1) * (q^2 + 1) * (q^2 + q + 1) * q^5,
  (q^2 + q + 1) * (q^2 + 1) * (q + 1)^2 * q^6,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1) * q^6,
  (q^2 + 1) * (q^2 + q + 1) * (q - 1)^2 * q^6,
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2 * q^6,
  (q + 1) * (q^2 + q + 1) * (q - 1)^3 * q^6,
])
charinfo = Vector{Any}[
  [[1, 1, 1], "A_3(q)", q - 1, [[1, 1, 1, 1]], [1, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", q - 1, [[2, 1, 1]], [2, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", q - 1, [[2, 2]], [3, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", q - 1, [[3, 1]], [4, 1], "irreducible "],
  [[1, 1, 1], "A_3(q)", q - 1, [[4]], [5, 1], "irreducible "],
  [[2, 1, 1], "A_2(q)", (q - 1)^2, [[1, 1, 1]], [1, 1], "irreducible "],
  [[2, 1, 1], "A_2(q)", (q - 1)^2, [[2, 1]], [2, 1], "irreducible "],
  [[2, 1, 1], "A_2(q)", (q - 1)^2, [[3]], [3, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[1, 1], [1, 1]], [1, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[1, 1], [2]], [2, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[2], [1, 1]], [3, 1], "irreducible "],
  [[3, 1, 1], "A_1(q) + A_1(q)", (q - 1)^2, [[2], [2]], [4, 1], "irreducible "],
  [[3, 1, 2], "A_1(q^2)", (q - 1) * (q + 1), [[1, 1]], [1, 1], "irreducible "],
  [[3, 1, 2], "A_1(q^2)", (q - 1) * (q + 1), [[2]], [2, 1], "irreducible "],
  [[4, 1, 1], "A_1(q)", (q - 1)^3, [[1, 1]], [1, 1], "irreducible "],
  [[4, 1, 1], "A_1(q)", (q - 1)^3, [[2]], [2, 1], "irreducible "],
  [[4, 1, 2], "A_1(q)", (q + 1) * (q - 1)^2, [[1, 1]], [1, 1], "irreducible "],
  [[4, 1, 2], "A_1(q)", (q + 1) * (q - 1)^2, [[2]], [2, 1], "irreducible "],
  [[5, 1, 1], "A_0(q)", (q - 1)^4, [[1]], [1, 1], "irreducible "],
  [[5, 1, 2], "A_0(q)", (q + 1) * (q - 1)^3, [[1]], [1, 1], "irreducible "],
  [[5, 1, 3], "A_0(q)", (q - 1)^2 * (q + 1)^2, [[1]], [1, 1], "irreducible "],
  [[5, 1, 4], "A_0(q)", (q^2 + q + 1) * (q - 1)^2, [[1]], [1, 1], "irreducible "],
  [[5, 1, 5], "A_0(q)", (q - 1) * (q + 1) * (q^2 + 1), [[1]], [1, 1], "irreducible "],
]
chardegree = R.([
  q^6,
  q^3 * (q^2 + q + 1),
  q^2 * (q^2 + 1),
  q * (q^2 + q + 1),
  1,
  (q + 1) * (q^2 + 1) * q^3,
  q * (q^2 + 1) * (q + 1)^2,
  (q^2 + 1) * (q + 1),
  q^2 * (q^2 + 1) * (q^2 + q + 1),
  q * (q^2 + 1) * (q^2 + q + 1),
  q * (q^2 + 1) * (q^2 + q + 1),
  (q^2 + 1) * (q^2 + q + 1),
  q^2 * (q^2 + q + 1) * (q - 1)^2,
  (q^2 + q + 1) * (q - 1)^2,
  q * (q + 1) * (q^2 + q + 1) * (q^2 + 1),
  (q + 1) * (q^2 + 1) * (q^2 + q + 1),
  q * (q - 1) * (q^2 + q + 1) * (q^2 + 1),
  (q - 1) * (q^2 + q + 1) * (q^2 + 1),
  (q^2 + 1) * (q^2 + q + 1) * (q + 1)^2,
  (q - 1) * (q + 1) * (q^2 + q + 1) * (q^2 + 1),
  (q^2 + 1) * (q^2 + q + 1) * (q - 1)^2,
  (q^2 + 1) * (q - 1)^2 * (q + 1)^2,
  (q + 1) * (q^2 + q + 1) * (q - 1)^3,
])

# The sums over a class or character type are built from sums over the
# centralizer types of the Maple source, which call each other.
class_center_sums = Dict{Tuple{Int,Int,Int},Function}()
class_center_sums[(3, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^2 - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i1], [i1 * (q + 1)]))
  erg - ss1n1
end
class_center_sums[(4, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q - 2)
  erg = nesum(erg, i3, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i3, i1, i2], [i1, i1, i1]))
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i3, i1], [i2, i1, i1]))
  ss2n2 = class_center_sums[(2, 1, 1)](evaluate(tt, [i3, i1, i2], [i2, i1, i1]))
  ss3n1 = class_center_sums[(3, 1, 1)](evaluate(tt, [i2, i3, i1], [i2, i2, i1]))
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1
end
class_center_sums[(3, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i1, i2], [i1, i1]))
  erg - ss1n1
end
class_center_sums[(4, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q^2 - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i2, i1], [i1 * (q + 1), i1]))
  ss2n1 = class_center_sums[(3, 1, 1)](evaluate(tt, [i2, i1], [i2 * (q + 1), i1]))
  erg - ss1n1 - ss2n1
end
class_center_sums[(2, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i1, i2], [i1, i1]))
  erg - ss1n1
end
class_center_sums[(5, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg = nesum(erg, i2, 0, q - 2)
  erg = nesum(erg, i3, 0, q - 2)
  erg = nesum(erg, i4, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i3, i1, i2, i4], [i1, i1, i1, i1]))
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i3, i1, i2, i4], [i1, i1, i1, i2]))
  ss2n2 = class_center_sums[(2, 1, 1)](evaluate(tt, [i3, i1, i2, i4], [i2, i1, i1, i1]))
  ss2n3 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i3, i1, i4], [i2, i1, i1, i1]))
  ss2n4 = class_center_sums[(2, 1, 1)](evaluate(tt, [i3, i2, i4, i1], [i1, i1, i1, i2]))
  ss3n1 = class_center_sums[(3, 1, 1)](evaluate(tt, [i3, i4, i1, i2], [i2, i2, i1, i1]))
  ss3n2 = class_center_sums[(3, 1, 1)](evaluate(tt, [i2, i3, i4, i1], [i2, i1, i2, i1]))
  ss3n3 = class_center_sums[(3, 1, 1)](evaluate(tt, [i3, i4, i2, i1], [i1, i2, i1, i2]))
  ss4n1 = class_center_sums[(4, 1, 1)](evaluate(tt, [i3, i4, i1, i2], [i3, i2, i1, i1]))
  ss4n2 = class_center_sums[(4, 1, 1)](evaluate(tt, [i3, i4, i2, i1], [i1, i2, i3, i1]))
  ss4n3 = class_center_sums[(4, 1, 1)](evaluate(tt, [i3, i4, i1, i2], [i1, i2, i3, i1]))
  ss4n4 = class_center_sums[(4, 1, 1)](evaluate(tt, [i3, i2, i1, i4], [i2, i3, i1, i1]))
  ss4n5 = class_center_sums[(4, 1, 1)](evaluate(tt, [i3, i1, i2, i4], [i2, i3, i1, i1]))
  ss4n6 = class_center_sums[(4, 1, 1)](evaluate(tt, [i2, i3, i1, i4], [i2, i1, i3, i1]))
  erg - ss1n1 - ss2n1 - ss2n2 - ss2n3 - ss2n4 - ss3n1 - ss3n2 - ss3n3 - ss4n1 - ss4n2 -
  ss4n3 - ss4n4 - ss4n5 - ss4n6
end
class_center_sums[(5, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^2 - 2)
  erg = nesum(erg, i2, 0, q - 2)
  erg = nesum(erg, i3, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i3, i2, i1], [i1, i1, i1 * (q + 1)]))
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i3, i1], [i2, i1, i1 * (q + 1)]))
  ss2n2 = class_center_sums[(2, 1, 1)](evaluate(tt, [i3, i2, i1], [i2, i1, i1 * (q + 1)]))
  ss3n1 = class_center_sums[(3, 1, 1)](evaluate(tt, [i2, i3, i1], [i2, i2, i1 * (q + 1)]))
  ss4n1 = class_center_sums[(4, 1, 1)](evaluate(tt, [i3, i2, i1], [i3, i2, i1 * (q + 1)]))
  ss5n1 = class_center_sums[(4, 1, 2)](evaluate(tt, [i3, i2, i1], [i1, i1, i2]))
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1 - ss4n1 - ss5n1
end
class_center_sums[(5, 1, 3)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^2 - 2)
  erg = nesum(erg, i2, 0, q^2 - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i2, i1], [i1 * (q + 1), i1 * (q + 1)]))
  ss2n1 = class_center_sums[(3, 1, 1)](evaluate(tt, [i2, i1], [i2 * (q + 1), i1 * (q + 1)]))
  ss3n1 = class_center_sums[(3, 1, 2)](evaluate(tt, [i2, i1], [i1, i1]))
  ss3n2 = class_center_sums[(3, 1, 2)](evaluate(tt, [i2, i1], [i1, q * i1]))
  ss4n1 = class_center_sums[(4, 1, 2)](evaluate(tt, [i2, i1], [i2, i1 * (q + 1)]))
  ss4n2 = class_center_sums[(4, 1, 2)](evaluate(tt, [i1, i2], [i2, i1 * (q + 1)]))
  erg - ss1n1 - ss2n1 - ss3n1 - ss3n2 - ss4n1 - ss4n2
end
class_center_sums[(5, 1, 5)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^4 - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i1], [i1 * (q + 1) * (q^2 + 1)]))
  ss2n1 = class_center_sums[(3, 1, 2)](evaluate(tt, [i1], [i1 * (q^2 + 1)]))
  erg - ss1n1 - ss2n1
end
class_center_sums[(5, 1, 4)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q^3 - 2)
  erg = nesum(erg, i2, 0, q - 2)
  ss1n1 = class_center_sums[(1, 1, 1)](evaluate(tt, [i2, i1], [i1, i1 * (q^2 + q + 1)]))
  ss2n1 = class_center_sums[(2, 1, 1)](evaluate(tt, [i2, i1], [i2, i1 * (q^2 + q + 1)]))
  erg - ss1n1 - ss2n1
end
class_center_sums[(1, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, i1, 0, q - 2)
  erg
end

char_center_sums = Dict{Tuple{Int,Int,Int},Function}()
char_center_sums[(3, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^2 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], [k1 * (q + 1)]))
  erg - ss1n1
end
char_center_sums[(4, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q - 2)
  erg = nesum(erg, k3, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k3, k2, k1], [k1, k1, k1]))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k3, k2, k1], [k1, k2, k1]))
  ss2n2 = char_center_sums[(2, 1, 1)](evaluate(tt, [k3, k2, k1], [k2, k1, k1]))
  ss3n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k3, k1], [k2, k2, k1]))
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1
end
char_center_sums[(3, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k2, k1], [k1, k1]))
  erg - ss1n1
end
char_center_sums[(4, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q^2 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1, k2], [k1, k1 * (q + 1)]))
  ss2n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k1], [k2 * (q + 1), k1]))
  erg - ss1n1 - ss2n1
end
char_center_sums[(2, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k2, k1], [k1, k1]))
  erg - ss1n1
end
char_center_sums[(5, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg = nesum(erg, k2, 0, q - 2)
  erg = nesum(erg, k3, 0, q - 2)
  erg = nesum(erg, k4, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k2, k3, k4, k1], [k1, k1, k1, k1]))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k2, k3, k4, k1], [k1, k1, k2, k1]))
  ss2n2 = char_center_sums[(2, 1, 1)](evaluate(tt, [k2, k4, k3, k1], [k1, k1, k2, k1]))
  ss2n3 = char_center_sums[(2, 1, 1)](evaluate(tt, [k3, k4, k2, k1], [k1, k1, k2, k1]))
  ss2n4 = char_center_sums[(2, 1, 1)](evaluate(tt, [k2, k3, k4, k1], [k1, k1, k1, k2]))
  ss3n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k4, k3, k1], [k1, k2, k2, k1]))
  ss3n2 = char_center_sums[(3, 1, 1)](evaluate(tt, [k3, k4, k2, k1], [k1, k2, k2, k1]))
  ss3n3 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k3, k4, k1], [k1, k1, k2, k2]))
  ss4n1 = char_center_sums[(4, 1, 1)](evaluate(tt, [k2, k4, k3, k1], [k1, k2, k3, k1]))
  ss4n2 = char_center_sums[(4, 1, 1)](evaluate(tt, [k3, k4, k2, k1], [k1, k2, k3, k1]))
  ss4n3 = char_center_sums[(4, 1, 1)](evaluate(tt, [k2, k3, k4, k1], [k1, k1, k2, k3]))
  ss4n4 = char_center_sums[(4, 1, 1)](evaluate(tt, [k4, k3, k2, k1], [k1, k2, k3, k1]))
  ss4n5 = char_center_sums[(4, 1, 1)](evaluate(tt, [k2, k4, k3, k1], [k1, k1, k2, k3]))
  ss4n6 = char_center_sums[(4, 1, 1)](evaluate(tt, [k3, k4, k2, k1], [k1, k1, k2, k3]))
  erg - ss1n1 - ss2n1 - ss2n2 - ss2n3 - ss2n4 - ss3n1 - ss3n2 - ss3n3 - ss4n1 - ss4n2 -
  ss4n3 - ss4n4 - ss4n5 - ss4n6
end
char_center_sums[(5, 1, 2)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^2 - 2)
  erg = nesum(erg, k2, 0, q - 2)
  erg = nesum(erg, k3, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k2, k3, k1], [k1, k1, k1 * (q + 1)]))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k3, k2, k1], [k1, k2, k1 * (q + 1)]))
  ss2n2 = char_center_sums[(2, 1, 1)](evaluate(tt, [k2, k1, k3], [k1, k1 * (q + 1), k2]))
  ss3n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k1, k3], [k2, k1 * (q + 1), k2]))
  ss4n1 = char_center_sums[(4, 1, 1)](evaluate(tt, [k2, k1, k3], [k2, k1 * (q + 1), k3]))
  ss5n1 = char_center_sums[(4, 1, 2)](evaluate(tt, [k2, k3, k1], [k1, k1, k2]))
  erg - ss1n1 - ss2n1 - ss2n2 - ss3n1 - ss4n1 - ss5n1
end
char_center_sums[(5, 1, 3)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^2 - 2)
  erg = nesum(erg, k2, 0, q^2 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1, k2], [k1 * (q + 1), k1 * (q + 1)]))
  ss2n1 = char_center_sums[(3, 1, 1)](evaluate(tt, [k2, k1], [k2 * (q + 1), k1 * (q + 1)]))
  ss3n1 = char_center_sums[(3, 1, 2)](evaluate(tt, [k2, k1], [k1, k1]))
  ss3n2 = char_center_sums[(3, 1, 2)](evaluate(tt, [k2, k1], [k1, q * k1]))
  ss4n1 = char_center_sums[(4, 1, 2)](evaluate(tt, [k2, k1], [k2, k1 * (q + 1)]))
  ss4n2 = char_center_sums[(4, 1, 2)](evaluate(tt, [k2, k1], [k1 * (q + 1), k2]))
  erg - ss1n1 - ss2n1 - ss3n1 - ss3n2 - ss4n1 - ss4n2
end
char_center_sums[(5, 1, 5)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^4 - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1], [k1 * (q + 1) * (q^2 + 1)]))
  ss2n1 = char_center_sums[(3, 1, 2)](evaluate(tt, [k1], [k1 * (q^2 + 1)]))
  erg - ss1n1 - ss2n1
end
char_center_sums[(5, 1, 4)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q^3 - 2)
  erg = nesum(erg, k2, 0, q - 2)
  ss1n1 = char_center_sums[(1, 1, 1)](evaluate(tt, [k1, k2], [k1 * (q^2 + q + 1), k1]))
  ss2n1 = char_center_sums[(2, 1, 1)](evaluate(tt, [k2, k1], [k2, k1 * (q^2 + q + 1)]))
  erg - ss1n1 - ss2n1
end
char_center_sums[(1, 1, 1)] = function (tt::Union{GenericCyclo,GenericCycloFrac})
  erg = tt
  erg = nesum(erg, k1, 0, q - 2)
  erg
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
]

classparams = [
  Parameters([Parameter(i1, q - 1)]),
  Parameters([Parameter(i1, q - 1)]),
  Parameters([Parameter(i1, q - 1)]),
  Parameters([Parameter(i1, q - 1)]),
  Parameters([Parameter(i1, q - 1)]),
  Parameters([Parameter(i1, q - 1), Parameter(i2, q - 1)], [((i1 - i2) * 1//(q - 1))]),
  Parameters([Parameter(i1, q - 1), Parameter(i2, q - 1)], [((i1 - i2) * 1//(q - 1))]),
  Parameters([Parameter(i1, q - 1), Parameter(i2, q - 1)], [((i1 - i2) * 1//(q - 1))]),
  Parameters([Parameter(i1, q - 1), Parameter(i2, q - 1)], [((i1 - i2) * 1//(q - 1))]),
  Parameters([Parameter(i1, q - 1), Parameter(i2, q - 1)], [((i1 - i2) * 1//(q - 1))]),
  Parameters([Parameter(i1, q - 1), Parameter(i2, q - 1)], [((i1 - i2) * 1//(q - 1))]),
  Parameters([Parameter(i1, q - 1), Parameter(i2, q - 1)], [((i1 - i2) * 1//(q - 1))]),
  Parameters([Parameter(i1, q^2 - 1)], [((-i1) * 1//(q + 1))]),
  Parameters([Parameter(i1, q^2 - 1)], [((-i1) * 1//(q + 1))]),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q - 1), Parameter(i3, q - 1)],
    [((i1 - i3) * 1//(q - 1)), ((-i2 + i3) * 1//(q - 1)), ((i1 - i2) * 1//(q - 1))],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q - 1), Parameter(i3, q - 1)],
    [((i1 - i3) * 1//(q - 1)), ((-i2 + i3) * 1//(q - 1)), ((i1 - i2) * 1//(q - 1))],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q^2 - 1)],
    [((i1*q + i1 - i2) * 1//(q^2 - 1)), ((-i2) * 1//(q + 1))],
  ),
  Parameters(
    [Parameter(i1, q - 1), Parameter(i2, q^2 - 1)],
    [((i1*q + i1 - i2) * 1//(q^2 - 1)), ((-i2) * 1//(q + 1))],
  ),
  Parameters(
    [
      Parameter(i1, q - 1), Parameter(i2, q - 1), Parameter(i3, q - 1), Parameter(i4, q - 1)
    ],
    [
      ((i1 - i2) * 1//(q - 1)),
      ((i2 - i3) * 1//(q - 1)),
      ((i3 - i4) * 1//(q - 1)),
      ((i1 - i3) * 1//(q - 1)),
      ((i2 - i4) * 1//(q - 1)),
      ((i1 - i4) * 1//(q - 1)),
    ],
  ),
  Parameters(
    [Parameter(i1, q^2 - 1), Parameter(i2, q - 1), Parameter(i3, q - 1)],
    [((-i1) * 1//(q + 1)), ((-i2 + i3) * 1//(q - 1))],
  ),
  Parameters(
    [Parameter(i1, q^2 - 1), Parameter(i2, q^2 - 1)],
    [
      ((-i1) * 1//(q + 1)),
      ((i1*q - i2) * 1//(q^2 - 1)),
      ((-i2) * 1//(q + 1)),
      ((i1 - i2) * 1//(q^2 - 1)),
    ],
  ),
  Parameters([Parameter(i1, q^3 - 1), Parameter(i2, q - 1)], [((-i1) * 1//(q^2 + q + 1))]),
  Parameters(
    [Parameter(i1, q^4 - 1)], [((-i1) * 1//(q^3 + q^2 + q + 1)), ((-i1) * 1//(q^2 + 1))]
  ),
]

charparams = [
  Parameters([Parameter(k1, q - 1)]),
  Parameters([Parameter(k1, q - 1)]),
  Parameters([Parameter(k1, q - 1)]),
  Parameters([Parameter(k1, q - 1)]),
  Parameters([Parameter(k1, q - 1)]),
  Parameters([Parameter(k1, q - 1), Parameter(k2, q - 1)], [((k1 - k2) * 1//(q - 1))]),
  Parameters([Parameter(k1, q - 1), Parameter(k2, q - 1)], [((k1 - k2) * 1//(q - 1))]),
  Parameters([Parameter(k1, q - 1), Parameter(k2, q - 1)], [((k1 - k2) * 1//(q - 1))]),
  Parameters([Parameter(k1, q - 1), Parameter(k2, q - 1)], [((k1 - k2) * 1//(q - 1))]),
  Parameters([Parameter(k1, q - 1), Parameter(k2, q - 1)], [((k1 - k2) * 1//(q - 1))]),
  Parameters([Parameter(k1, q - 1), Parameter(k2, q - 1)], [((k1 - k2) * 1//(q - 1))]),
  Parameters([Parameter(k1, q - 1), Parameter(k2, q - 1)], [((k1 - k2) * 1//(q - 1))]),
  Parameters([Parameter(k1, q^2 - 1)], [((-k1) * 1//(q + 1))]),
  Parameters([Parameter(k1, q^2 - 1)], [((-k1) * 1//(q + 1))]),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q - 1), Parameter(k3, q - 1)],
    [((k1 - k3) * 1//(q - 1)), ((-k2 + k3) * 1//(q - 1)), ((k1 - k2) * 1//(q - 1))],
  ),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q - 1), Parameter(k3, q - 1)],
    [((k1 - k3) * 1//(q - 1)), ((-k2 + k3) * 1//(q - 1)), ((k1 - k2) * 1//(q - 1))],
  ),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q^2 - 1)],
    [((k1*q + k1 - k2) * 1//(q^2 - 1)), ((-k2) * 1//(q + 1))],
  ),
  Parameters(
    [Parameter(k1, q - 1), Parameter(k2, q^2 - 1)],
    [((k1*q + k1 - k2) * 1//(q^2 - 1)), ((-k2) * 1//(q + 1))],
  ),
  Parameters(
    [
      Parameter(k1, q - 1), Parameter(k2, q - 1), Parameter(k3, q - 1), Parameter(k4, q - 1)
    ],
    [
      ((k1 - k2) * 1//(q - 1)),
      ((k2 - k3) * 1//(q - 1)),
      ((k3 - k4) * 1//(q - 1)),
      ((k1 - k3) * 1//(q - 1)),
      ((k2 - k4) * 1//(q - 1)),
      ((k1 - k4) * 1//(q - 1)),
    ],
  ),
  Parameters(
    [Parameter(k1, q^2 - 1), Parameter(k2, q - 1), Parameter(k3, q - 1)],
    [((-k1) * 1//(q + 1)), ((-k2 + k3) * 1//(q - 1))],
  ),
  Parameters(
    [Parameter(k1, q^2 - 1), Parameter(k2, q^2 - 1)],
    [
      ((-k1) * 1//(q + 1)),
      ((k1*q - k2) * 1//(q^2 - 1)),
      ((-k2) * 1//(q + 1)),
      ((k1 - k2) * 1//(q^2 - 1)),
    ],
  ),
  Parameters(
    [Parameter(k1, q^3 - 1), Parameter(k2, q - 1)], [((-k1*q - k1) * 1//(q^2 + q + 1))]
  ),
  Parameters(
    [Parameter(k1, q^4 - 1)],
    [((-k1*q^2 - k1*q - k1) * 1//(q^3 + q^2 + q + 1)), ((-k1) * 1//(q^2 + 1))],
  ),
]

classparamindex = var_index.([i1, i2, i3, i4])
charparamindex = var_index.([k1, k2, k3, k4])

information = raw"""The generic character table of $\mathrm{GL}_4(q)$.

- The table was first computed in [Ste51](@cite).

- CHEVIE table of a group of Dynkin type A_3(q)

- This table is computed by programs of the system CHEVIE3
  written by Frank Luebeck.

- More precisely the table corresponds to a series of groups of
  Lie type, given by the complete root datum:
  roots := [[1,-1,0,0],[0,1,-1,0],[0,0,1,-1]]
  coroots := [[1,-1,0,0],[0,1,-1,0],[0,0,1,-1]]
  F0 := [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]

- This table is valid for all prime powers q.

"""

TABLE = CharTable(order, permutedims(table), classinfo, classlength, charinfo, chardegree,
  classsums, charsums, classparamindex, charparamindex, classparams, charparams, S,
  information, splitext(basename(@__FILE__))[1])

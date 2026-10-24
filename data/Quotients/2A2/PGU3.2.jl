using ..GenericCharacterTables
import ..GenericCharacterTables:
  CentralQuotientData, QuotientCharacterType, QuotientClassType, Parameter
using ..GenericCharacterTables.Oscar

# PGU_3(q) = GU_3(q)/Z, q congruent to 2 modulo 3, Z = {zI} of order q + 1.
t = generic_character_table("GU3")
q, (k, l, m, u, v, w) = parameters(t)
R = parent(q)

DATA = CentralQuotientData(
  splitext(basename(@__FILE__))[1];
  congruence=ZZ.((-1, 3)),
  center_order=q + 1,
  center_class=1,
  center_generator=[k => R(1)],
  filter=3,
  # tensoring with det
  twist=[
    [u => R(1)], [u => R(1)], [u => R(1)], [u => R(1), v => R(1)], [u => R(1), v => R(1)],
    [u => R(1), v => R(1), w => R(1)], [v => R(1), u => 1 - q], [u => q^2 - q + 1],
  ],
  chars=[
    [
      QuotientCharacterType(T; substitution=[u => (q + 1) * 1//3 * u],
        inverse=[u => 3 * u * 1//(q + 1)], params=[Parameter(u, R(3))]) for T in 1:3
    ];
    [
      QuotientCharacterType(T; substitution=[v => -2 * u], params=[Parameter(u, q + 1)])
      for T in 4:5
    ];
    QuotientCharacterType(6; substitution=[w => -u - v],
      params=[Parameter(u, q + 1), Parameter(v, q + 1)]);
    QuotientCharacterType(7; substitution=[v => -u], params=[Parameter(u, q^2 - 1)]);
    QuotientCharacterType(8; substitution=[u => (q + 1) * u], inverse=[u => u * 1//(q + 1)],
      params=[Parameter(u, q^2 - q + 1)])
  ],
  classes=[
    [QuotientClassType(T; substitution=[k => R(0)]) for T in 1:3];
    # diag(1, ω, ω^2)
    QuotientClassType(6;
      substitution=[k => R(0), l => (q + 1) * 1//3, m => 2 * (q + 1) * 1//3],
      stabilizer=3);
    QuotientClassType(8; substitution=[k => (q^2 - q + 1) * 1//3 * k], stabilizer=3,
      params=[Parameter(k, R(2))], points=[[R(1)], [R(2)]]);
    [
      QuotientClassType(T; substitution=[k => R(0), l => k], projection=[k => l - k],
        params=[Parameter(k, q + 1)]) for T in 4:5
    ];
    QuotientClassType(6; substitution=[k => R(0), l => k, m => l],
      projection=[k => l - k, l => m - k], params=[
        Parameter(k, q + 1), Parameter(l, q + 1)
      ]);
    QuotientClassType(7; substitution=[k => R(0), l => -k],
      projection=[k => (q - 1) * k - l],
      params=[Parameter(k, q^2 - 1)]);
    QuotientClassType(8; projection=[k => k], params=[Parameter(k, q^2 - q + 1)],
      exceptions=[3 * k * 1//(q^2 - q + 1)])
  ],
)

TABLE = central_quotient(t, DATA)

using ..GenericCharacterTables
import ..GenericCharacterTables:
  CentralQuotientData, QuotientCharacterType, QuotientClassType, Parameter
using ..GenericCharacterTables.Oscar

# PSL_3(q) = SL_3(q)/Z, q congruent to 1 modulo 3, Z = {ωI} of order 3.
t = generic_character_table("SL3.1")
q, (a, b, m, n) = parameters(t)
R = parent(q)

DATA = CentralQuotientData(
  splitext(basename(@__FILE__))[1];
  center_order=R(3),
  center_class=1,
  center_generator=[a => R(1)],
  filter=3,
  chars=[
    [QuotientCharacterType(T) for T in 1:3];
    [
      QuotientCharacterType(T; substitution=[n => 3 * n], inverse=[n => n * 1//3],
        params=[Parameter(n, (q - 1) * 1//3)]) for T in 4:5
    ];
    [QuotientCharacterType(T) for T in 6:8];
    QuotientCharacterType(9; substitution=[n => 3 * n - m], inverse=[n => (n + m) * 1//3],
      params=[Parameter(n, (q - 1) * 1//3), Parameter(m, q - 1)]);
    QuotientCharacterType(10; substitution=[n => 3 * n], inverse=[n => n * 1//3],
      params=[Parameter(n, (q^2 - 1) * 1//3)]);
    QuotientCharacterType(17; substitution=[n => 3 * n], inverse=[n => n * 1//3],
      params=[Parameter(n, (q^2 + q + 1) * 1//3)])
  ],
  classes=[
    [QuotientClassType(T; substitution=[a => R(0)]) for T in 1:5];
    [QuotientClassType(T; projection=[a => a], params=[Parameter(a, q - 1)]) for T in 6:7];
    # diag(1, ω, ω^2)
    QuotientClassType(8; substitution=[a => R(0), b => (q - 1) * 1//3], stabilizer=3);
    QuotientClassType(8; projection=[a => a, b => b],
      params=[Parameter(a, q - 1), Parameter(b, q - 1)],
      exceptions=[3 * a * 1//(q - 1), 3 * b * 1//(q - 1)]);
    QuotientClassType(9; projection=[a => a], params=[Parameter(a, q^2 - 1)]);
    QuotientClassType(10; projection=[a => a], params=[Parameter(a, q^2 + q + 1)])
  ],
)

TABLE = central_quotient(t, DATA)

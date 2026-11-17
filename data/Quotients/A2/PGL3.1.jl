using ..GenericCharacterTables
import ..GenericCharacterTables:
  CentralQuotientData, QuotientCharacterType, QuotientClassType, Parameter
using ..GenericCharacterTables.Oscar

# PGL_3(q) = GL_3(q)/Z, q congruent to 1 modulo 3, Z = {zI} of order q - 1.
t = generic_character_table("GL3")
q, (a, b, c, l, m, n) = parameters(t)
R = parent(q)

DATA = CentralQuotientData(
  splitext(basename(@__FILE__))[1];
  congruence=ZZ.((1, 3)),
  center_order=q - 1,
  center_class=1,
  center_generator=[a => R(1)],
  filter=3,
  # tensoring with det
  twist=[
    [n => R(1)], [n => R(1)], [n => R(1)], [n => R(1), m => R(1)], [n => R(1), m => R(1)],
    [n => R(1), m => R(1), l => R(1)], [m => R(1), n => q + 1], [n => q^2 + q + 1],
  ],
  chars=[
    [
      QuotientCharacterType(T; substitution=[n => (q - 1) * 1//3 * n],
        inverse=[n => 3 * n * 1//(q - 1)], params=[Parameter(n, R(3))]) for T in 1:3
    ];
    [
      QuotientCharacterType(T; substitution=[m => -2 * n], params=[Parameter(n, q - 1)])
      for T in 4:5
    ];
    QuotientCharacterType(6; substitution=[l => -n - m],
      params=[Parameter(n, q - 1), Parameter(m, q - 1)]);
    QuotientCharacterType(7; substitution=[m => -n], params=[Parameter(n, q^2 - 1)]);
    QuotientCharacterType(8; substitution=[n => (q - 1) * n], inverse=[n => n * 1//(q - 1)],
      params=[Parameter(n, q^2 + q + 1)])
  ],
  classes=[
    [QuotientClassType(T; substitution=[a => R(0)]) for T in 1:3];
    [
      QuotientClassType(T; substitution=[a => R(0), b => a], projection=[a => b - a],
        params=[Parameter(a, q - 1)]) for T in 4:5
    ];
    # diag(1, ω, ω^2)
    QuotientClassType(6;
      substitution=[a => R(0), b => (q - 1) * 1//3, c => 2 * (q - 1) * 1//3],
      stabilizer=3);
    QuotientClassType(6; substitution=[a => R(0), b => a, c => b],
      projection=[a => b - a, b => c - a], params=[
        Parameter(a, q - 1), Parameter(b, q - 1)
      ]);
    QuotientClassType(7; substitution=[a => R(0), b => a],
      projection=[a => b - (q + 1) * a],
      params=[Parameter(a, q^2 - 1)]);
    # x with x^q = ωx
    QuotientClassType(8; substitution=[a => (q^2 + q + 1) * 1//3 * a], stabilizer=3,
      params=[Parameter(a, R(2))], points=[[R(1)], [R(2)]]);
    QuotientClassType(8; projection=[a => a], params=[Parameter(a, q^2 + q + 1)],
      exceptions=[a * 1//((q^2 + q + 1) * 1//3)])
  ],
)

TABLE = central_quotient(t, DATA)

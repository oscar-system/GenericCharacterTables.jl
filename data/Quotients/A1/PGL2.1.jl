using ..GenericCharacterTables
import ..GenericCharacterTables:
  CentralQuotientData, QuotientCharacterType, QuotientClassType, Parameter
using ..GenericCharacterTables.Oscar

# PGL_2(q) = GL_2(q)/Z, q odd, Z = {zI} of order q - 1.
t = generic_character_table("GL2")
q, (i, j, l, k) = parameters(t)
R = parent(q)

DATA = CentralQuotientData(
  splitext(basename(@__FILE__))[1];
  congruence=ZZ.((1, 2)),
  center_order=q - 1,
  center_class=1,
  center_generator=[i => R(1)],
  filter=2,
  # tensoring with det
  twist=[[k => R(1)], [k => R(1)], [k => R(1), l => R(1)], [k => q + 1]],
  chars=[
    QuotientCharacterType(1; substitution=[k => (q - 1)//2 * k],
      inverse=[k => 2 * k//(q - 1)], params=[Parameter(k, R(2))]),
    QuotientCharacterType(2; substitution=[k => (q - 1)//2 * k],
      inverse=[k => 2 * k//(q - 1)], params=[Parameter(k, R(2))]),
    QuotientCharacterType(3; substitution=[l => -k], params=[Parameter(k, q - 1)]),
    QuotientCharacterType(4; substitution=[k => (q - 1) * k],
      inverse=[k => k//(q - 1)], params=[Parameter(k, q + 1)]),
  ],
  classes=[
    QuotientClassType(1; substitution=[i => R(0)]),
    QuotientClassType(2; substitution=[i => R(0)]),
    # diag(1, -1) ~ diag(-1, 1)
    QuotientClassType(3; substitution=[i => R(0), j => (q - 1)//2], stabilizer=2),
    QuotientClassType(3; substitution=[i => R(0), j => i], projection=[i => j - i],
      params=[Parameter(i, q - 1)], exceptions=[2 * i//(q - 1)]),
    # x with x^q = -x
    QuotientClassType(4; substitution=[i => (q + 1)//2], stabilizer=2),
    QuotientClassType(4; projection=[i => i], params=[Parameter(i, q + 1)],
      exceptions=[2 * i//(q + 1)]),
  ],
)

TABLE = central_quotient(t, DATA)

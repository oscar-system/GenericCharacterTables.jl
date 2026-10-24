using ..GenericCharacterTables
import ..GenericCharacterTables:
  CentralQuotientData, QuotientCharacterType, QuotientClassType, Parameter
using ..GenericCharacterTables.Oscar

# PSL_2(q) = SL_2(q)/{±1}, q congruent to 3 modulo 4.
t = generic_character_table("SL2.1")
q0, (i, k) = parameters(t)
R = parent(q0)
q = q0^2

DATA = CentralQuotientData(
  splitext(basename(@__FILE__))[1];
  congruence=ZZ.((3, 4)),
  center_order=R(2),
  center_class=1,
  center_generator=[i => R(1)],
  filter=2,
  chars=[
    QuotientCharacterType(1),
    QuotientCharacterType(2),
    QuotientCharacterType(5),
    QuotientCharacterType(6),
    QuotientCharacterType(7; substitution=[k => 2 * k], inverse=[k => k * 1//2],
      params=[Parameter(k, (q - 1) * 1//2)]),
    QuotientCharacterType(8; substitution=[k => 2 * k], inverse=[k => k * 1//2],
      params=[Parameter(k, (q + 1) * 1//2)], exceptions=[k * 1//((q + 1) * 1//4)]),
  ],
  classes=[
    QuotientClassType(1; substitution=[i => R(0)]),
    QuotientClassType(2; substitution=[i => R(0)]),
    QuotientClassType(3; substitution=[i => R(0)]),
    QuotientClassType(4; projection=[i => i], params=[Parameter(i, (q - 1) * 1//2)]),
    QuotientClassType(5; projection=[i => i], params=[Parameter(i, (q + 1) * 1//2)],
      exceptions=[i * 1//((q + 1) * 1//4)]),
    # x with x^q = -x
    QuotientClassType(5; substitution=[i => (q + 1) * 1//4], stabilizer=2),
  ],
)

TABLE = central_quotient(t, DATA)

using ..GenericCharacterTables
import ..GenericCharacterTables: SimpleCharTable
using Oscar
K, sqrt2 = quadratic_field(2)
R, q = polynomial_ring(K, "q")

order = q^4*(q^2-1)*(q^4+1)
table = Generic.Poly{AbsSimpleNumFieldElem}[[
	q^4+1,
	R(1),
	R(1),
	R(1)] [
	-(q^2-1)*(q^2-sqrt2*q+1),
	-sqrt2*q+1,
	R(1),
	R(1)] [
	-(q^2-1)*(q^2+sqrt2*q+1),
	sqrt2*q+1,
	R(1),
	R(1)]]
classinfo = Vector{Any}[[], [], [], []]
classlength = R.([1, (q-1)*(q+1)*(q^4+1), 1//2*q^2*(q-1)*(q+1)*(q^4+1), 1//2*q^2*(q-1)*(q+1)*(q^4+1)])
classtypeorder = R.([1, 1, 1, 1])
charinfo = Vector{Any}[["T_1"], ["T_2"], ["T_3"]]
chardegree = R.([q^4+1, -(q^2-1)*(q^2-sqrt2*q+1), -(q^2-1)*(q^2+sqrt2*q+1)])

information = "- Information about the Green functions of \$^2B_2(q^2)\$.

- CHEVIE-name of the table: ``2B2green``

- The table was first computed in:
  {\\sc M. Suzuki}, On a class of doubly transitive groups, {\\em Ann. of
    Math. \\bf75} (1962), 105--145.
"

TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information,splitext(basename(@__FILE__))[1])

export setcongruence

# TODO: find a better name
# TODO: simplify? always? on request? never? (currently always)
@doc raw"""
    setcongruence(x::CharTable, congruence::Tuple{ZZRingElem, ZZRingElem})

Return a new generic character table based on `x` where the main parameter is additionally assumed to be congruent to `congruence[1]` modulo
`congruence[2]`. So the entries of `x` can potentially be simplified further.
"""
function setcongruence(x::CharTable, congruence::Tuple{ZZRingElem, ZZRingElem})
	if x.ring.congruence === nothing
		remainder,modulus=congruence
	else
		remainder=crt(congruence..., x.ring.congruence...)
		modulus=lcm(congruence[2], x.ring.congruence[2])
	end
	# The coercion of `GnericCharacter` relies on `base_ring(S) == base_ring(x.ring)`
	S=generic_cyclotomic_ring(base_ring(x.ring); congruence=(remainder, modulus))
	t=typeof(x)(
		x.order,
		deepcopy(x.classinfo),
		deepcopy(x.classlength),
		deepcopy(x.classsums),
		deepcopy(x.classparamindex),
		deepcopy(x.charparamindex),
		deepcopy(x.classparams),
		S,  # <- this changed
		x.information,
		Vector{GenericCharacter}(undef, chartypes(x)),
		x.irrchartypes,
		x.importname*"*"
	)
	for i in 1:chartypes(x)
		t.chars[i]=t(x[i])
	end
	return t
end

@doc raw"""
    setcongruence(x::CharTable; remainder::Union{Int, ZZRingElem}, modulus::Union{Int, ZZRingElem})

Return a new generic character table based on `x` where the main parameter is additionally assumed to be congruent to `remainder` modulo `modulus`.
So the entries of `x` can potentially be simplified further. All existing congruences in `x` will be preserved. This function is usefull for
decomposing tensor products.

# Examples
```jldoctest
julia> g=genchartab("GL2")
Generic character table GL2
  of order q^4 - q^3 - q^2 + q
  with 4 irreducible character types
  with 4 class types
  with parameters (i, j, l, k)

julia> setcongruence(g; remainder=0, modulus=2)
Generic character table GL2*
  of order q^4 - q^3 - q^2 + q
  restricted to q congruent to 0 modulo 2
  with 4 irreducible character types
  with 4 class types
  with parameters (i, j, l, k)
```
"""
function setcongruence(x::CharTable; remainder::Union{Int, ZZRingElem}, modulus::Union{Int, ZZRingElem})
	return setcongruence(x::CharTable, ZZ.((remainder, modulus)))
end

congruence(x::CharTable) = x.ring.congruence
congruence(x::SimpleCharTable) = nothing

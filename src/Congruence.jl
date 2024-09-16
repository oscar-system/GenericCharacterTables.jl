export setcongruence

# TODO: find a better name
# TODO: simplify? always? on request? never? (currently always)
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

setcongruence(x::CharTable, congruence::Tuple{Int, Int}) = setcongruence(x, ZZ.(congruence))

congruence(x::CharTable) = x.ring.congruence
congruence(x::SimpleCharTable) = nothing

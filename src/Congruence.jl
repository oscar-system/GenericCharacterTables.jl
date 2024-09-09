export setcongruence

# TODO: find a better name
# TODO: what type should `new_congruence` have?
# TODO: should we only allow to specify *additional* congruences?
# TODO: simplify? always? on request? never? (currently always)
function setcongruence(x::CharTable, new_congruence::Tuple{QQFieldElem, QQFieldElem})
	# For now don't allow changing the congruence once it has been set, as this
	# could lead to inconsistencies. In the future we could interpret this as *adding*
	# a congruence relation, but then we need to come up with a way to handle it.
	x.ring.congruence === nothing || error("cannot override already set congruence")
	S=generic_cyclotomic_ring(base_ring(x.ring); congruence=new_congruence)
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
		char=x[i]
		t.chars[i]=GenericCharacter(
			t,
			S.(char.values),  # <- this changed
			deepcopy(char.info),
			deepcopy(char.degree),
			deepcopy(char.sum),
			deepcopy(char.params)
		)
	end
	return t
end

setcongruence(x::CharTable, new_congruence::Tuple{Int, Int}) = setcongruence(x, QQ.(new_congruence))

congruence(x::CharTable) = x.ring.congruence
congruence(x::SimpleCharTable) = nothing

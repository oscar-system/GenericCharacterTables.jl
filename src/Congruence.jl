export setcongruence

# TODO this should mainly be removed due to the handling of congruences in GenericCycloRing

setcongruence(x::Union{GenericCyclo, GenericCycloFrac}, c::UPoly; simplify=true) = evaluate(x, [1], [c])  # TODO support simplify

# TODO: find a better name
# TODO: what type should `c` have?
# TODO: should we only allow to specify *additional* congruences?
# TODO: simplify? always? on request? never?
function setcongruence(x::CharTable, new_congruence::Tuple{QQFieldElem, QQFieldElem})
	# For now don't allow changing the congruence once it has been set, as this
	# could lead to inconsistencies. In the future we could interpret this as *adding*
	# a congruence relation, but then we need to come up with a way to handle it.
	x.congruence === nothing || error("cannot override already set congruence")
	t=typeof(x)(
		x.order,
		deepcopy(x.classinfo),
		deepcopy(x.classlength),
		deepcopy(x.classsums),
		deepcopy(x.classparamindex),
		deepcopy(x.charparamindex),
		deepcopy(x.classparams),
		new_congruence,  # <- this changed
		x.ring,
		x.information,
		Vector{GenericCharacter}(undef, chartypes(x)),
		x.irrchartypes,
		x.importname*"*"
	)
	for i in 1:chartypes(x)
		char=x[i]
		t.chars[i]=GenericCharacter(
			t,
			deepcopy(char.values),
			deepcopy(char.info),
			deepcopy(char.degree),
			deepcopy(char.sum),
			deepcopy(char.params)
		)
	end
	return t
end

function setcongruence(x::CharTable, new_congruence::Tuple{Int, Int})
	R = parent(x.order)
	setcongruence(x, QQ.(new_congruence))
end

congruence(x::CharTable) = x.congruence
congruence(x::SimpleCharTable) = nothing

@doc raw"""
    simplify(x::Union{GenericCyclo, GenericCycloFrac}, c::UPoly, cinv::UPoly)

Simplify `x` by replacing the first free variable in `x` by `c` and then back to `cinv`.

This is used to remove terms that look fractional but are in fact whole.
"""
function simplify(x::Union{GenericCyclo, GenericCycloFrac}, c::UPoly, cinv::UPoly)
	setcongruence(setcongruence(x, c), cinv, simplify=false)
end

@doc raw"""
    simplify(x::Union{GenericCyclo, GenericCycloFrac}, t::CharTable)

Simplify `x` according to the congruence relation given by `t`.
"""
function simplify(x::Union{GenericCyclo, GenericCycloFrac}, t::CharTable)
	if t.congruence === nothing
		return x
	else
		var=gens(base_ring(t.ring))[1]
		c=t.congruence[2]*var+t.congruence[1]
		cinv=(var-t.congruence[1])*inv(t.congruence[2])  # TODO why is // not allowed here?
		return simplify(x, c, cinv)
	end
end

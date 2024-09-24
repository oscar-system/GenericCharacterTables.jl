# Be careful with these

function get_shift_mask(ring::UPolyRing, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	generators = gens(ring)
	n=length(generators)
	newvars = vars.+(steps*step_size)
	mask=fill(false, n)
	for var in newvars
		mask[var]=true
	end
	return generators[mask]
end

function var_shift(a::UPoly, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return evaluate(a, vars, get_shift_mask(parent(a), vars, step_size, steps))
end
function var_shift(a::UPolyFrac, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return evaluate(a, vars, get_shift_mask(parent(numerator(a)), vars, step_size, steps))
end
function var_shift(a::GenericCyclo, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return evaluate(a, vars, get_shift_mask(base_ring(parent(a)), vars, step_size, steps))
end
function var_shift(a::GenericCycloFrac, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return evaluate(a, vars, get_shift_mask(base_ring(parent(a.numerator)), vars, step_size, steps))
end
function var_shift(a::Parameter, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return Parameter(var_shift(a.var, vars, step_size, steps), a.modulus)
end
function var_shift(a::ParameterSubstitution, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return ParameterSubstitution(var_shift(a.var, vars, step_size, steps), var_shift(a.expression, vars, step_size, steps))
end
function var_shift(a::Parameters, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return Parameters(var_shift.(a.params, Ref(vars),Ref(step_size), Ref(steps)),
		var_shift.(a.exceptions, Ref(vars),Ref(step_size), Ref(steps)),
		var_shift.(a.substitutions, Ref(vars),Ref(step_size), Ref(steps)))
end

@doc raw"""
    shift_class_parameters(t::CharTable, a::Union{Parameters,GenericCyclo,GenericCycloFrac}, steps::Int64)

Replace all class parameters of `t` in `a` by their counterparts suffixed with `steps`.

This is done by shifting them `steps*nrparams(t)` steps further in `t.argumentring`.
"""
function shift_class_parameters(t::CharTable, a::Union{Parameters,GenericCyclo,GenericCycloFrac}, steps::Int64)
	return var_shift(a, t.classparamindex, nrparams(t), steps)
end

@doc raw"""
    shift_char_parameters(t::CharTable, a::Union{Parameters,GenericCyclo,GenericCycloFrac}, steps::Int64)

Replace all character parameters of `t` in `a` by their counterparts suffixed with `steps`.

This is done by shifting them `steps*nrparams(t)` steps further in `t.argumentring`.
"""
function shift_char_parameters(t::CharTable, a::Union{Parameters,GenericCyclo,GenericCycloFrac}, steps::Int64)
	return var_shift(a, t.charparamindex, nrparams(t), steps)
end

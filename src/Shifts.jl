# Be careful with these

function var_shift(a::FracPoly{T}, vars::Vector{Int64}, step_size::Int64, steps::Int64) where T <: NfPoly
	S=parent(a)
	generators = gens(S)
	n=length(generators)
	newvars = vars.+(steps*step_size)
	mask=fill(false, n)
	for var in newvars
		mask[var]=true
	end
	return evaluate(a, vars, generators[mask])
end
function var_shift(a::Cyclo{<:NfPoly}, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return Cyclo(a.modulus,var_shift(a.argument, vars, step_size, steps), simplify=false)
end
function var_shift(a::CycloSum{<:NfPoly}, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return CycloSum(var_shift.(a.summands, Ref(vars), Ref(step_size), Ref(steps)),simplify=false)
end
function var_shift(a::CycloFrac{<:NfPoly}, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return CycloFrac(var_shift(a.numerator, vars, step_size, steps), var_shift(a.denominator, vars, step_size, steps),simplify=false)
end
function var_shift(a::Parameter{<:NfPoly}, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return Parameter(var_shift(a.var, vars, step_size, steps), a.modulus)
end
function var_shift(a::ParameterException{<:NfPoly}, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return ParameterException(var_shift(a.expression, vars, step_size, steps),simplify=false)
end
function var_shift(a::ParameterSubstitution{<:NfPoly}, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return ParameterSubstitution(var_shift(a.var, vars, step_size, steps), var_shift(a.expression, vars, step_size, steps))
end
function var_shift(a::Parameters{<:NfPoly}, vars::Vector{Int64}, step_size::Int64, steps::Int64)
	return Parameters(var_shift.(a.params, Ref(vars),Ref(step_size), Ref(steps)),
		var_shift.(a.exceptions, Ref(vars),Ref(step_size), Ref(steps)),
		var_shift.(a.substitutions, Ref(vars),Ref(step_size), Ref(steps)))
end

"""
    shift_class_parameters(t::CharTable{T}, a::Union{Parameters{T},Cyclotomic{T}}, steps::Int64) where T <: NfPoly

Replace all class parameters of `t` in `a` by their counterparts suffixed with `steps`.

This is done by shifting them `steps*nrparams(t)` steps further in `t.argumentring`.
"""
function shift_class_parameters(t::CharTable{T}, a::Union{Parameters{T},Cyclotomic{T}}, steps::Int64) where T <: NfPoly
	return var_shift(a, t.classparamindex, nrparams(t), steps)
end

"""
    shift_char_parameters(t::CharTable{T}, a::Union{Parameters{T},Cyclotomic{T}}, steps::Int64) where T <: NfPoly

Replace all character parameters of `t` in `a` by their counterparts suffixed with `steps`.

This is done by shifting them `steps*nrparams(t)` steps further in `t.argumentring`.
"""
function shift_char_parameters(t::CharTable{T}, a::Union{Parameters{T},Cyclotomic{T}}, steps::Int64) where T <: NfPoly
	return var_shift(a, t.charparamindex, nrparams(t), steps)
end

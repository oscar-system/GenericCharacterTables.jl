@doc raw"""
    specclassparam!(t::CharTable, class::Int64, var::UPoly, expr::RingElement)

Replace the parameter `var` with `expr` in the class type `class`.

# Examples
```jldoctest
julia> g=genchartab("GL2");

julia> [c[1] for c in g]
4-element Vector{GenericCharacterTables.GenericCyclo}:
 exp(2π𝑖((2*i*k)//(q - 1)))
 q*exp(2π𝑖((2*i*k)//(q - 1)))
 (q + 1)*exp(2π𝑖((i*l + i*k)//(q - 1)))
 (q - 1)*exp(2π𝑖((i*k)//(q - 1)))

julia> q,(i,j,l,k) = params(g);

julia> specclassparam!(g, 1, k, 3)

julia> [c[1] for c in g]
4-element Vector{GenericCharacterTables.GenericCyclo}:
 exp(2π𝑖((6*i)//(q - 1)))
 q*exp(2π𝑖((6*i)//(q - 1)))
 (q + 1)*exp(2π𝑖((i*l + 3*i)//(q - 1)))
 (q - 1)*exp(2π𝑖((3*i)//(q - 1)))
```
"""
function specclassparam!(t::CharTable, class::Int64, var::UPoly, expr::RingElement)
	if class > number_of_conjugacy_class_types(t)
		throw(DomainError(class, "Class type is out of range."))
	end
	if !is_gen(var)
		throw(DomainError(var, "Not a single variable."))
	end
	for char in 1:length(t)
		t[char].values[class]=evaluate(t[char,class], [var_index(var)], [expr])
	end
	push!(t.classparams[class].substitutions, ParameterSubstitution(var, base_ring(t.ring)(expr)))
	return nothing
end

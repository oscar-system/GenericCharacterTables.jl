show(io::IO, a::Parameter) = print(io, "$(a.var) ∈ {1,…, $(a.modulus)}")

show(io::IO, a::ParameterSubstitution) = print(io, "$(a.var) = $(a.expression)")

getindex(p::Parameters, i::Integer) = p.params[i]

eltype(::Type{Parameters}) = Parameter

length(p::Parameters) = length(p.params)

iterate(p::Parameters, state::Integer=1) =
  state > length(p) ? nothing : (p[state], state + 1)

function Parameters(p::Vector{Parameter})
  return Parameters(p, UPolyFrac[])
end

# TODO Use OSCAR's expressify system here.
function show(io::IO, a::Parameters)
  print(io, join(a.params, ", "))
  if !isempty(a.exceptions)
    print(io, " except ")
    for (i, exception) in enumerate(a.exceptions)
      if isone(denominator(exception))
        print(io, "$(numerator(exception)) ∈ ℤ")
      else
        print(io, "$(numerator(exception)) ∈ ($(denominator(exception)))ℤ")
      end
      if i < length(a.exceptions)
        print(io, ", ")
      end
    end
  end
end

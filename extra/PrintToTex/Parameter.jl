import Base: show

function show(io::IO, m::MIME{Symbol("text/latex")}, a::Parameter)
  print(
    io, "$(repr("text/latex",a.var)) \\in \\{1,\\ldots, $(repr("text/latex",a.modulus))\\}"
  )
end

show(io::IO, m::MIME{Symbol("text/latex")}, a::ParameterSubstitution) =
  print(io, "$(a.var) \\eq $(repr("text/latex",a.expression))")

function show(io::IO, m::MIME{Symbol("text/latex")}, a::Parameters)
  params = repr.(Ref("text/latex"), a.params)
  substitutions = repr.(Ref("text/latex"), a.substitutions)
  exceptions = repr.(Ref("text/latex"), a.exceptions)
  if isempty(a.exceptions)
    if isempty(a.substitutions)
      print(io, join(params, ", "))
    else
      print(
        io,
        "$(join(params, ", ")), \\textrm{substitutions}\\colon $(join(substitutions, ", "))",
      )
    end
  else
    if isempty(a.substitutions)
      print(io, "$(join(params, ", ")) \\textrm{except} $(join(exceptions, ", "))")
    else
      print(
        io,
        "$(join(params, ", ")) \\textrm{except} $(join(exceptions, ", ")), \\textrm{substitutions}\\colon  $(join(substitutions, ", "))",
      )
    end
  end
end

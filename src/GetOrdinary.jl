function exceptions_apply(exceptions, vars, vals)
  for exception in exceptions
    if is_integer(evaluate(exception, vars, vals))
      return true
    end
  end
  return false
end

function get_ordinary(char::GenericCharacter, val)
  ordinary_chars = []
  q = parameters(parent(char))[1]
  params = parameters(char)
  exceptions = params.exceptions
  ranges = UnitRange{Int64}[]
  vars = Int64[]
  for param in params
    push!(vars, var_index(param.var))
    upper = evaluate(param.modulus, [q], [val])
    push!(ranges, 1:numerator(constant_coefficient(upper)))
  end
  spec = specialize(char, q, val)
  for vals in Iterators.product(ranges...)
    vals = collect(vals)
    if !exceptions_apply(exceptions, vars, vals)
      ordinary_char = evaluate.(spec.values, Ref(vars), Ref(vals))
      push!(ordinary_chars, ordinary_char)
    end
  end
  return ordinary_chars
end

function get_ordinary(table::CharTable, val)
  q = parameters(table)[1]
  ordinary_chars = []
  for char in table
    for ordinary_char in get_ordinary(char, val)
      push!(ordinary_chars, ordinary_char)
    end
  end
  ordinary_table = []
  for _ in ordinary_chars
    push!(ordinary_table, [])
  end
  for class in 1:number_of_conjugacy_class_types(table)
    params = parameters(table[:,class])
    exceptions = params.exceptions
    ranges = UnitRange{Int64}[]
    vars = Int64[]
    for param in params
      push!(vars, var_index(param.var))
      upper = evaluate(param.modulus, [q], [val])
      push!(ranges, 1:numerator(constant_coefficient(upper)))
    end
    for vals in Iterators.product(ranges...)
      vals = collect(vals)
      if !exceptions_apply(exceptions, vars, vals)
        for (i, ordinary_char) in enumerate(ordinary_chars)
          push!(ordinary_table[i], evaluate(ordinary_char[class], vars, vals))
        end
      end
    end
  end
  return transpose(unique(unique(hcat(ordinary_table...), dims=1), dims=2))
end

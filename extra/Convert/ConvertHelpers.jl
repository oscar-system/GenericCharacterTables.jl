export convertvars, convertpoly, GEW2cyclo, bracket2vector, removecomments,
  convertparameter, convertsumme, convert_summen_parameter, convert_konvertierungen,
  getparams, convert2R

konvertGEWlist = [
  ("GEWZ1Y2", "(q-1)*(q^2+1)"),
  ("GEWZ1Y3", "(q-1)*(q^3+1)"),
  ("GEWY3Z1", "(q-1)*(q^3+1)"),
  ("GEWY1Z3", "(q+1)*(q^3-1)"),
  ("GEWZ3Y1", "(q+1)*(q^3-1)"),
  ("GEW2Z1", "2*(q-1)"),
  ("GEWC12", "q^4-q^2+1"),
  ("GEWZ1", "q-1"),
  ("GEWY1", "q+1"),
  ("GEWZ2", "q^2-1"),
  ("GEWY2", "q^2+1"),
  ("GEWC3", "q^2+q+1"),
  ("GEWC6", "q^2-q+1"),
  ("GEWZ3", "q^3-1"),
  ("GEWY3", "q^3+1"),
  ("GEWZ4", "q^4-1"),
  ("GEWY4", "q^4+1"),
  ("EW2", "2"),
  ("EW3", "3"),
  ("EW4", "4"),
]

konvertGEWlist_sqrt = [
  ("GEWC8ppZ2", "(q^2-sqrt2*q+1)*(q^2-1)"),
  ("GEWC8pZ2", "(q^2+sqrt2*q+1)*(q^2-1)"),
  ("GEWC12pp", "q^2+sqrt3*q+1"),
  ("GEWC24pp", "q^4-sqrt2*q^3+q^2-sqrt2*q+1"),
  ("GEWC8pp", "q^2-sqrt2*q+1"),
  ("GEWC12p", "q^2-sqrt3*q+1"),
  ("GEWC24p", "q^4+sqrt2*q^3+q^2+sqrt2*q+1"),
  ("GEWC8p", "q^2+sqrt2*q+1"),
]

function convertvars(x::String, vars::String)
  re = x
  for var in vars
    re = replace(re, lowercase(var) * uppercase(var) => lowercase(var))
  end
  return re
end

function convertpoly(x::String)
  re = replace(x, "/" => "//", "**" => "^")
  re = replace(re, r"(\D)//" => s"\1*1//")
  return replace(re, r"\^(\d+)//" => s"^\1*1//")
end

function replaceGEW(gew::String, base::String, pol::String)
  search = base * "\\^(\\w+)"
  replac = "CycloSum(R(1), \\1*S(1//(" * pol * ")))"
  re = replace(gew, Regex(search) => SubstitutionString(replac))
  ranges = [0]
  ran = findnext(base * "^", re, 1)
  while ran != nothing
    last = ran[end] + 2
    counter = 1
    while last <= length(re)
      if iszero(counter)
        break
      else
        if re[last] == '('
          counter += 1
        elseif re[last] == ')'
          counter -= 1
        end
        last += 1
      end
    end
    push!(ranges, ran[1])
    push!(ranges, ran[end])
    push!(ranges, last - 1)
    ran = findnext(base * "^", re, last)
  end
  if length(ranges) > 1
    ret = ""
    idx = 3
    while idx <= length(ranges)
      ret *=
        re[(ranges[idx - 2] + 1):(ranges[idx - 1] - 1)] * "CycloSum(R(1), " *
        re[(ranges[idx] + 1):ranges[idx + 1]] * "*S(1//(" * pol * ")))"
      idx += 3
    end
    ret *= re[(ranges[end] + 1):end]
  else
    ret = re
  end
  return replace(ret, base => "CycloSum(R(1), S(1//(" * pol * ")))")
end

function GEW2cyclo(gew::String, vars::String)
  parsed_gew = replace(gew, "\n" => "", " " => "")
  parsed_gew = convertpoly(parsed_gew)
  re = parsed_gew
  for (base, pol) in konvertGEWlist_sqrt
    re = replaceGEW(re, base, pol)
  end
  if re != parsed_gew
    println("found sqrt")
  end
  for (base, pol) in konvertGEWlist
    re = replaceGEW(re, base, pol)
  end
  if re == parsed_gew
    re = "CycloSum(" * re * ", S(0))"
  else
    re = convertvars(re, vars)
  end
  return re
end

function bracket2vector(brackets::String, depth::Int64)
  if iszero(depth)
    return brackets
  end
  s = brackets
  l = length(s)
  deg = zeros(UInt8, l)
  i = 1
  while i <= l
    pos = findnext('[', s, i)
    if pos == nothing
      break
    end
    deg[pos:end] .+= 0x01
    i = pos + 1
  end
  i = 1
  while i <= l
    pos = findnext(']', s, i)
    if pos == nothing
      break
    end
    deg[pos:end] .-= 0x01
    i = pos + 1
  end
  re = []
  i = findfirst(x -> x > 0, deg) + 1
  fin = findnext(x -> x == 0, deg, i)
  # println(deg)
  coll = [(x, y) for (x, y) in zip(deg, s)]
  while i <= fin
    pos = findnext(x -> x[1] == 0x01 && x[2] == ',', coll, i)
    if pos == nothing
      break
    end
    part = s[i:(pos - 1)]
    push!(re, bracket2vector(String(part), depth - 1))
    # println(typeof(part))
    # println(depth,re)
    i = pos + 1
  end
  if i <= fin - 1
    push!(re, bracket2vector(String(s[i:(fin - 1)]), depth - 1))
  end
  return re
end

function removecomments(a::String)
  b = String[]
  for i in findall('#', a)
    j = findnext('\n', a, i)
    push!(b, a[i:j])
  end
  for i in b
    a = replace(a, i => "")
  end
  return a
end

function convertparameter(parameter::String, nr::Int64, vars::String)
  re = []
  list = replace(parameter, " " => "")
  list = convertvars(list, vars)
  list = replace(list, r".*array.*(\[.*)" => s"\1")[1:(end - 1)]
  list = bracket2vector(list, 3)
  for param1 in list[(end - nr + 1):end]
    params, exceptions = param1
    parsed_params = []
    parsed_exceptions = []
    for param in params
      newparam = replace(param, r"(\w+)=\d\.\.(\d+)" => s"Parameter(\1, R(\2))")
      push!(parsed_params, replace(newparam, r"(\w+)=\d\.\.(.+)" => s"Parameter(\1, \2)"))
    end
    for exception in exceptions
      if exception == "`many`"
        println("found \"many\" exceptions")  # TODO
      else
        push!(
          parsed_exceptions,
          replace(exception, r"\[(.*),(.*)\]" => s"ParameterException((\1)*1/(\2))"),
        )
        if exception == parsed_exceptions[end]
          println("Syntax error in parameter exceptions")  # TODO
          parsed_exceptions = [
            "ParameterException(($(exceptions[1]))*1//($(exceptions[2])))"
          ]
          break
        end
      end
    end
    parsed_params = join(parsed_params, ", ")
    if isempty(parsed_params)
      parsed_params = "Parameter{QQPolyRingElem}[]"  # TODO
    else
      parsed_params = "[" * parsed_params * "]"
    end
    parsed_exceptions = join(parsed_exceptions, ", ")
    if isempty(parsed_exceptions)
      parsed_exceptions = "ParameterException{QQPolyRingElem}[]"  # TODO
    else
      parsed_exceptions = "[" * parsed_exceptions * "]"
    end
    push!(re, "Parameters(" * parsed_params * ", " * parsed_exceptions * ")")  # TODO
  end
  return convertpoly.(re)
end

function convertsumme(summe::String, vars::String)
  # TODO rh
  # TODO var_index
  re = "function (tt::Cyclotomic)\n"  # TODO tt? # TODO Cyclotomic{T} ?
  exceptions = 0
  parsed_lines = []
  lines = replace(summe, r":= *\n" => s":= ")
  lines = replace(lines, "proc(tt) " => "proc(tt)\n")
  lines = replace(lines, " end" => "\nend")
  lines = replace(lines, r"; *" => s";\n")
  lines = replace(lines, r"\n\n+" => s"\n")
  lines = split(lines, "\n")
  for line in lines
    if (
      findfirst("nesum", line) != nothing || findfirst("eesubs", line) != nothing ||
      findfirst("linkomb", line) != nothing || findfirst("=", line) != nothing
    ) && (
      findfirst("proc(", line) == nothing && findfirst("local", line) == nothing &&
      findfirst("end", line) == nothing
    )
      line_strip = replace(line, ":" => "", ";" => "", " " => "")
      line_strip = convertvars(line_strip, vars)
      if findfirst("eesubs", line_strip) != nothing
        input_element = replace(line_strip, r".*=eesubs\(\w*=.*,(\w*)\)" => s"\1")
        return_element = replace(line_strip, r"(.*)=eesubs.*" => s"\1")
        replacements = replace(line_strip, r".*=eesubs\((\w*=.*),\w*\)" => s"\1")
        replacements = split(replacements, ",")
        replacements = map(x -> split(x, "="), replacements)
        replace_vars = join(map(x -> x[1], replacements), ",")
        replace_vals = join(map(x -> x[2], replacements), ",")
        if length(replacements) > 1
          line_strip = "$(return_element)=eesubs($(input_element), [$(replace_vars)], S.([$(replace_vals)]))"
        else
          line_strip = "$(return_element)=eesubs($(input_element), [$(replace_vars)], [$(replace_vals)])"
        end
        line_strip = convertpoly(line_strip)
      elseif findfirst("nesum", line_strip) != nothing
        var = replace(line_strip, r"(\w*)nesum\(.*\)" => s"\1")
        line_strip = replace(
          line_strip,
          r".*nesum\((\w*),(\w*)=(\d*)\.\.(.*)\)" => s"nesum(\1, \2, \3, \4, congruence)",
        )
        line_strip = convertpoly(line_strip)
        if var == ""
          line_strip = line_strip
        else
          exceptions += 1
          var = rstrip(var, ['='])
          var *= ",e$exceptions="
          line_strip = var * line_strip
        end
      elseif findfirst("linkomb", line_strip) != nothing
        var = replace(line_strip, r"(\w*)linkomb\(.*\)" => s"\1")
        linkomb = replace(line_strip, r".*linkomb\((.*)\)" => s"\1")
        linkomb = replace(linkomb, "/" => "//")
        linkomb = split(linkomb, ",")
        line_strip = ""
        z = 1

        while z <= length(linkomb)
          factor = linkomb[z]
          elem = linkomb[z + 1]
          if factor == "1"
            line_strip *= "+" * elem
          elseif factor == "-1"
            line_strip *= "-" * elem
          else
            if factor[1] == '-'
              line_strip *= factor * "*" * elem
            else
              line_strip *= "+" * factor * "*" * elem
            end
          end
          z += 2
        end
        line_strip = lstrip(line_strip, ['+', '*'])
        line_strip = var * line_strip
      end
      push!(parsed_lines, line_strip)
    end
  end
  if isempty(parsed_lines)
    push!(parsed_lines, "(tt, Set{ParameterException{QQPolyRingElem}}())")
  else
    if length(parsed_lines) > 1
      parsed_lines[end] = replace(parsed_lines[end], r"\w*=(.*)" => s"\1")
      if startswith(parsed_lines[end], "nesum")
        var = replace(parsed_lines[end], r"nesum\((\w*),.*" => s"\1")
        exceptions += 1
        parsed_lines[end] = var * ",e$exceptions=" * parsed_lines[end]
        push!(parsed_lines, var)
      end
    end
    if exceptions > 0
      if isone(exceptions)
        parsed_lines[end] = "(" * parsed_lines[end] * ", e1)"
      else
        es = "e" * join(1:exceptions, ",e")
        parsed_lines[end] = "(" * parsed_lines[end] * ", union(" * es * "))"
      end
    end
  end
  re *= "\t" * join(parsed_lines, "\n\t")
  re *= "\nend"
  return re
end

function convert_summen_parameter(x::String, nrchars::Int64, nrclass::Int64, vars::String)
  charsums = String[]
  classsums = String[]
  charparams = ""
  classparams = ""
  x1 = replace(x, "\r" => "")  # DOS mode
  sp = replace(removecomments(x1), r": *" => s":")
  sp = replace(sp, "]):\n" => "])end:\n")
  sp = split(sp, "end:\n")
  st = strip.(String.(sp), Ref([' ', '\n']))
  for block in st
    if findfirst("Parameter", block) != nothing
      if findfirst("Char", block) != nothing
        charparams = convertparameter(String(block), nrchars, vars)
      elseif findfirst("Klassen", block) != nothing
        classparams = convertparameter(String(block), nrclass, vars)
      end
    elseif findfirst("Summe", block) != nothing
      if findfirst("Char", block) != nothing
        push!(charsums, convertsumme(String(block), vars))
      elseif findfirst("Klassen", block) != nothing
        push!(classsums, convertsumme(String(block), vars))
      end
    end
  end

  sums =
    "classsums=[\n" * join(classsums, ",\n") * "\n]\n\n" * "charsums=[\n" *
    join(charsums, ",\n") * "\n]"
  params =
    "classparams=[\n" * join(classparams, ",\n") * "\n]\n\n" * "charparams=[\n" *
    join(charparams, ",\n") * "\n]"
  return sums * "\n\n" * params * "\n"
end

function getparams(block::String, typ::String)
  search_string = "||" * typ
  params = [findfirst(search_string, block)]
  if params[1] != nothing
    x = findnext(search_string, block, params[end][end])
    while x != nothing
      push!(params, x)
      x = findnext(search_string, block, params[end][end])
    end
    vars = []
    for ran in params
      if tryparse(Int64, string(block[ran[1] - 1])) == nothing
        push!(vars, lowercase(block[ran[1] - 1]))
      else
        push!(vars, lowercase(block[(ran[1] - 2):(ran[1] - 1)]))
      end
    end
    return vars
  else
    return []
  end
end

function convert_konvertierungen(x::String)
  class = ""
  char = ""
  congruence = "nothing"
  x1 = replace(x, "\r" => "")  # DOS mode
  sp = split(replace(removecomments(x1), r": *" => s":"), ":\n")
  st = strip.(String.(sp), Ref([' ', '\n']))
  for block in st
    if findfirst("parameter", block) != nothing
      class = getparams(String(block), "class")
      char = getparams(String(block), "char")
    elseif findfirst("setCongruence", block) != nothing &&
      findfirst("unsetCongruence", block) == nothing
      stripped = replace(block, " " => "")
      lines = split(stripped, "\n")
      for line in lines
        if findfirst("q:=", line) != nothing
          if findfirst("+", line) != nothing
            congruence = replace(line, r"q:=(\w*)\*qQ\+(\w*).*" => s"R.((\2,\1))")
          elseif findfirst("-", line) != nothing
            congruence = replace(line, r"q:=(\w*)\*qQ\-(\w*).*" => s"R.((-\2,\1))")
          else
            if !startswith(line, "q:=qQ") && !startswith(line, "q:='q'")
              congruence = replace(line, r"q:=(\w*)\*qQ.*" => s"R.((0,\1))")
            end
          end
        end
      end
      congruence = "congruence=" * congruence
    end
  end
  # TODO var_index
  return "classparamindex=var_index.([" * join(class, ",") * "])\n" *
         "charparamindex=var_index.([" * join(char, ",") * "])\n" * congruence * "\n"
end

function convert2R(r::String)
  if findfirst('q', r) == nothing
    return "R(" * r * ")"
  else
    return r
  end
end

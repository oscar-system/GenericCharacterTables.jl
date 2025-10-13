andreas = "C:/Users/andre/Documents/chevie3r4m8.tar/chevie3r4m8/"
martin = "/home/martin/Desktop/Uni/22WS/Fachpraktikum/chevie3r4m8/"

include("ConvertHelpers.jl")

using StringEncodings

function readmaple(path::String, folder::String)
  sp_path = splitpath(path)
  sp_path[1] = uppercase(sp_path[1][1]) * sp_path[1][2:end]
  new_path = joinpath(sp_path)
  try
    rm("src/" * new_path)
  catch e
    return nothing
  end

  zeichenlänge = 96  # TODO
  # println("Hallo")
  mp = open(folder * path, enc"ISO-8859-1")
  a = read(mp, String)
  close(mp)
  a = replace(a, "\r" => "")
  a = replace(a, r" +\n" => s"\n")
  a = replace(a, r"`Information(.*)`:=TEXT\(" => s"Information\1:=TEXT(")

  name = split(path, "/")[end]

  cstart = findfirst("array(", a)
  cfin = findnext("):", a, cstart[end])
  charakterwerte = a[cstart[1]:cfin[end]]

  NurPolynom = findfirst("NurPolynom", a) != nothing
  if !NurPolynom
    # 3) Summationsprozeduren
    sstart = findnext("\nKlassen", a, cfin[end])
    smid = findlast("\nChar", a)
    sfin = findnext("end:", a, smid[end])
    summationsprozeduren = a[sstart[1]:sfin[end]]

    # 5) Informationen:
    istart = findnext("\nInformation", a, cfin[end])
    if istart == nothing
      informationen = nothing
    else
      ifin = findnext("):\n", a, istart[end])
      informationen = a[istart[1]:ifin[end]]
    end

    # 4) Konvertierungen
    # println(count('\n',a[1:smid[end]]))
    if findnext("\nparameter", a, ifin[end]) == nothing
      kstart = findnext("\nparameter", a, sfin[end])
      # println(count('\n',a[1:kstart[end]]))
      kmid = findlast("unsetCongruence", a[kstart[1]:istart[1]])[1] + kstart[1] - 1
    else
      kstart = findnext("\nparameter", a, ifin[end])
      # println(count('\n',a[1:kstart[end]]))
      kmid = findlast("unsetCongruence", a[kstart[1]:end])[1] + kstart[1] - 1
      # println("ja")
    end

    kfin = findnext("end:", a, kmid[end])

    konvertierungen = a[kstart[1]:kfin[end]]
    # println(konvertierungen)
    params = getparams(konvertierungen, "c")
    konvertierungen = convert_konvertierungen(String(konvertierungen))

    Coda = "TABLE=CharTable(order,permutedims(table),classinfo,classlength,charinfo,chardegree,
   classsums,charsums,classparamindex,charparamindex,classparams,charparams,congruence,R,S,information)\n"
  else
    # 5) Informationen:
    istart = findnext("\nInformation", a, cfin[end])
    if istart == nothing
      informationen = nothing
    else
      ifin = findnext("):\n", a, istart[end])
      informationen = a[istart[1]:ifin[end]]
    end

    sstart = findnext("\nKlassentypOrd", a, cfin[end])
    sfin = findnext("]", a, sstart[end])
    klassentypord = a[sstart[1]:sfin[end]]
    klassentypord = convertpoly.(bracket2vector(replace(klassentypord, "\n" => ""), 1))
    if sum(length.(klassentypord)) > zeichenlänge
      klassentypord = "classtypeorder = R.([\n\t" * join(klassentypord, ",\n\t") * "])\n"
    else
      klassentypord = "classtypeorder = R.([" * join(klassentypord, ", ") * "])\n"
    end

    kfin = cfin
    params = []
    imports = "using GenericCharacterTables\nimport GenericCharacterTables: SimpleCharTable\nusing GenericCharacterTables.Oscar\n"
    head = "R, q = polynomial_ring(QQ, \"q\")\n"
    Coda = "TABLE=SimpleCharTable(order,permutedims(table),classinfo,classlength,classtypeorder,charinfo,chardegree,R,information)\n"
  end

  nrpar = length(params)
  rr = String[]
  for t in ["", "1", "2", "3", "t1", "t2"]
    for i in params
      push!(rr, "$i$t")
    end
  end

  joinedparams = join(Set(map(x -> x[1], params)))

  re = replace(String(charakterwerte), "`" => "\"", ":=" => "=")

  w = bracket2vector(removecomments(re), 2)

  cht = parse(Int64, w[1][4])
  clt = parse(Int64, w[1][6])

  if !NurPolynom
    summationsprozeduren = convert_summen_parameter(
      removecomments(String(summationsprozeduren)), cht, clt, joinedparams
    )
    imports = "using GenericCharacterTables\nimport GenericCharacterTables: Cyclotomic, Parameters, Parameter, ParameterException, ParameterSubstitution, CharTable\nusing GenericCharacterTables.Oscar\n"
    head = "R, q = polynomial_ring(QQ, \"q\")\nQ = fraction_field(R)\nS = universal_polynomial_ring(Q; cached=false)\n"
    ring = join(rr[1:nrpar], ",") * ", _...=gens(S, " * repr(rr) * ")\n"
  end

  # d=replace(b, "iI"=>"i","jJ"=>"j", "kK"=>"k","lL"=>"l")

  ord = replace(w[1][3], " " => "", "\n" => "")
  ord = convertpoly(ord)
  # println(cht,",",clt)
  v = fill("", cht)
  vch = fill("", cht)
  vchi = fill("", cht)
  vcl = fill("", clt)
  vcli = fill("[]", clt)

  # println(charakterwerte)
  if NurPolynom
    for (i, wi) in enumerate(w[4:(3 + cht)])
      #println(wi[3:2+clt])
      ret = replace.(wi[3:(2 + clt)], Ref(" " => ""), Ref("\n" => ""))
      ret = convertpoly.(ret)
      # println(ret)
      ret = convert2R.(ret)
      v[i] = "[\n\t" * join(ret, ",\n\t") * "]"

      vch[i] = convertpoly(replace(wi[2], " " => "", "\n" => ""))
      vchi[i] = replace(wi[1], " " => "", "\n" => "", "\"[" => "[", "]\"" => "]")
    end
    table = "table = QQPolyRingElem[" * join(v, " ") * "]\n"
  else
    for (i, wi) in enumerate(w[4:(3 + cht)])
      # println(wi)
      ret = GEW2cyclo.(wi[3:(2 + clt)], Ref(joinedparams))
      v[i] = "[\n\t" * join(ret, ",\n\t") * "]"

      vch[i] = convertpoly(replace(wi[2], " " => "", "\n" => ""))
      vchi[i] = replace(wi[1], " " => "", "\n" => "")
    end
    table = "table = Cyclotomic{QQPolyRingElem}[" * join(v, " ") * "]\n"
  end

  for (i, wi) in enumerate(w[3][3:(2 + clt)])
    vcl[i] = convertpoly(replace(wi, " " => "", "\n" => ""))
  end
  if length(w[2]) >= 2 + clt
    for (i, wi) in enumerate(w[2][3:(2 + clt)])
      re = replace(wi, " " => "", "\n" => "")
      if findfirst("[", re) == nothing
        vcli[i] = "[" * re * "]"
      else
        vcli[i] = re
      end
    end
  end

  order = "order = $ord \n"

  if sum(length.(vcli)) > zeichenlänge
    classinfo = "classinfo = Vector{Any}[\n\t" * join(vcli, ",\n\t") * "]\n"
  else
    classinfo = "classinfo = Vector{Any}[" * join(vcli, ", ") * "]\n"
  end
  classinfo = replace(classinfo, "\\\\" => "\\")
  classinfo = replace(classinfo, "\\" => "\\\\")

  if sum(length.(vcl)) > zeichenlänge
    classlength = "classlength = R.([\n\t" * join(vcl, ",\n\t") * "])\n"
  else
    classlength = "classlength = R.([" * join(vcl, ", ") * "])\n"
  end

  if sum(length.(vchi)) > zeichenlänge
    charinfo = "charinfo = Vector{Any}[\n\t" * join(vchi, ",\n\t") * "]\n"
  else
    charinfo = "charinfo = Vector{Any}[" * join(vchi, ", ") * "]\n"
  end
  charinfo = replace(charinfo, "\\\\" => "\\")
  charinfo = replace(charinfo, "\\" => "\\\\")

  if sum(length.(vch)) > zeichenlänge
    chardegree = "chardegree = R.([\n\t" * join(vch, ",\n\t") * "])\n"
  else
    chardegree = "chardegree = R.([" * join(vch, ", ") * "])\n"
  end

  if informationen == nothing
    information = "information = \"\""
  else
    itstart = findfirst(":=TEXT(", informationen)
    itfin = findfirst("):\n", informationen)
    information = informationen[(itstart[1] + 1):itfin[end]]
    information = replace(information, " \n" => "\n")
    information = replace(information, "\"" => "\\\"")
    information =
      "information = " * replace(
        information,
        "=TEXT(\n`" => "\"",
        "`,\n`" => "\n",
        "`\n):" => "\"",
        "`):" => "\"",
        "\$" => "\\\$",
      )
  end

  if NurPolynom
    output =
      imports * head * "\n" * order * table * classinfo * classlength * klassentypord *
      charinfo * chardegree
  else
    output =
      imports * head * ring * "\n" * order * table * classinfo * classlength * charinfo *
      chardegree * "\n" * summationsprozeduren * "\n" * konvertierungen
  end
  output = replace(output, r" +" => s" ")
  output = replace(output, r" \n" => s"\n")

  open("src/" * new_path, "a") do io
    print(io, output * "\n" * information * "\n" * Coda)
  end
  return nothing
end

function readall(folder::String, first="GU3"::String, type="tables"::String)
  doit = false
  for dir in readdir(folder * type)
    for table_file in readdir(folder * type * "/" * dir)
      println(table_file)
      if table_file == first
        doit = true
      end
      if doit
        println("Weiter?")
        inp = readline()
        if inp != ""
          return nothing
        end
        readmaple(type * "/" * dir * "/" * table_file, folder)
      end
    end
  end
end

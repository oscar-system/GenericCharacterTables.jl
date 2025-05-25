using GenericCharacterTables

#
# This file generates two markdown files which contain
# a list of all generic character tables (`tables_list.md`)
# and a list of all Green function tables (`greenfunctions_list.md`).
#
# It is included by `docs/make.jl` so one normally should have no need
# to run it on its own.
#

# 'reverse' the synonym mappings (this kinda assumes there is at most
# one synonym for each table, which is the case right now; and since
# there are no plans to add more synonyms, this should be fine)
reverse_synonyms = Dict([(v,k) for (k,v) in GenericCharacterTables.synonyms])

# map table types to nicer rendering
function nicer_table_type(tt::String)
  tt == "uniGL" && return tt, ('A', 999, 0, 0)
  tt == "uniGU" && return tt, ('A', 999, 0, 0)

  twist = 0
  res = "\$"
  if isdigit(tt[1])
    twist = parse(Int, tt[1])
    res *= "{}^$(tt[1])"
    tt = tt[2:end]
  end
  series = tt[1]
  @assert isletter(series)
  res *= series
  tt = tt[2:end]

  # handle optional suffix ';2'
  parts = split(tt, ';')

  rank = parse(Int, parts[1])
  res *= "_{$rank}"

  extra = 0
  if length(parts) > 1
    extra = parse(Int, parts[2])
    res *= ";" * parts[2]
  end

  res *= "\$"
  return res, (series, rank, twist, extra)
end

path = joinpath(@__DIR__, "..", "data")

for (tabletype, header, filename, loader) in (("Tables", "tables", "tables_list.md", generic_character_table),
        ("Greenfunctions", "Green functions", "greenfunctions_list.md", green_function_table))
  open(joinpath(@__DIR__, "src", filename), "w") do out
    println("# List of $header")
    println(out, """
                 ```@meta
                 CurrentModule = GenericCharacterTables
                 DocTestSetup = :(using GenericCharacterTables, Oscar)
                 ```
                 
                 # List of $header
                 """)
    table_types = readdir("$path/$tabletype")
    sort!(table_types, by = tt -> nicer_table_type(tt)[2])
    for tt in table_types
      ntt = nicer_table_type(tt)[1]
      println("# Table type $tt -> $ntt")
      println(out, """
                   ## Table type $ntt
                   """)

      tables = [replace(x, ".jl" => "") for x in readdir("$path/$tabletype/$tt")]
      for name in tables
        println("- Table $tt/$name")
        if haskey(reverse_synonyms, name)
          println(out, """
                       ### Table `$name` (synonym: `$(reverse_synonyms[name])`)
                       """)
        else
          println(out, """
                       ### Table `$name`
                       """)
        end
        g = loader(name)
        if isempty(g.information)
          println(out, """
                       !!! note "Missing data"
                           Unfortunately no information about this table is available.
                       """)
        else
          println(out, g.information)
        end
        println(out)
      end
    end
  end
end

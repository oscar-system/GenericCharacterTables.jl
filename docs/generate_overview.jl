using GenericCharacterTables


println("@__DIR__")

tabletype = "Tables"
path = joinpath(@__DIR__, "..", "data")
table_types = readdir("$path/$tabletype")

open(joinpath(@__DIR__, "src", "tables_list.md"), "w") do out
  println(out, """
               ```@meta
               CurrentModule = GenericCharacterTables
               DocTestSetup = :(using GenericCharacterTables, Oscar)
               ```
               
               # List of tables
               """)
  for tt in table_types
    println("# Table type $tt")
    # TODO: provide a map from table types to "nice" versisons, e.g. `2A2` -> `{}^2A_2`
    println(out, """
                 ## Table type $tt
                 """)

    tables = [replace(x, ".jl" => "") for x in readdir("$path/$tabletype/$tt")]
    for name in tables
      println("- Table $tt/$name")
      println(out, """
                   ### Table `$name`
                   """)
      g = generic_character_table(name)
      println(out, info(g))
      println(out)
    end
  end
end

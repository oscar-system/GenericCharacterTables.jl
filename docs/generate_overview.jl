using GenericCharacterTables


println("@__DIR__")

path = joinpath(@__DIR__, "..", "data")

for (tabletype, header, filename) in (("Tables", "tables", "tables_list.md"), ("Greenfunctions", "Green functions", "greenfunctions_list.md"))
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
        println(out, g.information)
        println(out)
      end
    end
  end
end

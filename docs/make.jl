using Documenter, GenericCharacterTables

DocMeta.setdocmeta!(GenericCharacterTables, :DocTestSetup, :(using GenericCharacterTables, Oscar); recursive=true)

doctest(GenericCharacterTables)
makedocs(
	sitename="GenericCharacterTables.jl",
	format=Documenter.HTML(prettyurls=get(ENV, "CI", "false") == "true"),
	pages=[
		"index.md",
		"showinfo.md",
		"calculations.md",
		"modify.md",
		"unexported.md"
	]
)

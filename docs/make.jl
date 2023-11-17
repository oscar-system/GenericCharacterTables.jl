using Documenter, GenericCharacterTables

DocMeta.setdocmeta!(GenericCharacterTables, :DocTestSetup, :(using GenericCharacterTables, Oscar); recursive=true)

makedocs(
	sitename="GenericCharacterTables.jl",
	format=Documenter.HTML(prettyurls=get(ENV, "CI", "false") == "true"),
	doctest = true,
	pages=[
		"index.md",
		"showinfo.md",
		"calculations.md",
		"modify.md",
		"unexported.md"
	]
)

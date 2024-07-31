using Documenter
using DocumenterCitations
using GenericCharacterTables

DocMeta.setdocmeta!(GenericCharacterTables, :DocTestSetup, :(using GenericCharacterTables, Oscar); recursive=true)

bib = CitationBibliography(
    joinpath(@__DIR__, "src", "refs.bib");
    style=:numeric
)

makedocs(
	sitename="GenericCharacterTables.jl",
	format=Documenter.HTML(prettyurls=get(ENV, "CI", "false") == "true"),
	doctest = true,
	pages=[
		"index.md",
		"showinfo.md",
		"calculations.md",
		"modify.md",
		"book.md",
		"unexported.md",
		"references.md",
	],
	plugins=[bib],
)

deploydocs(
   repo   = "github.com/oscar-system/GenericCharacterTables.jl.git",
   target = "build",
   deps = nothing,
   make   = nothing,
)

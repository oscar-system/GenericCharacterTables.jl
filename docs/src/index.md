```@meta
CurrentModule = GenericCharacterTables
```

# GenericCharacterTables.jl

## About

[GenericCharacterTables](https://github.com/oscar-system/GenericCharacterTables.jl)
is a library for working with generic character tables. It is based on
[CHEVIE](http://www.math.rwth-aachen.de/homes/CHEVIE/index.html)
and aims to provide all its features originally implemented in
[Maple](https://de.maplesoft.com/products/Maple/index.aspx).
It is written in [Julia](https://julialang.org/) and depends on
[Nemo](https://nemocas.github.io/Nemo.jl/stable/) and therefore on
[AbstractAlgebra](https://nemocas.github.io/AbstractAlgebra.jl/stable/).

## Loading tables

Before doing anything you need to load a table first. GenericCharacterTables comes with a variety of precomputed tables.

```@docs
genchartab
```

GenericCharacterTables also provides some tables of Green functions. They can be loaded similarly.

```@docs
greenfuntab
```

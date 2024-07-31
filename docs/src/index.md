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


For the mathematical background, consider that there are many interesting
*families* of finite groups. For example, the matrix groups
$\mathrm{GL}_n(\mathbb{F}_q)$ or $\mathrm{SL}_n(\mathbb{F}_q)$, for $n>1$ and
$q$ a prime power. These groups have many properties in common. It turns out
that for a fixed rank (say $n=2$) it is possible to parametrize the conjugacy
classes and irreducible characters of these group in terms of $q$, and to
write this down into a so-called *generic character table*. This was first
done by Schur for $\mathrm{SL}_2(\mathbb{F}_q)$.

This package provides code to interact with such generic character tables,
and also includes many such tables.
The code in this package is based on Maple code included in the CHEVIE project.

For more details about the mathematical background, see [GHLMP96](@cite).


## Loading tables

Before doing anything you need to load a table first. GenericCharacterTables comes with a variety of precomputed tables.

```@docs
genchartab
```

GenericCharacterTables also provides some tables of Green functions. They can be loaded similarly.

```@docs
greenfuntab
```

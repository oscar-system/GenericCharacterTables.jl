[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://oscar-system.github.io/GenericCharacterTables.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://oscar-system.github.io/GenericCharacterTables.jl/dev)
[![Build Status](https://github.com/oscar-system/GenericCharacterTables.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/oscar-system/GenericCharacterTables.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Codecov](https://codecov.io/github/oscar-system/GenericCharacterTables.jl/coverage.svg?branch=master&token=)](https://codecov.io/gh/oscar-system/GenericCharacterTables.jl)

GenericCharacterTables
======================
This project aims to provide the functionalities of the
[Maple](https://de.maplesoft.com/products/Maple/index.aspx) part of
[CHEVIE](http://www.math.rwth-aachen.de/homes/CHEVIE/index.html) in
[Julia](https://julialang.org/).

Currently the following functionalities are missing:

- PrintValPhi
- GreenFunctionsA
- GreenFunctionsA2
- PrintToTex (partially)

Build Docs
----------

Run the following command inside the base directory:
```bash
julia --project=@. docs/make.jl
```

Run Tests
---------

Run the following commands in a julia console inside the base directory:

```
pkg> activate .
pkg> test GenericCharacterTables
```

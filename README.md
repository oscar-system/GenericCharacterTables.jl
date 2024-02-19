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

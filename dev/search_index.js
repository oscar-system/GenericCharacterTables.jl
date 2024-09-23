var documenterSearchIndex = {"docs":
[{"location":"references/#References","page":"References","title":"References","text":"","category":"section"},{"location":"references/","page":"References","title":"References","text":"M. Geck, G. Hiss, F. Lübeck, G. Malle and G. Pfeiffer. CHEVIE—a system for computing and processing generic character tables. Appl. Algebra Engrg. Comm. Comput. 7, 175–210 (1996). Computational methods in Lie theory (Essen, 1994).\n\n\n\nThe Computer Algebra System OSCAR: Algorithms and Examples. Vol. 32 of Algorithms and Computation in Mathematics (Springer, 2024).\n\n\n\n","category":"page"},{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"calculations/#Calculate-with-Tables","page":"Calculate with Tables","title":"Calculate with Tables","text":"","category":"section"},{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"GenericCharacterTables allows you to compute for example scalar products of whole class or character types. The results are correct for all possible combinations of parameters except possibly for those where the additionally returned exceptions apply. Those consist of multivariate polynomials with coefficients in a rational function field and are fulfilled if the evaluation of this polynomial is an integer.","category":"page"},{"location":"calculations/#On-Characters","page":"Calculate with Tables","title":"On Characters","text":"","category":"section"},{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"norm(char::GenericCharacter)\nnorm(char::SimpleGenericCharacter{T}) where T <: NfPoly\nscalar_product(char1::GenericCharacter, char2::GenericCharacter)\nscalar_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <: NfPoly","category":"page"},{"location":"calculations/#LinearAlgebra.norm-Tuple{GenericCharacterTables.GenericCharacter}","page":"Calculate with Tables","title":"LinearAlgebra.norm","text":"norm(char::GenericCharacter)\n\nReturn the norm of the character type char.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> norm(g[1])\n1\n\n\n\n\n\n","category":"method"},{"location":"calculations/#LinearAlgebra.norm-Union{Tuple{GenericCharacterTables.SimpleGenericCharacter{T}}, Tuple{T}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Calculate with Tables","title":"LinearAlgebra.norm","text":"norm(char::SimpleGenericCharacter{T}) where T <: NfPoly\n\nReturn the norm of the character type char.\n\nExamples\n\njulia> g=greenfuntab(\"GL3\");\n\njulia> norm(g[1])\n6//(q^3 - 3*q^2 + 3*q - 1)\n\n\n\n\n\n","category":"method"},{"location":"calculations/#Oscar.scalar_product-Tuple{GenericCharacterTables.GenericCharacter, GenericCharacterTables.GenericCharacter}","page":"Calculate with Tables","title":"Oscar.scalar_product","text":"scalar_product(char1::GenericCharacter, char2::GenericCharacter)\n\nReturn the scalar product between the character types char1 and char2.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> scalar_product(g[3],g[2])\n0\nWith exceptions:\n  l1 + k1 - 2*k2 ∈ (q - 1)ℤ\n  l1 - k2 ∈ (q - 1)ℤ\n  k1 - k2 ∈ (q - 1)ℤ\n\n\n\n\n\n","category":"method"},{"location":"calculations/#Oscar.scalar_product-Union{Tuple{T}, Tuple{GenericCharacterTables.SimpleGenericCharacter{T}, GenericCharacterTables.SimpleGenericCharacter{T}}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Calculate with Tables","title":"Oscar.scalar_product","text":"scalar_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <: NfPoly\n\nReturn the scalar product between the character types char1 and char2.\n\nExamples\n\njulia> g=greenfuntab(\"GL3\");\n\njulia> scalar_product(g[1],g[2])\n0\n\n\n\n\n\n","category":"method"},{"location":"calculations/#On-Classes","page":"Calculate with Tables","title":"On Classes","text":"","category":"section"},{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"ortho2norm\northo2scalar\nclassmult","category":"page"},{"location":"calculations/#GenericCharacterTables.ortho2norm","page":"Calculate with Tables","title":"GenericCharacterTables.ortho2norm","text":"ortho2norm(t::CharTable, class::Int64)\n\nReturn the (generic) norm of the class type class.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> ortho2norm(g,2)\n1\n\n\n\n\n\northo2norm(t::SimpleCharTable{T}, class::Int64) where T <: NfPoly\n\nReturn the (generic) norm of the class type class.\n\nExamples\n\njulia> g=greenfuntab(\"GL3\");\n\njulia> ortho2norm(g,2)\n(5*q^2 + 2*q + 3)//(q^5 - 2*q^4 + q^3)\n\n\n\n\n\n","category":"function"},{"location":"calculations/#GenericCharacterTables.ortho2scalar","page":"Calculate with Tables","title":"GenericCharacterTables.ortho2scalar","text":"ortho2scalar(t::CharTable, class1::Int64, class2::Int64)\n\nReturn the (generic) scalar product between the class types class1 and class2.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> ortho2scalar(g,3,2)\n0\nWith exceptions:\n  i1 + j1 - 2*i2 ∈ (q - 1)ℤ\n  i1 - i2 ∈ (q - 1)ℤ\n  j1 - i2 ∈ (q - 1)ℤ\n\n\n\n\n\northo2scalar(t::SimpleCharTable{T}, class1::Int64, class2::Int64) where T <: NfPoly\n\nReturn the (generic) scalar product between the class types class1 and class2.\n\nExamples\n\njulia> g=greenfuntab(\"GL3\");\n\njulia> ortho2scalar(g,2,2)\n(5*q^2 + 2*q + 3)//(q^5 - 2*q^4 + q^3)\n\n\n\n\n\n","category":"function"},{"location":"calculations/#GenericCharacterTables.classmult","page":"Calculate with Tables","title":"GenericCharacterTables.classmult","text":"classmult(t::CharTable, class1::Int64, class2::Int64, class3::Int64)\n\nReturn the (generic) class multiplication constant of the class types class1, class2 and class3 of the table t.\n\nExamples\n\njulia> g=genchartab(\"SL2.0\");\n\njulia> classmult(g,2,2,4)\nq + 1\nWith exceptions:\n  a3 ∈ (q + 1)ℤ\n\n\n\n\n\nclassmult(t::SimpleCharTable{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly\n\nReturn the (generic) class multiplication constant of the class types class1, class2 and class3 of the table t.\n\nExamples\n\njulia> g=greenfuntab(\"GL3\");\n\njulia> classmult(g,1,2,3)\n(q + 3)//(q^5 - 2*q^4 + q^3)\n\n\n\n\n\n","category":"function"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"modify/#Modify-Tables","page":"Modify Tables","title":"Modify Tables","text":"","category":"section"},{"location":"modify/#Add-Characters","page":"Modify Tables","title":"Add Characters","text":"","category":"section"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"It is also possible to create new character types with GenericCharacterTables.","category":"page"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"tensor_product(char1::GenericCharacter, char2::GenericCharacter)\ntensor_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T <: PolyRingElem\nlincomb\nomega","category":"page"},{"location":"modify/#Hecke.tensor_product-Tuple{GenericCharacterTables.GenericCharacter, GenericCharacterTables.GenericCharacter}","page":"Modify Tables","title":"Hecke.tensor_product","text":"tensor_product(char1::GenericCharacter, char2::GenericCharacter)\n\nReturn the tensor product of the character types char1 and char2. This can also be obtained via char1 * char2.\n\nExamples\n\njulia> g = genchartab(\"GL2\");\n\njulia> tensor_product(g[1], g[2])\nGeneric character of GL2\n  with parameters\n    kt1 ∈ {1,…, q - 1}, kt2 ∈ {1,…, q - 1}\n  of degree q\n  with values\n    q*exp(2π𝑖((2*i*kt1 + 2*i*kt2)//(q - 1)))\n    0\n    exp(2π𝑖((i*kt1 + i*kt2 + j*kt1 + j*kt2)//(q - 1)))\n    (-1)*exp(2π𝑖((i*kt1 + i*kt2)//(q - 1)))\n\n\n\n\n\n","category":"method"},{"location":"modify/#Hecke.tensor_product-Union{Tuple{T}, Tuple{GenericCharacterTables.SimpleGenericCharacter{T}, GenericCharacterTables.SimpleGenericCharacter{T}}} where T<:AbstractAlgebra.PolyRingElem","page":"Modify Tables","title":"Hecke.tensor_product","text":"tensor_product(char1::SimpleGenericCharacter{T}, char2::SimpleGenericCharacter{T}) where T<:PolyRingElem\n\nReturn the tensor product of the character types char1 and char2. This can also be obtained via char1 * char2.\n\nExamples\n\njulia> g = greenfuntab(\"GL3\");\n\njulia> tensor_product(g[1],g[2])\nGeneric character of GL3\n  of degree -q^6 - 2*q^5 - 2*q^4 + 2*q^2 + 2*q + 1\n  with values\n    -q^6 - 2*q^5 - 2*q^4 + 2*q^2 + 2*q + 1\n    2*q + 1\n    1\n\n\n\n\n\n","category":"method"},{"location":"modify/#GenericCharacterTables.lincomb","page":"Modify Tables","title":"GenericCharacterTables.lincomb","text":"lincomb(coeffs::Vector{Int64}, chars::Vector{<:GenericCharacter})\n\nReturn the linear combination of the character types chars with coefficients coeffs.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> lincomb([5,1],[g[1],g[2]])\nGeneric character of GL2\n  with parameters\n    kl1 ∈ {1,…, q - 1}, kl2 ∈ {1,…, q - 1}\n  of degree q + 5\n  with values\n    (5)*exp(2π𝑖((2*i*kl1)//(q - 1))) + q*exp(2π𝑖((2*i*kl2)//(q - 1)))\n    (5)*exp(2π𝑖((2*i*kl1)//(q - 1)))\n    exp(2π𝑖((i*kl2 + j*kl2)//(q - 1))) + (5)*exp(2π𝑖((i*kl1 + j*kl1)//(q - 1)))\n    (-1)*exp(2π𝑖((i*kl2)//(q - 1))) + (5)*exp(2π𝑖((i*kl1)//(q - 1)))\n\n\n\n\n\nlincomb(coeffs::Vector{Int64}, chars::Vector{SimpleGenericCharacter{T}}) where T <: NfPoly\n\nReturn the linear combination of the character types chars with coefficients coeffs.\n\nExamples\n\njulia> g=greenfuntab(\"GL3\");\n\njulia> lincomb([5,1],[g[1],g[2]])\nGeneric character of GL3\n  of degree 4*q^3 + 10*q^2 + 10*q + 6\n  with values\n    4*q^3 + 10*q^2 + 10*q + 6\n    10*q + 6\n    6\n\n\n\n\n\n","category":"function"},{"location":"modify/#GenericCharacterTables.omega","page":"Modify Tables","title":"GenericCharacterTables.omega","text":"omega(char::GenericCharacter)\n\nReturn the (generic) central character of the character type char.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> omega(g[1])\nGeneric character of GL2\n  with parameters\n    k ∈ {1,…, q - 1}\n  of degree 1\n  with values\n    exp(2π𝑖((2*i*k)//(q - 1)))\n    (q^2 - 1)*exp(2π𝑖((2*i*k)//(q - 1)))\n    (q^2 + q)*exp(2π𝑖((i*k + j*k)//(q - 1)))\n    (q^2 - q)*exp(2π𝑖((i*k)//(q - 1)))\n\n\n\n\n\n\nomega(char::SimpleGenericCharacter{T}) where T <: NfPoly\n\nReturn the (generic) central character of the character type char.\n\nExamples\n\njulia> g=greenfuntab(\"GL3\");\n\njulia> omega(g[1])\nGeneric character of GL3\n  of degree 1\n  with values\n    1\n    2*q^2 - q - 1\n    q^3 - 2*q^2 + q\n\n\n\n\n\n","category":"function"},{"location":"modify/#Change-Values","page":"Modify Tables","title":"Change Values","text":"","category":"section"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"Sometimes one likes to specify some of the free variables in the tables to simplify the often very complicated values a bit.","category":"page"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"specialize\nspecclassparam!","category":"page"},{"location":"modify/#GenericCharacterTables.specialize","page":"Modify Tables","title":"GenericCharacterTables.specialize","text":"specialize(char::GenericCharacter, var::UPoly, expr::RingElement)\n\nReturn the generic character where the parameter var is replaced with expr in char.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printval(g,char=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖((2*i*k)//(q - 1)))\n  2: exp(2π𝑖((2*i*k)//(q - 1)))\n  3: exp(2π𝑖((i*k + j*k)//(q - 1)))\n  4: exp(2π𝑖((i*k)//(q - 1)))\n\njulia> q,(i,j,l,k) = params(g);\n\njulia> specialize(g[1], i, q)\nGeneric character of GL2\n  with parameters\n    k ∈ {1,…, q - 1}, substitutions: i = q\n  of degree 1\n  with values\n    exp(2π𝑖((2*k)//(q - 1)))\n    exp(2π𝑖((2*k)//(q - 1)))\n    exp(2π𝑖((j*k + k)//(q - 1)))\n    exp(2π𝑖(k//(q - 1)))\n\n\n\n\n\n\n","category":"function"},{"location":"modify/#GenericCharacterTables.specclassparam!","page":"Modify Tables","title":"GenericCharacterTables.specclassparam!","text":"specclassparam!(t::CharTable, class::Int64, var::UPoly, expr::RingElement)\n\nReplace the parameter var with expr in the class type class.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printval(g,class=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖((2*i*k)//(q - 1)))\nValue of character type 2 on class type\n  1: q*exp(2π𝑖((2*i*k)//(q - 1)))\nValue of character type 3 on class type\n  1: (q + 1)*exp(2π𝑖((i*l + i*k)//(q - 1)))\nValue of character type 4 on class type\n  1: (q - 1)*exp(2π𝑖((i*k)//(q - 1)))\n\njulia> q,(i,j,l,k) = params(g);\n\njulia> specclassparam!(g, 1, k, 3)\n\njulia> printval(g,class=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖((6*i)//(q - 1)))\nValue of character type 2 on class type\n  1: q*exp(2π𝑖((6*i)//(q - 1)))\nValue of character type 3 on class type\n  1: (q + 1)*exp(2π𝑖((i*l + 3*i)//(q - 1)))\nValue of character type 4 on class type\n  1: (q - 1)*exp(2π𝑖((3*i)//(q - 1)))\n\n\n\n\n\n","category":"function"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"#GenericCharacterTables.jl","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"","category":"section"},{"location":"#About","page":"GenericCharacterTables.jl","title":"About","text":"","category":"section"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"GenericCharacterTables is a library for working with generic character tables. It is based on CHEVIE and aims to provide all its features originally implemented in Maple. It is written in Julia and depends on Nemo and therefore on AbstractAlgebra.","category":"page"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"For the mathematical background, consider that there are many interesting families of finite groups. For example, the matrix groups mathrmGL_n(mathbbF_q) or mathrmSL_n(mathbbF_q), for n1 and q a prime power. These groups have many properties in common. It turns out that for a fixed rank (say n=2) it is possible to parametrize the conjugacy classes and irreducible characters of these group in terms of q, and to write this down into a so-called generic character table. This was first done by Schur for mathrmSL_2(mathbbF_q).","category":"page"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"This package provides code to interact with such generic character tables, and also includes many such tables. The code in this package is based on Maple code included in the CHEVIE project.","category":"page"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"For more details about the mathematical background, see [GHLMP96].","category":"page"},{"location":"#Loading-tables","page":"GenericCharacterTables.jl","title":"Loading tables","text":"","category":"section"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"Before doing anything you need to load a table first. GenericCharacterTables comes with a variety of precomputed tables.","category":"page"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"genchartab","category":"page"},{"location":"#GenericCharacterTables.genchartab","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.genchartab","text":"genchartab(x::String)\n\nReturn the generic character table with name x.\n\nOmitting x will return the names of all importable character tables.\n\nExamples\n\njulia> g = genchartab(\"GL2\")\nGeneric character table GL2\n  of order q^4 - q^3 - q^2 + q\n  with 4 irreducible character types\n  with 4 class types\n  with parameters (i, j, l, k)\n\n\n\n\n\n","category":"function"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"GenericCharacterTables also provides some tables of Green functions. They can be loaded similarly.","category":"page"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"greenfuntab","category":"page"},{"location":"#GenericCharacterTables.greenfuntab","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.greenfuntab","text":"greenfuntab(x::String)\n\nReturn the greenfunction table with name x.\n\nOmitting x will return the names of all importable greenfunctions.\n\nExamples\n\njulia> g = greenfuntab(\"GL2\")\nGeneric character table GL2\n  of order q^4 - q^3 - q^2 + q\n  with 2 irreducible character types\n  with 2 class types\n  without parameters\n\n\n\n\n\n","category":"function"},{"location":"unexported/","page":"Unexported Functions","title":"Unexported Functions","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"unexported/#Unexported-Functions","page":"Unexported Functions","title":"Unexported Functions","text":"","category":"section"},{"location":"unexported/","page":"Unexported Functions","title":"Unexported Functions","text":"These are all functions for internal use only:","category":"page"},{"location":"unexported/","page":"Unexported Functions","title":"Unexported Functions","text":"Modules = [GenericCharacterTables]\nPublic = false","category":"page"},{"location":"unexported/#GenericCharacterTables.CharTable","page":"Unexported Functions","title":"GenericCharacterTables.CharTable","text":"CharTable <: Table\n\nThe type for generic character tables. This is used to model generic character tables containing generic cyclotomic entries.\n\nExamples\n\njulia> g=genchartab(\"GL2\")\nGeneric character table GL2\n  of order q^4 - q^3 - q^2 + q\n  with 4 irreducible character types\n  with 4 class types\n  with parameters (i, j, l, k)\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.CharTable-Tuple{GenericCharacterTables.GenericCharacter}","page":"Unexported Functions","title":"GenericCharacterTables.CharTable","text":"(t::CharTable)(c::GenericCharacter)\n\nReturn c as a generic character of t. This will only work if t is a version of the parent table of c with a more restricted congruence.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.GenericCharacter","page":"Unexported Functions","title":"GenericCharacterTables.GenericCharacter","text":"GenericCharacter <: AbstractGenericCharacter\n\nThe type for generic characters. These are the generic characters used in CharTable.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> g[1]\nGeneric character of GL2\n  with parameters\n    k ∈ {1,…, q - 1}\n  of degree 1\n  with values\n    exp(2π𝑖((2*i*k)//(q - 1)))\n    exp(2π𝑖((2*i*k)//(q - 1)))\n    exp(2π𝑖((i*k + j*k)//(q - 1)))\n    exp(2π𝑖((i*k)//(q - 1)))\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.GenericCyclo","page":"Unexported Functions","title":"GenericCharacterTables.GenericCyclo","text":"GenericCyclo <: RingElem\n\nThe type for generic cyclotomic numbers.\n\nExamples\n\njulia> R = universal_polynomial_ring(QQ; cached=false);\n\njulia> q = gen(R, \"q\");\n\njulia> S = generic_cyclotomic_ring(R);\n\njulia> S(q; exponent=1//(q-1))\nq*exp(2π𝑖(1//(q - 1)))\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.GenericCycloFrac","page":"Unexported Functions","title":"GenericCharacterTables.GenericCycloFrac","text":"GenericCycloFrac\n\nThe type for fractions of generic cyclotomic numbers.\n\nExamples\n\njulia> R = universal_polynomial_ring(QQ; cached=false);\n\njulia> q = gen(R, \"q\");\n\njulia> S = generic_cyclotomic_ring(R);\n\njulia> a = S(q; exponent=1//(q-1))\nq*exp(2π𝑖(1//(q - 1)))\n\njulia> b = S(q^2; exponent=1//(q^2-1))\nq^2*exp(2π𝑖(1//(q^2 - 1)))\n\njulia> a//b\nq*exp(2π𝑖(1//(q - 1)))//(q^2*exp(2π𝑖(1//(q^2 - 1))))\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.GenericCycloRing","page":"Unexported Functions","title":"GenericCharacterTables.GenericCycloRing","text":"GenericCycloRing <: Ring\n\nThe ring of generic cyclotomic numbers.\n\nExamples\n\njulia> R = universal_polynomial_ring(QQ; cached=false);\n\njulia> q = gen(R, \"q\");\n\njulia> S = generic_cyclotomic_ring(R)\nGeneric cyclotomic ring\n  over Rational field\n  dependent on q\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.Parameter","page":"Unexported Functions","title":"GenericCharacterTables.Parameter","text":"Parameter\n\nA paramter of a generic character or class type unique up to a polynomial modulus. They are used in Parameters.\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.ParameterExceptions","page":"Unexported Functions","title":"GenericCharacterTables.ParameterExceptions","text":"ParameterExceptions\n\nA collection of parameter exceptions used in GenericCycloFrac.\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.ParameterSubstitution","page":"Unexported Functions","title":"GenericCharacterTables.ParameterSubstitution","text":"ParameterSubstitution\n\nA substitution of paramters used in Parameters. They are generated by for example specclassparam!.\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.Parameters","page":"Unexported Functions","title":"GenericCharacterTables.Parameters","text":"Parameters\n\nParameters of generic characters and class types. This is used in GenericCharacter and CharTable and is only of internal use.\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.SimpleCharTable","page":"Unexported Functions","title":"GenericCharacterTables.SimpleCharTable","text":"SimpleCharTable{T} <: Table\n\nThe type for simple generic character tables. This is used to model generic character tables containing polynomial entries. The type parameter T is the type of the table entries.\n\nExamples\n\njulia> g=genchartab(\"uniGL2\")\nGeneric character table uniGL2\n  of order q^4 - q^3 - q^2 + q\n  with 2 irreducible character types\n  with 4 class types\n  without parameters\n\n\n\n\n\n","category":"type"},{"location":"unexported/#GenericCharacterTables.SimpleGenericCharacter","page":"Unexported Functions","title":"GenericCharacterTables.SimpleGenericCharacter","text":"SimpleGenericCharacter <: AbstractGenericCharacter\n\nThe type for simple generic characters. These are the generic characters used in SimpleCharTable.\n\nExamples\n\njulia> g=genchartab(\"uniGL2\")\nGeneric character table uniGL2\n  of order q^4 - q^3 - q^2 + q\n  with 2 irreducible character types\n  with 4 class types\n  without parameters\n\njulia> g[1]\nGeneric character of uniGL2\n  of degree q\n  with values\n    q\n    0\n    1\n    -1\n\n\n\n\n\n","category":"type"},{"location":"unexported/#AbstractAlgebra.Generic.normal_form-Tuple{AbstractAlgebra.Generic.UnivPoly{Nemo.ZZRingElem, AbstractAlgebra.Generic.MPoly{Nemo.ZZRingElem}}, Int64}","page":"Unexported Functions","title":"AbstractAlgebra.Generic.normal_form","text":"normal_form(f::AbstractAlgebra.Generic.UnivPoly{ZZRingElem, AbstractAlgebra.Generic.MPoly{ZZRingElem}}, m::Int64)\n\nReturn a normal form of f modulo m, such that normal_form(f,m) is equal to normal_form(g,m) if and only if f and g are congruent modulo m.\n\nExamples\n\njulia> R=universal_polynomial_ring(ZZ);\n\njulia> x=gen(R, :x);\n\njulia> normal_form(4*x^2,6)\nx^2 + 3*x\n\njulia> normal_form(4*x^2-(x^2+3*x),6)\n0\n\njulia> normal_form(4*x^9+x^7,12)\nx^3 + 4*x\n\njulia> normal_form(4*x^9+x^7-(x^3+4*x),12)\n0\n\n\n\n\n\n\n","category":"method"},{"location":"unexported/#Base.iszero-Tuple{GenericCharacterTables.GenericCycloFrac}","page":"Unexported Functions","title":"Base.iszero","text":"iszero(x::GenericCycloFrac; ignore_exceptions::Bool=false)\n\nReturn if x is zero. If ignore_exceptions is true then the exceptions of x will not be considered.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#Base.show-Tuple{IO, MIME{Symbol(\"text/plain\")}, GenericCharacterTables.AbstractGenericCharacter}","page":"Unexported Functions","title":"Base.show","text":"show(io::IO, c::AbstractGenericCharacter)\n\nDisplay a summary of the generic character c.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> g[3]\nGeneric character of GL2\n  with parameters\n    k ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ\n  of degree q + 1\n  with values\n    (q + 1)*exp(2π𝑖((i*l + i*k)//(q - 1)))\n    exp(2π𝑖((i*l + i*k)//(q - 1)))\n    exp(2π𝑖((i*l + j*k)//(q - 1))) + exp(2π𝑖((i*k + j*l)//(q - 1)))\n    0\n\njulia> [g[3]]\n1-element Vector{GenericCharacterTables.GenericCharacter}:\n Generic character of GL2\n\n\n\n\n\n\n","category":"method"},{"location":"unexported/#Base.show-Tuple{IO, MIME{Symbol(\"text/plain\")}, GenericCharacterTables.Table}","page":"Unexported Functions","title":"Base.show","text":"show(io::IO, t::Table)\n\nDisplay a summary of the generic character table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\")\nGeneric character table GL2\n  of order q^4 - q^3 - q^2 + q\n  with 4 irreducible character types\n  with 4 class types\n  with parameters (i, j, l, k)\n\njulia> [g]\n1-element Vector{GenericCharacterTables.CharTable}:\n Generic character table GL2\n\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.add_exception!-Tuple{GenericCharacterTables.ParameterExceptions, AbstractAlgebra.Generic.FracFieldElem{AbstractAlgebra.Generic.UnivPoly{Nemo.QQFieldElem, AbstractAlgebra.Generic.MPoly{Nemo.QQFieldElem}}}}","page":"Unexported Functions","title":"GenericCharacterTables.add_exception!","text":"add_exception!(a::ParameterExceptions, exception::UPolyFrac)\n\nInclude exception into a. This also removes all now redundant exceptions from a.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.is_integer-Tuple{AbstractAlgebra.Generic.FracFieldElem{AbstractAlgebra.Generic.UnivPoly{Nemo.QQFieldElem, AbstractAlgebra.Generic.MPoly{Nemo.QQFieldElem}}}}","page":"Unexported Functions","title":"GenericCharacterTables.is_integer","text":"is_integer(x::UPolyFrac)\n\nReturn if x represents an integer.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.is_restriction-Tuple{GenericCharacterTables.ParameterExceptions}","page":"Unexported Functions","title":"GenericCharacterTables.is_restriction","text":"is_restriction(x::ParameterExceptions)\n\nReturn if x actually restricts something.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.merge-Tuple{GenericCharacterTables.ParameterExceptions, GenericCharacterTables.ParameterExceptions}","page":"Unexported Functions","title":"GenericCharacterTables.merge","text":"merge(x::ParameterExceptions, y::ParameterExceptions)\n\nReturn a new collection of parameter exceptions composed of x and y where all redundant exceptions are omitted.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.shift_char_parameters-Tuple{GenericCharacterTables.CharTable, Union{GenericCharacterTables.GenericCyclo, GenericCharacterTables.GenericCycloFrac, GenericCharacterTables.Parameters}, Int64}","page":"Unexported Functions","title":"GenericCharacterTables.shift_char_parameters","text":"shift_char_parameters(t::CharTable, a::Union{Parameters,GenericCyclo,GenericCycloFrac}, steps::Int64)\n\nReplace all character parameters of t in a by their counterparts suffixed with steps.\n\nThis is done by shifting them steps*nrparams(t) steps further in t.argumentring.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.shift_class_parameters-Tuple{GenericCharacterTables.CharTable, Union{GenericCharacterTables.GenericCyclo, GenericCharacterTables.GenericCycloFrac, GenericCharacterTables.Parameters}, Int64}","page":"Unexported Functions","title":"GenericCharacterTables.shift_class_parameters","text":"shift_class_parameters(t::CharTable, a::Union{Parameters,GenericCyclo,GenericCycloFrac}, steps::Int64)\n\nReplace all class parameters of t in a by their counterparts suffixed with steps.\n\nThis is done by shifting them steps*nrparams(t) steps further in t.argumentring.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.shrink-Tuple{GenericCharacterTables.GenericCycloFrac}","page":"Unexported Functions","title":"GenericCharacterTables.shrink","text":"shrink(a::GenericCycloFrac{<:NfPoly})\n\nRemove exceptions from a that follow from the others. And try to simplify the representation of a.\n\n\n\n\n\n","category":"method"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"showinfo/#Get-Information","page":"Get Information","title":"Get Information","text":"","category":"section"},{"location":"showinfo/#About-Tables","page":"Get Information","title":"About Tables","text":"","category":"section"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"printval\ninfo\nnrparams\nparams\norder(t::Table)","category":"page"},{"location":"showinfo/#GenericCharacterTables.printval","page":"Get Information","title":"GenericCharacterTables.printval","text":"printval([io::IO], t::Table; char::Union{Int64, Nothing}=nothing, class::Union{Int64, Nothing}=nothing)\n\nPrint to io (or to the default output stream stdout if io is not given) the values of the char type char and the class type class of the table t.\n\nLeaving class unspecified will print the values of all class types at char. Leaving both unspecified will print all values of t\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printval(g,char=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖((2*i*k)//(q - 1)))\n  2: exp(2π𝑖((2*i*k)//(q - 1)))\n  3: exp(2π𝑖((i*k + j*k)//(q - 1)))\n  4: exp(2π𝑖((i*k)//(q - 1)))\n\njulia> printval(g,char=4,class=2)\nValue of character type 4 on class type\n  2: (-1)*exp(2π𝑖((i*k)//(q - 1)))\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.info","page":"Get Information","title":"GenericCharacterTables.info","text":"info(t::Table)\n\nReturn the metadata of t in LaTeX format. This usually includes the time the table was first computed.\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.nrparams","page":"Get Information","title":"GenericCharacterTables.nrparams","text":"nrparams(t::CharTable)\n\nReturn the number of class and character parameters of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrparams(g)\n4\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.params","page":"Get Information","title":"GenericCharacterTables.params","text":"params(t::CharTable)\n\nReturn all parameters the table t depends on.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> params(g)\n(q, (i, j, l, k))\n\n\n\n\n\n\nparams(chi::AbstractGenericCharacter)\n\nReturn the parameters of the character type chi. This includes the parameter names, ranges and exceptions.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> params(g[3])\nk ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#AbstractAlgebra.order-Tuple{GenericCharacterTables.Table}","page":"Get Information","title":"AbstractAlgebra.order","text":"order(t::Table)\n\nReturn the order of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> order(g)\nq^4 - q^3 - q^2 + q\n\n\n\n\n\n","category":"method"},{"location":"showinfo/#About-Characters","page":"Get Information","title":"About Characters","text":"","category":"section"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"nrchars\nnrirrchars\nchardeg\ndegree(chi::AbstractGenericCharacter)\nparams(chi::GenericCharacter)\nprintcharparam\nprintinfochar","category":"page"},{"location":"showinfo/#GenericCharacterTables.nrchars","page":"Get Information","title":"GenericCharacterTables.nrchars","text":"nrchars(t::Table, char::Int64)\n\nReturn the number of characters in the character type char of the table t.\n\nIn the case of a SimpleCharTable this is always one.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrchars(g, 1)\nq - 1\n\n\n\n\n\n\nnrchars(char::GenericCharacter)\n\nReturn the number of characters in the generic character char.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrchars(g[1])\nq - 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.nrirrchars","page":"Get Information","title":"GenericCharacterTables.nrirrchars","text":"nrirrchars(t::Table)\n\nReturn the number of irreducible characters of table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrirrchars(g)\nq^2 - 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.chardeg","page":"Get Information","title":"GenericCharacterTables.chardeg","text":"chardeg(t::Table, char::Int64)\n\nReturn the character degree of the character type char of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> chardeg(g, 3)\nq + 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#AbstractAlgebra.degree-Tuple{GenericCharacterTables.AbstractGenericCharacter}","page":"Get Information","title":"AbstractAlgebra.degree","text":"degree(char::AbstractGenericCharacter)\n\nReturn the character degree of char.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> degree(g[3])\nq + 1\n\n\n\n\n\n\n","category":"method"},{"location":"showinfo/#GenericCharacterTables.params-Tuple{GenericCharacterTables.GenericCharacter}","page":"Get Information","title":"GenericCharacterTables.params","text":"params(chi::AbstractGenericCharacter)\n\nReturn the parameters of the character type chi. This includes the parameter names, ranges and exceptions.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> params(g[3])\nk ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ\n\n\n\n\n\n","category":"method"},{"location":"showinfo/#GenericCharacterTables.printcharparam","page":"Get Information","title":"GenericCharacterTables.printcharparam","text":"printcharparam([io::IO], t::CharTable, char::Union{Int64, Nothing}=nothing)\n\nPrint to io (or to the default output stream stdout if io is not given) the parameters of the character type char of the table t.\n\nThis includes the parameter names, ranges and exceptions. Leaving char unspecified will print the parameters of all character types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printcharparam(g)\n1\tk ∈ {1,…, q - 1}\n2\tk ∈ {1,…, q - 1}\n3\tk ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except -l + k ∈ (q - 1)ℤ\n4\tk ∈ {1,…, q^2 - 1} except k ∈ (q + 1)ℤ\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printinfochar","page":"Get Information","title":"GenericCharacterTables.printinfochar","text":"printinfochar([io::IO], t::Table, char::Union{Int64, Nothing}=nothing)\n\nPrint to io (or to the default output stream stdout if io is not given) the infolists of the character type char of the table t.\n\nLeaving char unspecified will print the infolists of all character types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printinfochar(g)\n1\tAny[Any[1, 0], Any[\"A_1\", [2]]]\n2\tAny[Any[1, 1], Any[\"A_1\", [1, 1]]]\n3\tAny[Any[2, 0], Any[\"A_0\", [1]]]\n4\tAny[Any[3, 0], Any[\"A_0\", [1]]]\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#About-Classes","page":"Get Information","title":"About Classes","text":"","category":"section"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"classtypes\nnrclasses\ncentord\nprintclassparam\nprintinfoclass","category":"page"},{"location":"showinfo/#GenericCharacterTables.classtypes","page":"Get Information","title":"GenericCharacterTables.classtypes","text":"classtypes(t::Table)\n\nReturn the number of conjugacy class types of table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> classtypes(g)\n4\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.nrclasses","page":"Get Information","title":"GenericCharacterTables.nrclasses","text":"nrclasses(t::Table)\n\nReturn the number of conjugacy classes of table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrclasses(g)\nq^2 - 1\n\n\n\n\n\n\nnrclasses(t::Table, class::Int64)\n\nReturn the number of conjugacy classes in the class type class of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrclasses(g, 1)\nq - 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.centord","page":"Get Information","title":"GenericCharacterTables.centord","text":"centord(t::Table, class::Int64)\n\nReturn the order of the centralizer of the class type class of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> centord(g, 1)\nq^4 - q^3 - q^2 + q\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printclassparam","page":"Get Information","title":"GenericCharacterTables.printclassparam","text":"printclassparam([io::IO], t::CharTable, class::Union{Int64, Nothing}=nothing)\n\nPrint to io (or to the default output stream stdout if io is not given) the parameters of the class type class of the table t.\n\nThis includes the parameter names, ranges and exceptions. Leaving class unspecified will print the parameters of all character types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printclassparam(g)\n1\ti ∈ {1,…, q - 1}\n2\ti ∈ {1,…, q - 1}\n3\ti ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except i - j ∈ (q - 1)ℤ\n4\ti ∈ {1,…, q^2 - 1} except i ∈ (q + 1)ℤ\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printinfoclass","page":"Get Information","title":"GenericCharacterTables.printinfoclass","text":"printinfoclass([io::IO], t::Table, class::Union{Int64, Nothing}=nothing)\n\nPrint to io (or to the default output stream stdout if io is not given) the infolists of the class type class of the table t.\n\nLeaving class unspecified will print the infolists of all class types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printinfoclass(g)\n1\tAny[Any[1, 0], Any[\"A_1\", [1, 1]]]\n2\tAny[Any[1, 1], Any[\"A_1\", [2]]]\n3\tAny[Any[2, 0], Any[\"A_0\", [1]]]\n4\tAny[Any[3, 0], Any[\"A_0\", [1]]]\n\n\n\n\n\n\n","category":"function"}]
}

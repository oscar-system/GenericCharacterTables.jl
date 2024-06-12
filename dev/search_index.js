var documenterSearchIndex = {"docs":
[{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"calculations/#Calculate-with-Tables","page":"Calculate with Tables","title":"Calculate with Tables","text":"","category":"section"},{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"GenericCharacterTables allows you to compute for example scalar products of whole class or character types. The results are correct for all possible combinations of parameters except possibly for those where the additionally returned exceptions apply. Those consist of multivariate polynomials with coefficients in a rational function field and are fulfilled if the evaluation of this polynomial is an integer.","category":"page"},{"location":"calculations/#On-Characters","page":"Calculate with Tables","title":"On Characters","text":"","category":"section"},{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"norm(t::Table{T}, char::Int64) where T <: NfPoly\nscalar","category":"page"},{"location":"calculations/#LinearAlgebra.norm-Union{Tuple{T}, Tuple{GenericCharacterTables.Table{T}, Int64}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Calculate with Tables","title":"LinearAlgebra.norm","text":"norm(t::Table{T}, char::Int64) where T <: NfPoly\n\nReturn the norm of the character type char.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> norm(g,1)\n1\n\n\n\n\n\n\n","category":"method"},{"location":"calculations/#GenericCharacterTables.scalar","page":"Calculate with Tables","title":"GenericCharacterTables.scalar","text":"scalar(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly\n\nReturn the scalar product between the character types char1 and char2.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> scalar(g,3,2)\n0\nWith exceptions:\n  (l1 + k1 - 2*k2)//(q - 1) ∈ ℤ\n  (l1 - k2)//(q - 1) ∈ ℤ\n  (k1 - k2)//(q - 1) ∈ ℤ\n\n\n\n\n\n","category":"function"},{"location":"calculations/#On-Classes","page":"Calculate with Tables","title":"On Classes","text":"","category":"section"},{"location":"calculations/","page":"Calculate with Tables","title":"Calculate with Tables","text":"ortho2norm\northo2scalar\nclassmult","category":"page"},{"location":"calculations/#GenericCharacterTables.ortho2norm","page":"Calculate with Tables","title":"GenericCharacterTables.ortho2norm","text":"ortho2norm(t::Table{T}, class::Int64) where T <: NfPoly\n\nReturn the (generic) norm of the class type class.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> ortho2norm(g,2)\n1\n\n\n\n\n\n","category":"function"},{"location":"calculations/#GenericCharacterTables.ortho2scalar","page":"Calculate with Tables","title":"GenericCharacterTables.ortho2scalar","text":"ortho2scalar(t::Table{T}, class1::Int64, class2::Int64) where T <: NfPoly\n\nReturn the (generic) scalar product between the class types class1 and class2.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> ortho2scalar(g,3,2)\n0\nWith exceptions:\n  (i1 + j1 - 2*i2)//(q - 1) ∈ ℤ\n  (i1 - i2)//(q - 1) ∈ ℤ\n  (j1 - i2)//(q - 1) ∈ ℤ\n\n\n\n\n\n","category":"function"},{"location":"calculations/#GenericCharacterTables.classmult","page":"Calculate with Tables","title":"GenericCharacterTables.classmult","text":"classmult(t::Table{T}, class1::Int64, class2::Int64, class3::Int64) where T <: NfPoly\n\nReturn the (generic) class multiplication constant of the class types class1, class2 and class3 of the table t.\n\nExamples\n\njulia> g=genchartab(\"SL2.0\");\n\njulia> classmult(g,2,2,4)\nq + 1\nWith exceptions:\n  (a3)//(q + 1) ∈ ℤ\n\n\n\n\n\n","category":"function"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"modify/#Modify-Tables","page":"Modify Tables","title":"Modify Tables","text":"","category":"section"},{"location":"modify/#Add-Characters","page":"Modify Tables","title":"Add Characters","text":"","category":"section"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"It is also possible to create new character types with GenericCharacterTables. These new characters will be added to the tables inplace.","category":"page"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"tensor!\nlincomb!\nomega!","category":"page"},{"location":"modify/#GenericCharacterTables.tensor!","page":"Modify Tables","title":"GenericCharacterTables.tensor!","text":"tensor!(t::Table{T}, char1::Int64, char2::Int64) where T <: NfPoly\n\nAppend the tensor product of the character types char1 and char2 to the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> tensor!(g,1,2)\n5\n\njulia> printinfochar(g,5)\n5\t[\"Tensor of type 1 and 2\"]\n\n\n\n\n\n\n","category":"function"},{"location":"modify/#GenericCharacterTables.lincomb!","page":"Modify Tables","title":"GenericCharacterTables.lincomb!","text":"lincomb!(t::Table{T}, coeffs::Vector{Int64}, chars::Vector{Int64}) where T <: NfPoly\n\nAppend the linear combination of the character types chars with coefficients coeffs to the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> lincomb!(g,[5,1],[1,2])\n5\n\njulia> printinfochar(g,5)\n5\t[\"Lincomb 5 * type 1 + 1 * type 2\"]\n\n\n\n\n\n\n","category":"function"},{"location":"modify/#GenericCharacterTables.omega!","page":"Modify Tables","title":"GenericCharacterTables.omega!","text":"omega!(t::Table{T}, char::Int64) where T <: NfPoly\n\nAppend the (generic) central character of the character type char to the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> omega!(g,1)\n5\n\njulia> printinfochar(g,5)\n5\t[\"Omega of type 1\"]\n\n\n\n\n\n\n","category":"function"},{"location":"modify/#Change-Values","page":"Modify Tables","title":"Change Values","text":"","category":"section"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"Sometimes one likes to specify some of the free variables in the tables to simplify the often very complicated values a bit.","category":"page"},{"location":"modify/","page":"Modify Tables","title":"Modify Tables","text":"speccharparam!\nspecclassparam!","category":"page"},{"location":"modify/#GenericCharacterTables.speccharparam!","page":"Modify Tables","title":"GenericCharacterTables.speccharparam!","text":"speccharparam!(t::CharTable{T}, char::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly\n\nReplace the parameter var with expr in the character type char.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printval(g,char=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖(2//(q - 1)*i*k))\n  2: exp(2π𝑖(2//(q - 1)*i*k))\n  3: exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*k))\n  4: exp(2π𝑖(1//(q - 1)*i*k))\n\njulia> q,(i,j,l,k) = params(g);\n\njulia> speccharparam!(g, 1, i, q)\n\njulia> printval(g,char=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖(2//(q - 1)*k))\n  2: exp(2π𝑖(2//(q - 1)*k))\n  3: exp(2π𝑖(1//(q - 1)*j*k + 1//(q - 1)*k))\n  4: exp(2π𝑖(1//(q - 1)*k))\n\n\n\n\n\n","category":"function"},{"location":"modify/#GenericCharacterTables.specclassparam!","page":"Modify Tables","title":"GenericCharacterTables.specclassparam!","text":"specclassparam!(t::CharTable{T}, class::Int64, var::FracPoly{T}, expr::RingElement) where T <: NfPoly\n\nReplace the parameter var with expr in the class type class.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printval(g,class=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖(2//(q - 1)*i*k))\nValue of character type 2 on class type\n  1: q*exp(2π𝑖(2//(q - 1)*i*k))\nValue of character type 3 on class type\n  1: (q + 1)*exp(2π𝑖(1//(q - 1)*i*l + 1//(q - 1)*i*k))\nValue of character type 4 on class type\n  1: (q - 1)*exp(2π𝑖(1//(q - 1)*i*k))\n\njulia> q,(i,j,l,k) = params(g);\n\njulia> specclassparam!(g, 1, k, 3)\n\njulia> printval(g,class=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖(6//(q - 1)*i))\nValue of character type 2 on class type\n  1: q*exp(2π𝑖(6//(q - 1)*i))\nValue of character type 3 on class type\n  1: (q + 1)*exp(2π𝑖(1//(q - 1)*i*l + 3//(q - 1)*i))\nValue of character type 4 on class type\n  1: (q - 1)*exp(2π𝑖(3//(q - 1)*i))\n\n\n\n\n\n","category":"function"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"#GenericCharacterTables.jl","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"","category":"section"},{"location":"#About","page":"GenericCharacterTables.jl","title":"About","text":"","category":"section"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"GenericCharacterTables is a library for working with generic character tables. It is based on CHEVIE and aims to provide all its features originally implemented in Maple. It is written in Julia and depends on Nemo and therefore on AbstractAlgebra.","category":"page"},{"location":"#Loading-tables","page":"GenericCharacterTables.jl","title":"Loading tables","text":"","category":"section"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"Before doing anything you need to load a table first. GenericCharacterTables comes with a variety of precomputed tables.","category":"page"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"genchartab","category":"page"},{"location":"#GenericCharacterTables.genchartab","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.genchartab","text":"genchartab(x::String)\n\nReturn the generic character table with name x.\n\nOmitting x will return the names of all importable character tables.\n\nExamples\n\njulia> g = genchartab(\"GL2\")\nGeneric character table\n  of order q^4 - q^3 - q^2 + q\n  with 4 irreducible character types\n  with 4 class types\n  with parameters (i, j, l, k)\n\n\n\n\n\n","category":"function"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"GenericCharacterTables also provides some tables of Green functions. They can be loaded similarly.","category":"page"},{"location":"","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.jl","text":"greenfuntab","category":"page"},{"location":"#GenericCharacterTables.greenfuntab","page":"GenericCharacterTables.jl","title":"GenericCharacterTables.greenfuntab","text":"greenfuntab(x::String)\n\nReturn the greenfunction table with name x.\n\nOmitting x will return the names of all importable greenfunctions.\n\nExamples\n\njulia> g = greenfuntab(\"GL2\")\nGeneric character table\n  of order q^4 - q^3 - q^2 + q\n  with 2 irreducible character types\n  with 2 class types\n  without parameters\n\n\n\n\n\n","category":"function"},{"location":"unexported/","page":"Unexported Functions","title":"Unexported Functions","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"unexported/#Unexported-Functions","page":"Unexported Functions","title":"Unexported Functions","text":"","category":"section"},{"location":"unexported/","page":"Unexported Functions","title":"Unexported Functions","text":"These are all functions for internal use only:","category":"page"},{"location":"unexported/","page":"Unexported Functions","title":"Unexported Functions","text":"Modules = [GenericCharacterTables]\nPublic = false","category":"page"},{"location":"unexported/#Base.iszero-Tuple{GenericCharacterTables.CycloFrac}","page":"Unexported Functions","title":"Base.iszero","text":"iszero(x::CycloFrac; ignore_exceptions::Bool=false)\n\nReturn if x is zero. If ignore_exceptions is true then the exceptions of x will not be considered.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.normal_form-Tuple{Nemo.QQFieldElem}","page":"Unexported Functions","title":"GenericCharacterTables.normal_form","text":"normal_form(a::FracPoly)\n\nReturn a normal form b of a such that exp(2pi mathrmi cdot a) = exp(2pi mathrmi cdot b).\n\nThis is done by reducing the numerators of the coefficients modulo their denominators.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.shift_char_parameters-Union{Tuple{T}, Tuple{GenericCharacterTables.CharTable{T}, Union{GenericCharacterTables.Cyclotomic{T}, GenericCharacterTables.Parameters{T}}, Int64}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Unexported Functions","title":"GenericCharacterTables.shift_char_parameters","text":"shift_char_parameters(t::CharTable{T}, a::Union{Parameters{T},Cyclotomic{T}}, steps::Int64) where T <: NfPoly\n\nReplace all character parameters of t in a by their counterparts suffixed with steps.\n\nThis is done by shifting them steps*nrparams(t) steps further in t.argumentring.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.shift_class_parameters-Union{Tuple{T}, Tuple{GenericCharacterTables.CharTable{T}, Union{GenericCharacterTables.Cyclotomic{T}, GenericCharacterTables.Parameters{T}}, Int64}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Unexported Functions","title":"GenericCharacterTables.shift_class_parameters","text":"shift_class_parameters(t::CharTable{T}, a::Union{Parameters{T},Cyclotomic{T}}, steps::Int64) where T <: NfPoly\n\nReplace all class parameters of t in a by their counterparts suffixed with steps.\n\nThis is done by shifting them steps*nrparams(t) steps further in t.argumentring.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.shrink-Union{Tuple{GenericCharacterTables.CycloFrac{T}}, Tuple{T}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Unexported Functions","title":"GenericCharacterTables.shrink","text":"shrink(a::CycloFrac{<:NfPoly})\n\nRemove exceptions from a that follow from the others. And try to simplify the representation of a.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.shrink-Union{Tuple{Set{GenericCharacterTables.ParameterException{T}}}, Tuple{T}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Unexported Functions","title":"GenericCharacterTables.shrink","text":"shrink(a::Set{ParameterException{<:NfPoly}})\n\nRemove exceptions from a that follow from the others.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.simplify-Union{Tuple{T}, Tuple{Union{GenericCharacterTables.Cyclotomic{T}, GenericCharacterTables.ParameterException{T}}, GenericCharacterTables.CharTable{T}}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Unexported Functions","title":"GenericCharacterTables.simplify","text":"simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, t::CharTable{T}) where T <: NfPoly\n\nSimplify x according to the congruence relation given by t.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.simplify-Union{Tuple{T}, Tuple{Union{GenericCharacterTables.Cyclotomic{T}, GenericCharacterTables.ParameterException{T}}, T, AbstractAlgebra.Generic.FracFieldElem{T}}} where T<:Union{AbstractAlgebra.PolyRingElem{Nemo.AbsSimpleNumFieldElem}, AbstractAlgebra.PolyRingElem{Nemo.QQFieldElem}}","page":"Unexported Functions","title":"GenericCharacterTables.simplify","text":"simplify(x::Union{Cyclotomic{T}, ParameterException{T}}, c::T, cinv::Generic.FracFieldElem{T}) where T <: NfPoly\n\nSimplify x by replacing the generator of the polynomials of type T by c and then back to cinv.\n\nThis is used to remove terms that look fractional but are in fact whole.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.weak_sign-Tuple{Nemo.AbsSimpleNumFieldElem}","page":"Unexported Functions","title":"GenericCharacterTables.weak_sign","text":"weak_sign(a::QQFieldElem)\n\nReturn the sign of the leading coefficient of the polynomial representation of a.\n\n\n\n\n\n","category":"method"},{"location":"unexported/#GenericCharacterTables.weak_sign-Tuple{Nemo.QQFieldElem}","page":"Unexported Functions","title":"GenericCharacterTables.weak_sign","text":"weak_sign(a::QQFieldElem)\n\nReturn the sign of a.\n\n\n\n\n\n","category":"method"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"CurrentModule = GenericCharacterTables","category":"page"},{"location":"showinfo/#Get-Information","page":"Get Information","title":"Get Information","text":"","category":"section"},{"location":"showinfo/#About-Tables","page":"Get Information","title":"About Tables","text":"","category":"section"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"status\nprintval\nprintinfotab\nnrparams\nparams\norder(t::Table)","category":"page"},{"location":"showinfo/#GenericCharacterTables.status","page":"Get Information","title":"GenericCharacterTables.status","text":"status(t::Table)\n\nPrint the order of the group associated to t and the number of class and character types of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> status(g)\nOrder:                     q^4 - q^3 - q^2 + q\nNumber of character types: 4\nNumber of class types:     4\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printval","page":"Get Information","title":"GenericCharacterTables.printval","text":"printval(t::Table; char::Union{Int64, Nothing}=nothing, class::Union{Int64, Nothing}=nothing)\n\nPrint the values of the char type char and the class type class of the table t.\n\nLeaving class unspecified will print the values of all class types at char. Leaving both unspecified will print all values of t\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printval(g,char=1)\nValue of character type 1 on class type\n  1: exp(2π𝑖(2//(q - 1)*i*k))\n  2: exp(2π𝑖(2//(q - 1)*i*k))\n  3: exp(2π𝑖(1//(q - 1)*i*k + 1//(q - 1)*j*k))\n  4: exp(2π𝑖(1//(q - 1)*i*k))\n\njulia> printval(g,char=4,class=2)\nValue of character type 4 on class type\n  2: -1*exp(2π𝑖(1//(q - 1)*i*k))\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printinfotab","page":"Get Information","title":"GenericCharacterTables.printinfotab","text":"printinfotab(t::Table)\n\nPrint metadata of t in the latex format.\n\nThis usually includes the time the table was first computed.\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.nrparams","page":"Get Information","title":"GenericCharacterTables.nrparams","text":"nrparams(t::CharTable)\n\nReturn the number of class and character parameters of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrparams(g)\n4\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.params","page":"Get Information","title":"GenericCharacterTables.params","text":"params(t::CharTable)\n\nReturn all parameters the table t depends on.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> params(g)\n(q, (i, j, l, k))\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#AbstractAlgebra.order-Tuple{GenericCharacterTables.Table}","page":"Get Information","title":"AbstractAlgebra.order","text":"order(t::Table)\n\nReturn the order of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> order(g)\nq^4 - q^3 - q^2 + q\n\n\n\n\n\n","category":"method"},{"location":"showinfo/#About-Characters","page":"Get Information","title":"About Characters","text":"","category":"section"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"chartypes\nirrchartypes\nnrchars\nnrirrchars\nchardeg\nprintcharparam\nprintinfochar","category":"page"},{"location":"showinfo/#GenericCharacterTables.chartypes","page":"Get Information","title":"GenericCharacterTables.chartypes","text":"chartypes(t::Table)\n\nReturn the number of character types of table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> chartypes(g)\n4\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.irrchartypes","page":"Get Information","title":"GenericCharacterTables.irrchartypes","text":"irrchartypes(t::Table)\n\nReturn the number of irreducible character types of table t.\n\nFor example this excludes character types created with tensor! or lincomb!.\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.nrchars","page":"Get Information","title":"GenericCharacterTables.nrchars","text":"nrchars(t::Table{T}, char::Int64) where T <: NfPoly\n\nReturn the number of characters in the character type char of the table t.\n\nIn the case of a SimpleCharTable this is always one.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrchars(g, 1)\nq - 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.nrirrchars","page":"Get Information","title":"GenericCharacterTables.nrirrchars","text":"nrirrchars(t::Table)\n\nReturn the number of irreducible characters of table t.\n\nFor example this excludes characters created with tensor! or lincomb!.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrirrchars(g)\nq^2 - 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.chardeg","page":"Get Information","title":"GenericCharacterTables.chardeg","text":"chardeg(t::Table, char::Int64)\n\nReturn the character degree of the character type char of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> chardeg(g, 3)\nq + 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printcharparam","page":"Get Information","title":"GenericCharacterTables.printcharparam","text":"printcharparam(t::CharTable, char::Union{Int64, Nothing}=nothing)\n\nPrint the parameters of the character type char of the table t.\n\nThis includes the parameter names, ranges and exceptions. Leaving char unspecified will print the parameters of all character types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printcharparam(g)\n1\tk ∈ {1,…, q - 1}\n2\tk ∈ {1,…, q - 1}\n3\tk ∈ {1,…, q - 1}, l ∈ {1,…, q - 1} except (l - k)//(q - 1) ∈ ℤ\n4\tk ∈ {1,…, q^2 - 1} except (k)//(q + 1) ∈ ℤ\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printinfochar","page":"Get Information","title":"GenericCharacterTables.printinfochar","text":"printinfochar(t::Table, char::Union{Int64, Nothing}=nothing)\n\nPrint the infolists of the character type char of the table t.\n\nLeaving char unspecified will print the infolists of all character types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printinfochar(g)\n1\tAny[Any[1, 0], Any[\"A_1\", [2]]]\n2\tAny[Any[1, 1], Any[\"A_1\", [1, 1]]]\n3\tAny[Any[2, 0], Any[\"A_0\", [1]]]\n4\tAny[Any[3, 0], Any[\"A_0\", [1]]]\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#About-Classes","page":"Get Information","title":"About Classes","text":"","category":"section"},{"location":"showinfo/","page":"Get Information","title":"Get Information","text":"classtypes\nnrclasses\ncentord\nprintclassparam\nprintinfoclass","category":"page"},{"location":"showinfo/#GenericCharacterTables.classtypes","page":"Get Information","title":"GenericCharacterTables.classtypes","text":"classtypes(t::Table)\n\nReturn the number of conjugacy class types of table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> classtypes(g)\n4\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.nrclasses","page":"Get Information","title":"GenericCharacterTables.nrclasses","text":"nrclasses(t::Table)\n\nReturn the number of conjugacy classes of table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrclasses(g)\nq^2 - 1\n\n\n\n\n\n\nnrclasses(t::Table{T}, class::Int64) where T <: NfPoly\n\nReturn the number of conjugacy classes in the class type class of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> nrclasses(g, 1)\nq - 1\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.centord","page":"Get Information","title":"GenericCharacterTables.centord","text":"centord(t::Table, class::Int64)\n\nReturn the order of the centralizer of the class type class of the table t.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> centord(g, 1)\nq^4 - q^3 - q^2 + q\n\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printclassparam","page":"Get Information","title":"GenericCharacterTables.printclassparam","text":"printclassparam(t::CharTable, class::Union{Int64, Nothing}=nothing)\n\nPrint the parameters of the class type class of the table t.\n\nThis includes the parameter names, ranges and exceptions. Leaving class unspecified will print the parameters of all character types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printclassparam(g)\n1\ti ∈ {1,…, q - 1}\n2\ti ∈ {1,…, q - 1}\n3\ti ∈ {1,…, q - 1}, j ∈ {1,…, q - 1} except (i - j)//(q - 1) ∈ ℤ\n4\ti ∈ {1,…, q^2 - 1} except (i)//(q + 1) ∈ ℤ\n\n\n\n\n\n","category":"function"},{"location":"showinfo/#GenericCharacterTables.printinfoclass","page":"Get Information","title":"GenericCharacterTables.printinfoclass","text":"printinfoclass(t::Table, class::Union{Int64, Nothing}=nothing)\n\nPrint the infolists of the class type class of the table t.\n\nLeaving class unspecified will print the infolists of all class types.\n\nExamples\n\njulia> g=genchartab(\"GL2\");\n\njulia> printinfoclass(g)\n1\tAny[Any[1, 0], Any[\"A_1\", [1, 1]]]\n2\tAny[Any[1, 1], Any[\"A_1\", [2]]]\n3\tAny[Any[2, 0], Any[\"A_0\", [1]]]\n4\tAny[Any[3, 0], Any[\"A_0\", [1]]]\n\n\n\n\n\n\n","category":"function"}]
}

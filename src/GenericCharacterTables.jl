# GenericCharacterTables
# Copyright (C) 2022 Andreas Leim <leim@rhrk.uni-kl.de>, Martin Wagner <marwagne@rhrk.uni-kl.de>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

module GenericCharacterTables

using Oscar
import Oscar.AbstractAlgebra.Generic

import Compat

if Compat.pkgversion(Oscar.AbstractAlgebra) >= v"0.42.0"
    const FracPoly{T} = Generic.UnivPoly{Generic.FracFieldElem{T}} where T
else
    const FracPoly{T} = Generic.UnivPoly{Generic.FracFieldElem{T}, Generic.MPoly{Generic.FracFieldElem{T}}} where T
end
const NfPoly = Union{PolyRingElem{QQFieldElem}, PolyRingElem{AbsSimpleNumFieldElem}}

include("Parameter.jl")
include("Arith.jl")
include("CharTable.jl")
include("Shifts.jl")
include("SumProc.jl")
include("Show.jl")
include("Ortho.jl")
include("ModifyTable.jl")
include("Congruence.jl")

end

import Base: show, isone, iszero, one, zero, conj, inv, rand, deepcopy_internal, hash, promote_rule,
	getindex, eltype, length, iterate, +, -, *, //, ^, ==
import Compat: pkgversion
using Oscar.Random: Random, SamplerTrivial, GLOBAL_RNG
using Oscar.RandomExtensions: RandomExtensions, Make2, AbstractRNG
import Oscar.AbstractAlgebra: parent_type, elem_type, base_ring, base_ring_type, parent, is_domain_type,
	is_exact_type, canonical_unit, isequal, divexact, zero!, mul!, add!, get_cached!, is_unit,
	characteristic, Ring, RingElem, expressify, evaluate, normal_form, divexact
import Oscar: tensor_product, norm, scalar_product, norm, scalar_product, class_multiplication_coefficient,
	order, degree, number_of_conjugacy_classes, pretty, Indent, Dedent

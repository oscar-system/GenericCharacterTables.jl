import Base:
	*,
	+,
	-,
	//,
	==,
	^,
	conj,
	deepcopy_internal,
	eltype,
	getindex,
	hash,
	inv,
	isone,
	iszero,
	iterate,
	length,
	one,
	promote_rule,
	rand,
	show,
	zero

import Compat:
	pkgversion

import Oscar.Random:
	GLOBAL_RNG,
	Random,
	SamplerTrivial

import Oscar.RandomExtensions:
	AbstractRNG,
	RandomExtensions,
	Make2

import Oscar.AbstractAlgebra:
	add!,
	base_ring,
	base_ring_type,
	canonical_unit,
	characteristic,
	divexact,
	elem_type,
	evaluate,
	expressify,
	get_cached!,
	is_domain_type,
	isequal,
	is_exact_type,
	is_unit,
	mul!,
	normal_form,
	parent,
	parent_type,
	Ring,
	RingElem,
	zero!

import Oscar:
	class_multiplication_coefficient,
	Dedent,
	degree,
	Indent,
	norm,
	number_of_conjugacy_classes,
	order,
	pretty,
	scalar_product,
	tensor_product


```@meta
CurrentModule = GenericCharacterTables
DocTestSetup = :(using GenericCharacterTables, Oscar)
```

# Generic cyclotomics
Generic cyclotomic numbers are expressions of the form
$$p_1\operatorname{e}^{\operatorname{i}2 \pi \frac{f_1}{g_1}} + \ldots + p_r\operatorname{e}^{\operatorname{i}2 \pi \frac{f_r}{g_r}}$$
where $p_1,\ldots,p_r,g_1,\ldots,g_r \in \mathbb{Q}[q]$ and $f_1, \ldots, f_r \in \mathbb{Q}[q,x_1,\ldots,x_k]$.
These describe the entries of generic character tables. Two generic cyclotomics
are defined to be equal if their evaluations coincide for every tuple of integers.
Where evaluation just means replacing the free variables by actual values which
yields a cyclotomic number. Usually the first component of the tuples is restricted
to the prime powers, sometimes just to the even prime powers or something similar.
This depends on the specific character table. Of course only evaluations where the
$g_1,\ldots,g_r$ are not zeros are considered.

These numbers form a ring which will be called generic cyclotomic ring.
Currently, only very basic operations are supported. Basically just the normal
ring operations and evaluation. Things like inversion or division still
lack the necessary mathematical theory.

```@docs
generic_cyclotomic_ring
param
```

# Table file format

A generic character table can be stored as a TOML document instead of Julia
code, at `data/Tables/<type>/<name>.toml`; `generic_character_table(name)`
prefers it over `<name>.jl`. This page specifies the format, so that other
programs can read these files with any TOML 1.0 parser. The reference reader
is `load_table_data` in `src/TableFormat.jl`; `data/Tables/A1/GL2.toml` is
a complete small example.

## What a table describes

A generic character table describes the character tables of a family of
finite groups ``G(q)`` at once. Its conjugacy classes fall into *class
types*, its irreducible characters into *character types*. The members of a
type are indexed by integer *parameters*. Everything is expressed in the
table's *variable* (usually `q`) and these parameters:

- the group order, and for each class type the size of its classes, for
  each character type the degree of its characters: polynomials;
- the value of a character type on a class type: a *generic cyclotomic
  number*, a finite sum of terms ``c \cdot \zeta^{n/d}`` with
  ``\zeta^{n/d} = \exp(2 \pi i\, n/d)`` and polynomials ``c``, ``n``, ``d``
  over ``\mathbb{Q}`` in the variable and the parameters of both types;
- for each type a *sum*: a program that sums a function of the parameters
  over all members of the type.

## Document

The document has these top-level keys.

| Key | TOML type | Required | Meaning |
|:----|:----------|:---------|:--------|
| `format` | integer | yes | Version of this format; `1`. Readers must reject other versions. |
| `kind` | string | yes | `"CharTable"`; no other kind is defined. |
| `order` | string | yes | The group order, a [polynomial](@ref "Expressions"). |
| `variable` | string | no | Name of the variable, default `"q"`. |
| `power` | integer | no | Default `1`, see below. |
| `congruence` | array of 2 integers | no | `[a, m]`: the table holds for those values of the variable whose `power`-th power is congruent to `a` modulo `m`. |
| `classparams` | array of strings | yes | Names of all class parameters, possibly empty. |
| `charparams` | array of strings | yes | Names of all character parameters, possibly empty. |
| `information` | string | yes | Description in Markdown; `[Key](@cite)` refers to an entry of `docs/src/refs.bib`. |
| `class_helpers` | table of strings | no | Named [sums](@ref "Sums") the class sums call. |
| `char_helpers` | table of strings | no | Named sums the character sums call. |
| `classtypes` | array of tables | yes | The class types, in order. |
| `chartypes` | array of tables | yes | The character types, in order. |

Readers should ignore keys they do not know; they are reserved for metadata
such as the description of a table derived from another one.

The variable to the power `power` is an integer; `power` is not `1` when the
variable stands for a root of an integer (`SL2.1` uses `q0` with
`power = 2`). In the exponents ``n/d`` of a value the variable then only
occurs in powers that are multiples of `power`.

The name of the table is the file name without `.toml`. Types are numbered
by their position in `classtypes` and `chartypes`, starting at 1; the
comments `# 3` after `[[classtypes]]` in the files are for reading only.

### Names

The names usable in expressions and sums are the variable, the parameters,
and copies of the parameters: for every name `n` in `classparams` followed
by `charparams` and every suffix `s` in `1`, `2`, `3`, `t1`, `t2`, the name
`n` followed by `s`, e.g. `i11` for `i1`. The copies are free variables;
sums use them as auxiliary summation variables, and the Julia package uses
them to compute scalar products. All these names are distinct. `E` and `tt`
are reserved.

The Julia package orders its variables as the variable, `classparams`,
`charparams`, then the copies by suffix; other readers do not need this.

### Class types

Each table in `classtypes` has these keys.

| Key | TOML type | Required | Meaning |
|:----|:----------|:---------|:--------|
| `info` | array | yes | Descriptive data from the source of the table (e.g. CHEVIE labels). Opaque to readers; `{ poly = "..." }` inside it is a polynomial. |
| `length` | string | yes | The size of each class of this type, a polynomial. |
| `params` | array of `[name, modulus]` | yes | The parameters of this type and their moduli (polynomials in the variable), possibly empty. |
| `exceptions` | array of strings | no | Fractions; see below. |
| `sum` | string | yes | The class sum, a [program](@ref "Sums"). |

A parameter with modulus ``m`` is an integer modulo ``m``; the package
prints the range as ``1, \ldots, m``. A tuple of parameter values at which
one of the `exceptions` evaluates to an integer describes no member:
`(i - j)//(q - 1)` excludes ``i \equiv j \pmod{q - 1}``. The exceptions need
not exclude every tuple that describes no member, and several tuples may
describe the same member, so only the [sum](@ref "Sums") defines the
members; this holds for character types alike. Applied to the
function that is 1 at one tuple, modulo the moduli, and 0 elsewhere, it
gives the weight of that tuple: 1 if the tuple alone describes its member,
``1/2`` if it is one of two describing the same member, 0 if it describes
none. Character type 81 of `CSp6.1`, for example, has the parameters `k1`,
`k2`, `k3`, and its sum leaves out ``k_1 = 0``, which no exception
excludes. At such tuples the values mean nothing.

### Character types

Each table in `chartypes` has the keys `info`, `params`, `exceptions` and
`sum` of a class type, the sum being the character sum, and these.

| Key | TOML type | Required | Meaning |
|:----|:----------|:---------|:--------|
| `degree` | string | yes | The degree of each character of this type, a polynomial. |
| `values` | array of strings | yes | One [value](@ref "Expressions") per class type, in order: the value of the characters of this type on the classes of that class type, in the parameters of both types. |

## Expressions

Polynomials, fractions and values are strings in one expression language.
Spaces, tabs and newlines between tokens are ignored. An integer is a
sequence of decimal digits of any length; a name matches
`[A-Za-z_][A-Za-z0-9_]*`.

```
sum     = ["+" | "-"] product {("+" | "-") product}
product = frac {"*" ["-"] frac}
frac    = power {"//" power}
power   = atom ["^" atom]
atom    = integer | name | "E(" sum ")" | "(" sum ")"
```

As in Julia, `^` binds tighter than `//`, and `//` tighter than `*`: the
coefficient `1//2*q^5` is ``\frac{1}{2} q^5``. A leading `-` negates the
product after it. The binary operators are left-associative; the exponent
of `^` is an atom, so `q^2^3` is not an expression.

- Names stand for the variable and the parameters, integers for integers.
  `+`, `-` and `*` are the operations of polynomials over ``\mathbb{Q}``,
  `a^k` is a power with a nonnegative integer `k`.
- `a//b` is the rational number ``a/b`` if `a` and `b` are integers, and
  the fraction of the polynomials `a` and `b` otherwise. A rational
  coefficient is written `1//2*q`, never `q//2`, which is a fraction.
- `E(d)`, with a polynomial `d`, is a root of unity awaiting its exponent:
  `E(d)^(n)`, with a polynomial `n`, is ``\exp(2 \pi i\, n/d)``, and `E(d)`
  alone is `E(d)^(1)`. This is GAP's `E(d)` raised to the power `n`.

Where a string is read decides what it must be:

- A *polynomial* (`order`, `length`, `degree`, moduli, `{ poly = ... }`):
  an expression without `E` and without fractions of polynomials, in any
  form, e.g. factored: `"q^9 * (q^6 - 1) * (q^4 - 1) * (q^2 - 1) * (q - 1)"`.
- A *fraction* (`exceptions`): `"(i - j)//(q - 1)"`, or a polynomial.
- A *value*: polynomials and roots of unity combined by `+`, `-` and
  multiplication with polynomials, i.e. a sum of terms
  `c*E(d)^(n)` and polynomial terms `c`, which count as exponent 0. The
  product of two roots of unity is not a value. No two terms may have the
  same exponent ``n/d``. Zero is written `"0"`.

For example, character type 3 of `GL2` has the value
`"E(q - 1)^(i*l + j*k) + E(q - 1)^(i*k + j*l)"` on class type 3. For
``q = 3`` and the parameters ``i = 0``, ``j = 1``, ``k = 0``, ``l = 1`` it
is ``\exp(0) + \exp(2\pi i \cdot 1/2) = 1 - 1 = 0``.

The Julia reader keeps the numerator and denominator of every exponent
``n/d`` and of every exception exactly as written, without cancelling, and
the terms of each value in the order of the file. A table therefore reads
back with the internal representation it was written from, down to how its
values print. Other readers may normalize; the meaning does not change.

## Sums

The class sum of a class type maps a function ``f`` of the parameters to
``\sum_C f(C)``, the sum over all classes ``C`` of the type, each counted
once. The character sum of a character type does the same over its
characters. So the number of classes of a type is the class sum of 1, and
the order of the group is
``\sum_\chi (\text{character sum of } 1) \cdot \text{degree}^2`` over the
character types ``\chi``: a check for a reader.

A sum is a program: statements separated by newlines, with `#` starting a
comment that runs to the end of the line. Inside parentheses and brackets a
newline is whitespace. The syntax is a subset of Julia's; its expressions
are those [above](@ref "Expressions") with `atom` replaced:

```
program   = {statement} sum
statement = name "=" sum
atom      = integer | name | call | vector | "(" sum ")"
call      = name "(" sum {"," sum} ")" | "R.(" sum ")"
vector    = "[" sum {"," sum} "]"
```

`sum`, `product`, `frac` and `power` are as above. The result is the last
expression. The argument ``f`` is `tt`; it may contain names other than the
type's parameters, which are constants for the sum. A name is `tt`, a name
assigned by an earlier statement, or a name of the table; assigned names
shadow the table's names. The operators act on values as on polynomials; in
the tables `//` only joins integers, `^` only raises the variable to an
integer power, and one factor of every product is a rational number or a
polynomial. The calls are:

- `nesum(x, v, lo, hi)`: ``\sum_{v = lo}^{hi} x``, where `v` is a name of
  the table, `lo` a nonnegative integer and `hi` a polynomial;
- `evaluate(x, [v1, ..., vk], [e1, ..., ek])`: `x` with the names `vi`
  replaced by the polynomials `ei` simultaneously;
- `R.(v)` for a vector `v`: `v` with its entries as polynomials, which
  changes nothing mathematically;
- `h(x)`: the helper `h` applied to `x`, i.e. its program with `tt` bound
  to `x`. Class sums call `class_helpers`, character sums `char_helpers`.
  Helpers may call each other.

For example, class type 3 of `GL2` has the parameters `i`, `j` modulo
``q - 1`` with ``i \not\equiv j``, and ``(i, j)`` and ``(j, i)`` describe
the same class. Its sum

```
s1 = evaluate(tt, [j], [i])
s2 = nesum(tt, j, 0, q - 2)
s1 = s2 - s1
s2 = nesum(s1, i, 0, q - 2)
1//2 * s2
```

sums over all ordered pairs with ``j \ne i`` and halves the result: one term
per unordered pair. Its class sum of 1 is ``(q - 1)(q - 2)/2``.

A reader that evaluates a table at a fixed ``q`` can compute `nesum` by
adding up the terms. The Julia package keeps ``q`` symbolic: a term not
depending on `v` is multiplied by ``hi + 1``, and for the others it computes
``\sum_{v=0}^{hi} c\,\zeta^{(a v + b)/d}`` as a geometric sum,
``c\,\zeta^{b/d} (\zeta^{a(hi+1)/d} - 1)/(\zeta^{a/d} - 1)``. This needs
the exponent to be at most linear in `v` and the coefficient ``c`` not to
depend on `v`, which holds in all tables. The formula fails where ``a/d``
is an integer; the result records these parameter values as its
exceptions.

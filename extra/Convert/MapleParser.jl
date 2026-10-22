# Parser for the Maple files of CHEVIE3, the generator of the generic character
# tables in `data`. It covers the subset of Maple those files use:
#
#   statement  := expr [':=' expr] (';' | ':')
#   expr       := sum [('=' | '..') sum]
#   sum        := product (('+' | '-') product)*
#   product    := unary (('*' | '/') unary)*
#   unary      := '-'? power
#   power      := postfix ('^' unary)?
#   postfix    := primary ('(' args ')' | '[' args ']' | '.' primary)*
#   primary    := integer | name | `string` | '(' expr ')' | '[' args ']'
#                 | '{' args '}' | proc
#   proc       := 'proc' '(' names ')' ['local' names ';'] statement* 'end'
#
# Layout is irrelevant: CHEVIE3 wraps lines at 78 columns, in the middle of
# identifiers and numbers, and puts the ':' terminating a `proc` on a line of
# its own, which is where reading the files as raw text comes apart.

module MapleParser

export MExpr, MNum, MName, MStr, MCall, MIndex, MList, MSet, MSeq, MEq, MRange,
  MBin, MNeg, MProc, MStmt, parse_maple_file, parse_maple

abstract type MExpr end

struct MNum <: MExpr
  value::BigInt
end

struct MName <: MExpr
  name::String
end

# A `backquoted` Maple name; used for labels and the lines of an Information block.
struct MStr <: MExpr
  text::String
end

struct MCall <: MExpr
  head::MExpr
  args::Vector{MExpr}
end

struct MIndex <: MExpr
  head::MExpr
  args::Vector{MExpr}
end

struct MList <: MExpr
  items::Vector{MExpr}
end

struct MSet <: MExpr
  items::Vector{MExpr}
end

# A parenthesized expression sequence, as in the keys `(3, 1, 2)` of a Maple table.
struct MSeq <: MExpr
  items::Vector{MExpr}
end

struct MEq <: MExpr
  lhs::MExpr
  rhs::MExpr
end

struct MRange <: MExpr
  from::MExpr
  to::MExpr
end

struct MBin <: MExpr
  op::Symbol  # :+ :- :* :/ :^ :concat
  left::MExpr
  right::MExpr
end

struct MNeg <: MExpr
  arg::MExpr
end

# An assignment, or a bare expression as the result of a `proc`.
struct MStmt
  target::Union{MExpr,Nothing}
  value::MExpr
end

struct MProc <: MExpr
  args::Vector{String}
  locals::Vector{String}
  body::Vector{MStmt}
end

## Tokenizer

struct Token
  kind::Symbol  # :num :name :str :op :eof
  text::String
  pos::Int  # for error messages
end

const OPERATORS = [":=", "..", "+", "-", "*", "/", "^", "=", "(", ")", "[", "]",
  "{", "}", ",", ";", ":", "."]

function tokenize(text::AbstractString)
  s = String(text)
  tokens = Token[]
  i = firstindex(s)
  n = lastindex(s)
  while i <= n
    c = s[i]
    if isspace(c)
      i = nextind(s, i)
    elseif c == '#'  # comment up to the end of the line
      j = something(findnext('\n', s, i), n + 1)
      i = min(j, n + 1)
    elseif c == '`'
      buf = IOBuffer()
      j = nextind(s, i)
      while true
        k = findnext('`', s, j)
        k === nothing && error("unterminated backquoted name at $i")
        print(buf, s[j:prevind(s, k)])
        j = nextind(s, k)
        # A doubled backquote stands for a literal one and does not end the name.
        if j <= n && s[j] == '`'
          print(buf, '`')
          j = nextind(s, j)
        else
          break
        end
      end
      push!(tokens, Token(:str, String(take!(buf)), i))
      i = j
    elseif c == '\''  # unevaluated name, as in `q := 'q'`
      j = findnext('\'', s, nextind(s, i))
      j === nothing && error("unterminated quoted name at $i")
      push!(tokens, Token(:name, s[nextind(s, i):prevind(s, j)], i))
      i = nextind(s, j)
    elseif isdigit(c)
      j = i
      while j <= n && isdigit(s[j])
        j = nextind(s, j)
      end
      push!(tokens, Token(:num, s[i:prevind(s, j)], i))
      i = j
    elseif isletter(c) || c == '_'
      j = i
      while j <= n && (isletter(s[j]) || isdigit(s[j]) || s[j] == '_')
        j = nextind(s, j)
      end
      push!(tokens, Token(:name, s[i:prevind(s, j)], i))
      i = j
    else
      op = nothing
      for cand in OPERATORS  # ":=" and ".." come first, so they win over ":" and "."
        if startswith(SubString(s, i), cand)
          op = cand
          break
        end
      end
      op === nothing && error("unexpected character '$c' at $i")
      push!(tokens, Token(:op, op, i))
      i += ncodeunits(op)
    end
  end
  push!(tokens, Token(:eof, "", n + 1))
  return tokens
end

## Parser

mutable struct State
  tokens::Vector{Token}
  pos::Int
end

peek(st::State) = st.tokens[st.pos]
advance!(st::State) = (t=st.tokens[st.pos]; st.pos += 1; t)

isop(t::Token, text::String) = t.kind === :op && t.text == text
iskeyword(t::Token, word::String) = t.kind === :name && t.text == word

function expect!(st::State, text::String)
  t = advance!(st)
  isop(t, text) || error("expected '$text' but found '$(t.text)' at $(t.pos)")
  return t
end

function parse_args!(st::State, closing::String)
  args = MExpr[]
  if isop(peek(st), closing)
    advance!(st)
    return args
  end
  while true
    push!(args, parse_expr!(st))
    t = advance!(st)
    isop(t, ",") && continue
    isop(t, closing) && break
    error("expected ',' or '$closing' but found '$(t.text)' at $(t.pos)")
  end
  return args
end

function parse_names!(st::State)
  names = String[]
  while true
    t = advance!(st)
    t.kind === :name || error("expected a name but found '$(t.text)' at $(t.pos)")
    push!(names, t.text)
    isop(peek(st), ",") || break
    advance!(st)
  end
  return names
end

function parse_proc!(st::State)
  expect!(st, "(")
  args = isop(peek(st), ")") ? String[] : parse_names!(st)
  expect!(st, ")")
  locals = String[]
  while iskeyword(peek(st), "local") || iskeyword(peek(st), "global")
    advance!(st)
    append!(locals, parse_names!(st))
    expect!(st, ";")
  end
  body = MStmt[]
  while !iskeyword(peek(st), "end")
    push!(body, parse_statement!(st; terminator_optional=true))
  end
  advance!(st)  # 'end'
  return MProc(args, locals, body)
end

function parse_primary!(st::State)
  t = advance!(st)
  if t.kind === :num
    return MNum(parse(BigInt, t.text))
  elseif t.kind === :str
    return MStr(t.text)
  elseif t.kind === :name
    t.text == "proc" && return parse_proc!(st)
    return MName(t.text)
  elseif isop(t, "(")
    e = parse_expr!(st)
    if isop(peek(st), ",")
      items = MExpr[e]
      while isop(peek(st), ",")
        advance!(st)
        push!(items, parse_expr!(st))
      end
      expect!(st, ")")
      return MSeq(items)
    end
    expect!(st, ")")
    return e
  elseif isop(t, "[")
    return MList(parse_args!(st, "]"))
  elseif isop(t, "{")
    return MSet(parse_args!(st, "}"))
  end
  return error("unexpected '$(t.text)' at $(t.pos)")
end

function parse_postfix!(st::State)
  e = parse_primary!(st)
  while true
    t = peek(st)
    if isop(t, "(")
      advance!(st)
      e = MCall(e, parse_args!(st, ")"))
    elseif isop(t, "[")
      advance!(st)
      e = MIndex(e, parse_args!(st, "]"))
    elseif isop(t, ".")  # name concatenation, as in `iI.k.class`
      advance!(st)
      e = MBin(:concat, e, parse_primary!(st))
    else
      return e
    end
  end
end

function parse_power!(st::State)
  base = parse_postfix!(st)
  isop(peek(st), "^") || return base
  advance!(st)
  return MBin(:^, base, parse_unary!(st))
end

function parse_unary!(st::State)
  if isop(peek(st), "-")
    advance!(st)
    return MNeg(parse_unary!(st))
  elseif isop(peek(st), "+")
    advance!(st)
    return parse_unary!(st)
  end
  return parse_power!(st)
end

function parse_product!(st::State)
  e = parse_unary!(st)
  while isop(peek(st), "*") || isop(peek(st), "/")
    op = Symbol(advance!(st).text)
    e = MBin(op, e, parse_unary!(st))
  end
  return e
end

function parse_sum!(st::State)
  e = parse_product!(st)
  while isop(peek(st), "+") || isop(peek(st), "-")
    op = Symbol(advance!(st).text)
    e = MBin(op, e, parse_product!(st))
  end
  return e
end

function parse_expr!(st::State)
  e = parse_sum!(st)
  if isop(peek(st), "=")
    advance!(st)
    return MEq(e, parse_expr!(st))  # the right hand side may be a range: `iI1 = 1 .. q-1`
  elseif isop(peek(st), "..")
    advance!(st)
    return MRange(e, parse_sum!(st))
  end
  return e
end

function parse_statement!(st::State; terminator_optional::Bool=false)
  lhs = parse_expr!(st)
  target = nothing
  value = lhs
  if isop(peek(st), ":=")
    advance!(st)
    target = lhs
    value = parse_expr!(st)
  end
  if isop(peek(st), ";") || isop(peek(st), ":")
    advance!(st)
  elseif !terminator_optional && peek(st).kind !== :eof
    error("expected a statement terminator but found '$(peek(st).text)' at $(peek(st).pos)")
  end
  return MStmt(target, value)
end

"""
    parse_maple(text::AbstractString) -> Vector{MStmt}

Parse Maple source into a list of statements.
"""
function parse_maple(text::AbstractString)
  st = State(tokenize(text), 1)
  stmts = MStmt[]
  while peek(st).kind !== :eof
    push!(stmts, parse_statement!(st))
  end
  return stmts
end

"""
    parse_maple_file(path::AbstractString) -> Vector{MStmt}

Parse a CHEVIE3 Maple table. The files are ISO-8859-1 (they spell out
"Universit\"at" and the like in their headers), which `read` would otherwise
reject as invalid UTF-8.
"""
function parse_maple_file(path::AbstractString)
  bytes = read(path)
  text = String(map(Char, bytes))  # ISO-8859-1 to UTF-8
  return parse_maple(text)
end

end  # module

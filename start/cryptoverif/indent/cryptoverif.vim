" Name:        CryptoVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetCryptoVerifIndent()
setlocal indentkeys=o,O,=else,0=*),0),0],0}
setlocal nolisp
setlocal nosmartindent

let b:undo_indent = "setl indentkeys< indentexpr< lisp< smartindent<"

if exists('*shiftwidth')
  fun! s:shiftwidth()
    return shiftwidth()
  endf

else
  fun! s:shiftwidth()
    return &sw
  endf
endif

if exists("*GetCryptoVerifIndent")
  finish
endif

fun! s:is_comment(l)
  return synIDattr(synID(a:l, match(getline(a:l), '\S') + 1, 1), "name") =~# "Comment"
endf

fun! s:is_macro(lnum)
  return empty(synstack(a:lnum, 1)) ? 0 : (synIDattr(synstack(a:lnum, 1)[0], "name") == "cryptoverifMacroDef")
endf

fun! s:reset_indent(lnum)
  return (s:is_macro(v:lnum) ? s:shiftwidth() : 0)
endf

fun! GetCryptoVerifIndent()
  let l:this = getline(v:lnum)
  let l:ind = indent(v:lnum)

  " Get previous non-blank line
  let l:prevlnum = prevnonblank(v:lnum - 1)
  if l:prevlnum <= 0
    return l:ind
  endif

  let l:prev = getline(l:prevlnum)
  let l:prevind = indent(l:prevlnum)

  " Indentation rules for comments
  if s:is_comment(l:prevlnum)
    " If the previous line was a one-line comment, keep the same indentation
    if l:prev =~# '^\s*(\*.*\*)\s*$'
      return l:prevind
    endif
    " Increase indentation after opening a multi-line comment
    if l:prev =~# '^\s*(\*' && l:prev !~# '\*)\s*$'
      return l:prevind + (l:this =~ '^\s*\*' ? 1 : s:shiftwidth())
    endif
    " Otherwise, decrease indentation after a closed comment
    if l:prev =~# '\*)\s*$'
      return l:prevind - (l:prev =~# '^\s*\*' ? 1 : s:shiftwidth())
    endif
    return -1
  endif

  " Strip comments
  let l:this = substitute(l:this, '(\*.\{-}\*)', '', 'g')
  let l:prev = substitute(l:prev, '(\*.\{-}\*)', '', 'g')

  " Reset indentation after a line ending with a dot
  if l:prevind > 0 && l:prev =~# '\.\s*$'
    return s:reset_indent(v:lnum)
  endif

  " Unindent `else` at the start of a line.
  if l:this =~# '^\s*else'
    return l:prevind - s:shiftwidth()
  endif

  " Indent when the previous line ends with certain keywords or symbols
  if l:prev =~# '\%(=\|\<else\|\<then\)\s*$'
    return l:prevind + s:shiftwidth()
  endif

  " Indent when the previous line begins with certain keywords
  " and does not end with a dot.
  if l:prev =~# '^\s*\%(collision\|equation\|equiv\|forall\|fun\|\<query\>.*event\>\|process\|query\|reduc\)[^.]*$'
    return l:prevind + s:shiftwidth()
  endif

  " Indent lines with an unmatched open parenthesis.
  if l:prev =~# '\%(([^)]*\|\[[^\]]*\|{[^}]*\)$'
    return l:prevind + s:shiftwidth()
  endif

  " Decrease indent in lines with an unmatched closed parenthesis.
  if l:this =~# '^\%([^(]*)\|[^\[]*\]\|[^{]*}\)'
    return l:prevind - s:shiftwidth()
  endif

  return l:prevind
endf


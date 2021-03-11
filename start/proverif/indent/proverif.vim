" Name:        ProVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetProverifIndent()
setlocal indentkeys=o,O,=else,=otherwise,0=*),0),0],0}
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

fun! s:is_macro(l)
  return empty(synstack(a:l, 1)) ? 0 : synIDattr(synstack(a:l, 1)[0], "name") =~# "Macro"
endf

fun! s:is_comment(l)
  return synIDattr(synID(a:l, match(getline(a:l), '\S') + 1, 1), "name") =~# "Comment"
endf

fun! s:find_pair(pstart, pmid, pend)
  call cursor(v:lnum, 1)
  call search(a:pend, 'Wc')
  return indent(searchpair(a:pstart, a:pmid, a:pend, 'bWn', 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'))
endf

fun! s:find_comment_pair(l)
  call cursor(a:l, 1)
  call search('\*)', 'Wc')
  return indent(searchpair('(\*', '', '\*)', 'bWn'))
endf

fun! s:reset_indent(lnum)
  return (s:is_macro(v:lnum) ? s:shiftwidth() : 0)
endf

if exists("*GetProverifIndent")
  finish
endif

fun! GetProverifIndent()
  let l:prevlnum = prevnonblank(v:lnum - 1)

  if l:prevlnum <= 0
    return l:ind
  endif

  let l:this = substitute(getline(v:lnum), '(\*.\{-}\*)', '', 'g')
  let l:prev = substitute(getline(l:prevlnum), '(\*.\{-}\*)', '', 'g')
  let l:prevind = indent(l:prevlnum)

  if l:prev =~# '(\*'
    " Indent after opening a multi-line comment
    return l:this =~ '^\s*\*' ? l:prevind + 1 : -1
  elseif l:prev =~# '\*)'
    " Decrease indentation after a closed comment
    return (l:prev =~# '^\s*\*' ? l:prevind - 1 : s:find_comment_pair(l:prevlnum))
  elseif s:is_comment(l:prevlnum) && getline(l:prevlnum) ==# l:prev " Prev. line is inside comment
    if l:this =~# '^\s*\*)'
      return s:find_comment_pair(v:lnum) + 1
    elseif l:prev =~# '^\s*\*'
      return l:prevind
    else
      return -1 " Do not touch indentation inside a multiline comment
    endif
  endif

  " Reset indentation after a line ending with a dot
  if l:prevind > 0 && l:prev =~# '\.\s*$'
    return s:reset_indent(v:lnum)
  endif

  if l:this =~# '\<else\>'
    return l:prev =~# '^\s*)\s*$'
          \ ? l:prevind - s:shiftwidth()
          \ : s:find_pair('\<\%(in\|then\)\>', '', '\<else\>')
  endif

  if l:this =~# '\<otherwise\>'
    return s:find_pair('\<\%(reduc\|otherwise\)\>', '', '\<otherwise\>')
  endif

  " Align a closed parenthesis with a matching open parenthesis.
  if l:this =~# '^\s*)'
    return s:find_pair('(', '', ')')
  elseif l:this =~# '^\s*\]'
    return s:find_pair('\[', '', '\]')
  elseif l:this =~# '^\s*}'
    return s:find_pair('{', '', '}')
  endif

  " Match indentation of `else` at the start of a line with previous
  " expression. For instance:
  "
  "     if 1 then
  "       ...
  "     else (* matches if *)
  "
  "     if 1 then
  "       let x = ... in
  "       ...
  "       else (* matches let *)
  "
  " Indent when the previous line ends with certain keywords or symbols
  if l:prev =~# '\%(\<else\|\<then\|=\)\s*$'
    return l:prevind + s:shiftwidth()
  endif

  " Indent when the previous line begins with certain keywords and does not
  " end with a dot.
  if l:prev =~# '^\s*\%(equation\|equiv\|forall\|fun\|process\|query\|reduc\|otherwise\|axiom\|lemma\|restriction\)[^.]*$'
    return l:prevind + s:shiftwidth()
  endif

  " Indent lines with an unmatched open parenthesis.
  if l:prev =~# '\%(([^)]*\|\[[^\]]*\|{[^}]*\)$'
    return l:prevind + s:shiftwidth()
  endif

  return l:prevind
endf


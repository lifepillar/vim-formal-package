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

if exists("*GetProverifIndent")
  finish
endif

if exists('*shiftwidth')
  fun! s:shiftwidth()
    return shiftwidth()
  endf
else
  fun! s:shiftwidth()
    return &sw
  endf
endif

fun! s:is_comment(l)
  return synIDattr(synID(a:l, match(getline(a:l), '\S') + 1, 1), "name") =~# "Comment"
endf

fun! s:is_macro(l)
  return empty(synstack(a:l, 1)) ? 0 : synIDattr(synstack(a:l, 1)[0], "name") =~# "Macro"
endf

fun! s:find_pair(pstart, pmid, pend)
  call cursor(v:lnum, 1)
  call search(a:pend, 'Wc')
  return indent(searchpair(a:pstart, a:pmid, a:pend, 'bWn', 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'))
endf

fun! s:find_comment_start(l)
  call cursor(a:l, 1)
  return searchpairpos('(\*', '', '\*)', 'bWn')[1]
endf

fun! s:reset_indent(lnum)
  return (s:is_macro(v:lnum) ? s:shiftwidth() : 0)
endf

fun! s:prevnoncomment(l)
  let l:prevlnum = prevnonblank(a:l)
  while l:prevlnum > 0 && s:is_comment(l:prevlnum)
    let l:prevlnum = prevnonblank(l:prevlnum - 1)
  endwhile
  return l:prevlnum
endf

fun! GetProverifIndent()
  if s:is_comment(v:lnum) && getline(v:lnum) !~# '^\s*(\*'
    " Continuation of a comment
    return s:find_comment_start(v:lnum)
  endif

  let l:prevlnum = s:prevnoncomment(v:lnum - 1)

  if l:prevlnum <= 0
    return l:ind
  endif

  let l:this = substitute(getline(v:lnum), '(\*.\{-}\*)', '', 'g')
  let l:prev = substitute(getline(l:prevlnum), '(\*.\{-}\*)', '', 'g')
  let l:prevind = indent(l:prevlnum)

  " Always reset indentation after a line ending with a dot
  if l:prevind > 0 && l:prev =~# '\.\s*$'
    return s:reset_indent(v:lnum)
  endif

  if l:this =~# '\<else\>'
    return l:prev =~# '^\s*)\s*$'
          \ ? l:prevind - s:shiftwidth()
          \ : s:find_pair('\<in\s*\%((\*.*\)\=$\|\<then\>', '', '\<else\>')
  elseif l:this =~# '\<otherwise\>'
    return s:find_pair('\<\%(reduc\|otherwise\)\>', '', '\<otherwise\>')
  elseif l:this =~# '^\s*)'
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
  elseif l:prev =~# '^\s*\%(equation\|equiv\|forall\|fun\|process\|query\|reduc\|otherwise\|axiom\|lemma\|restriction\)[^.]*$'
    return l:prevind + s:shiftwidth()
  elseif l:prev =~# '\%(([^)]*\|\[[^\]]*\|{[^}]*\)$'
    " Indent lines with an unmatched open parenthesis
    return l:prevind + s:shiftwidth()
  endif

  return l:prevind
endf


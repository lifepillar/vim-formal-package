" Name:        Tamarin
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetTamarinIndent()
setlocal indentkeys=o,O
setlocal indentkeys+=rule,=begin,=end,=lemma,=let,=in,=builtins,=functions,=equations
setlocal indentkeys+=0=-->,0=--[,0\",0)
setlocal nolisp
setlocal nosmartindent

let b:undo_indent = "setl indentexpr< indentkeys< lisp< smartindent<"

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

fun! s:find_pair(pstart, pmid, pend)
  call cursor(v:lnum, 1)
  call search(a:pend, 'Wc')
  return indent(searchpair(a:pstart, a:pmid, a:pend, 'bWn', 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'))
endf

fun! s:find_comment_pair(l)
  call cursor(a:l, 1)
  call search('\*\/', 'Wc')
  return indent(searchpair('\/\*', '', '\*\/', 'bWn'))
endf

fun! s:count(l, expr)
  let l:c = 0
  let l:p = -1
  while 1
    let l:p = match(getline(a:l), a:expr, l:p + 1)
    if l:p == -1
      break
    endif
    let l:c += 1
  endwhile
  return l:c
endf

" if exists("*GetTamarinIndent")
"   finish
" endif

fun! GetTamarinIndent()
  let l:prevlnum = prevnonblank(v:lnum - 1)
  if l:prevlnum <= 0
    return -1
  endif

  let l:this = substitute(getline(v:lnum), '\%(\/\*.\{-}\*\/\)\|\/\/.*$', '', 'g')
  let l:prev = substitute(getline(l:prevlnum), '\/\*.\{-}\*\/\|\/\/.*$', '', 'g')
  let l:ind = indent(v:lnum)
  let l:prevind = indent(l:prevlnum)

  if l:prev =~# '/\*'
    " Indent after opening a multi-line comment
    return l:this =~ '^\s*\*' ? l:prevind + 1 : -1
  elseif l:prev =~# '\*/'
    " Decrease indentation after a closed comment
    return (l:prev =~# '^\s*\*' ? l:prevind - 1 : s:find_comment_pair(l:prevlnum))
  elseif s:is_comment(l:prevlnum) && getline(l:prevlnum) ==# l:prev " Prev. line is inside comment
    if l:this =~# '^\s*\*/'
      return s:find_comment_pair(v:lnum) + (l:prev =~# '^\s*\*' ? 1 : 0)
    elseif l:prev =~# '^\s*\*'
      return l:prevind
    else
      return -1 " Do not touch indentation inside a multiline comment
    endif
  endif

  if l:this =~# '\<\%(lemma\|rule\|functions\|equations\)\>'
    return s:shiftwidth()
  elseif l:this =~# '^\s*--[>\[]'
    return l:prevind - s:shiftwidth()
  endif

  if l:this =~# '\<in\>'
    return s:find_pair('\<let\>', '', '\<in\>')
  endif

  if l:this =~# '^\s*)'
    return s:find_pair('(', '', ')')
  endif

  if l:this =~# '"'
    if l:prev =~# ':\s*$'
      return l:prevind + s:shiftwidth()
    else
      return l:prevind - s:shiftwidth()
    endif
  endif

  if l:this =~# '\<\(%begin\|end\)\>'
    return 0
  endif

  if l:prev =~# '\<\%(begin\|let\|in\)\>'
    return l:prevind + s:shiftwidth()
  endif

  if l:prev =~# 'rule.*:\s*$'
    return l:prevind + s:shiftwidth() + (l:this =~# '\<let\>' ? 0 : s:shiftwidth())
  endif

  if l:prev =~# '[.:=]\s*$'
    return l:prevind + s:shiftwidth()
  endif

  if l:prev =~# '^\s*\%(--[>\[]\|"\)'
    return l:prevind + s:shiftwidth()
  endif

  " Indent lines with an unmatched open parenthesis.
  if s:count(l:prevlnum, '(') > s:count(l:prevlnum, ')')
    return l:prevind + s:shiftwidth()
  endif

  return l:prevind
endf


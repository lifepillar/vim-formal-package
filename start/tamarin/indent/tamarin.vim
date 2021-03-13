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
setlocal indentkeys+==rule,=begin,=end,=lemma,=let,=in,=builtins,=functions,=equations,=restriction
setlocal indentkeys+=0=-->,0=--[,0\",0),0]
setlocal nolisp
setlocal nosmartindent

let b:undo_indent = "setl indentexpr< indentkeys< lisp< smartindent<"

" if exists("*GetTamarinIndent")
"   finish
" endif

if exists('*shiftwidth')
  fun! s:shiftwidth()
    return shiftwidth()
  endf
else
  fun! s:shiftwidth()
    return &sw
  endf
endif

" We assume that, if a line starts with a comment, the whole line is
" a comment, i.e., we assume that the user does not use weird style, such as:
"
"     /* ... */ rule Foo:
"
fun! s:is_comment(l)
  return synIDattr(synID(a:l, match(getline(a:l), '\S') + 1, 1), "name") =~# "Comment"
endf

fun! s:find_pair(pstart, pmid, pend)
  call cursor(v:lnum, 1)
  call search(a:pend, 'Wc')
  return indent(searchpair(a:pstart, a:pmid, a:pend, 'bWn', 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'))
endf

fun! s:find_comment_start(l)
  call cursor(a:l, 1)
  return searchpairpos('/\*', '\*', '\*/', 'bWn')[1] - 1
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

fun! s:prevnoncomment(l)
   let l:prevlnum = prevnonblank(a:l)
   while l:prevlnum > 0 && s:is_comment(l:prevlnum)
      let l:prevlnum = prevnonblank(l:prevlnum - 1)
   endwhile
   return l:prevlnum
endf

fun! GetTamarinIndent()
  if s:is_comment(v:lnum)
    return getline(v:lnum) =~# '^\s*/\*'
          \ ? indent(s:prevnoncomment(v:lnum - 1))
          \ : s:find_comment_start(v:lnum)
  endif

  let l:prevlnum = s:prevnoncomment(v:lnum - 1)

  if l:prevlnum <= 0
    return -1
  endif

  let l:prevind = indent(l:prevlnum)
  let l:this = substitute(getline(v:lnum), '\%(\/\*.\{-}\*\/\)\|\/\/.*$', '', 'g')

  if l:this =~# '^\s*\<\%(lemma\|rule\|functions\|equations\|restriction\)\>'
    return s:shiftwidth()
  elseif l:this =~# '^\s*--[>\[]'
    return l:prevind - s:shiftwidth()
  elseif l:this =~# '^\s*in\s*$'
    return s:find_pair('\<let\>', '', '\<in\>')
  elseif l:this =~# '^\s*)'
    return s:find_pair('(', '', ')')
  elseif l:this =~# '^\s*\]'
    return s:find_pair('\[', '', '\]')
  elseif l:this =~# '^\s*"'
    return getline(s:prevnoncomment(v:lnum - 1)) =~# '^\s*\%(exists-trace\|all-traces\>\)\|\%(:\s*$\)'
          \ ? l:prevind + s:shiftwidth()
          \ : s:find_pair('"', '', '"')
  elseif l:this =~# '\<\(%begin\|end\)\>'
    return 0
  endif

  let l:prev = substitute(getline(l:prevlnum), '\/\*.\{-}\*\/\|\/\/.*$', '', 'g')

  if l:prev =~# '^\s*\<\%(begin\|let\)\>'
    return l:prevind + s:shiftwidth()
  elseif l:prev =~# '^\s*in\s*$'
    return l:prevind + s:shiftwidth()
  elseif l:prev =~# 'rule.*:\s*\%(/\*.*\)\=$'
    return l:prevind + s:shiftwidth() + (l:this =~# '\<let\>' ? 0 : s:shiftwidth())
  elseif l:prev =~# '[.:=]\s*\%(/\*.*\)\=$'
    return l:prevind + s:shiftwidth()
  elseif l:prev =~# '^\s*\%(--[>\[]\|"\)'
    return l:prevind + s:shiftwidth()
  elseif s:count(l:prevlnum, '(') > s:count(l:prevlnum, ')')
    " Indent lines with an unmatched open parenthesis
    return l:prevind + s:shiftwidth()
  elseif s:count(l:prevlnum, '[') > s:count(l:prevlnum, ']')
    return l:prevind + s:shiftwidth()
  endif

  return l:prevind
endf


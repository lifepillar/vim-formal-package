" Name:        Verifpal
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetVerifpalIndent()
setlocal indentkeys+==]

let b:undo_indent = "setl indentkeys< indentexpr<"

if exists('*shiftwidth')
  fun! s:shiftwidth()
    return shiftwidth()
  endf

else
  fun! s:shiftwidth()
    return &sw
  endf
endif

" if exists("*GetVerifpalIndent")
"   finish
" endif

fun! s:is_comment(l)
  return synIDattr(
        \ synID(a:l,
        \     match(getline(a:l), '\S')+1, 0)
        \ , "name")
        \ =~# "Comment"
endf

fun! GetVerifpalIndent()
  let l:this = substitute(getline(v:lnum), '//.*$', '', '')
  let l:ind = indent(v:lnum)

  " Get previous non-blank line
  let l:prevlnum = prevnonblank(v:lnum - 1)
  if l:prevlnum <= 0
    return l:ind
  endif

  let l:prev = substitute(getline(l:prevlnum), '//.*$', '', '')
  let l:prevind = indent(l:prevlnum)

  " Indent when the previous line has an unmatched open bracket
  if l:prev =~# '\[[^\]]*$'
    return l:prevind + s:shiftwidth()
  endif

  " Decrease indentation when the current line has an unmatched closed bracket
  if l:this =~# '^[^\[]*\]'
    return l:prevind - s:shiftwidth()
  endif

  return l:prevind
endf


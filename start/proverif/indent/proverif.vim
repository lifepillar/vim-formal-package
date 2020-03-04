" Name:        ProVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetProverifIndent()
setlocal indentkeys+==else,=let,=process,=then,=*),==

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

" if exists("*GetProverifIndent")
"   finish
" endif

fun! s:is_comment(l)
  return synIDattr(
        \ synID(a:l,
        \     match(getline(a:l), '\S')+1, 0)
        \ , "name")
        \ =~# "Comment"
endf

fun! GetProverifIndent()
  let l:ind = indent(v:lnum)

  " Get previous non-blank line
  let l:prevlnum = prevnonblank(v:lnum - 1)
  if l:prevlnum <= 0
    return l:ind
  endif

  let l:prevind = indent(l:prevlnum)

  " Indentation rules for comments
  if s:is_comment(l:prevlnum) == 1
    " Increase indentation after opening a multi-line comment
    if getline(l:prevlnum) =~# '^\s*(\*' && getline(l:prevlnum) !~# '\*)\s*$'
      return l:prevind + s:shiftwidth()
    endif
    " Decrease indentation when closing a multi-line comment
    if getline(v:lnum) =~# '^\s*\*)'
      return l:prevind - s:shiftwidth()
    endif
    " Otherwise, return -1 to tell Vim to use the formatoptions setting to
    " determine the indent to use But only if the next line is blank.  This
    " would be true if the user is typing, but it would not be true if the
    " user is reindenting the file
    if getline(v:lnum) =~# '^\s*$'
      return -1
    endif
  endif

  " Unindent `else`
  if getline(v:lnum) =~# '\<else\s*$'
    return l:prevind - s:shiftwidth()
  endif

  " Unindent after a line ending with a dot.
  if l:prevind > 0 && getline(l:prevlnum) =~# '\.\s*$'
    return l:prevind - s:shiftwidth()
  endif

  " Indent after a line containing only `process` or ending with `=`, `else` or `then`.
  if getline(l:prevlnum) =~# '^\s*\%(process\)\s*\_$\|\%(=\|\<else\|\<then\)\s*$'
    return l:prevind + s:shiftwidth()
  endif

  return l:prevind
endf


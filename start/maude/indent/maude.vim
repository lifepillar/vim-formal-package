" Maude indent file
" Maintainer: Lifepillar

if exists("b:did_indent")
  finish
endif
" let b:did_indent = 1

setlocal indentexpr=GetMaudeIndent()
setlocal indentkeys+==endfm,=endm,=endom,=endsm,=endth,=endfth,=endsth,=endv,=)***

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

" if exists("*GetMaudeIndent")
"   finish
" endif

fun! s:is_comment(l)
  return synIDattr(
        \ synID(a:l,
        \     match(getline(a:l), '\S')+1, 0)
        \ , "name")
        \ =~# "Comment"
endf

fun! GetMaudeIndent()
  let l:ind = indent(v:lnum)

  " Get previous non-blank line
  let l:prevlnum = prevnonblank(v:lnum - 1)
  if l:prevlnum <= 0
    return l:ind
  endif

  let l:prevind = indent(l:prevlnum)

  if s:is_comment(l:prevlnum) == 1
    " Increase indentation after opening a multi-line comment
    if getline(l:prevlnum) =~# '^\s*\*\{3}('
      return l:prevind + s:shiftwidth()
    endif
    " Decrease indentation when closing a multi-line comment
    if getline(v:lnum) =~# '^)$\|)\*\{3}'
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

  if getline(v:lnum) =~# '^\s*\%(end\%(\%([ofs]\=m\)\|v\|[fs]\=th\)\)\>'
    return l:prevind - s:shiftwidth()
  endif

  if getline(l:prevlnum) =~# '\<\%([fos]\=mod\|[fs]\=th\|view\)\>'
    return l:prevind + s:shiftwidth()
  endif

  return l:ind
endf


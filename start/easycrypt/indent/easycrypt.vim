" Name:        EasyCrypt
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetEasyCryptIndent()
setlocal indentkeys=o,O,=else,=qed.,0),0],0}
setlocal nolisp
setlocal nosmartindent

let b:undo_indent = "setl indentkeys< indentexpr< lisp< smartindent<"

" if exists("*GetEasyCryptIndent")
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

fun! s:is_comment(l)
  return synIDattr(synID(a:l, match(getline(a:l), '\S') + 1, 1), "name") =~# "Comment"
endf

fun! s:find_pair(pstart, pmid, pend)
  call cursor(v:lnum, 1)
  return indent(searchpair(a:pstart, a:pmid, a:pend, 'bWn', 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'))
endf

fun! s:find_comment_start(l)
  call cursor(a:l, 1)
  return searchpairpos('(\*', '\*', '\*)', 'bWn')[1] - 1
endf

fun! s:count(l, expr)
  return str2nr(matchstr(execute(a:l .. 's/' .. a:expr .. '//egn'), '\d\+'))
endf

fun! s:prevnoncomment(l)
  let l:prevlnum = prevnonblank(a:l)
  while l:prevlnum > 0 && s:is_comment(l:prevlnum)
    let l:prevlnum = prevnonblank(l:prevlnum - 1)
  endwhile
  return l:prevlnum
endf

fun! GetEasyCryptIndent()
  if s:is_comment(v:lnum) && getline(v:lnum) !~# '^\s*(\*'
    return s:find_comment_start(v:lnum)
  endif

  let l:prevlnum = s:prevnoncomment(v:lnum - 1)

  if l:prevlnum <= 0
    return -1
  endif

  let l:prevind = indent(l:prevlnum)
  let l:this = substitute(getline(v:lnum), '(\*.*$', '', '')

  if l:this =~# '^\s*\<\%(proof\|qed\)\>'
    return l:prevind - s:shiftwidth()
  elseif l:this =~# '\<else\>'
    return s:find_pair('\<if\>', '\<else\|elif\>', '\<else\>')
  elseif l:this =~# '^\s*}'
    return s:find_pair('{', '', '}')
  elseif l:this =~# '^\s*\]'
    return s:find_pair('\[', '', '\]')
  elseif l:this =~# '^\s*)'
    return s:find_pair('(', '', ')')
  endif

  " Indent when the previous line ends with certain keywords or symbols
  if l:prev =~# '\%(\<proof\.\|\<with\>\|:\)\s*$'
    return l:prevind + s:shiftwidth()
  endif

  if s:count(l:prevlnum, '{') > s:count(l:prevlnum, '}')
    return l:prevind + s:shiftwidth()
  elseif s:count(l:prevlnum, '(') > s:count(l:prevlnum, ')')
    return l:prevind + s:shiftwidth()
  elseif s:count(l:prevlnum, '\[') > s:count(l:prevlnum, '\]')
    return l:prevind + s:shiftwidth()
  endif

  return l:prevind
endf


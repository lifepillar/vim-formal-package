" Name:        ProVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("current_compiler")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

" Note: commas must be escaped twice, one for the set command and one
" to avoid recognizing the comma as a separator of error formats
" (:help quickfix-valid).
let s:proverif_errorformat =
      \ '%trror: %m'
      \.',%A%>File "%f"\, line %l\, characters%\\= %c%.%#'
      \.',%Z%trror: %m'
      \.',%Z%tarning: %m'
      \.',%+IRESULT %m'

" Ignore unmatched lines
let s:proverif_errorformat .= ',%-G%.%#'

let b:proverif_errorformat = escape(s:proverif_errorformat, ' ",')
execute 'CompilerSet errorformat=' . b:proverif_errorformat
unlet s:proverif_errorformat

CompilerSet makeprg=proverif\ %

let &cpo = s:keepcpo
unlet s:keepcpo


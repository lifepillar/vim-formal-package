" Name:        CryptoVerif
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
let s:cryptoverif_errorformat =
      \ '%trror: %m'
      \.',%A%>File "%f"\, line %l\, characters%\\= %c%.%#'
      \.',%Z%trror: %m'
      \.',%Z%tarning: %m'
      \.',%+IRESULT %m'

" Ignore unmatched lines
let s:cryptoverif_errorformat .= ',%-G%.%#'

let b:cryptoverif_errorformat = escape(s:cryptoverif_errorformat, ' ",')
execute 'CompilerSet errorformat=' . b:cryptoverif_errorformat
unlet s:cryptoverif_errorformat

CompilerSet makeprg=cryptoverif\ %

let &cpo = s:keepcpo
unlet s:keepcpo

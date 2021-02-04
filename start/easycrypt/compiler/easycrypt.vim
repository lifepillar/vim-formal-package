" Name:        EasyCrypt
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("current_compiler")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

" Note: commas in the error messages must be escaped twice, one for the set
" command and one to avoid recognizing the comma as a separator of error
" formats (:help quickfix-valid).
let s:easycrypt_errorformat =
      \  '%E[critical] [%f: line %l (%c%.%#)] %m'
      \.',%E[critical] [%.%# to line %l (%c%.%#)] %m'
      \.',%Z[/]%.%#'
      \.',%Z[|]%.%#'

" Ignore unmatched lines
let s:easycrypt_errorformat .= ',%-G%.%#'

let b:easycrypt_errorformat = escape(s:easycrypt_errorformat, ' ",|')
execute 'CompilerSet errorformat=' . b:easycrypt_errorformat
unlet s:easycrypt_errorformat

CompilerSet makeprg=easycrypt\ %

let &cpo = s:keepcpo
unlet s:keepcpo

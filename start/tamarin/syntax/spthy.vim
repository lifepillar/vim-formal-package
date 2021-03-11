" Name:        Tamarin
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn sync minlines=100
syn case match
syn iskeyword @,48-57,192-255,_

syn keyword spthyBuiltin aenc fr getMessage h hashing lts multiset pb pk revealSign revealVerify sdec sdec senc sign sk true verify
syn keyword spthyBuiltin multiset signing
syn match   spthyBuiltin "\<\%(asymmetric-encryption\|diffie-hellman\|reliable-channel\|revealing-signing\|symmetric-encryption\|translation-progress\)\>"

syn match   spthyDelimiter /[:.'"{}]/
syn match   spthyOperator "[=*^@<!>]\|:>\|<:\|--|\|>+>\|>->\|->\|<-\|==>\|<=>"
syn match   spthyLogicOperator "[|&]"
syn match   spthyDelimiter "{\*\|\*}"

syn match   spthyRuleSym "-->\|--\[\|\]->\|\[\|\]"

syn match spthyIdentifier "[~$#]\k\+"

syn keyword spthyStatement assertions axiom begin builtins default_rules enable end equations functions heuristic in lemma let modulo options predicate predicates property protocol restriction rule section subsection text theory verdictfunction
syn match   spthyStatement "\<\%(all-traces\|anb-proto\|exists-trace\)\>"
syn match   spthyStatement "[a-zA-Z\-_]\@<!\d\+\."

syn keyword spthyKeyword account accounts as delete else event for if in in insert lock lookup new otherwise out parties then then unlock
syn keyword spthyLogicKeyword F T All Ex not

syn region  spthyLiteral matchgroup=spthyDelimiter start="\~\='" end="'"

syn keyword spthyAnnot contained use_induction sources reuse hide_lemma left right
syn region spthyAnnotLemma matchgroup=spthyKeyword start="\<lemma\>" skip="(\s\+\w\+\s*\[|\])" end=":" matchgroup=NONE contains=spthyAnnot

syn keyword spthyTodo contained TODO FIXME XXX
syn region  spthyComment start="/\*"  end="\*/" contains=spthyTodo
syn match   spthyLineComment      "//.*" contains=spthyTodo

hi def link spthyAnnot         Label
hi def link spthyRuleSym       PreProc
hi def link spthyBuiltin       Function
hi def link spthyComment       Comment
hi def link spthyDelimiter     Delimiter
hi def link spthyIdentifier    Identifier
hi def link spthyKeyword       Keyword
hi def link spthyLineComment   Comment
hi def link spthyLiteral       Constant
hi def link spthyLogicKeyword  String
hi def link spthyLogicOperator String
hi def link spthyOperator      Operator
hi def link spthyStatement     Statement
hi def link spthyTodo          Todo

let b:current_syntax = "spthy"

" vim: nowrap et ts=2 sw=2

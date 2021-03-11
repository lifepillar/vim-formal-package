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

syn keyword spthyKeyword _restrict account accounts as delete else event for if insert lock lookup new otherwise parties then unlock
" This is defined with match not to take precedence over in():
syn match   spthyKeyword "\<in\>"

syn keyword spthyQuantifier All Ex
syn keyword spthyConstant F T
syn keyword spthyOperator not

syn match spthyIsFunction /\<\k\+\ze(/ contains=spthyFunction

" hashing
syn keyword spthyFunction contained h
" asymmetric-encryption
syn keyword spthyFunction contained adec aenc pk
" signing
syn keyword spthyFunction contained sign verify
syn keyword spthyConstant true
" revealing-signing
syn keyword spthyFunction contained getMessage revealSign revealVerify
" symmetric-encryption
syn keyword spthyFunction contained sdec senc
" diffie-hellman
syn keyword spthyFunction contained inv
syn match   spthyOperator "[*^]"
" bilinear-pairing
syn keyword spthyFunction contained em pmult
" xor
syn keyword spthyOperator XOR
syn keyword spthyConstant zero
syn match   spthyOperator "⊕"
" reliable-channel
syn keyword spthyFunction contained in out
" Other
syn keyword spthyFunction contained exp fst mult mun snd
syn keyword spthyConstant one
syn match   spthyNumber "\<\d\+\>"

syn keyword spthyFact Fr In Out

syn region  spthyLiteral matchgroup=spthyLiteral start="\~\='" end="'"

syn keyword spthyBuiltin fr getMessage hashing lts multiset pair pb senc sk xor
syn keyword spthyBuiltin multiset signing
syn match   spthyBuiltin "\<\%(asymmetric-encryption\|bilinear-pairing\|diffie-hellman\|reliable-channel\|revealing-signing\|symmetric-encryption\|translation-progress\)\>"

syn match   spthyDelimiter /[:."\[\]{}]/
syn match   spthyOperator "[=*^@|&<!>]\|:>\|<:\|--|\|>+>\|>->\|->\|<-\|==>\|<=>\|\~\~>"
syn region  spthyFormalComment matchgroup=spthyDelimiter start="{\*" end="\*}" contains=spthyTodo

syn match   spthyFactSym "-->\|--\[\|\]->"

syn match spthyFreshName "\~\a\k*\>"
syn match spthyPubName "\$\a\k*\>"
syn match spthyTemporal "#\a\k*\>"

syn keyword spthyStatement assertions axiom begin builtins default_rules enable end equations functions heuristic lemma let modulo options predicate predicates property protocol restriction rule section subsection text theory verdictfunction
syn match   spthyStatement "\<\%(all-traces\|anb-proto\|exists-trace\)\>"
syn match   spthyStatement "[a-zA-Z\-_]\@<!\d\+\."

syn keyword spthyAttr contained no_precomp private color colour
syn keyword spthyAnnot contained diff_reuse hide_lemma left reuse right sources use_induction
syn region  spthyBracket matchgroup=spthyDelimiter start="\[" end="\]" contains=ALL

syn keyword spthyTodo contained TODO FIXME XXX
syn region  spthyComment start="/\*"  end="\*/" contains=spthyTodo
syn match   spthyLineComment      "//.*" contains=spthyTodo

hi def link spthyAnnot         Label
hi def link spthyAttr          Tag
hi def link spthyBuiltin       Function
hi def link spthyComment       Comment
hi def link spthyConstant      Constant
hi def link spthyDelimiter     Delimiter
hi def link spthyFact          Macro
hi def link spthyFactSym       Delimiter
hi def link spthyFormalComment Comment
hi def link spthyFreshName         Identifier
hi def link spthyFunction      Function
hi def link spthyKeyword       Keyword
hi def link spthyLineComment   Comment
hi def link spthyLiteral       Character
hi def link spthyNumber        Number
hi def link spthyOperator      Operator
hi def link spthyPubName       Identifier
hi def link spthyQuantifier    Define
hi def link spthyStatement     Statement
hi def link spthyTemporal      Special
hi def link spthyTodo          Todo

let b:current_syntax = "spthy"

" vim: nowrap et ts=2 sw=2

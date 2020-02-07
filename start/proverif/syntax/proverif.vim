" Name:        ProVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn case match
syn keyword proverifKeyword among block channel choice clauses const data def diff do elimtrue else
syn keyword proverifKeyword equation equivalence event expand fail forall foreach free fun get
syn keyword proverifKeyword if implementation in insert let letfun memberOptim new noninterf not nounif
syn keyword proverifKeyword options or otherwise out param phase pred private proba process proof
syn keyword proverifKeyword public_vars putbegin query reduc secret set suchthat sync table then
syn keyword proverifKeyword type typeConverter weaksecret yield
syn match   proverifKeyword "\<inj-event\>"

syn match proverifConstant "\<0\>\|[.;]"

syn match proverifOperator "[:!=/*]"
syn match proverifOperator "&&\|||\|<>"
syn match proverifOperator "==>\|<-R\?\|<=\|->\|<->\|<=>"
syn match proverifDelimiter "[[\]()]"

syn keyword proverifType bitstring
syn region proverifComment matchgroup=proverifComment start=/(\*/ end=/\*)/

hi def link proverifComment Comment
hi def link proverifConstant Constant
hi def link proverifDelimiter Delimiter
hi def link proverifKeyword Keyword
hi def link proverifOperator Operator
hi def link proverifType     Type

let b:current_syntax = "proverif"

" vim: nowrap et ts=2 sw=2

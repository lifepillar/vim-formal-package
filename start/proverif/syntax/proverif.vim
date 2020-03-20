" Name:        ProVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn sync minlines=1 maxlines=100
syn case match
syn iskeyword @,48-57,192-255,_,'

syn keyword proverifKeyword among block channel choice clauses const def diff do elimtrue else
syn keyword proverifKeyword equation equivalence event expand fail forall foreach free fun get
syn keyword proverifKeyword if implementation in insert let letfun new noninterf not nounif
syn keyword proverifKeyword options or otherwise out param phase pred proba process proof
syn keyword proverifKeyword public_vars putbegin query reduc secret suchthat sync table then
syn keyword proverifKeyword type weaksecret yield
syn match   proverifKeyword "\<inj-event\>"

syn match proverifConstant "\<0\>\|[.;]"

syn match proverifOperator "[:!=/*]"
syn match proverifOperator "&&\|||\|<>"
syn match proverifOperator "==>\|<->\|<-R\?\|<=\|->\|<=>"
syn match proverifDelimiter "[[\](){}]"

syn region proverifOption matchgroup=proverifOperator start=/\[/ end=/]/ contains=proverifOptionValue
syn keyword proverifOptionValue contained convergent data linear private reachability pv_reachability
syn keyword proverifOptionValue contained real_or_random pv_real_or_random typeConverter
syn keyword proverifOptionValue contained block memberOptim
syn keyword proverifPredicate attacker ev evinj mess
syn region proverifSettings matchgroup=proverifKeyword start=/\<set\>/ end=/\./ contains=proverifSetting,proverifSettingValue,proverifOperator keepend
syn keyword proverifSetting contained ignoreTypes attacker keyCompromise simplifyProcess
syn keyword proverifSetting contained rejectChoiceTrueFalse rejectNoSimplif movenew maxDepth maxHyp
syn keyword proverifSetting contained selFun stopTerm redundancyElim redundancyHypElim
syn keyword proverifSetting contained swapping interactiveSwapping predicatesImplementable traceDisplay
syn keyword proverifSetting contained verboseClauses abbreviateClauses removeUselessClausesBeforeDisplay
syn keyword proverifSetting contained verboseEq verboseTerm verboseRules verboseRedundant verboseCompleted
syn keyword proverifSetting contained eqInNames expandIfTermsToTerms expandSimplifyIfCst symbOrder
syn keyword proverifSetting contained simplifyDerivation abbreviateDerivation explainDerivation reconstructTrace
syn keyword proverifSetting contained unifyDerivation reconstructDerivation displayDerivation traceBacktracking
syn keyword proverifSettingValue contained true false all none active passive approx strict
syn keyword proverifSettingValue contained interactive short long check nocheck simple best beginOnly
syn keyword proverifSettingValue contained TermMaxsize Term NounifsetMaxsize Nounifset explained
" Used indentation
syn region proverifMacro matchgroup=proverifDelimiter start=/{/ end=/}/ keepend

syn keyword proverifType bitstring

syn keyword proverifTodo contained TODO FIXME XXX DEBUG NOTE
syn region proverifComment matchgroup=proverifComment start=/(\*/ end=/\*)/ contains=proverifTodo keepend

hi def link proverifComment      Comment
hi def link proverifConstant     Constant
hi def link proverifDelimiter    Delimiter
hi def link proverifKeyword      Keyword
hi def link proverifOperator     Operator
hi def link proverifOptionValue  StorageClass
hi def link proverifPredicate    Function
hi def link proverifSetting      Debug
hi def link proverifSettingValue Constant
hi def link proverifTodo         Todo
hi def link proverifType         Type

let b:current_syntax = "proverif"

" vim: nowrap et ts=2 sw=2

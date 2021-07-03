" Name:        ProVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn sync minlines=100
syn case match
syn iskeyword @,48-57,192-255,_,'

syn keyword proverifKeyword among axiom block channel choice clauses const def diff do elimtrue else
syn keyword proverifKeyword equation equivalence event expand fail forall foreach free fun get
syn keyword proverifKeyword if implementation in insert lemma let letfun new noninterf not nounif
syn keyword proverifKeyword options or otherwise out param phase pred proba process proof
syn keyword proverifKeyword public_vars putbegin query reduc restriction secret suchthat sync table then
syn keyword proverifKeyword type weaksecret yield
syn match   proverifKeyword "\<inj-event\>"

syn keyword proverifConstant true false
syn match   proverifConstant "\<\d\+\>"
syn match   proverifConstant "\<0\>\|[.;]"

syn match proverifOperator "[:!=/*]"
syn match proverifOperator "&&\|||\|<>"
syn match proverifOperator "==>\|<->\|<-R\?\|<=\|->\|<=>"
syn match proverifDelimiter "[[\](){}]"

syn region proverifOption matchgroup=proverifOperator start=/\[/ end=/]/ contains=proverifOptionValue
syn keyword proverifOptionValue contained convergent data linear private reachability pv_reachability
syn keyword proverifOptionValue contained real_or_random pv_real_or_random typeConverter
syn keyword proverifOptionValue contained block memberOptim
syn keyword proverifOptionValue contained noneSat discardSat instantiateSat fullSat removeEvents keepEvents
syn keyword proverifOptionValue contained noneVerif discardVerif instantiateVerif fullVerif
syn keyword proverifOptionValue contained maxSubset proveAll noInduction keep precise
syn keyword proverifOptionValue contained hypothesis conclusion induction inductionOn ignoreAFewTimes

syn keyword proverifPredicate attacker ev evinj mess subterm

syn region proverifSettings matchgroup=proverifKeyword start=/\<set\>/ end=/\./ contains=proverifSetting,proverifSettingValue,proverifOperator keepend
syn keyword proverifSetting contained ignoreTypes attacker keyCompromise privateCommOnPublicFreeNames simplifyProcess preciseActions
syn keyword proverifSetting contained rejectChoiceTrueFalse rejectNoSimplif allowDiffPatterns movenew movelet maxDepth maxHyp
syn keyword proverifSetting contained selFun stopTerm redundancyElim redundancyHypElim removeEventsForLemma inductionQueries inductionLemmas
syn keyword proverifSetting contained saturationApplication verificationApplication preciseLetExpand ignoreAFewTimes nounifIgnoreAFewTimes nounifIgnoreNtimes
syn keyword proverifSetting contained swapping interactiveSwapping predicatesImplementable traceDisplay
syn keyword proverifSetting contained featureFuns featureNames featurePredicates featureEvents featureTables featureDepth featureWidth
syn keyword proverifSetting contained verboseClauses verboseLemmas abbreviateClauses removeUselessClausesBeforeDisplay
syn keyword proverifSetting contained verboseEq verboseTerm verboseRules verboseBase verboseRedundant verboseCompleted
syn keyword proverifSetting contained eqInNames expandIfTermsToTerms expandSimplifyIfCst symbOrder
syn keyword proverifSetting contained simplifyDerivation abbreviateDerivation explainDerivation reconstructTrace
syn keyword proverifSetting contained unifyDerivation reconstructDerivation displayDerivation traceBacktracking
syn keyword proverifSettingValue contained true false all none auto active passive approx strict full discard instantiate
syn keyword proverifSettingValue contained interactive short long check nocheck simple best no beginOnly
syn keyword proverifSettingValue contained TermMaxsize Term trueWithoutArgsInNames NounifsetMaxsize Nounifset explained
syn region proverifMacro matchgroup=proverifDelimiter start=/{/ end=/}/ keepend contains=ALL

syn keyword proverifType bitstring bool nat sid

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

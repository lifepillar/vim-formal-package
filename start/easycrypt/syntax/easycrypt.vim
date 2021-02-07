" Name:        EasyCrypt
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn sync minlines=100
syn case match
syn iskeyword @,48-57,192-255,_,'

syn keyword easycryptKeyword assert async elif else equiv exists forall fun glob hoare if in islossless let phoare proc res return then var while
syn keyword easycryptStatement Pr Self Top abbrev abort abstract as axiom axiomatized class clone const declare dump end export goal hint import include inductive instance lemma local module nosmt notation of op pred print proof prover qed realize remove rename require search section theory timeout type why3 with
syn keyword easycryptFunction algebra alias apply auto beta byequiv byphoare bypr call case cfold change clear congr conseq cut delta eager elim eta exfalso fel field fieldeq fission fusion have idtac inline iota kill left logic modpath move pose pr_bounded progress rcondf rcondt replace rewrite right ring ringeq rnd rwnormal seq sim simplify skip sp split splitwhile subst suff swap symmetry transitivity trivial unroll wlog wp zeta
syn keyword easycryptException do expect first last strict try
syn keyword easycryptPreProc assumption by debug done exact pragma reflexivity smt solve time undo
syn keyword easycryptIdentifier admit admitted

syn match easycryptDelimiter "[[\]\|(){}]"

syn keyword easycryptConstant tt empty
syn match easycryptConstant  "[.:,;]"
syn match easycryptConstant  "\<_\>"
syn keyword easycryptConstant true false

" syn keyword easycryptFunction seq rnd skip

syn match easycryptOperator "`\=[=<>/\+^*|:&%-]\+`\="
syn match easycryptOperator "\\[A-z0-9_']\+"
syn match easycryptOperator "!"

" easycryptAssignment *must* be after easycryptOperator (:h syn-priority)
syn match easycryptAssignment "<[@$]"

" syn keyword easycryptStatement smt

syn keyword easycryptType bool distr fmap int real unit

syn keyword easycryptTodo contained TODO FIXME XXX DEBUG NOTE
syn region easycryptComment matchgroup=easycryptComment start=/(\*/ end=/\*)/ contains=easycryptTodo keepend
syn region easycryptString start=+"+ end=+"+

hi def link easycryptAssignment   Operator
hi def link easycryptCommand      Statement
hi def link easycryptComment      Comment
hi def link easycryptConstant     Constant
hi def link easycryptDelimiter    Delimiter
hi def link easycryptException    Exception
hi def link easycryptFunction     Function
hi def link easycryptKeyword      Keyword
hi def link easycryptIdentifier   Identifier
hi def link easycryptOperator     Operator
hi def link easycryptPreProc      PreProc
hi def link easycryptStatement    Special
hi def link easycryptString       String
hi def link easycryptTodo         Todo
hi def link easycryptType         Type

let b:current_syntax = "easycrypt"

" vim: nowrap et ts=2 sw=2

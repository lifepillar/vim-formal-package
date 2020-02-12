" Name:        Maude
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn sync minlines=1 maxlines=100
syn case match
syn iskeyword @,48-57,192-255,_,-,.

syn keyword maudeKeyword cmb ceq eq eqs extending including if is protecting mb mbs op ops sort sorts subsort subsorts such that var vars
syn keyword maudeKeyword id-hook op-hook or-else term-hook vu-narrow
syn keyword maudeKeyword fmod mod omod smod endm endom endfm endsm
syn keyword maudeKeyword abort advice advise advisories advisory alias aliases all amatch amatchrew
syn keyword maudeKeyword attr attribute body break breakdown by cd clear
syn keyword maudeKeyword cmd color command components cond condition constants cont continue
syn keyword maudeKeyword crl csd debug deselect do dsrew dsrewrite endfm endfth endm
syn keyword maudeKeyword endom endsm endsth endth endv eof erew erewrite
syn keyword maudeKeyword ex exclude expr extend fail flat flattened format
syn keyword maudeKeyword frew frewrite from fth gc get graph identity idle
syn keyword maudeKeyword in inc include irredundant kinds label labels load
syn keyword maudeKeyword loop ls match matchrew memo metadata mixfix
syn keyword maudeKeyword module modules nar narrow narrowing newline nonexec not number off
syn keyword maudeKeyword on otherwise owise paren parens parentheses parse
syn keyword maudeKeyword path pr print profile protect push pwd q quit
syn keyword maudeKeyword rat rational red reduce resume reveal rew rewrite rl rls
syn keyword maudeKeyword rule rules sd sds search select set show sload
syn keyword maudeKeyword srew srewrite stats step sth strat strategy strats
syn keyword maudeKeyword subst substitution summary term test th
syn keyword maudeKeyword timing to top trace try unify using variant variants
syn keyword maudeKeyword verbose view views where whole with xmatch xmatchrew
syn match   maudeKeyword "\<conceal\>"

" Quoted identifiers
syn match maudeQuotedID "'\S\+"

" Todo
syn keyword maudeTodo contained TODO FIXME XXX DEBUG NOTE

" Standard modules and sort
syn keyword maudeStdMod BOOL BOOL-OPS EXT-BOOL INT NAT QID RAT STRING TRUTH TRUTH-VALUE
syn keyword maudeSort Bool Char Nat PosRat NzRat Qid Rat String


syn keyword maudeAttr assoc associative comm commutative
syn keyword maudeAttr ctor constructor idem idempotent iter iterated memo ditto
syn keyword maudeAttr config configuration obj object msg message metadata strat poly polymorphic
syn keyword maudeAttr frozen prec precedence format gather special
syn match maudeAttr "\%(left\|right\)\s*id:"

syn match maudeOperator "[<@?!+*]"
syn match maudeOperator "-->\|-?->\|->\|\~>\|<=?\|=>\|:=\|/\\"

syn match maudeDelimiter /[[\](){}.:,";]/

syn match maudePlaceholder "_"

" Line comments
syn region maudeComment matchgroup=maudeComment start=/---\|\*\{3}/ end=/$/ contains=maudeTodo
" Multi-line comments
syn region maudeComment matchgroup=maudeComment start=/\*\{3}(/ end=/^\s*)\s*$\|)\*\{3}/ contains=maudeTodo

" Strings
syn region maudeString matchgroup=maudeDelimiter start=/"/ skip=/\\"/ end=/"/

hi def link maudeAttr      Statement
hi def link maudeComment   Comment
hi def link maudeConstant  Constant
hi def link maudeDelimiter Delimiter
hi def link maudeKeyword   Keyword
hi def link maudeModKeyword   Keyword
hi def link maudeOperator  Operator
hi def link maudePlaceholder Operator
hi def link maudeModOp     Operator
hi def link maudeQuotedID  Identifier
hi def link maudeStdMod    Identifier
hi def link maudeString    String
hi def link maudeTodo      Todo
hi def link maudeSort      Type

let b:current_syntax = "maude"

" vim: nowrap et ts=2 sw=2


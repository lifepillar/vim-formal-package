" Name:        Verifpal
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn case match
syn keyword verifpalKeyword authentication confidentiality generates knows
syn keyword verifpalSection attacker principal phase queries
syn keyword verifpalQualifier passive active private public password
syn keyword verifpalConstant G
syn keyword verifpalPrimitive ASSERT AEAD_DEC AEAD_ENC DEC ENC HASH HKDF MAC
syn keyword verifpalPrimitive PKE_DEC PKE_ENC PW_HASH SHAMIR_SPLIT SHAMIR_JOIN
syn keyword verifpalPrimitive SIGN SIGNVERIF

syn match verifpalOperator "[=?^]"
syn match verifpalOperator "->"
syn match verifpalDelimiter "[[\]:,()]"

hi def link verifpalConstant Constant
hi def link verifpalDelimiter Delimiter
hi def link verifpalKeyword Keyword
hi def link verifpalOperator Operator
hi def link verifpalPrimitive Function
hi def link verifpalQualifier PreProc
hi def link verifpalSection Type

let b:current_syntax = "verifpal"

" vim: nowrap et ts=2 sw=2

" Name:        Verifpal
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn case match
syn keyword verifpalKeyword authentication confidentiality generates knows leaks
syn keyword verifpalSection attacker authentication confidentiality freshness phase precondition principal queries unlinkability
syn keyword verifpalQualifier passive active private public password

syn keyword verifpalPrimitive AEAD_DEC AEAD_ENC ASSERT BLIND CONCAT DEC ENC G HASH HKDF MAC PKE_DEC PKE_ENC
syn keyword verifpalPrimitive PW_HASH RINGSIGN RINGSIGNVERIF SHAMIR_JOIN SHAMIR_SPLIT SIGN SIGNVERIF SPLIT
syn keyword verifpalPrimitive UNBLIND

syn keyword verifpalConstant _ nil

syn match verifpalOperator "[=?^]"
syn match verifpalOperator "->"
syn match verifpalDelimiter "[[\]:,()]"

syn match verifpalComment "//.*$"

hi def link verifpalComment Comment
hi def link verifpalConstant Constant
hi def link verifpalDelimiter Delimiter
hi def link verifpalKeyword Keyword
hi def link verifpalOperator Operator
hi def link verifpalPrimitive Function
hi def link verifpalQualifier PreProc
hi def link verifpalSection Type

let b:current_syntax = "verifpal"

" vim: nowrap et ts=2 sw=2

" Language:           Maude
" Maintainer:         Lifepillar

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< fo< sua< inc< def< ofu<"
      \ . "| unlet! b:match_ignorecase b:match_words b:match_skip"

" No middle part for multi-line comments, as in $VIMRUNTIME/ftplugin/xml.vim
setlocal comments=s:***(,e:)***,:---,:***, commentstring=---\ %s formatoptions-=2lrot formatoptions+=cjq
setlocal suffixesadd=.maude
setlocal omnifunc=syntaxcomplete#Complete

if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let b:match_words =
        \ '\<mod\>:\<endm\>,' .
        \ '\<fmod\>:\<endfm\>,' .
        \ '\<omod\>:\<endom\>,' .
        \ '\<smod\>:\<endsm\>,' .
        \ '\<view\>:\<endv\>,'
  " Ignore comments and strings
  let b:match_skip = 'synIDattr(synID(line("."), col("."), 1), "name")
        \ =~# "^maude\\%(Comment\\|String\\|\\)$"'
endif

let &cpo = s:cpo_save
unlet s:cpo_save


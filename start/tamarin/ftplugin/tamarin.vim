" Name:        Tamarin
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:undo_ftplugin = "setlocal autoindent< comments< commentstring< formatoptions< suffixesadd< omnifunc<"
let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '') . s:undo_ftplugin

setlocal autoindent
setlocal comments=sr:/*,mb:*,ex:*/
setlocal commentstring=//%s
setlocal formatoptions=croqjl
setlocal suffixesadd=.sapic,.spthy
setlocal omnifunc=syntaxcomplete#Complete

" compiler tamarin

" Commands for asynchronous verification
" command! -buffer -nargs=? -complete=file Tamarin          call tamarin#verify(<q-args>)
" command!         -nargs=0                TamarinJobStatus call tamarin#job_status()
" command!         -nargs=0                TamarinStopJobs  call tamarin#stop_jobs()

" vim: foldmethod=marker nowrap et ts=2 sw=2

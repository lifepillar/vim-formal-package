" Name:        EasyCrypt
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

let s:keepcpo= &cpo
set cpo&vim

" Helper functions {{{
function! s:easycrypt_echo(message, mode)
  redraw
  echo "\r"
  execute 'echohl' a:mode
  echomsg '[EasyCrypt]' a:message
  echohl None
endf

function! s:sh()
  return has('win32') || has('win64') || has('win16') || has('win95')
        \ ? ['cmd.exe', '/C']
        \ : ['/bin/sh', '-c']
endfunction

" For backward compatibility
if exists('*win_getid')

  function! s:win_getid()
    return win_getid()
  endf

  function! s:win_id2win(winid)
    return win_id2win(a:winid)
  endf

else

  function! s:win_getid()
    return winnr()
  endf

  function! s:win_id2win(winnr)
    return a:winnr
  endf

endif
" }}}

" EasyCrypt jobs {{{
let g:easycrypt_jobs = []

" Print the status of easycrypt jobs
function! easycrypt#job_status()
  let l:jobs = filter(g:easycrypt_jobs, 'job_status(v:val) == "run"')
  let l:n = len(l:jobs)
  call s:easycrypt_echo(
        \ 'There '.(l:n == 1 ? 'is' : 'are').' '.(l:n == 0 ? 'no' : l:n)
        \ .' job'.(l:n == 1 ? '' : 's').' running'
        \ .(l:n == 0 ? '.' : ' (' . join(l:jobs, ', ').').'),
        \ 'ModeMsg')
endfunction

" Stop all easycrypt jobs
function! easycrypt#stop_jobs()
  let l:jobs = filter(g:easycrypt_jobs, 'job_status(v:val) == "run"')
  for job in l:jobs
    call job_stop(job)
  endfor
  sleep 1
  let l:tmp = []
  for job in l:jobs
    if job_status(job) == "run"
      call add(l:tmp, job)
    endif
  endfor
  let g:easycrypt_jobs = l:tmp
  if empty(g:easycrypt_jobs)
    return
  else
    call s:easycrypt_echo('There are still some jobs running. Please try again.', 'WarningMsg')
  endif
endfunction

function! easycrypt#callback(path, start_time, job, status)
  if index(g:easycrypt_jobs, a:job) != -1 && job_status(a:job) != 'run' " just in case
    call remove(g:easycrypt_jobs, index(g:easycrypt_jobs, a:job))
  endif
  call s:callback(a:path, a:start_time, a:job, a:status)
endfunction

function! easycrypt#close_cb(channel)
  call job_status(ch_getjob(a:channel)) " Trigger exit_cb's callback for faster feedback
endfunction

function! s:verify(path)
  update
  call add(g:easycrypt_jobs,
        \ job_start(add(s:sh(), easycrypt#command() . ' ' . shellescape(fnamemodify(a:path, ":t"))), {
        \   'close_cb' : 'easycrypt#close_cb',
        \   'exit_cb'  : function(get(b:, 'easycrypt_callback', get(g:, 'easycrypt_callback', 'easycrypt#callback')),
        \                         [a:path, reltime()]),
        \   'in_io'    : 'null',
        \   'out_io'   : 'file',
        \   'out_name' : fnamemodify(a:path, ':r').'.out',
        \   'err_io'   : "out"
        \ }))
endfunction

function! s:callback(path, start_time, job, status) abort
  let l:time_passed = reltimefloat(reltime(a:start_time))
  if a:status < 0 " Assume the job was terminated
    call s:easycrypt_echo('Job interrupted after '.printf('%.03f', l:time_passed).'s', 'ModeMsg')
    return
  endif
  " Get info about the current window
  let l:winid = s:win_getid()             " Save window id
  let l:cwd = fnamemodify(getcwd(), ":p") " Save local working directory
  execute 'lcd' fnameescape(fnamemodify(a:path, ':h'))
  try
    execute 'cgetfile' fnameescape(fnamemodify(a:path, ':r') . '.out')
    botright cwindow
  finally " Restore cwd
    execute s:win_id2win(l:winid) . 'wincmd w'
    execute 'lcd ' . fnameescape(l:cwd)
  endtry
  if a:status == 0
    call s:easycrypt_echo('Finished! ['.printf('%.03f', l:time_passed).'s]', 'ModeMsg')
  else
    call s:easycrypt_echo('There are errors ['.printf('%.03f', l:time_passed).'s]', 'ErrorMsg')
  endif
endfunction

function! easycrypt#command()
  return get(b:, 'easycrypt', get(g:, 'easycrypt', 'eval $(opam env) && easycrypt'))
endfunction

" Accepts an optional path. If no argument is given, uses the path of the
" current buffer.
function! easycrypt#verify(...) abort
  let l:path = fnamemodify(strlen(a:000[0]) > 0 ? a:1 : expand("%"), ":p")
  let l:cwd = fnamemodify(getcwd(), ":p") " Save local working directory
  call s:easycrypt_echo('Verifying...',  'ModeMsg')
  execute 'lcd' fnameescape(fnamemodify(l:path, ":h"))
  try
    call s:verify(l:path)
  finally " Restore local working directory
    execute 'lcd ' . fnameescape(l:cwd)
  endtry
endfunction!
"}}}

let &cpo = s:keepcpo
unlet s:keepcpo

" vim: sw=2 fdm=marker

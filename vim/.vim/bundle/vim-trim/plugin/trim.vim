" Only load plugin once
if exists("g:loaded_trim") | finish | endif

" Reset compatible
let s:save_cpo = &cpo
set cpo&vim

command! -bang Trim :call Trim()


function! Trim() abort
  " Save cursor position
  let pos = getpos(".")

  " Remove trailing whitespace
  %s/\s\+$//e

  " Restore cursor position
  call setpos(".", pos)
endfunction


" Restore compatible setting
let &cpo = s:save_cpo
unlet s:save_cpo

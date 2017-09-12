" Only load plugin once
if exists("g:trim") | finish | endif

" Reset compatible
let s:save_cpo = &cpo
set cpo&vim


function! s:Trim() abort
  " Save cursor position
  winsaveview()

  " Remove trailing whitespace
  while search(" $", "n") !=# 0
    %s/\s\+$//e
  endwhile

  " Restore cursor position
  winrestview()
endfunction


" Restore compatible setting
let &cpo = s:save_cpo
unlet s:save_cpo

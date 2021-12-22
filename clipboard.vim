
" clipboard
" visual mode: only paste but not replace cut table
vnoremap p pgvy
noremap <silent> <leader>p "+p
noremap <silent> <leader>y "+y:call clipboard#yank()<cr>


function clipboard#yank()
  if executable('s2rc')
    return system('s2rc', @")
  endif
  if executable('send-to-remote-clipboard')
    return system('send-to-remote-clipboard', @")
  endif
endfunction

" clipboard
" visual mode: only paste but not replace cut table
" MacOS * + 寄存器指向系统剪切板
" Linux X11 * 寄存器指向Primary 选区，鼠标选中区域
" Linux X11 + 寄存器指向Clipboard选区，系统剪切板
vnoremap p pgvy
noremap <silent> <leader>p "+p
noremap <silent> <leader>y "+y:call clipboard#yank()<cr>
" 预防粘贴时有<Esc>或<CR>字符，导致剪切板劫持
inoremap <C-r>+ <C-g>u<C-\><C-o>"+gP

function clipboard#yank()
  if executable('s2rc')
    return system('s2rc', @")
  endif
  if executable('send-to-remote-clipboard')
    return system('send-to-remote-clipboard', @")
  endif
endfunction

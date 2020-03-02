"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
" Plug 'airblade/vim-gitgutter'
" git display on ruler
" GitGutterDisable
" GitGutterEnable
nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk

let g:gitgutter_map_keys = 0
let g:gitgutter_terminal_reports_focus = 0
function! Gitgutter_Disabled_in_Largefile()
  if line2byte(line("$")+1) > g:LargeFile*1024*1024
    call gitgutter#disable()
  endif
endfunction
autocmd BufRead * silent call Gitgutter_Disabled_in_Largefile()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickhl {{{1
" Plug 't9md/vim-quickhl'
" autocmd BufWinEnter * execute "call quickhl#cword#enable()"
let g:quickhl_manual_enable_at_startup = 1
let g:quickhl_cword_enable_at_startup = 1
let g:quickhl_manual_colors = [
      \ "gui=bold ctermfg=white ctermbg=17 guifg=white guibg=#000044",
      \ "gui=bold ctermfg=white ctermbg=52 guibg=white guifg=#440000",
      \ "gui=bold ctermfg=white ctermbg=22 guibg=white guifg=#004400",
      \ "gui=bold ctermfg=white ctermbg=9  guibg=white guifg=#444400",
      \ "gui=bold ctermfg=white ctermbg=4  guibg=white guifg=#004444",
      \ "gui=bold ctermfg=white ctermbg=5  guibg=white guifg=#440044",
      \ "gui=bold ctermfg=white ctermbg=3  guibg=white guifg=#224488",
      \ "gui=bold ctermfg=white ctermbg=2  guibg=white guifg=#884422",
      \ "gui=bold ctermfg=white ctermbg=1  guibg=white guifg=#448822",
      \ ]
nmap <leader>mm <Plug>(quickhl-manual-this)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses   {{{1
" high light parentheses with different color
" Plug 'kien/rainbow_parentheses.vim'

let g:rbpt_loadcmd_toggle = 0
let g:rbpt_max = 9
" autocmd VimEnter * nested :RainbowParenthesesToggle
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" autocmd Syntax * RainbowParenthesesLoadChevrons

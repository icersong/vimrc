"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter   {{{1
" Plug 'scrooloose/nerdcommenter'
" <leader>cc add comment
" <leader>cu remove comment
" let NERDCreateDefaultMappings = 0
" let NERDSpaceDelims           = 1
" let NERDAllowAnyVisualDelims  = 1
" let NERDCommentEmptyLines     = 1
" let NERDCompactSexyComs       = 1
" let NERDDefaultAlign          = 'left'
" let NERDTrimTrailingWhitespace = 1
" let g:NERDCustomDelimiters = {
"     \ 'python': { 'left': '#', 'leftAlt': '#' },
" \ }
" vmap <BS> <plug>NERDCommenterToggle:nohls<CR>gv
" nmap <BS> <plug>NERDCommenterToggle
" nmap <leader>cc <plug>NERDCommenterToggle
" vmap <leader>cc <plug>NERDCommenterAlignBoth:nohls<CR>gv
" nmap <leader>cu <plug>NERDCommenterUncomment:nohls<CR>gv

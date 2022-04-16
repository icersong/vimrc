"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'tpope/vim-dispatch'

# markdown preview
command! MDP Dispatch HTTPS_PROXY=&& HTTP_PROXY=
      \ && grip --user-content --context=joeyespo/grip % 0.0.0.0

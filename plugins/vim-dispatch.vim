"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'tpope/vim-dispatch'

command! MDP Dispatch! HTTPS_PROXY=&& HTTP_PROXY=
      \ && grip --user-content --context=joeyespo/grip % 0.0.0.0

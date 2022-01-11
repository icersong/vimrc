"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimux  {{{1
" Plug 'benmills/vimux'

map <Leader>vxp normal! VimuxPromptCommand<CR>
map <Leader>vxl :VimuxRunLastCommand<CR>
map <Leader>vxi :VimuxInspectRunner<CR>
map <Leader>vxq :VimuxCloseRunner<CR>
map <Leader>vxk :VimuxInterruptRunner<CR>
map <Leader>vxz :call VimuxZoomRunner()<CR>

let g:VimuxHeight = "16"
let g:VimuxOrientation = "v"
let g:VimuxPromptString = "(tmux)$ "

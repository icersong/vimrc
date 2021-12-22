" fakeclip  {{{1
" Plug 'kana/vim-fakeclip'
if !has('nvim') && !has('gui_running')
  set clipboard+=exclude:.*
endif
let g:fakeclip_provide_clipboard_key_mappings =
    \ (has('macunix') || has('gui_gtk2')) && !has('gui_running')
let g:fakeclip_terminal_multiplexer_type = 'tmux'

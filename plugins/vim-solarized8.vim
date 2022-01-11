" solarized8 theme  {{{1
" Plug 'altercation/vim-colors-solarized'
" Plug 'lifepillar/vim-solarized8'
let g:solarized_hitrail     = 1
let g:solarized_menu        = 0
let g:solarized_contrast    = "normal"
let g:solarized_visibility  = "normal"
let g:solarized_diffmode = "high"
if !has('gui_running')
  let g:solarized_termcolors  = 256
  let g:solarized_termtrans   = 1
  let g:solarized_degrade     = 1
endif


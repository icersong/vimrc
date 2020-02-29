"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gundo (visualize undo tree) {{{1
" Plug 'sjl/gundo.vim'
autocmd sourcepost $VIMFILES/gundo.vim/*.vim call s:plugin_loaded()
function! s:plugin_loaded() abort
    " if exists('janus#disable_plugin')
    "     call janus#disable_plugin('gundo', s:no_python_support)
    " endif
    let g:gundo_close_on_revert = 1
    let g:gundo_tree_statusline = 'Gundo'
    let g:gundo_width = 45
    let g:gundo_preview_height = 11
    let g:gundo_right = 1
endfunction

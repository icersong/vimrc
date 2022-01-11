"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PyDoc     {{{1
" Plug 'fs111/pydoc.vim'
" let g:pydoc_cmd = 'python -m pydoc'
let g:pydoc_perform_mappings = 0
let g:pydoc_window_lines=0.5
nnoremap <leader>? :Pydoc <C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>
" 用ag在当前工程下搜索选中文本的文件名 gag
vnoremap <leader>? :Pydoc! <C-R>=escape(functools#get_visual_selection(), "/\\\*\ \|\(\)")<CR>

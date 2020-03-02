"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSF    {{{1
" Plug 'dyng/ctrlsf.vim'
" CtrlSF [options] <patten> [path]
" <leader>,ss [path]
" key 'M' for edit mode

let g:ctrlsf_auto_focus = {"at": "done", "duration_less_than": 1000}
let g:ctrlsf_auto_close = 1
let g:ctrlsf_default_root = 'project+fw'
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_context = '-B 0 -A 0'
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_extra_root_markers = ['.root']
let g:ctrlsf_ignore_dir = ['bin', 'dist', 'build', 'lib', 'libs', 'img', 'fonts', 'cache', 'htdocs/static']

nnoremap <leader>ss <Plug>CtrlSFCwordPath
vnoremap <leader>ss <Plug>CtrlSFVwordPath

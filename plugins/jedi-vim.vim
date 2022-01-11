"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim  {{{1
" jedi-vim is a is a VIM binding to the autocompletion library Jedi.
" 此插件会导致键入时迟缓，严重时会卡住
" Plug 'davidhalter/jedi-vim'
if !has('nvim')
  let g:jedi#completions_enabled      = 0
  let g:jedi#auto_initialization      = 0
  let g:jedi#auto_vim_configuration   = 0
  let g:jedi#use_tabs_not_buffers     = 0
  let g:jedi#use_splits_not_buffers   = 1
  let g:jedi#popup_select_first       = 0
  let g:jedi#popup_on_dot             = 0
  let g:jedi#auto_close_doc           = 1
  let g:jedi#show_call_signatures     = 1
  let g:jedi#completions_command      = ""
  " if functools#has_command('PythonJedi') && !functools#has_command('YcmCompleter')
  let g:jedi#goto_assignments_command = "<leader>jj"
  let g:jedi#goto_definitions_command = "<leader>jd"
  let g:jedi#documentation_command = "<leader>jk"
  let g:jedi#usages_command = "<leader>ju"
  let g:jedi#rename_command = "<leader>jr"
endif



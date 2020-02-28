"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" denite   {{{1
" Plug 'Shougo/denite.nvim', { 'on': ['Denite'] }
" Denite file/rec   // 递归搜索, rec 表递归

nnoremap <silent> <leader>ff :Denite
            \ -input='<C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>'
            \ buffer `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

vnoremap <silent> <leader>ff :Denite
            \ -input='<C-R>=escape(GetVisualSelection(), "/\\\*\ \|\(\)")<CR>'
            \ buffer `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

nnoremap <silent> <leader>fa :Denite -auto-action=preview
            \ -input='<C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>'
            \ buffer `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> A
  \ denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" denite option
call denite#custom#option('default', {
  \   'wincol': &columns * 1 / 8,
  \   'winwidth': &columns * 3 / 4,
  \   'split': 'floating',
  \   'root-markers': '.git,.svn',
  \   'highlight_matched_char' : 'MoreMsg',
  \   'highlight_matched_range' : 'MoreMsg',
  \   'statusline' : has('patch-7.4.1154') ? v:false : 0,
  \   'prompt' : '➜',
  \ })

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> <C-p> :<C-u>Denite -auto-action=preview 
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<cr>
" nnoremap <leader>c :<C-u>Denite colorscheme -auto-action=preview<cr>
" nnoremap <leader>; :<C-u>Denite file_mru<cr>

" call denite#custom#map('insert', '<tab>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<S-tab>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '<C-cr>', '<denite:choose_action>', 'noremap')
" call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<tab>', '<denite:do_action:preview>', 'noremap')
" call denite#custom#map('normal', '<S-tab>', '<denite:choose_action>', 'noremap')
call denite#custom#map('insert', '<esc>', '<denite:choose_action>', 'noremap')
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')

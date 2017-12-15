"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite     {{{1
" powerful than CtrlP|ACK ...
" search project
"   :UniteWithProjectDir -toggle -auto-resize -buffer-name=project file
"   >> **/????  !xx
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/neomru.vim'
let g:unite_data_directory = $VIMCACHE.'/unite'
let g:unite_enable_start_insert = 1
let g:unite_no_default_keymapping = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 5000
let g:unite_prompt = '» '
let g:unite_split_rule = 'botright'
let g:unite_ignore_source_files = ['function.vim', 'command.vim']
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
  let g:unite_source_grep_recursive_opt=''
endif
function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  " imap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
function! s:init_unite()
  if HasCmdValid('Unite') && !hasmapto('Unite')
    " call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#set_profile('files', 'context.smartcase', 1)
    autocmd FileType unite call s:unite_settings()
    nnoremap <silent><leader>s :UniteWithProjectDir -toggle -auto-resize -buffer-name=project file<cr>**/<space>
    " nnoremap <silent><c-s> :Unite -toggle -auto-resize -buffer-name=mixed
    "       \ file_mru file_rec/async buffer bookmark<cr>
    nnoremap <silent><leader>ul :Unite -auto-resize -buffer-name=line line<cr>
    nnoremap <silent><leader>u/ :Unite -no-quit -buffer-name=search grep:.<cr>
  endif
endfunction
autocmd VimEnter * call s:init_unite()
" nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize
"       \ -buffer-name=mixed file_mru file_rec/async buffer bookmark<cr><c-u>
" nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
" nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
" nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
" nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
" nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
" nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
" nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

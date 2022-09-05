" 离开插入模式后自动关闭预览窗口
" key <esc>
" inoremap <expr> <esc> (pumvisible() ? "\<esc>a" : "\<esc>")
inoremap <expr><esc> coc#pum#visible() ? coc#pum#cancel() 
  \: pumvisible() ? "\<C-e>"
  \: "\<esc>"

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap <expr><cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")
" inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><CR> coc#pum#visible() ? coc#_select_confirm()
  \: pumvisible() ? "\<C-y>"
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shift + tab, jump prev
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : pumvisible() ? "\<C-p>" : "\<S-Tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Super TAB
" Use <TAB> to select the popup menu:
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr><TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ pumvisible() ? "\<C-n>" :
  \ functools#has_function('delimitMate#ShouldJump')
  \   && delimitMate#ShouldJump() ?
  \ delimitMate#JumpAny() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

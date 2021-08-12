" 离开插入模式后自动关闭预览窗口
" key <esc>
" inoremap <expr> <esc> (pumvisible() ? "\<esc>a" : "\<esc>")

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <TAB> to select the popup menu:
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ delimitMate#ShouldJump() ?
      \ delimitMate#JumpAny() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()



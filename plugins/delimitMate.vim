"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Raimondi/delimitMate {{{1
" automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'Raimondi/delimitMate'
" for python docstring "
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 0
let delimitMate_jump_expansion = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_excluded_regions = "Comment,String"
au FileType python let b:delimitMate_nesting_quotes = ['"', "'", '`']

" Fixed <tab> jump out
" autocmd VimEnter * imap <silent> <expr> <TAB>
"       \ !pumvisible()
"       \ && delimitMate#ShouldJump() ?
"       \ delimitMate#JumpAny() : "\<TAB>"

" Super <TAB>
" See keymap.vim
" function! Ulti_ExpandOrJump_and_getRes()
"   if !functools#has_function('UltiSnips#ExpandSnippetOrJump')
"     return -1
"   endif
"   call UltiSnips#ExpandSnippetOrJump()
"   return g:ulti_expand_or_jump_res
" endfunction

" autocmd VimEnter * imap <silent> <expr> <TAB>
"   \ pumvisible() ?
"   \ "\<C-N>" :
"   \ functools#has_function('delimitMate#ShouldJump') && delimitMate#ShouldJump() ?
"   \ delimitMate#JumpAny() :
"   \ "\<C-R>=(Ulti_ExpandOrJump_and_getRes() > 0) ? '' : '\<TAB>'\<CR>"



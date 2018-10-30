"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe   {{{1
" YCM windows install guides needed.
" Plug 'Valloric/YouCompleteMe'
" set completeopt=longest,menu    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
" nmap <leader>jj :YcmCompleter GoTo<CR>
" nmap <leader>jr :YcmCompleter GoToReferences<CR>
" nmap <leader>jd :YcmCompleter GoToDefinition<CR>
" nmap <leader>ji :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
" inoremap <leader><leader> <C-x><C-o>

" 配置文件
let g:ycm_global_ycm_extra_conf = simplify(expand(
    \ $VIM_BUNDLE_PATH.'/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'))
" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 在local-list中显示错误
let g:syntastic_always_populate_loc_list = 1
" 补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion = 2
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 语义补全快捷键，默认<ctrl-space>
let g:ycm_key_invoke_completion = '<c-z>'
noremap <c-z> <NOP>
" 禁止语义检查
let g:ycm_show_diagnostics_ui = 0
" python解释器路径
" let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
" 任意两个字符触发语义补全
let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \ 'cs,lua,javascript': ['re!\w{2}'],
  \ }
" 限制分析的文件类型
" let g:ycm_filetype_whitelist = {
"   \ "c":1,
"   \ "cpp":1,
"   \ "sh":1,
"   \ "go":1,
"   \ "cs":1,
"   \ "zsh":1,
"   \ "lua":1,
"   \ "php":1,
"   \ "perl":1,
"   \ "java":1,
"   \ "python":1,
"   \ "javascript":1,
"   \ "css":1,
"   \ "html":1,
"   \ "jinja":1,
"   \ }
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 跳转快捷键
function! MappingForYcm()
  " if HasCmdValid('YcmCompleter')
    nmap <buffer> <leader>jj :YcmCompleter GoTo<CR>
    nmap <buffer> <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    inoremap <buffer> <leader><leader> <C-x><C-o>
  " endif
endfunction
autocmd BufReadPost * call  MappingForYcm()

" 上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

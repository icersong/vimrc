"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10
" Modified: 2020-02-22
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:enable_youcompleteme = 0
let g:enable_pydiction = 0
let g:enable_jedi = 0
let g:enable_ropevim = 0

if $MACOS
  let g:enable_youcompleteme = 1
else
  let g:enable_pydiction = 1
  let g:enable_jedi = 1
endif
let g:enable_jedi = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start page {{{1
" Plug 'mhinz/vim-startify'
let g:startify_session_dir = $VIMCACHE.'/session'
" let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smooth scroll {{{1
" Plug 'terryma/vim-smooth-scroll'
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 9)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 9)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 9)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 9)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme  {{{1
" solarized8 theme  {{{1
" Plug 'altercation/vim-colors-solarized'
" Plug 'lifepillar/vim-solarized8'
let g:solarized_hitrail     = 1
let g:solarized_menu        = 0
let g:solarized_contrast    = "normal"
let g:solarized_visibility  = "normal"
let g:solarized_diffmode = "high"
if !has('gui_running')
  let g:solarized_termcolors  = 256
  let g:solarized_termtrans   = 1
  let g:solarized_degrade     = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minimap   {{{1
" Plug 'severin-lemaignan/vim-minimap'
" let g:minimap_highlight='Visual'
" let g:minimap_show='<leader>ms'
" let g:minimap_update='<leader>mu'
" let g:minimap_close='<leader>gc'
" let g:minimap_toggle='<leader>gt'


" minimap   {{{1
" Plug 'koron/minimap-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree  {{{1
" Plug 'scrooloose/nerdtree'
"nmap <leader>nt :NERDTree<CR>
"let NERDTreeHighlightCursorline=1
"let NERDTreeQuitOnOpen = 1
"let NERDTreeWinSize = 48
"let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"let g:netrw_home=$VIMCACHE.'/NERDTree'
""close vim if the only window left open is a NERDTree
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | :bd<cr> | end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" defx {{{1
" Plug 'Shougo/defx.nvim'

nnoremap <silent> <leader>df :Defx -split=vertical -winwidth=50 -direction=topleft<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF   {{{1
" Plug 'junegunn/fzf.vim'

let g:fzf_history_dir = $VIMCACHE.'/fzf-history'

nmap <leader>fb :Buffers<CR>
nmap <leader>fz :Files<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fh :History<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP {{{1
" Plug 'kien/ctrlp.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'FelikZ/ctrlp-py-matcher'
" ----------------------------------------------------------------
" ripgrep is fastest search tools then ag, grep, ...
" $ brew install ripgrep
" $ sudo apt install cmake python-dev libboost-all-dev
" ----------------------------------------------------------------

" nmap <c-p> <plug>(ctrlp)
nmap <silent> <c-p> :CtrlPMRU<CR>
nmap <silent> <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 100000
" let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['.git', '.svn', '.hg', '.bzr', '_darcs']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|cache|dist|build)$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|gif|zip|7z|gz|tgz|swp|bin|pyc|pyo)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
let g:ctrlp_funky_syntax_highlight = 1
if executable('rg')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = {
        \ 'types': {
        \   1: ['.git', 'rg %s --files --color=never --glob ""'],
        \   2: ['.svn', 'rg %s --files --color=never --glob ""'],
        \ },
        \ 'fallback': 'rg %s --files --color=never --glob ""'
        \ }
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
elseif executable('ag')
  let g:ctrlp_use_caching = 0
  " 使用ctrl-py-matcher加速
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden'
        \ . ' --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'''
        \ . ' -g "."'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag    {{{1
" Plug 'rking/ag.vim'
" Search by file name
" :AgFile [options] {pattern} [{directory}]
" Search file content
" :Ag [options] {pattern} [{directory}]
" :Ag '\\\#define foo' to search for #define foo
let g:ag_prg="ag --vimgrep --nocolor --nogroup --smart-case --ignore .git --ignore .svn --ignore .DS_Store"
let g:ag_working_path_mode="r"
let g:ag_format="%f:%l:%c:%m"
let g:ag_hightlight=1
" let g:ag_qhandler="copen"
" nnoremap <leader>gf  :AgFile<space>
" 用ag在当前工程下搜索光标下的文件名
nnoremap <leader>ff yiw:AgFile! "<C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>"
" 用ag在当前工程下搜索选中文本的文件名 gag
vnoremap <leader>ff ""y:AgFile! "<C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepper   {{{1
" Plug 'mhinz/vim-grepper'
" Search file content
" let g:grepper           = {}
" let g:grepper.tools     = ['ag', 'git', 'grep', 'file']
" let g:grepper.repo      = ['.git', '.hg', '.svn']
" let g:grepper.open      = 1
" let g:grepper.jump      = 0
" let g:grepper.stop      = 99
" let g:grepper.highlight = 1
" let g:grepper.next_tool = '<tab>'   " <TAB>键切换搜索工具
" let g:grepper.ag = { 'grepprg': 'ag --vimgrep --smart-case' }
" let g:grepper.file= { 'grepprg': 'ag --vimgrep --smart-case -g' }

" ---- 内容搜索 ----
" 用ag搜索当前目录,
" nnoremap <leader>f. :Grepper -tool ag<cr>
" 用ag在当前目录下搜索光标下的单词, "CtrlSF xxx ." 替代
" nmap <leader>*  :Grepper -tool ag -noprompt -cword<CR>
" nmap <leader>f. yiw:Grepper -noprompt -grepprg ag
"     \ "<C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>"
" 用ag在当前目录下搜索选中的内容, "CtrlSF xxx ." 替代
" vmap <leader>* ""y:Grepper -noprompt -grepprg ag
"     \ "<C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>"<CR>
" 用ag在当前工程下搜索, 等待输入
" nnoremap <leader>fr :Grepper -tool ag -dir repo,file<cr>
" 用ag在当前工程下搜索光标下的单词
" nnoremap <leader>fr :Grepper -tool ag -cword -noprompt -dir repo,file<cr>
" 用ag在当前工程下搜索选中的内容
" vnoremap <leader>fr ""y:Grepper -noprompt -dir repo,file -grepprg ag
"     \ "<C-R>=escape(escape(@", '\'), '"/\ \|\(\))')<CR>"<CR>

" ---- 文件搜索 ----
" 用ag在当前工程下搜索光标下的文件名
" nnoremap <leader>ff :Grepper -tool file -cword -noprompt -dir repo,file<CR>
" 用ag在当前工程下搜索选中的文件名
" vnoremap <leader>ff ""y:Grepper -tool file -noprompt -dir repo,file -grepprg ag -g
    " \ "<C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>"<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSF    {{{1
" Plug 'dyng/ctrlsf.vim'
" like ag.vim but show context with matches line
" CtrlSF [options] <patten> [path]
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

nmap <leader>fr <Plug>CtrlSFCwordPath
vmap <leader>fr <Plug>CtrlSFVwordPath


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch {{{1
" highlighting search results
" Plug 'haya14busa/incsearch.vim'
" set hlsearch
" let g:incsearch#auto_nohlsearch = 1
" nmap n  <Plug>(incsearch-nohl-n)
" nmap N  <Plug>(incsearch-nohl-N)
" nmap *  <Plug>(incsearch-nohl-*)
" nmap #  <Plug>(incsearch-nohl-#)
" nmap g* <Plug>(incsearch-nohl-g*)
" nmap g# <Plug>(incsearch-nohl-g#)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickhl {{{1
" Plug 't9md/vim-quickhl'
" autocmd BufWinEnter * execute "call quickhl#cword#enable()"
let g:quickhl_manual_enable_at_startup = 1
let g:quickhl_cword_enable_at_startup = 1
let g:quickhl_manual_colors = [
      \ "gui=bold ctermfg=white ctermbg=17 guifg=white guibg=#000044",
      \ "gui=bold ctermfg=white ctermbg=52 guibg=white guifg=#440000",
      \ "gui=bold ctermfg=white ctermbg=22 guibg=white guifg=#004400",
      \ "gui=bold ctermfg=white ctermbg=9  guibg=white guifg=#444400",
      \ "gui=bold ctermfg=white ctermbg=4  guibg=white guifg=#004444",
      \ "gui=bold ctermfg=white ctermbg=5  guibg=white guifg=#440044",
      \ "gui=bold ctermfg=white ctermbg=3  guibg=white guifg=#224488",
      \ "gui=bold ctermfg=white ctermbg=2  guibg=white guifg=#884422",
      \ "gui=bold ctermfg=white ctermbg=1  guibg=white guifg=#448822",
      \ ]
nmap <leader>mm <Plug>(quickhl-manual-this)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VOoM  {{{1
" Plug 'vim-voom/VOoM'
let g:voom_tree_placement = "right"
let g:voom_tree_width = 40
let g:voom_tab_key = "<C-Tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion  {{{1
" fast jump to after current, \\f<char>
" Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = ";"
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ;'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-sneak  {{{1
" fast jump to after current, \\f<char>
" Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
let g:sneak#target_labels = ";abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent line {{{1
" Plug 'Yggdroot/indentLine'
let g:indentLine_maxLines = 999
let g:indentLine_faster = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" polyglot {{{1
" Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = []
let g:jsx_ext_required = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses   {{{1
" high light parentheses with different color
" Plug 'kien/rainbow_parentheses.vim'

" let g:rbpt_loadcmd_toggle = 0
" let g:rbpt_max = 9
" " autocmd VimEnter * nested :RainbowParenthesesToggle
" autocmd VimEnter * RainbowParenthesesToggle
" autocmd Syntax * RainbowParenthesesLoadRound
" autocmd Syntax * RainbowParenthesesLoadSquare
" autocmd Syntax * RainbowParenthesesLoadBraces
" " autocmd Syntax * RainbowParenthesesLoadChevrons


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
" Fixed <tab> jump out
" autocmd VimEnter * imap <silent> <expr> <TAB>
"       \ !pumvisible() && delimitMate#ShouldJump() ?
"       \ delimitMate#JumpAny() : "\<TAB>"
au FileType python let b:delimitMate_nesting_quotes = ['"', "'", '`']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FastFold    {{{1
" Plug 'Konfekt/FastFold'

nmap zuz <Plug>(FastFoldUpdate)
xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" let g:tex_fold_enabled=1
" let g:vimsyn_folding='af'
" let g:xml_syntax_folding = 1
" let g:php_folding = 1
" let g:perl_fold = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'tmhedberg/SimpylFold' {{{1
let g:SimpylFold_docstring_preview=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips   {{{1
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnips = {}
let g:UltiSnipsListSnippets = '<C-L>'
"let g:UltiSnipsExpandTrigger = '<Tab>'
"let g:UltiSnipsJumpForwardTrigger = '<Tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
let g:UltiSnipsSnippetsDir=simplify(expand($CONFROOT.'/snippets/UltiSnips'))
let g:UltiSnipsSnippetDirectories=[simplify(expand($VIMFILES.'/vim-snippets/UltiSnips'))]

let g:snips_author = 'icersong'
let g:snips_email = 'icersong@gmail.com'
let g:snips_github = 'https://github.com/icersong'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" echodoc {{{1
" Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-dict   {{{1
" usage: os.p<tab>
" Plug 'rkulla/pydiction'
let g:pydiction_location = simplify(expand($VIM_BUNDLE_PATH.'/pydiction/complete-dict'))
let g:pydiction_menu_height = 9


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
  " if HasCmdValid('PythonJedi') && !HasCmdValid('YcmCompleter')
  let g:jedi#goto_assignments_command = "<leader>jj"
  let g:jedi#goto_definitions_command = "<leader>jd"
  let g:jedi#documentation_command = "<leader>jk"
  let g:jedi#usages_command = "<leader>ju"
  let g:jedi#rename_command = "<leader>jr"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-auto-indent    {{{1
" Plug 'hynek/vim-python-pep8-indent'
let g:pymode_indent = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html/css tools  {{{1
" fast create xml css html
" eg: root>elememnt#property*3>default<ctrl-y>,
" Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
function! ProxyEmmetInstall()
  if HasCmdValid('EmmetInstall')
    execute('EmmetInstall')
  endif
endfunction
autocmd FileType php,css,xml,tpl,htm,html,xhtml,jinja call ProxyEmmetInstall()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-syntax  {{{1
" Plug 'hdima/python-syntax'
let g:python_highlight_all = 1
let g:python_slow_sync = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vdebug {{{1
" Plug 'joonty/vdebug'

let g:vdebug_options= {
\    "port" : 9000,
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DBGPavim  {{{1
" Plug 'brookhong/DBGPavim'
let g:dbgPavimBreakAtEntry = 0
let g:dbgPavimOnce = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PyDoc     {{{1
" Plug 'fs111/pydoc.vim'
" let g:pydoc_cmd = 'python -m pydoc'
let g:pydoc_perform_mappings = 0
let g:pydoc_window_lines=0.5
nnoremap <leader>? yiw:Pydoc <C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>
" 用ag在当前工程下搜索选中文本的文件名 gag
vnoremap <leader>? ""y:Pydoc! <C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'chrisbra/Colorizer'
" 注：此插件可能极度影响光标及输入的速度, 但是功能强于'gko/vim-coloresque'
" let g:colorizer_auto_color = 0
" let g:colorizer_auto_filetype='css,html,javascript,jinia,python,xdefaults'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript indentation and syntax     {{{1
" Vastly improved Javascript indentation and syntax support in Vim
" Plug 'pangloss/vim-javascript'
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
" let g:javascript_conceal_function   = "ƒ"
" let g:javascript_conceal_null       = "ø"
" let g:javascript_conceal_this       = "@"
" let g:javascript_conceal_return     = "⇚"
" let g:javascript_conceal_undefined  = "¿"
" let g:javascript_conceal_NaN        = "ℕ"
" let g:javascript_conceal_prototype  = "¶"
" let g:javascript_conceal_static     = "•"
" let g:javascript_conceal_super      = "Ω"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular  {{{1
" Plug 'godlygeek/tabular'
" let g:tabular_loaded = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fakeclip  {{{1
" Plug 'kana/vim-fakeclip'
if !has('nvim')
  set clipboard+=exclude:.*
endif
let g:fakeclip_provide_clipboard_key_mappings =
    \ (has('macunix') || has('gui_gtk2')) && !has('gui_running')
let g:fakeclip_terminal_multiplexer_type = 'tmux'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TaskList.vim {{{1
" It will search the file for FIXME, TODO, and XXX ...
" Plug 'vim-scripts/TaskList.vim'
map <leader>tl <Plug>TaskList


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better-whitespace {{{1
" improve from trailing-whitespace
" :StripWhitespace
" Plug 'ntpeters/vim-better-whitespace'

" autocmd FileType javascript,c,cpp,java,html,python,vim,tpl,css,jinja,markdown
"       \ autocmd BufWritePre <buffer> StripWhitespace
" let g:better_whitespace_filetypes_blacklist=['text', 'rich', 'diff', 'gitcommit', 'unite', 'qf', 'help']
" highlight ExtraWhitespace ctermbg=Red
" unmap <silent><space>
" nmap <silent><space> :nohls<CR>za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent-object   {{{1
" select object by indent
" vii, viI, vai, vaI,
" Plug 'michaeljsmith/vim-indent-object'
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" surround    {{{1
" normal-add-word: ysiw<symbol>  ysw<symbol>
" normal-add-line: yss<symbol>
" normal-change: cs<oldsymbol><newsymbol>  cst<newtag>
" normal-delete: ds<symbol>
" normal-delete-tag: dst
" visual-add: S<symbol>
" Plug 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter   {{{1
" Plug 'scrooloose/nerdcommenter'
" <leader>cc add comment
" <leader>cu remove comment
" let NERDCreateDefaultMappings = 0
" let NERDSpaceDelims           = 1
" let NERDAllowAnyVisualDelims  = 1
" let NERDCommentEmptyLines     = 1
" let NERDCompactSexyComs       = 1
" let NERDDefaultAlign          = 'left'
" let NERDTrimTrailingWhitespace = 1
" let g:NERDCustomDelimiters = {
"     \ 'python': { 'left': '#', 'leftAlt': '#' },
" \ }
" vmap <BS> <plug>NERDCommenterToggle:nohls<CR>gv
" nmap <BS> <plug>NERDCommenterToggle
" nmap <leader>cc <plug>NERDCommenterToggle
" vmap <leader>cc <plug>NERDCommenterAlignBoth:nohls<CR>gv
" nmap <leader>cu <plug>NERDCommenterUncomment:nohls<CR>gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary {{{1
" Plug 'tpope/vim-commentary'
vmap <silent> <BS> <plug>Commentary:nohls<CR>gv
nmap <silent> <BS> :Commentary<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multiple-cursors  {{{1
" Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_insert_maps={'I':1, 'i':1, 'a':1, 'A':1}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand-region   {{{1
" select region by key "+" & "-"
" Plug 'terryma/vim-expand-region'
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NrrwRgn   {{{1
" :NR      - Open the selected region in a new narrowed window
" :NW      - Open the current visual window in a new narrowed window
" Plug 'chrisbra/NrrwRgn'
let g:nrrw_rgn_wdth = 50
" let g:nrrw_rgn_resize_window = 'absolute'
" let g:nrrw_rgn_rel_min = 30
" let g:nrrw_rgn_rel_max = 80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoVim  {{{1
" It is for Collaborative Editing. But not stable
" if $MACOS
"   Plug 'FredKSchott/CoVim'
"   let CoVim_default_name = "icersong"
"   let CoVim_default_port = "8888"
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - taglist   {{{1
" Plug 'vim-scripts/taglist.vim'
" "let Tlist_Auto_Open = 1
" let Tlist_Close_On_Select = 1
" let Tlist_File_Fold_Auto_Close = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Show_One_File = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_Use_SingleClick = 1
" $ctags -R . 在当前目录下递归生成tags文件

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar {{{1
" Plug 'majutsushi/tagbar'
if !executable("ctags")
  if exists('janus#disable_plugin')
    call janus#disable_plugin("tagbar", "The ctags program is not installed")
  endif
else
  nmap <Leader>tb :TagbarToggle<CR>
  "let g:tagbar_ctags_bin='/usr/bin/ctags'
  let g:tagbar_width=33
  " let g:tagbar_autoclose = 1
  " let g:tagbar_autofocus = 1
  let g:tagbar_show_linenumbers = 1
  " let g:tagbar_singleclick = 1
  " autocmd BufReadPost *.cpp,*.c,*.h,*.py,*.js,*.php call tagbar#autoopen()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VCS   {{{1
" Plug 'vim-scripts/vcscommand.vim'
if $WINDOWS
  let g:VCSCommandSVNExec="D:\\PROGRA~1\\TORTOI~1\\bin\\svn.exe"
  let g:VCSCommandVCSTypeOverride= [['D:/tmp', 'SVN'], ['D:/MyWork', 'SVN']]
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive   {{{1
" git wapper
" Plug 'tpope/vim-fugitive'
" autocmd QuickFixCmdPost *grep* cwindow
command GPush :AsyncRun -raw=1 -post=copen git svn dcommit
command GPull :AsyncRun -raw=1 -post=copen git svn rebase
command GStash :Git stash
command GStashPop :Git stash pop
" 修正本地查看远程分支列表
command GitRemotePruneOrigin :Git remote prune origin<CR>

nnoremap <leader>gv :Gitv!<CR>
nnoremap <leader>gV :Gitv --all<CR>
nnoremap <leader>gl :AsyncRun -raw=1 -post=copen
      \ git --no-pager log --oneline --decorate --graph -40
      \ --date=format:"\%Y-\%m-\%d \%H:\%M:\%S" --pretty="format:\%h \%ad \%an \%s" %<CR>
nnoremap <leader>gL :AsyncRun -raw=1 -post=copen
      \ git --no-pager log --oneline --decorate --graph -40
      \ --date=format:"\%Y-\%m-\%d \%H:\%M:\%S" --pretty="format:\%h \%ad \%an \%s" %<CR>
" nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gC :Gcommit -v -q --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gD :Git diff --stat origin<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :AsyncRun -raw=1 -post=copen git push<CR>
nnoremap <leader>gpt :AsyncRun -raw=1 -post=copen git push --tags<CR>
nnoremap <leader>gpl :AsyncRun -raw=1 -post=copen git pull<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signify   {{{1
" Plug 'mhinz/vim-signify'
" UPDATE it to reflect your preferences, it will speed up opening files

let g:signify_vcs_list = ['git', 'svn']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
" Plug 'airblade/vim-gitgutter'
" git display on ruler
" GitGutterDisable
" GitGutterEnable
nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk

let g:gitgutter_map_keys = 0
let g:gitgutter_terminal_reports_focus = 0
function! Gitgutter_Disabled_in_Largefile()
  if line2byte(line("$")+1) > g:LargeFile*1024*1024
    call gitgutter#disable()
  endif
endfunction
autocmd BufRead * silent call Gitgutter_Disabled_in_Largefile()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature  {{{1
" Plug 'kshenoy/vim-signature'
" virtual mark
" m.        If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m<space>  Delete all marks from te current buffer
" [` or ]`  Jump to prev or next mark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commandline complete  {{{1
" Plug 'vim-scripts/CmdlineComplete'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" improved shell  {{{1
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/vimshell.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-tmux-navigator  {{{1
" Plug "christoomey/vim-tmux-navigator"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun    {{{1
" Plug 'skywind3000/asyncrun.vim'
function! AsyncRunning(id)
  if !empty(matchstr(g:asyncrun_status, '\d\+'))
    let g:asyncrun_status += 1
    let g:asyncrun_status .= ''
  else
    if g:asyncrun_status == 'running'
      let g:asyncrun_status = '1'
    endif
    if g:asyncrun_status == 'success'
      let g:asyncrun_status = ''
      if exists('s:asyncrun_running_timer')
        call timer_stop(s:asyncrun_running_timer)
        unlet s:asyncrun_running_timer
      endif
    endif
    if g:asyncrun_status == 'failure'
      if exists('s:asyncrun_running_timer')
        call timer_stop(s:asyncrun_running_timer)
        unlet s:asyncrun_running_timer
      endif
    endif
  endif
  let g:airline_section_error = g:asyncrun_status
  exec ':AirlineRefresh'
  redrawstatus!
  redraw
endfunction
autocmd User AsyncRunStart let s:asyncrun_running_timer =
      \ timer_start(1000, 'AsyncRunning', {'repeat': 100})


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimux  {{{1
" Plug 'benmills/vimux'

map <Leader>vxp normal! VimuxPromptCommand<CR>
map <Leader>vxl :VimuxRunLastCommand<CR>
map <Leader>vxi :VimuxInspectRunner<CR>
map <Leader>vxq :VimuxCloseRunner<CR>
map <Leader>vxk :VimuxInterruptRunner<CR>
map <Leader>vxz :call VimuxZoomRunner()<CR>

let g:VimuxHeight = "16"
let g:VimuxOrientation = "v"
let g:VimuxPromptString = "(tmux)$ "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" calendar  {{{1
" Plug 'itchyny/calendar.vim'
" let g:calendar_frame = 'default'
" let g:calendar_cache_directory = simplify(expand($VIMCACHE.'/calendar'))
" Plug 'mattn/calendar-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'iamcco/markdown-preview.vim'
" :MarkdownPreview
" :MarkdownPreviewStop
if $MACOS
  let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
else
  let g:mkdp_path_to_chrome = "google-chrome"
  " let g:mkdp_path_to_chrome = "chromium-browser"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim markdown  {{{1
" 较大文件会导致中文输入极其缓慢
" Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_frontmatter=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" suan/vim-instant-markdown
" 可在浏览器中实时预览正在编写的MD文档
" 安装需要node.js


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-vim-instant-markdown   {{{1
" python markdown实时预览，与其它markdown syntax冲突
" :Instantmd
" Plug 'isnowfy/python-vim-instant-markdown'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZoomWin  {{{1
" Plug 'vim-scripts/ZoomWin'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EnhancedDiff {{{1
" Plugin 'chrisbra/vim-diff-enhanced'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xml.vim  {{{1
" Plug 'othree/xml.vim'
" auto close tag
":help xml-plugin
"<para>|   ==>  <para>|</para>
"<para>>|  ==>  <para>\n..|\n</para>
"LocalLeader is '\'
"<LocalLeader> d or D del tags or with contant
"<LocalLeader> % jump to the matching tag
" let xml_tag_completion_map = "<C-l>"
let g:xml_warn_on_duplicate_mapping = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'gabrielelana/vim-markdown'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lage file   {{{1
" Plug 'vim-scripts/LargeFile'
let g:LargeFile=9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" timestamp   {{{1
" Plug 'icersong/timestamp.vim'
"@ Modified: 2014-09-09 00:00:00 [0]
let g:timestamp_regexp = '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)@<='
let g:timestamp_regexp .= '(\d{4}[-/]\d{2}[-/]\d{2}|\d{4}[-/]\d{2}[-/]\d{2} \d{2}:\d{2}:\d{2}|TIMESTAMP)'
let g:timestamp_regexp .= '\s*(\[(\d+)\])?$'
let g:timestamp_rep = '\=strftime("%Y-%m-%d").(submatch(2)==submatch(9) ? "" : " [".(submatch(3)+1)."]")'
let g:timestamp_modelines = 9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto load plugin's config while plug valid

call LoadConfigures($CONFROOT, g:plugs_order)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10 00:00:00
" Modified: 2016-01-23 21:11:54 [1176]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle  {{{1

set nocompatible                " be improved
filetype off                    " required!

" Variables
let $VIM_BUNDLE_PATH = $VIMFILES.'/bundle'
let $GIT_LOCAL_URL = $VIMFILES.'/repostory'
let $VIMWIKI = $VIMFILES.'/wiki'
let $WEBROOT = '/Users/apple/Sites'
let s:no_python_support = "Vim is compiled without python support"
let s:no_ruby_support = "Vim is compiled without ruby support"

" initalize vundle
set rtp +=$VIMFILES/bundle/Vundle.vim
" call vundle#rc($VIM_BUNDLE_PATH)
call vundle#begin($VIM_BUNDLE_PATH)

" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'
"filetype plugin indent on       " required!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Bundles here:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" screen saver {{{1
Bundle 'uguu-org/vim-matrix-screensaver'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" recover swap file {{{1
Bundle 'chrisbra/Recover.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start page {{{1
Bundle 'mhinz/vim-startify'
let g:startify_session_dir = $VIMCACHE.'session'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bundle 'Lokaltog/vim-powerline'
"  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-powerline'))))
"    "set t_Co=256
"    set laststatus=2
"    let g:Powline_symbols='fancy'
"    "let g:Powerline_cache_dir = g:iswindows ? $VIM.'/cache/powerline' : '~/.vim/cache/powerline'
"    let g:Powerline_cache_dir = simplify(expand($VIMCACHE.'/powerline'))
"  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline   {{{1
Bundle 'bling/vim-airline'
  " git need plugin https://github.com/tpope/vim-fugitive
  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-airline'))))
    set laststatus=2
    let g:airline_theme = "dark"
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_extensions = ['branch', 'tabline', 'syntastic', 'whitespace', 'tagbar']
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#fnamemod = ':p:t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s:'
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#tagbar#enabled = 1
    " autocmd BufEnter <buffer> AirlineRefresh
  " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme  {{{1
Bundle 'altercation/vim-colors-solarized'
  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-colors-solarized'))))
    " let g:solarized_termcolors = 256
    " let g:solarized_termtrans  = 1
    " let g:solarized_degrade    = 1
    let g:solarized_contrast   = "high"
    let g:solarized_visibility = "high"
    let g:solarized_termtrans  = 1
    let g:solarized_contrast   = "normal"
    let g:solarized_visibility = "normal"
    if has('gui_running')
      set background=dark
    endif
  " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" molokai theme  {{{1
Bundle 'tomasr/molokai'
  if !has('gui_running')
    if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/molokai'))))
      let g:molokai_original = 1
      set background=dark
    endif
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree  {{{1
Bundle "scrooloose/nerdtree"
nmap <leader>nt :NERDTree<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home=$VIMCACHE.'/NERDTree'
"close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | :bd<cr> | end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SrcExpl   {{{1
Bundle 'wesleyche/SrcExpl'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
" powerful than CtrlP|ACK ...
if version > 702
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/neomru.vim'
let g:unite_data_directory = $VIMCACHE.'/unite'
let g:unite_no_default_keymapping = 1
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_prompt = '» '
let g:unite_split_rule = 'botright'
let g:unite_ignore_source_files = ['function.vim', 'command.vim']
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <silent><c-s> :Unite -auto-resize file file_mru file_rec<cr>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grep
" Search file content
Bundle 'vim-scripts/grep.vim'
let Grep_Skip_Files = '*.bak *~'
" let Grep_Default_Options = '-rli'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP {{{1
" Bundle 'kien/ctrlp.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'FelikZ/ctrlp-py-matcher'

  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/ctrlp.vim'))))
    map <F1> <c-p>
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMRU'
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn)|cache)$',
      \ 'file': '\v\.(exe|so|dll|png|jpg|bin)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }
    "if g:ismacos || g:islinux
    "  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*           " Linux/MacOSX
    "  set wildignore+=*/tmp/*,*.so,*.swp,*.zip            " MacOSX/Linux
    "  set wildignore+=*/.cache/*,.cache/*
    "  set wildignore+=*/Caches/*,Caches/*
    "  let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
    "endif
    "if g:iswindows
    "  set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*     " Windows ('noshellslash')
    "  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe         " Windows
    "  let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
    "endif
    nmap <leader>f :CtrlP<CR>
  " endif

  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'haya14busa/incsearch.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl   {{{1
" Bundle "fholgado/minibufexpl.vim"
" Bundle "techlivezheng/vim-plugin-minibufexpl"
"   " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-plugin-minibufexpl'))))
"     let g:did_minibufexplorer_syntax_inits = 1
"     "hi MBENormal               guifg=#808080 guibg=fg
"     "hi MBEChanged              guifg=#CD5907 guibg=fg
"     "hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
"     "hi MBEVisibleChanged       guifg=#F1266F guibg=fg
"     hi MBEVisibleActiveNormal  guifg=#0000FF guibg=#FFFF00
"     hi MBEVisibleActiveChanged guifg=#FF0000 guibg=#FFFF00
"     let g:miniBufExplUseSingleClick = 1
"     let g:miniBufExplCloseOnSelect = 1
"     let g:miniBufExplorerAutoStart = 0
"     let g:miniBufExplBuffersNeeded = 1
"   " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VOoM  {{{1
Bundle 'vim-voom/VOoM'
  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/VOoM'))))
    let g:voom_tree_placement = "right"
    let g:voom_tree_width = 40
    let g:voom_tab_key = "<C-Tab>"
  " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses   {{{1
" high light parentheses with different color
Bundle 'rainbow_parentheses.vim'
if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/rainbow_parentheses.vim'))))
  let g:rbpt_loadcmd_toggle = 0
  autocmd VimEnter * nested :RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion  {{{1
" fast jump to after current, \\f<char>
Bundle 'Lokaltog/vim-easymotion'
  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-easymotion'))))
    let g:EasyMotion_leader_key = ";"
  " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Indent guides   {{{1
" 依靠背景色显示缩进效果，速度比Indent line慢，且显示效果不佳
" Bundle 'nathanaelkane/vim-indent-guides'
"   " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-indent-guides'))))
"     let g:indent_guides_enable_on_vim_startup = 1
"     let g:indent_guides_guide_size = 1
"   " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent line {{{1
Bundle 'Yggdroot/indentLine'
let g:indentLine_maxLines = 64
let g:indentLine_faster = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips   {{{1
if has('python')
Bundle 'honza/vim-snippets'
Bundle 'SirVer/ultisnips'
  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/ultisnips'))))
    let g:UltiSnipsEditSplit='vertical'
    "let g:UltiSnips = {}
    let g:UltiSnipsListSnippets = '<C-L>'
    "let g:UltiSnipsExpandTrigger = '<Tab>'
    "let g:UltiSnipsJumpForwardTrigger = '<Tab>'
    "let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
    let g:UltiSnipsExpandTrigger="<C-J>"
    let g:UltiSnipsJumpForwardTrigger="<C-J>"
    let g:UltiSnipsJumpBackwardTrigger="<C-K>"
    let g:UltiSnipsSnippetsDir=simplify(expand($VIMFILES.'/vimrc/snippets/UltiSnips'))
    let g:UltiSnipsSnippetDirectories=[simplify(expand($VIM_BUNDLE_PATH.'/vim-snippets/UltiSnips'))]
  endif
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic   {{{1
" check syntax for all language while write file.
Bundle 'scrooloose/syntastic'
  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/syntastic'))))
    let g:syntastic_error_symbol        = "✘"
    let g:syntastic_warning_symbol      = "⚠"
    let g:syntastic_style_error_symbol  = "✗"
    let g:syntastic_style_warning_symbol= "◬"
    let g:syntastic_aggregate_errors    = 1
    let g:syntastic_auto_loc_list       = 1
    let g:syntastic_auto_jump           = 0
    let g:syntastic_loc_list_height     = 3
    let g:syntastic_ignore_files        = ['.*\.log$']
    let g:syntastic_html_checkers       = ['tidy']  " 'jshint', 'jslint'
    let g:syntastic_xhtml_checkers      = ['tidy']
    let g:syntastic_javascript_checkers = ['jsl']
    let g:syntastic_python_checkers     = ['pyflakes', 'pep8']
    let g:syntastic_xml_checkers        = ['xmllint']
    let g:syntastic_python_pep8_quiet_messages={"regex": [
        \ '^E111', '^E127', '^E128', '^E401', '^E402', '^E501', '^E701', '^E731', '^C901'] }
    let g:syntastic_javascript_jsl_quiet_messages={"regex":
        \ ['redeclaration of var',
        \ 'missing default case in switch statement',
        \ 'anonymous function does not always return a value',
        \ 'increment (++) and decrement (--) operators used as part of greater statement']}
    let g:syntastic_html_tidy_quiet_messages={"regex":
        \ ['unescaped & which should be written as &amp;']}
    let g:syntastic_xhtml_tidy_quiet_messages={"regex":
        \ ['unescaped & which should be written as &amp;']}
    if (g:iswindows)
      let $PATH=$VIM.'\\Utilities;'.$PATH
      let $PATH=$VIM.'\\Utilities\\GNU;'.$PATH
      let $PATH=$VIM.'\\Utilities\\jsl;'.$PATH
      let $PATH='C:\\Python27\\Scripts;'.$PATH
      let g:syntastic_mode_map = { 'mode': 'active',
          \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python'],
          \ 'passive_filetypes': [] }
    endif

    if (g:ismacos)
      " autocmd BufWritePost * :SyntasticCheck
      "let g:syntastic_python_pep8_exec = 'python /Library/Python/2.7/site-packages/pep8.pyc'
      let g:syntastic_mode_map = { 'mode': 'active',
          \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python'],
          \ 'passive_filetypes': [] }
    endif
  " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pyflakes    {{{1
" Bundle 'kevinw/pyflakes-vim'
Bundle 'icersong/pyflakes-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - AutoComplPop    {{{1
" Bundle 'icersong/AutoComplPop'
" let g:acp_enableAtStartup = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - YouCompleteMe   {{{1
" YCM windows install guides needed.
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
nmap <leader>jj :YcmCompleter GoTo<CR>
nmap <leader>jr :YcmCompleter GoToReferences<CR>
nmap <leader>jd :YcmCompleter GoToDefinition<CR>
nmap <leader>ji :YcmCompleter GoToDeclaration<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete   {{{1
if version > 702
Bundle 'Shougo/neocomplete.vim'
" if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/neocomplete'))))
"   if (filereadable(simplify(expand('$VIMFILES/vimrc/neocomplete.vim'))))
"     source $VIMFILES/vimrc/neocomplete.vim
"     inoremap <expr><C-N>  pumvisible() ?  "\<C-N>" : neocomplete#start_manual_complete()
"     inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"   endif
" endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-dict   {{{1
" usage: os.p<tab>
Bundle "rkulla/pydiction"
let g:pydiction_location = simplify(expand($VIM_BUNDLE_PATH.'/pydiction/complete-dict'))
let g:pydiction_menu_height = 9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim  {{{1
" jedi-vim is a is a VIM binding to the autocompletion library Jedi.
" 此插件会导致键入时迟缓，严重时会卡住
Bundle 'davidhalter/jedi-vim'
let g:jedi#auto_initialization      = 0
let g:jedi#auto_vim_configuration   = 0
let g:jedi#use_tabs_not_buffers     = 0
let g:jedi#use_splits_not_buffers   = 1
let g:jedi#completions_enabled      = 0
let g:jedi#popup_select_first       = 1
let g:jedi#popup_on_dot             = 1
let g:jedi#auto_close_doc           = 1
" let g:jedi#completions_command      = "<C-N>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python rope vim   {{{1
" Bundle "python-rope/ropevim"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-auto-indent    {{{1
Bundle "hynek/vim-python-pep8-indent"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autopep8    {{{1
" : Autopep8 [--range 1 5]
" : call Autopep8(" --range 1 5")
Bundle "tell-k/vim-autopep8"
" let g:autopep8_indent_size=4
" let g:autopep8_ignore="E501,W293"
" let g:autopep8_select="E501,W293"
let g:autopep8_pep8_passes=99
let g:autopep8_max_line_length=127
let g:autopep8_aggressive=0
let g:autopep8_disable_show_diff=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pydoc     {{{1
Bundle "fs111/pydoc.vim"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-mode   {{{1
" if has('python')
" Bundle 'klen/python-mode'
"   " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/python-mode'))))
"     let g:pymode_rope = 0
"     let g:pymode_rope_lookup_project = 1
"     let g:pymode_rope_autoimport = 1
"     let g:pymode_rope_autoimport_modules = ['os', 'sys', 'logging']
"     let g:pymode_rope_completion = 1
"     let g:pymode_rope_complete_on_dot = 0
"     " let g:pymode_rope_completion_bind = '<C-N>'
"     let g:pymode_lint = 0
"     let g:pymode_lint_unmodified = 1
"     let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"     let g:pymode_lint_ignore = "E401,E501,E701,E731,E111,C901"
"   " endif
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimpdb  {{{1
" ???.py
"   import pdb; pdb.set_trace()
"   import vimpdb; vimpdb.hookPdb()
" :PDB???
" Bundle 'gotcha/vimpdb'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - xmledit   {{{1
"Bundle 'othree/xml.vim'
"Bundle 'vim-scripts/xmledit'
"Bundle 'tpope/vim-ragtag'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- vim-project     {{{1
" Bundle 'hemerey/vim-project'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html/css tools  {{{1
" fast create xml css html
" eg: root>elememnt#property*3>default<ctrl-y>,
Bundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType css,xml,html,xhtml,tpl EmmetInstall


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-syntax  {{{1
Bundle 'hdima/python-syntax'
let python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" css color #RGB <color>    {{{1
Bundle 'chrisbra/Colorizer'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jinja2 highlight  {{{1
Bundle 'Glench/Vim-Jinja2-Syntax'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript regex color  {{{1
" :ColorHighLight
Bundle 'slevithan/regex-colorizer'
autocmd FileType javascript,html,css ColorHighlight


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript indentation and syntax     {{{1
" Vastly improved Javascript indentation and syntax support in Vim
Bundle 'pangloss/vim-javascript'
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'othree/html5.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" json    {{{1
Bundle 'leshill/vim-json'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SQL   {{{ 1
" Align {{{ 1
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/SQLUtilities'
Bundle 'vim-scripts/SQLComplete.vim'
let g:sqlutil_align_where = 1
let g:sqlutil_align_comma = 1
let g:sqlutil_align_first_word = 1
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_wrap_expressions = 1
let g:sqlutil_default_menu_mode = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" matchit   {{{1
" The matchit.vim script allows you to configure % to match more than just single characters.
Bundle 'vim-scripts/matchit.zip'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TaskList.vim {{{1
" It will search the file for FIXME, TODO, and XXX ...
Bundle 'vim-scripts/TaskList.vim'
map <leader>tl <Plug>TaskList


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better-whitespace {{{1
" improve from trailing-whitespace
" :StripWhitespace
Bundle 'ntpeters/vim-better-whitespace'
if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-better-whitespace'))))
  autocmd FileType javascript,c,cpp,java,html,python,vim autocmd BufWritePre <buffer> StripWhitespace
  let g:better_whitespace_filetypes_blacklist=['text', 'rich']
  highlight ExtraWhitespace ctermbg=DarkGray
endif

" ---- trailing-whitespace  ----
" :FixWhitespace
" Bundle 'bronson/vim-trailing-whitespace'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" repeat  {{{1
Bundle 'tpope/vim-repeat'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gundo (visualize undo tree) {{{1
Bundle 'sjl/gundo.vim'
if !has("python")
  call janus#disable_plugin("gundo", s:no_python_support)
else
  let g:gundo_close_on_revert = 1
  let g:gundo_tree_statusline = 'Gundo'
  let g:gundo_width = 45
  let g:gundo_preview_height = 11
  let g:gundo_right = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent-object   {{{1
" select object by indent
" vii, viI, vai, vaI,
Bundle 'michaeljsmith/vim-indent-object'
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
Bundle 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand-region {{{1
" select region by key "+" & "-"
Bundle 'terryma/vim-expand-region'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Raimondi/delimitMate {{{1
" automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'
" for python docstring "
au FileType python let b:delimitMate_nesting_quotes = ['"']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter   {{{1
" <leader>cc add common
" <leader>cu remove common
" Bundle 'scrooloose/nerdcommenter'
Bundle 'icersong/nerdcommenter'
let NERDSpaceDelims = 1
let NERDCreateDefaultMappings = 'OFF'
" vmap <BS> <plug>NERDCommenterToggle gv
vmap <BS> <plug>NERDCommenterToggle gv
nmap <BS> <plug>NERDCommenterToggle
vmap <leader>cc <plug>NERDCommenterAlignBoth gv
nmap <leader>cu <plug>NERDCommenterUncomment gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" author info   {{{1
Bundle 'vim-scripts/AuthorInfo'
let g:vimrc_author='icersong'
let g:vimrc_email='icersong@gmail.com'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NrrwRgn  {{{1
Bundle 'chrisbra/NrrwRgn'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multiple-cursors  {{{1
Bundle 'terryma/vim-multiple-cursors'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoVim  {{{1
Bundle 'FredKSchott/CoVim'
let CoVim_default_name = "icersong"
let CoVim_default_port = "8888"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - taglist   {{{1
" Bundle 'vim-scripts/taglist.vim'
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
Bundle 'majutsushi/tagbar'
if !executable("ctags")
  if exists('janus#disable_plugin')
    call janus#disable_plugin("tagbar", "The ctags program is not installed")
  endif
else
  nmap <Leader>tb :TagbarToggle<CR>
  "let g:tagbar_ctags_bin='/usr/bin/ctags'
  let g:tagbar_width=30
  let g:tagbar_autoclose = 2
  let g:tagbar_autofocus = 1
  let g:tagbar_show_linenumbers = 1
  let g:tagbar_singleclick = 1
  "autocmd BufReadPost *.cpp,*.c,*.h,*.py call tagbar#autoopen()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffergator {{{1
Bundle 'jeetsukumaran/vim-buffergator'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VCS   {{{1
Bundle 'vim-scripts/vcscommand.vim'
if (g:iswindows)
  let g:VCSCommandSVNExec="D:\\PROGRA~1\\TORTOI~1\\bin\\svn.exe"
  let g:VCSCommandVCSTypeOverride= [['D:/tmp', 'SVN'], ['D:/MyWork', 'SVN']]
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive   {{{1
" git wapper
Bundle 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
nnoremap ,gl :silent! Glog -1<CR>:copen 33<CR><C-W>p:silent! Glog<CR><C-W>p
nnoremap ,gL :!git --no-pager log --oneline --decorate --graph -40 %<CR>
" nnoremap <space>ga :Git add %:p<CR><CR>
" nnoremap <space>gs :Gstatus<CR>
" nnoremap <space>gc :Gcommit -v -q<CR>
" nnoremap <space>gt :Gcommit -v -q %:p<CR>
" nnoremap <space>gd :Gdiff<CR>
" nnoremap <space>ge :Gedit<CR>
" nnoremap <space>gr :Gread<CR>
" nnoremap <space>gw :Gwrite<CR><CR>
" nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <space>gp :Ggrep<Space>
" nnoremap <space>gm :Gmove<Space>
" nnoremap <space>gb :Git branch<Space>
" nnoremap <space>go :Git checkout<Space>
" nnoremap <space>gps :Dispatch! git push<CR>
" nnoremap <space>gpl :Dispatch! git pull<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
" git display on ruler
" GitGutterDisable
" GitGutterEnable

Bundle 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
function! Gitgutter_Disabled_in_Largefile()
  if line2byte(line("$")+1) > g:LargeFile*1024*1024
    call gitgutter#disable()
    " call gitgutter#enable()
  endif
endfunction
autocmd BufRead * silent call Gitgutter_Disabled_in_Largefile()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature  {{{1
" virtual mark
Bundle 'kshenoy/vim-signature'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-vinegar  {{{1
Bundle 'tpope/vim-vinegar'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw   {{{1
Bundle 'eiginn/netrw'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commandline complete  {{{1
Bundle 'vim-scripts/CmdlineComplete'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" improved shell  {{{1
if version > 702
Bundle 'Shougo/vimshell.vim'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" calendar  {{{1
" Bundle 'itchyny/calendar.vim'
" let g:calendar_frame = 'default'
" let g:calendar_cache_directory = simplify(expand($VIMCACHE.'/calendar'))


Bundle 'mattn/calendar-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki  {{{1
" Bundle 'vimwiki/vimwiki'
Bundle 'icersong/vimwiki'
let g:vimwiki_list = [
  \ {'path': simplify(expand($VIMWIKI.'/technology')),
  \ 'path_html': simplify(expand($WEBROOT.'/wiki/technology')),
  \ 'css_name': '/style.css',
  \ 'template_ext': '.tpl',
  \ 'template_path': simplify(expand($VIMWIKI.'/templetes')),
  \ 'template_default': 'default.tpl',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'auto_export': 1,
  \ 'custom_wiki2html': simplify(expand($VIM_BUNDLE_PATH.'/vimwiki/bin/misaka_md2html.py')),
  \ 'diary_link_count': 5}
  \ ]

let g:vimwiki_debug = 0
let g:vimwiki_user_htmls = '404.html,search.html'
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
" 禁止添加vimwiki菜单到GUIVim菜单
let g:vimwiki_menu = ''
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
" 详见下文...
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZoomWin  {{{1
Bundle 'vim-scripts/ZoomWin'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EnhancedDiff {{{1
Plugin 'chrisbra/vim-diff-enhanced'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular  {{{1
Bundle 'godlygeek/tabular'
let g:tabular_loaded = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim markdown  {{{1
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lage file   {{{1
Bundle 'vim-scripts/LargeFile'
let g:LargeFile=9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" timestamp   {{{1
Bundle 'icersong/timestamp.vim'
  "@ Modified: 2014-09-09 00:00:00 [0]
  let g:timestamp_regexp = '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)@<='
  let g:timestamp_regexp .= '(\d{4}[-/]\d{2}[-/]\d{2} \d{2}:\d{2}:\d{2}|TIMESTAMP)'
  let g:timestamp_regexp .= '\s*(\[(\d+)\])?$'
  let g:timestamp_rep = '\=strftime("%Y-%m-%d %H:%M:%S").(submatch(2)==submatch(9) ? "" : " [".(submatch(3)+1)."]")'
  let g:timestamp_modelines = 9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-python-syntax {{{1
Bundle 'icersong/vim-python'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END  {{{1
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed
"

call vundle#end()
filetype plugin indent on
if has('gui_running')
  colorscheme solarized
else
  colorscheme molokai
endif

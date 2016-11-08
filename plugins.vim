"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10 00:00:00
" Modified: 2016-11-08 16:52:28 [1558]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle  {{{1

set nocompatible                " be improved
filetype off                    " required!

" Variables
let $VIM_BUNDLE_PATH = $VIMFILES.'/bundle'
let $GIT_LOCAL_URL = $VIMFILES.'/repostory'
let $VIM_TOOL_PATH = $VIMFILES.'/tools'
let $VIMWIKI = $VIMFILES.'/wiki'
let $WEBROOT = '/Users/apple/Sites'
let s:no_python_support = "Warning! Vim is compiled without python support."
let s:no_ruby_support = "Warning! Vim is compiled without ruby support."

" initalize vundle
set rtp +=$VIMFILES/bundle/Vundle.vim
" call vundle#rc($VIM_BUNDLE_PATH)
call vundle#begin($VIM_BUNDLE_PATH)

" let Bundle managed by Vundle
Bundle 'gmarik/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Bundles here:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" screen saver {{{1
" bug: When after run matrix, all other syntax gone.
Bundle 'uguu-org/vim-matrix-screensaver'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" recover swap file {{{1
Bundle 'chrisbra/Recover.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start page {{{1
Bundle 'mhinz/vim-startify'
let g:startify_session_dir = $VIMCACHE.'session'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline   {{{1
Bundle 'bling/vim-airline'
  " git need plugin https://github.com/tpope/vim-fugitive
  " if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-airline'))))
  set laststatus=2
  let g:airline_theme = "dark"
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_section_z = '%B %P %l/%L %v'
  let g:airline_section_z = '%B %P %l/%L %v'
  let g:airline_extensions = ['branch',
      \ 'tabline', 'syntastic', 'whitespace',
      \ 'tagbar', 'virtualenv']
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
  let g:airline#extensions#virtualenv#enabled = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let airline#extensions#tabline#ignore_bufadd_pat =
        \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree|vim-minimap'
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>0 <Plug>AirlineSelectTab10
  nmap <leader>- <Plug>AirlineSelectPrevTab
  nmap <leader>+ <Plug>AirlineSelectNextTab
  nmap <silent><c-h> <Plug>AirlineSelectPrevTab
  nmap <silent><c-l> <Plug>AirlineSelectNextTab
  " autocmd BufEnter <buffer> AirlineRefresh
  " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme  {{{1
Bundle 'altercation/vim-colors-solarized'
if has('gui_running')
  let g:solarized_contrast   = "high"
  let g:solarized_visibility = "high"
else
  " let g:solarized_termcolors = 256
  let g:solarized_contrast   = "high"
  let g:solarized_visibility = "high"
  let g:solarized_termtrans  = 1
  let g:solarized_degrade    = 1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim devicons  {{{1
" Bundle "ryanoasis/vim-devicons"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minimap   {{{1
Bundle "everin-lemaignan/vim-minimap"
" let g:minimap_highlight='Visual'
" let g:minimap_show='<leader>ms'
" let g:minimap_update='<leader>mu'
" let g:minimap_close='<leader>gc'
" let g:minimap_toggle='<leader>gt'


" minimap   {{{1
" Bundle "koron/minimap-vim"

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
nnoremap <silent><c-a> :UniteWithProjectDir -auto-resize file file_mru file_rec<cr>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepper
" Search file content
" eg: ,ag<cr>
"    ...> mhinz
"    ...> mhinz\\|bling
Bundle 'mhinz/vim-grepper'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag    {{{1
Bundle 'rking/ag.vim'
let g:ag_prg="ag --vimgrep --nocolor --nogroup --smart-case --ignore .git --ignore .svn --ignore .DS_Store"
let g:ag_working_path_mode="r"
let g:ag_format="%f:%l:%c:%m"
let g:ag_hightlight=1
" let g:ag_qhandler="copen"

" vim-action-ag   {{{1
" plugin for ag
Bundle 'Chun-Yang/vim-action-ag'
let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'


" ctrlsf    {{{1
" like ag.vim but show context with matches line
" CtrlSF [options] <patten> [path]
Bundle 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_close = 1
let g:ctrlsf_default_root = 'project+ww'
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'bottom'


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
    \ 'file': '\v\.(exe|so|dll|png|jpg|gif|zip|7z|gz|tgz|swp|bin)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
  " if g:ismacos || g:islinux
  "   set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
  "   let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
  " endif
  " if g:iswindows
  "   set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*     " Windows ('noshellslash')
  "   set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe         " Windows
  "   let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
  " endif
  if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
  nmap <leader>f :CtrlP<CR>
" endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch {{{1
" highlighting search results
Bundle 'haya14busa/incsearch.vim'
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


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
    " let g:syntastic_debug               = 33
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
    let g:syntastic_python_pyflakes_quiet_messages={"regex": [
        \ 'unable to detect undefined names$']}
    let g:syntastic_python_pep8_quiet_messages={"regex": [
        \ '^E111', '^E127', '^E128', '^E401', '^E402', '^E501', '^E701', '^E731', '^C901', '^E721']}
    let g:syntastic_javascript_jsl_quiet_messages={"regex":
        \ ['redeclaration of var',
        \ 'variable rid hides argument',
        \ 'missing default case in switch statement',
        \ 'missing break statement for last case in switch',
        \ 'anonymous function does not always return a value',
        \ 'function \{\w\}\+ does not always return a value',
        \ 'increment (++) and decrement (--) operators used as part of greater statement',
        \ 'unexpected end of line; it is ambiguous whether these lines are part of the same statement']}
    let g:syntastic_css_csslint_quiet_messages={
        \ "regex": ["^Duplicate property"]}
    let g:syntastic_html_tidy_quiet_messages={"regex":
        \ ['unescaped & which should be written as &amp;']}
    let g:syntastic_xhtml_tidy_quiet_messages={"regex":
        \ ['unescaped & which should be written as &amp;']}
    let g:syntastic_po_msgfmt_quiet_messages={"regex":
        \ ['header field ''Last-Translator'' still has the initial default value']}
    if (g:iswindows)
      let $PATH=$VIM.'\\Utilities;'.$PATH
      let $PATH=$VIM.'\\Utilities\\GNU;'.$PATH
      let $PATH=$VIM.'\\Utilities\\jsl;'.$PATH
      let $PATH='C:\\Python27\\Scripts;'.$PATH
      let g:syntastic_mode_map = { 'mode': 'active',
          \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python', 'xml'],
          \ 'passive_filetypes': [] }
    endif

    if (g:ismacos)
      " autocmd BufWritePost * :SyntasticCheck
      "let g:syntastic_python_pep8_exec = 'python /Library/Python/2.7/site-packages/pep8.pyc'
      let g:syntastic_mode_map = { 'mode': 'active',
          \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python', 'xml'],
          \ 'passive_filetypes': [] }
    endif
  " endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - AutoComplPop    {{{1
" Bundle 'icersong/AutoComplPop'
" let g:acp_enableAtStartup = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-virtualenv    {{{1
Bundle 'jmcantrell/vim-virtualenv'


" ----------------------------------------
" function to list virtualenvs
" change the directory path to point to your virtualenvs
fun ReturnVirtualEnvs(A,L,P)
  if g:ismacos
    return system("ls -d /Users/apple/.virtualenvs/*/ \| cut -d'/' -f5")
  endif
  if g:islinux
    return system("ls -d /root/.virtualenvs/*/ \| cut -d'/' -f5")
  endif
endfun

" changing virtualenv should restart ycmserver
" Venv <Virtualenv-name>
if g:ismacos
  command -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args> | YcmRestartServer
else
  command -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - YouCompleteMe   {{{1
" YCM windows install guides needed.
if g:ismacos
  Bundle 'Valloric/YouCompleteMe'
  let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
  highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
  highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
  nmap <leader>jj :YcmCompleter GoTo<CR>
  " nmap <leader>jr :YcmCompleter GoToReferences<CR>
  " nmap <leader>jd :YcmCompleter GoToDefinition<CR>
  " nmap <leader>ji :YcmCompleter GoToDeclaration<CR>
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif

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
let g:pymode_indent = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autopep8    {{{1
" : Autopep8 [--range 1 5]
" : call Autopep8(" --range 1 5")
Bundle "tell-k/vim-autopep8"
" let g:autopep8_indent_size=4
" let g:autopep8_ignore="E501,E701,W293"
" let g:autopep8_select="E501,E701,W293"
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
" coffee-script     {{{1
Bundle 'kchmck/vim-coffee-script'


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
" javascript indentation and syntax     {{{1
" Vastly improved Javascript indentation and syntax support in Vim
Bundle 'pangloss/vim-javascript'
let javascript_enable_domhtmlcss = 1
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
" Tabular  {{{1
Bundle 'godlygeek/tabular'
let g:tabular_loaded = 1


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
  autocmd FileType javascript,c,cpp,java,html,python,vim,tpl,css,jinja,markdown autocmd BufWritePre <buffer> StripWhitespace
  let g:better_whitespace_filetypes_blacklist=['text', 'rich', 'diff', 'gitcommit', 'unite', 'qf', 'help']
  highlight ExtraWhitespace ctermbg=Red
endif


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
" multiple-cursors  {{{1
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_insert_maps={'I':1, 'i':1, 'a':1, 'A':1}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand-region   {{{1
" select region by key "+" & "-"
Bundle 'terryma/vim-expand-region'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NrrwRgn   {{{1
" :NR      - Open the selected region in a new narrowed window
" :NW      - Open the current visual window in a new narrowed window
Bundle 'chrisbra/NrrwRgn'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoVim  {{{1
" It is for Collaborative Editing. But not stable
" if g:ismacos
"   Bundle 'FredKSchott/CoVim'
"   let CoVim_default_name = "icersong"
"   let CoVim_default_port = "8888"
" endif


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
" nnoremap ,gl :silent! Glog -1<CR>:copen 33<CR><C-W>p:silent! Glog<CR><C-W>
nnoremap ,gl :Glog --graph --pretty=format:%h\ %ai\ %an\ %s<CR>
nnoremap ,gL :!git --no-pager log --oneline --decorate --graph -40<CR>
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
" Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-tmux-navigator  {{{1
" Bundle "christoomey/vim-tmux-navigator"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun shell  {{{1
if version >= 800
Bundle "skywind3000/asyncrun.vim"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" calendar  {{{1
" Bundle 'itchyny/calendar.vim'
" let g:calendar_frame = 'default'
" let g:calendar_cache_directory = simplify(expand($VIMCACHE.'/calendar'))
Bundle 'mattn/calendar-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki  {{{1
Bundle 'icersong/vimwiki'
" Bundle 'vimwiki/vimwiki'

let g:vimwiki_list = [
  \ {
  \ 'path': simplify(expand($VIMWIKI.'/projects/technology')),
  \ 'path_html': simplify(expand($VIMWIKI.'/static/technology')),
  \ 'css_name': '/style.css',
  \ 'template_path': simplify(expand($VIMWIKI.'/templetes')),
  \ 'template_default': 'default',
  \ 'template_ext': '.tpl',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'auto_export': 1,
  \ 'auto_toc': 0,
  \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp', 'html': 'html',},
  \ 'custom_wiki2html': simplify(expand($VIM_TOOL_PATH.'/misaka_md2html/misaka_md2html.py')),
  \ 'diary_link_count': 5},
  \ {
  \ 'path': simplify(expand($VIMWIKI.'/projects/soc')),
  \ 'path_html': simplify(expand($VIMWIKI.'/static/soc')),
  \ 'css_name': 'css/style.css',
  \ 'template_path': simplify(expand($VIMWIKI.'/templetes')),
  \ 'template_default': 'default',
  \ 'template_ext': '.tpl',
  \ 'auto_export': 1,
  \ 'auto_toc': 1,
  \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp','html': 'html',},
  \ 'diary_link_count': 5}
  \ ]
let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_use_mouse = 1
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_user_htmls = '404.html,search.html'
let g:vimwiki_toc_header = 'Catalogue'
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 2
" 禁止添加vimwiki菜单到GUIVim菜单
let g:vimwiki_menu = ''
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
" 详见下文...
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1,nav'
" 是否开启按语法折叠  会让文件比较慢
" let g:vimwiki_folding = 'syntax'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZoomWin  {{{1
Bundle 'vim-scripts/ZoomWin'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EnhancedDiff {{{1
Plugin 'chrisbra/vim-diff-enhanced'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown  {{{1
Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'shell=sh']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'gabrielelana/vim-markdown'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim markdown  {{{1
" 较大文件会导致中文输入极其缓慢
" Bundle 'plasticboy/vim-markdown'
" let g:vim_markdown_frontmatter=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" suan/vim-instant-markdown
" 可在浏览器中实时预览正在编写的MD文档
" 安装需要node.js


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-vim-instant-markdown   {{{1
" python markdown实时预览，与其它markdown syntax冲突
" :Instantmd
" Bundle 'isnowfy/python-vim-instant-markdown'


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax enable
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set background=dark
  colorscheme solarized
endif

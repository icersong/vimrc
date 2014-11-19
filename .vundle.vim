"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10 00:00:00
" Modified: 2014-11-20 02:25:53 [557]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle  {{{1

set nocompatible                " be improved
filetype off                    " required!

let $VIM_BUNDLE_PATH = $VIMFILES.'/bundle'
let $GIT_LOCAL_URL = $VIMFILES.'/repostory'

" initalize vundle
set rtp +=$VIMFILES/bundle/vundle/
call vundle#rc($VIM_BUNDLE_PATH)

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"filetype plugin indent on       " required!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Bundles here:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" screen saver {{{1
Bundle 'uguu-org/vim-matrix-screensaver'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start page {{{1
Bundle 'mhinz/vim-startify'


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
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-airline'))))
    set laststatus=2
    let g:airline_theme                      = "dark"
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#fnamemod = ':p:t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s:'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_detect_whitespace = 0
    let g:airline_powerline_fonts = 0
    let g:airline_enable_branch = 1
    let g:airline_enable_syntastic = 1
    let g:airline_detect_paste = 1
    autocmd BufEnter <buffer> AirlineRefresh
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme  {{{1
Bundle 'altercation/vim-colors-solarized'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-colors-solarized'))))
    let g:solarized_termcolors = 256
    let g:solarized_contrast = "high"
    let g:solarized_visibility = "high"
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    if has('gui_running')
      set background=dark
      colorscheme solarized
    endif
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" molokai theme  {{{1
Bundle 'tomasr/molokai'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/molokai'))))
    let g:molokai_original = 1
    if !has('gui_running')
      set background=dark
      colorscheme molokai
    endif
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-syntax  {{{1
Bundle 'hdima/python-syntax'
let python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree  {{{1
Bundle "scrooloose/nerdtree"
nmap <leader>nt :NERDTree<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SrcExpl   {{{1
Bundle 'wesleyche/SrcExpl'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
" powerful than CtrlP|ACK ...
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/neomru.vim'
let g:unite_data_directory = $VIMCACHE.'/unite'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grep
Bundle 'yegappan/grep'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP {{{1
Bundle 'kien/ctrlp.vim'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/ctrlp.vim'))))
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
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl   {{{1
" Bundle "fholgado/minibufexpl.vim"
Bundle "techlivezheng/vim-plugin-minibufexpl"
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-plugin-minibufexpl'))))
    let g:did_minibufexplorer_syntax_inits = 1
    "hi MBENormal               guifg=#808080 guibg=fg
    "hi MBEChanged              guifg=#CD5907 guibg=fg
    "hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
    "hi MBEVisibleChanged       guifg=#F1266F guibg=fg
    hi MBEVisibleActiveNormal  guifg=#0000FF guibg=#FFFF00
    hi MBEVisibleActiveChanged guifg=#FF0000 guibg=#FFFF00
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplCloseOnSelect = 1
    let g:miniBufExplorerAutoStart = 0
    let g:miniBufExplBuffersNeeded = 1
  endif
noremap <silent><Left> :bp<CR>
noremap <silent><Right> :bn<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VOoM  {{{1
Bundle 'vim-voom/VOoM'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/VOoM'))))
    let g:voom_tree_placement = "right"
    let g:voom_tree_width = 40
    let g:voom_tab_key = "<C-Tab>"
  endif


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
  else
    "echo 'rainbo_parentheses plugin not found.'
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion  {{{1
" fast jump to after current, \\f<char>
Bundle 'Lokaltog/vim-easymotion'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-easymotion'))))
    let g:EasyMotion_leader_key = ";"
  else
    "echo 'easymotion plugin not found.'
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent guides   {{{1
" Bundle 'Yggdroot/indentLine'
Bundle 'nathanaelkane/vim-indent-guides'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-indent-guides'))))
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips   {{{1
if has('python')
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/ultisnips'))))
    let g:UltiSnipsEditSplit='vertical'
    "let g:UltiSnipsUsePythonVersion = 2
    "let g:UltiSnips = {}
    "let g:UltiSnipsExpandTrigger = '<Tab>'
    let g:UltiSnipsListSnippets = '<c-l>'
    "let g:UltiSnipsJumpForwardTrigger = '<Tab>'
    "let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
    let g:UltiSnipsExpandTrigger="<c-Enter>"
    let g:UltiSnipsJumpForwardTrigger="<c-Enter>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsSnippetsDir=simplify(expand($VIM_BUNDLE_PATH.'/vim-snippets/UltiSnips'))
    let g:UltiSnipsSnippetDirectories=[simplify(expand($VIM_BUNDLE_PATH.'/vim-snippets/UltiSnips'))]
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-mode   {{{1
Bundle 'klen/python-mode'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/python-mode'))))
    let g:pymode_rope = 0
    let g:pymode_rope_lookup_project = 1
    let g:pymode_rope_autoimport = 1
    let g:pymode_rope_autoimport_modules = ['os', 'sys', 'logging']
    let g:pymode_rope_completion = 1
    let g:pymode_rope_complete_on_dot = 1
    let g:pymode_rope_completion_bind = '<C-SPACE>'
    let g:pymode_lint = 0
    let g:pymode_lint_on_write = 1
    let g:pymode_lint_unmodified = 0
    let g:pymode_lint_checkers = ['pyflakes', 'pep8']
    let g:pymode_lint_ignore = "E501,E401,E701,E731,C901,E111"
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pyflakes    {{{1
Bundle 'kevinw/pyflakes-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic   {{{1
" check syntax for all language while write file.
Bundle 'scrooloose/syntastic'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/syntastic'))))
    let g:syntastic_error_symbol        = '✗'
    let g:syntastic_warning_symbol      = '⚠'
    let g:syntastic_enable_balloons     = 1
    let g:syntastic_check_on_open       = 0
    let g:syntastic_auto_loc_list       = 1
    let g:syntastic_auto_jump           = 2
    let g:syntastic_loc_list_height     = 3
    let g:syntastic_html_checkers       = ['tidy']  " 'jshint', 'jslint'
    let g:syntastic_xhtml_checkers      = ['tidy']
    let g:syntastic_javascript_checkers = ['jsl']
    let g:syntastic_python_checkers     = ['pep8', 'pyflakes']  " 'pyflakes', 'pep8'
    let g:syntastic_xml_checkers        = ['xmllint']
    let g:syntastic_python_pep8_quiet_messages={"regex": [
          \ '^E401', '^E501', '^E701', '^E731', '^E111', '^C901'] }
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
      let $PATH='C:\\python27\\scripts;'.$PATH
      let g:syntastic_mode_map = { 'mode': 'active',
                  \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python'],
                  \ 'passive_filetypes': [] }
    else
      " autocmd BufWritePost * :SyntasticCheck
      "let g:syntastic_python_pep8_exec = 'python /Library/Python/2.7/site-packages/pep8.pyc'
      let g:syntastic_mode_map = { 'mode': 'active',
                  \ 'active_filetypes': [],
                  \ 'passive_filetypes': ['python', 'javascript', 'html', 'xhtml', 'css'] }
    endif
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto complete plugin   {{{1
Bundle 'Shougo/neocomplete.vim'
if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/neocomplete'))))
  if (filereadable(simplify(expand('$VIMFILES/vimrc/neocomplete.vim'))))
    source $VIMFILES/vimrc/neocomplete.vim
  endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim  {{{1
" jedi-vim is a is a VIM binding to the autocompletion library Jedi.
Bundle 'davidhalter/jedi-vim'
let g:jedi#auto_initialization      = 1
let g:jedi#auto_vim_configuration   = 0
let g:jedi#use_tabs_not_buffers     = 1
let g:jedi#completions_enabled      = 1
let g:jedi#popup_select_first       = 1
let g:jedi#popup_on_dot             = 0
let g:jedi#auto_close_doc           = 1
let g:jedi#completions_command      = "<C-N>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - xmledit   {{{1
"Bundle 'othree/xml.vim'
"Bundle 'vim-scripts/xmledit'
"Bundle 'tpope/vim-ragtag'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html/css tools  {{{1
" fast create xml css html
" eg: root>elememnt#property*3>default<ctrl-y>,
Bundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType css,xml,html,xhtml,tpl EmmetInstall


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
" Bundle 'pangloss/vim-javascript'
" let javascript_enable_domhtmlcss = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" json    {{{1
Bundle 'leshill/vim-json'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SQL   {{{ 1
" Align {{{ 1
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/SQLUtilities'
let g:sqlutil_align_comma = 1
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_keyword_case = '\U'
" Bundle 'godlygeek/tabular'  " The featrues is same as Align


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - YouCompleteMe   {{{1
" YCM windows install guides needed.
" Bundle 'Valloric/YouCompleteMe'


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
" surround    {{{1
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
Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
let NERDCreateDefaultMappings = 'OFF'
vmap <BS> <plug>NERDCommenterAlignBoth
vmap <S-BS> <plug>NERDCommenterUncomment
vmap <C-BS> <plug>NERDCommenterUncomment
nmap <BS> <plug>NERDCommenterToggle
vmap <leader>cu <plug>NERDCommenterUncomment


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" author info   {{{1
Bundle 'vim-scripts/AuthorInfo'
let g:vimrc_author='icersong'
let g:vimrc_email='icersong@gmail.com'


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
nmap <Leader>tb :TagbarToggle<CR>
"let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = -1
let g:tagbar_singleclick = 1
"autocmd BufReadPost *.cpp,*.c,*.h,*.py call tagbar#autoopen()


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
" git display on ruler
Bundle 'airblade/vim-gitgutter'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim session   {{{1
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
  let g:loaded_session = 0
  let g:session_menu = 0
  let g:session_autosave = 'yes'
  let g:session_autoload = 'no'
  let g:session_command_aliases = 1
  let g:session_directory = simplify(expand($VIMCACHE.'/session'))
  " patch for compitable minibufexpl
  " let g:xolox#session#ignore_window_patterns = ['^\[unite\]', '^vimfiler\:', 'MiniBufExplorer']
  " let g:xolox#session#wipe_filetypes = ['unite', 'vimfiler']
  " let g:xolox#session#wipe_filetypes = [
  "   \ 'unite',
  "   \ { name: 'vimfiler', command: 'VimFilerExplorer' }
  "   \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature  {{{1
" virtual mark
Bundle 'kshenoy/vim-signature'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commandline complete  {{{1
Bundle 'vim-scripts/CmdlineComplete'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" improved shell  {{{1
Bundle 'xolox/vim-shell'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shell window    {{{1
Bundle 'vim-scripts/Conque-Shell'


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

filetype plugin indent on

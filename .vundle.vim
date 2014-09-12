"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10 00:00:00
" Modified: 2014-09-12 10:39:55 [186]
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
filetype plugin indent on       " required!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Bundles here:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_detect_whitespace          = 0
    let g:airline_powerline_fonts=1
    let g:airline_enable_branch=1
    let g:airline_enable_syntastic=1
    let g:airline_detect_paste=1
    au BufEnter * :AirlineRefresh
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized   {{{1
Bundle 'altercation/vim-colors-solarized'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-colors-solarized'))))
    let g:solarized_termcolors = 256
    let g:solarized_contrast = "high"
    let g:solarized_visibility = "high"
    set background=dark
    colorscheme solarized
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree  {{{1
Bundle "scrooloose/nerdtree"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SrcExpl   {{{1
Bundle 'wesleyche/SrcExpl'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP {{{1
Bundle 'kien/ctrlp.vim'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/ctrlp.vim'))))
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    "let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
    if g:ismacos || g:islinux
      let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
    endif
    if g:iswindows
      let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
    endif
    nmap <leader>f :CtrlP<CR>
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl   {{{1
" Bundle "fholgado/minibufexpl.vim"
Bundle "techlivezheng/vim-plugin-minibufexpl"
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-plugin-minibufexpl'))))
    "hi MBENormal               guifg=#808080 guibg=fg
    "hi MBEChanged              guifg=#CD5907 guibg=fg
    "hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
    "hi MBEVisibleChanged       guifg=#F1266F guibg=fg
    "hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
    "hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplCloseOnSelect = 0
    let g:miniBufExplorerAutoStart = 0
    let g:miniBufExplBuffersNeeded = 1
    if !has('gui_running')
        let g:miniBufExplorerAutoStart = 0
    endif
  endif


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
Bundle 'rainbow_parentheses.vim'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/rainbow_parentheses.vim'))))
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * nested :RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
  else
    "echo 'rainbo_parentheses plugin not found.'
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent guides   {{{1
Bundle 'nathanaelkane/vim-indent-guides'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/vim-indent-guides'))))
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips   {{{1
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/ultisnips'))))
    let g:UltiSnipsExpandTrigger='<c-s>'
    let g:UltiSnipsJumpForwardTrigger='c-s'
    let g:UltiSnipsJumpBackwardTrigger='c-s-s'
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-mode   {{{1
Bundle 'klen/python-mode'
  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/python-mode'))))
    let g:pymode_rope = 1
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
    let g:syntastic_check_on_open=1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_auto_jump = 2
    let g:syntastic_loc_list_height = 3
    let g:syntastic_html_checkers=['tidy']  " 'jshint', 'jslint'
    let g:syntastic_xhtml_checkers=['tidy']
    let g:syntastic_javascript_checkers=['jsl']
    let g:syntastic_python_checkers=['pep8', 'pyflakes']  " 'pyflakes', 'pep8'
    let g:syntastic_xml_checkers=['xmllint']
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
      let $PATH=$VIM.'/Utilities/;'.$PATH
      let $PATH=$VIM.'/Utilities/GNU/;'.$PATH
      let $PATH=$VIM.'/Utilities/jsl/;'.$PATH
      let $PATH=$PATH.';c:/python27/scripts'
      let g:syntastic_mode_map = { 'mode': 'active',
                  \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python'],
                  \ 'passive_filetypes': [] }
    else
      au BufWritePost * :SyntasticCheck
      "let g:syntastic_python_pep8_exec = 'python /Library/Python/2.7/site-packages/pep8.pyc'
      let g:syntastic_mode_map = { 'mode': 'active',
                  \ 'active_filetypes': [],
                  \ 'passive_filetypes': ['python', 'javascript', 'html', 'xhtml', 'css'] }
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
let g:jedi#popup_select_first       = 0
let g:jedi#popup_on_dot             = 0
let g:jedi#auto_close_doc           = 1
let g:jedi#completions_command      = "<C-N>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-colors-solarized  {{{1
" code highlight
"Bundle 'altercation/vim-colors-solarized'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xml   {{{1
"Bundle 'othree/xml.vim'
Bundle 'vim-scripts/xmledit'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html/css tools  {{{1
"Bundle 'mattn/emmet-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" css color #RGB <color>    {{{1
Bundle 'chrisbra/Colorizer'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jinja2 highlight  {{{1
Bundle 'Glench/Vim-Jinja2-Syntax'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript regex color  {{{1
Bundle 'slevithan/regex-colorizer'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" json    {{{1
Bundle 'leshill/vim-json'
autocmd BufNewFile,BufRead,BufReadPre *.json set filetype=json


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SQL   {{{1
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/SQLUtilities'
let g:sqlutil_align_comma = 1
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_keyword_case = '\U'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto complete plugin   {{{1
"Bundle 'Shougo/neocomplete.vim'
"Bundle 'Shougo/neocomplcache.vim'
"  " CTRL-N,CTRL-P
"  if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/neocomplcache.vim'))))
"    au VimEnter * nested NeoComplCacheEnable
"    source <sfile>:p:h/.neocomplcache.vim
"  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe   {{{1
" YCM windows install guides needed.
"Bundle 'Valloric/YouCompleteMe'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" matchit   {{{1
" The matchit.vim script allows you to configure % to match more than just single characters.
Bundle 'vim-scripts/matchit.zip'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" repeat  {{{1
Bundle 'tpope/vim-repeat'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" surround    {{{1
Bundle 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto close   {{{1
"Bundle 'Townk/vim-autoclose'
"    let g:AutoClosePairs = ""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter   {{{1
Bundle 'scrooloose/nerdcommenter'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" author info   {{{1
Bundle 'vim-scripts/AuthorInfo'
let g:vimrc_author='icersong'
let g:vimrc_email='icersong@gmail.com'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist   {{{1
Bundle 'vim-scripts/taglist.vim'
" $ctags -R . 在当前目录下递归生成tags文件


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VCS   {{{1
Bundle 'vim-scripts/vcscommand.vim'
  if (g:iswindows)
    let g:VCSCommandSVNExec="D:\\PROGRA~1\\TORTOI~1\\bin\\svn.exe"
    let g:VCSCommandVCSTypeOverride= [['D:/tmp', 'SVN'], ['D:/MyWork', 'SVN']]
  endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim session   {{{1
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
  let g:session_menu = 0
  let g:session_autosave = 'yes'
  let g:session_autoload = 'yes'
  let g:session_command_aliases = 1
  let g:session_directory = simplify(expand($VIMCACHE.'/session'))


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

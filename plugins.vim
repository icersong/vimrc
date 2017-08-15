"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10
" Modified: 2017-08-15
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:enable_youcompleteme = 0
let g:enable_neocomplete = 0
let g:enable_pydiction = 0
let g:enable_jedi = 0
let g:enable_ropevim = 0

if g:ismacos
  let g:enable_youcompleteme = 1
else
  let g:enable_neocomplete = 1
  let g:enable_pydiction = 1
  let g:enable_jedi = 1
endif

" Variables
let $VIM_PLUGING_PATH = simplify(expand($VIMFILES.'/plugins'))
let $GIT_LOCAL_URL = simplify(expand($VIMFILES.'/repostory'))
let $VIM_TOOL_PATH = simplify(expand($VIMFILES.'/tools'))
let $VIMWIKI = simplify(expand($VIMFILES.'/wiki'))
let $WEBROOT = '/Users/apple/Sites'
let s:no_python_support = "Warning! Vim is compiled without python support."
let s:no_ruby_support = "Warning! Vim is compiled without ruby support."

" if has('nvim') && g:ismacos
"   set shell=/bin/bash
"   let g:python_host_skip_check = 1
"   let g:python_host_prog = simplify(expand('~/.virtualenvs/py2.7/bin/python'))
"   let g:python3_host_prog = '/usr/local/bin/python3'
"   let g:loaded_python_provider = 1
"   let g:loaded_python3_provider = 1
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function for test command is exists
function! HasCmdValid(cmd)
  if g:iswin
    return executable(a:cmd)
  endif
  if g:islinux
    return executable(a:cmd)
  endif
  if g:ismacos
    let cc = execute('command ' . a:cmd)
    if len(matchstr(cc, ' '.a:cmd.' '))
      return 1
    endif
  endif
  return 0
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs {{{1

" initalize vundle
let $PLUGPATH = simplify(expand($VIMFILES.'/plugins/vim-plug'))
set rtp+=$PLUGPATH
call plug#begin($VIM_PLUGING_PATH)

Plug 'CodeFalling/fcitx-vim-osx'
Plug 'junegunn/vim-plug'
" Plug 'uguu-org/vim-matrix-screensaver'
Plug 'chrisbra/Recover.vim'
Plug 'mhinz/vim-startify'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
" Plug 'ryanoasis/vim-devicons'
Plug 'severin-lemaignan/vim-minimap'
" Plug 'koron/minimap-vim'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
" Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mhinz/vim-grepper'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'dyng/ctrlsf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'vim-voom/VOoM'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'tmhedberg/SimpylFold'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips', {'for': ['c', 'cpp', 'javascript', 'python']}
Plug 'scrooloose/syntastic'
if has('nvim')
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',
        \ 'for': ['c', 'cpp', 'css', 'html'] }
  Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',
        \ 'for': ['c', 'cpp', 'css', 'html', 'python'] }
  Plug 'davidhalter/jedi-vim', { 'for': ['None'] }
endif
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/neomru.vim'
if has('nvim')
  Plug 'Shougo/vimshell.vim', {'for': ['None']}
  command! -nargs=0 VimShell :e term://zsh
  tnoremap <Esc> <C-\><C-n>
else
  Plug 'Shougo/vimshell.vim'
endif
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim', { 'for': ['c', 'cpp', 'python', 'php'] }
Plug 'jmcantrell/vim-virtualenv', { 'for': ['python'] }
" Plug 'rkulla/pydiction', { 'for': ['python'] }
" Plug 'python-rope/ropevim', { 'for': ['python'] }
Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
Plug 'tell-k/vim-autopep8', { 'for': ['python'] }
Plug 'fs111/pydoc.vim', {'for': ['python'] }
" Plug 'gotcha/vimpdb'
Plug 'othree/xml.vim', { 'for': ['xml', 'html', 'xhtml', 'jinja']}
" Plug 'hemerey/vim-project'
" Plug 'chrisbra/Colorizer', { 'for': ['css', 'html', 'javascript', 'jinja', 'python'] }
Plug 'gko/vim-coloresque', { 'for': ['css', 'html', 'javascript', 'jinja', 'python', 'vim'] }
Plug 'hdima/python-syntax', { 'for': ['python'] }
Plug 'icersong/vim-python', { 'for': ['python'] }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2'] }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['xml', 'htm', 'html', 'xhtml'] }
Plug 'othree/html5.vim', { 'for': ['htm', 'html', 'xhtml'] }
Plug 'leshill/vim-json', { 'for': ['json'] }
Plug 'vim-scripts/Align'
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/TaskList.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'sjl/gundo.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/AuthorInfo'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'chrisbra/NrrwRgn'
" Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/vcscommand.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'joonty/vdebug', {'for': ['python', 'php']}
" Plug 'tpope/vim-vinegar'
" Plug 'eiginn/netrw'
Plug 'vim-scripts/CmdlineComplete'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'skywind3000/asyncrun.vim'
" Plug 'itchyny/calendar.vim'
Plug 'mattn/calendar-vim'
Plug 'icersong/vimwiki'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
" Plug 'plasticboy/vim-markdown'
" Plug 'suan/vim-instant-markdown'
" Plug 'isnowfy/python-vim-instant-markdown'
" Plug 'gabrielelana/vim-markdown'
Plug 'vim-scripts/ZoomWin'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'vim-scripts/LargeFile'
Plug 'icersong/timestamp.vim'
" Plug 'git://git.wincent.com/command-t.git'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start page {{{1
" Plug 'mhinz/vim-startify'
let g:startify_session_dir = $VIMCACHE.'/session'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline   {{{1
" g ctrl-g 可显示选中字符数量信息
" Plug 'bling/vim-airline'
set laststatus=2
let g:airline_theme = "dark"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_z = '%B %P %l/%L %v'
let g:airline_extensions = ['branch',
    \ 'tabline', 'syntastic', 'whitespace',
    \ 'tagbar', 'virtualenv', 'unite']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let airline#extensions#tabline#ignore_bufadd_pat =
      \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree|vim-minimap|DebuggerWatch|[No Name]'
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_idx_format = {
"       \ '0': '⁰', '1': '¹', '2': '²', '3': '³', '4': '⁴',
"       \ '5': '⁵', '6': '⁶', '7': '⁷', '8': '⁸', '9': '⁹'}
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme  {{{1
" Plug 'altercation/vim-colors-solarized'
let g:solarized_hitrail          = 1
let g:solarized_menu             = 0
if has('gui_running')
  let g:solarized_contrast   = "normal"
  let g:solarized_visibility = "normal"
else
  let g:solarized_termcolors = 256
  let g:solarized_contrast   = "normal"
  let g:solarized_visibility = "normal"
  let g:solarized_termtrans  = 1
  let g:solarized_degrade    = 1
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
nmap <leader>nt :NERDTree<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 48
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home=$VIMCACHE.'/NERDTree'
"close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | :bd<cr> | end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP {{{1
" Plug 'kien/ctrlp.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'FelikZ/ctrlp-py-matcher'

map <F1> <c-p>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|cache)$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|gif|zip|7z|gz|tgz|swp|bin)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
if HasCmdValid('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" if g:ismacos || g:islinux
"   set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
"   let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" endif
" if g:iswin
"   set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*     " Windows ('noshellslash')
"   set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe         " Windows
"   let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Numbers {{{1
" Plug 'myusuf3/numbers.vim'

let g:numbers_exclude = ['nerdtree', 'unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m']
autocmd VimEnter * NumbersDisable


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
if HasCmdValid('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif HasCmdValid('ack')
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepper   {{{1
" Search file content
" eg: ,ag<cr>
"    ...> mhinz
"    ...> mhinz\\|bling
" Plug 'mhinz/vim-grepper'
let g:grepper           = {}
let g:grepper.tools     = ['ag', 'git', 'grep']
let g:grepper.open      = 1
let g:grepper.jump      = 0
let g:grepper.next_tool = '<leader>g'
" let g:grepper.ag = { 'grepprg': 'ag --vimgrep --' }
nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag    {{{1
" Plug 'rking/ag.vim'
let g:ag_prg="ag --vimgrep --nocolor --nogroup --smart-case --ignore .git --ignore .svn --ignore .DS_Store"
let g:ag_working_path_mode="r"
let g:ag_format="%f:%l:%c:%m"
let g:ag_hightlight=1
" let g:ag_qhandler="copen"

" vim-action-ag   {{{1
" Normal Mode
"   gagiw to search the word
"   gagi' to search the words inside single quotes.
" Visual Mode
"   gag to search the selected text
" Plug 'Chun-Yang/vim-action-ag'
let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'


" ctrlsf    {{{1
" like ag.vim but show context with matches line
" CtrlSF [options] <patten> [path]
" Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_close = 1
let g:ctrlsf_default_root = 'project+ww'
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_context = '-B 0 -A 0'
nmap <leader>f <Plug>CtrlSFCwordPath
vmap <leader>f <Plug>CtrlSFVwordExec


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch {{{1
" highlighting search results
" Plug 'haya14busa/incsearch.vim'
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
" Plug 'vim-voom/VOoM'
let g:voom_tree_placement = "right"
let g:voom_tree_width = 40
let g:voom_tab_key = "<C-Tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses   {{{1
" high light parentheses with different color
" Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_loadcmd_toggle = 0
autocmd VimEnter * nested :RainbowParenthesesToggle
" autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion  {{{1
" fast jump to after current, \\f<char>
" Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = ";"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent line {{{1
" Plug 'Yggdroot/indentLine'
let g:indentLine_maxLines = 64
let g:indentLine_faster = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'tmhedberg/SimpylFold' {{{1
let g:SimpylFold_docstring_preview=0


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
let g:UltiSnipsSnippetsDir=simplify(expand($VIMFILES.'/vimrc/snippets/UltiSnips'))
let g:UltiSnipsSnippetDirectories=[simplify(expand($VIM_BUNDLE_PATH.'/vim-snippets/UltiSnips'))]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic   {{{1
" check syntax for all language while write file.
" Plug 'scrooloose/syntastic'
" examine debug messages with :mes
" let g:syntastic_debug               = 1
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
let g:syntastic_python_checkers     = ['pep8', 'pyflakes']
let g:syntastic_xml_checkers        = ['xmllint']
let g:syntastic_python_pyflakes_quiet_messages={"regex": [
    \ 'unable to detect undefined names$']}
let g:syntastic_python_pep8_args='--ignore=C901,E111'
if executable('/usr/local/bin/pep8')
  let g:syntastic_python_pep8_exec='/usr/local/bin/pep8'
endif
" let g:syntastic_python_pep8_options='-std=c++11 -I$ROOTSYS/include/'
let g:syntastic_python_pep8_quiet_messages={"regex": [
    \ '^E111', '^E127', '^E128', '^E401', '^E402', '^E501', '^E701', '^E731', '^E721']}
let g:syntastic_javascript_jsl_quiet_messages={"regex": [
    \ 'redeclaration of var',
    \ 'variable rid hides argument',
    \ 'missing default case in switch statement',
    \ 'missing break statement for last case in switch',
    \ 'anonymous function does not always return a value',
    \ 'function {\\w}\+ does not always return a value',
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
if g:iswin
  let $PATH=$VIM.'\\Utilities;'.$PATH
  let $PATH=$VIM.'\\Utilities\\GNU;'.$PATH
  let $PATH=$VIM.'\\Utilities\\jsl;'.$PATH
  let $PATH='C:\\Python27\\Scripts;'.$PATH
  let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python', 'xml'],
      \ 'passive_filetypes': [] }
endif

if g:ismacos
  " autocmd BufWritePost * :SyntasticCheck
  let g:syntastic_python_pep8_exec = "/usr/local/bin/pep8"
  let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python', 'xml'],
      \ 'passive_filetypes': [] }
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-virtualenv    {{{1
" Plug 'jmcantrell/vim-virtualenv'

" ----------------------------------------
" function to list virtualenvs
" change the directory path to point to your virtualenvs
" default load virtualenv VIRTUAL_ENV
" .bash_profile or .zshrc
" export VIRTUAL_ENV=$WORKON_HOME/<virtual_env_name>

" function _VirtualEnvActivate()
" py << EOF
" import os
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
"   print 'Activate', os.environ['VIRTUAL_ENV']
" else:
"   print 'VIRTUAL_ENV not found.'
" EOF
" endfunction
" ----------------------------------------

" changing virtualenv should restart ycmserver
" Venv <Virtualenv-name>
let g:virtualenv_directory = simplify(expand('~/.virtualenvs'))
fun ReturnVirtualEnvs(A,L,P)
  return system("ls -d ~/.virtualenvs/*/ \| cut -d'/' -f5")
endfun
if g:ismacos && !has('nvim')
  command -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args> | YcmRestartServer
else
  command -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe   {{{1
" YCM windows install guides needed.
" Plug 'Valloric/YouCompleteMe'
" set completeopt=longest,menu    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_global_ycm_extra_conf = simplify(expand(
    \ $VIM_BUNDLE_PATH.'/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'))
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:syntastic_always_populate_loc_list = 1
" let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
" let g:ycm_collect_identifiers_from_tags_files = 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif   " 离开插入模式后自动关闭预览窗口
" nmap <leader>jj :YcmCompleter GoTo<CR>
" nmap <leader>jr :YcmCompleter GoToReferences<CR>
" nmap <leader>jd :YcmCompleter GoToDefinition<CR>
" nmap <leader>ji :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
" inoremap <leader><leader> <C-x><C-o>
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

function! MappingForYcm()
  if HasCmdValid('YcmCompleter')
    nmap <buffer> <leader>jj :YcmCompleter GoTo<CR>
    nmap <buffer> <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " inoremap <buffer> <leader><leader> <C-x><C-o>
  endif
endfunction
autocmd BufReadPost * call  MappingForYcm()


" 上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete   {{{1
" Plug 'Shougo/neocomplete.vim'
" if (isdirectory(simplify(expand($VIM_BUNDLE_PATH.'/neocomplete'))))
"   if (filereadable(simplify(expand('$VIMFILES/vimrc/neocomplete.vim'))))
"     source $VIMFILES/vimrc/neocomplete.vim
"     inoremap <expr><C-N>  pumvisible() ?  "\<C-N>" : neocomplete#start_manual_complete()
"     inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"   endif
" endif


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
let g:jedi#auto_initialization      = 1
let g:jedi#auto_vim_configuration   = 1
let g:jedi#use_tabs_not_buffers     = 0
let g:jedi#use_splits_not_buffers   = 1
let g:jedi#completions_enabled      = 1
let g:jedi#popup_select_first       = 0
let g:jedi#popup_on_dot             = 1
let g:jedi#auto_close_doc           = 1
let g:jedi#show_call_signatures     = 1
let g:jedi#completions_command      = "<C-N>"
function! MappingForJedi()
  if HasCmdValid('PythonJedi') && !HasCmdValid('YcmCompleter')
    inoremap <silent> <buffer> <C-N> <c-x><c-o>
    nnoremap <silent> <buffer> <leader>jj :call jedi#goto()<cr>
    nnoremap <silent> <buffer> <leader>jr :call jedi#rename()<cr>
    nnoremap <silent> <buffer> <leader>ju :call jedi#usages()<cr>
    nnoremap <silent> <buffer> <leader>jk :call jedi#documentation()<cr>
  endif
endfunction
autocmd FileType python call  MappingForJedi()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-auto-indent    {{{1
" Plug 'hynek/vim-python-pep8-indent'
let g:pymode_indent = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autopep8    {{{1
" : Autopep8 [--range 1 5]
" : call Autopep8(" --range 1 5")
" Plug 'tell-k/vim-autopep8'
" let g:autopep8_indent_size=4
" let g:autopep8_ignore="E501,E701,W293"
" let g:autopep8_select="E501,E701,W293"
let g:autopep8_pep8_passes=99
let g:autopep8_max_line_length=127
let g:autopep8_aggressive=0
let g:autopep8_disable_show_diff=1


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
autocmd FileType css,xml,html,xhtml,tpl call ProxyEmmetInstall()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-syntax  {{{1
" Plug 'hdima/python-syntax'
let python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vdebug {{{1
" Plug 'joonty/vdebug'

let g:vdebug_options = {"timeout": 99}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'chrisbra/Colorizer'
" 注：此插件可能极度影响光标及输入的速度
" let g:colorizer_auto_color = 0
" let g:colorizer_auto_filetype='css,html,javascript,jinia,python'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript indentation and syntax     {{{1
" Vastly improved Javascript indentation and syntax support in Vim
" Plug 'pangloss/vim-javascript'
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
" SQL   {{{ 1
" Align {{{ 1
" Plug 'vim-scripts/Align'
" Plug 'vim-scripts/dbext.vim'
" Plug 'vim-scripts/SQLUtilities'
" Plug 'vim-scripts/SQLComplete.vim'
let g:sqlutil_align_where = 1
let g:sqlutil_align_comma = 1
let g:sqlutil_align_first_word = 1
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_wrap_expressions = 1
let g:sqlutil_default_menu_mode = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular  {{{1
" Plug 'godlygeek/tabular'
let g:tabular_loaded = 1


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
autocmd FileType javascript,c,cpp,java,html,python,vim,tpl,css,jinja,markdown
      \ autocmd BufWritePre <buffer> StripWhitespace
let g:better_whitespace_filetypes_blacklist=['text', 'rich', 'diff', 'gitcommit', 'unite', 'qf', 'help']
highlight ExtraWhitespace ctermbg=Red
unmap <silent><space>
nmap <silent><space> :nohls<CR>za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gundo (visualize undo tree) {{{1
" Plug 'sjl/gundo.vim'
if !has('python')
  if exists('janus#disable_plugin')
    call janus#disable_plugin('gundo', s:no_python_support)
  endif
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
" Raimondi/delimitMate {{{1
" automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'Raimondi/delimitMate'
" for python docstring "
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter   {{{1
" <leader>cc add common
" <leader>cu remove common
" Plug 'scrooloose/nerdcommenter'
let NERDCreateDefaultMappings = 0
let NERDSpaceDelims           = 1
let NERDAllowAnyVisualDelims  = 1
let NERDCommentEmptyLines     = 1
let NERDCompactSexyComs       = 1
let NERDDefaultAlign          = 'left'
let NERDTrimTrailingWhitespace = 1
vmap <BS> <plug>NERDCommenterToggle:nohls<CR>gv
nmap <BS> <plug>NERDCommenterToggle
vmap <leader>cc <plug>NERDCommenterAlignBoth:nohls<CR>gv
nmap <leader>cu <plug>NERDCommenterUncomment:nohls<CR>gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" author info   {{{1
" Plug 'vim-scripts/AuthorInfo'
let g:vimrc_author='icersong'
let g:vimrc_email='icersong@gmail.com'


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NrrwRgn   {{{1
" :NR      - Open the selected region in a new narrowed window
" :NW      - Open the current visual window in a new narrowed window
" Plug 'chrisbra/NrrwRgn'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoVim  {{{1
" It is for Collaborative Editing. But not stable
" if g:ismacos
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
if !HasCmdValid("ctags")
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
" Buffergator {{{1
" <leader>b to open buffer list
" Plug 'jeetsukumaran/vim-buffergator'
let g:buffergator_split_size = 0
let g:buffergator_vsplit_size = 80
let g:buffergator_show_full_directory_path = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VCS   {{{1
" Plug 'vim-scripts/vcscommand.vim'
if g:iswin
  let g:VCSCommandSVNExec="D:\\PROGRA~1\\TORTOI~1\\bin\\svn.exe"
  let g:VCSCommandVCSTypeOverride= [['D:/tmp', 'SVN'], ['D:/MyWork', 'SVN']]
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive   {{{1
" git wapper
" Plug 'tpope/vim-fugitive'
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

Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
function! Gitgutter_Disabled_in_Largefile()
  if line2byte(line("$")+1) > g:LargeFile*1024*1024
    call gitgutter#disable()
  endif
endfunction
autocmd BufRead * silent call Gitgutter_Disabled_in_Largefile()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature  {{{1
" virtual mark
" m.        If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m<space>  Delete all marks from te current buffer
" [` or ]`  Jump to prev or next mark
" Plug 'kshenoy/vim-signature'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-vinegar  {{{1
" vinegar.vim enhances netrw
" Plug 'tpope/vim-vinegar'
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw   {{{1
" Plug 'eiginn/netrw'


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
" asyncrun shell  {{{1
" Plug "skywind3000/asyncrun.vim"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" calendar  {{{1
" Plug 'itchyny/calendar.vim'
" let g:calendar_frame = 'default'
" let g:calendar_cache_directory = simplify(expand($VIMCACHE.'/calendar'))
" Plug 'mattn/calendar-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki  {{{1
" Plug 'icersong/vimwiki'
" Plug 'vimwiki/vimwiki'

let g:vimwiki_list = [{
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
  \ 'diary_link_count': 5
  \ }, {
  \ 'path': simplify(expand($VIMWIKI.'/projects/soc')),
  \ 'path_html': simplify(expand($VIMWIKI.'/static/soc')),
  \ 'css_name': 'css/style.css',
  \ 'template_path': simplify(expand($VIMWIKI.'/templetes')),
  \ 'template_default': 'default',
  \ 'template_ext': '.tpl',
  \ 'auto_export': 1,
  \ 'auto_toc': 1,
  \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp','html': 'html',},
  \ 'diary_link_count': 5
  \ }]
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
autocmd BufNewFile $VIMWIKI/** set fileencoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown  {{{1
" Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'shell=sh']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'iamcco/markdown-preview.vim'
" :MarkdownPreview
" :MarkdownPreviewStop
if g:ismacos
  let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
else
  let g:mkdp_path_to_chrome = "chromium-browser"
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
" Plug 'othree/xml.vim'
" auto close tag

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
" syntax on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

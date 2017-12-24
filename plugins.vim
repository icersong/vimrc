"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10
" Modified: 2017-12-24
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
let $VIM_TOOL_PATH = simplify(expand($VIMFILES.'/tools'))
let $VIMWIKI = simplify(expand($VIMFILES.'/wiki'))
let $WEBROOT = simplify(expand('~/Sites'))

" if has('nvim') && g:ismacos
"   set shell=/bin/bash
"   let g:python_host_skip_check = 1
"   let g:python_host_prog = simplify(expand('~/.virtualenvs/py2.7/bin/python'))
"   let g:python3_host_prog = '/usr/local/bin/python3'
"   let g:loaded_python_provider = 1
"   let g:loaded_python3_provider = 1
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs {{{1

" initalize vundle
let $PLUGPATH = simplify(expand($VIMFILES.'/plugins/vim-plug'))
set rtp+=$PLUGPATH
call plug#begin($VIM_PLUGING_PATH)
" 插件加载工具
Plug 'junegunn/vim-plug'


"""""""""""""""""""""""""""""""" Env & Misc """"""""""""""""""""""""""""""""
if g:ismacos
  " $ brew install fcitx-remote-for-osx --with-input-method=<method>
  " <method>: osx-pinyin baidu-wubi osx-wubi general squirrel-rime
  "     squirrel-rime-upstream qingg qq-wubi baidu-pinyin sogou-pinyin
  Plug 'CodeFalling/fcitx-vim-osx'
endif
" 性能分析插件
" Plug 'hyiltiz/vim-plugins-profile'

" 打开大文件加速, 自动禁用性能插件
Plug 'vim-scripts/LargeFile'
" 窗口最大最小化工具
" if has('gui_running')
"   Plug 'vim-scripts/ZoomWin'
" endif

" Plug 'eiginn/netrw'   " vim8已经内置
" vinegar.vim enhances netrw
" Plug 'tpope/vim-vinegar'

" 屏幕保护matrix
" Plug 'uguu-org/vim-matrix-screensaver'
" 启动页面
Plug 'mhinz/vim-startify'
" Buffer标签页&状态栏
Plug 'bling/vim-airline', {'configure': 'plug-airline.vim'}
" 缩略图显示显示代码及光标位置
" Plug 'severin-lemaignan/vim-minimap'
" Plug 'koron/minimap-vim'
" 打开文件检查.swp冲突并提示操作
Plug 'chrisbra/Recover.vim'
" 关灯编辑，Distraction edit on special width & heigth pannel
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" 命令窗口<c-n> or <c-p>自动补全
Plug 'vim-scripts/CmdlineComplete'


"""""""""""""""""""""""""""""""" 文件搜索 """"""""""""""""""""""""""""""""
" 文件浏览器
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
" Buffer列表显示
Plug 'fholgado/minibufexpl.vim', {'on': ['MBEOpen', 'MBEToggle']}
" Tag列表显示
Plug 'majutsushi/tagbar', {'on':  ['Tagbar', 'TagbarOpen', 'TagbarToggle', 'TagbarShowTags']}
" 自定义目录数工具
Plug 'vim-voom/VOoM', {'on': ['Voom', '<plug>(Voom)']}
" List for TODO and XXX ...
Plug 'vim-scripts/TaskList.vim', {'on': ['TaskList', '<Plug>TaskList']}
" Ctrl-P波峰式文件搜索利器
Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMRU', 'CtrlPBuffer', 'CtrlPFunky', '<plug>(ctrlp)']}
" Ctrl-P匹配加速器，利用python匹配提升速度
Plug 'FelikZ/ctrlp-py-matcher', {'on': ['CtrlP', 'CtrlPMRU', 'CtrlPBuffer', 'CtrlPFunky', '<plug>(ctrlp)']}
" Function搜索插件
Plug 'tacahiroy/ctrlp-funky', {'on': ['CtrlPFunky']}
" Ctrl-P匹配结果优化输出
" Plug 'nixprime/cpsm', { 'do': 'env PY3=OFF ./install.sh' }
" Grepper当前目录文件内容搜索
Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)']}
" 搜索当前工程内文件或内容, Ag & AgFile
Plug 'rking/ag.vim', {'on': ['Ag', 'AgFile', 'AgBuffer']}
" 用Ag搜索选中内容或光标下单词, gag|gagi'|gagiw
Plug 'Chun-Yang/vim-action-ag'
" 搜索选中内容或光标下单词, <leader>f
Plug 'dyng/ctrlsf.vim', {'on': ['CtrlSF', '<plug>CtrlSFCwordPath', '<plug>CtrlSFVwordExec']}
" fzf搜索工具
Plug 'junegunn/fzf', { 'on': ['History', 'Files', 'GFiles', 'Buffers'], 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim', { 'on': ['History', 'Files', 'GFiles', 'Buffers'] }
" 搜索工具，比ctrl-p匹配准确，python异步完成, 可以搜索MRU Function etc.
" Plug 'Yggdroot/LeaderF'
" 功能比较强悍的搜索工具
Plug 'Shougo/denite.nvim', { 'on': [] }

" 指定字母快速移动光标
Plug 'Lokaltog/vim-easymotion'
" 扩展%快速匹配跳转
Plug 'vim-scripts/matchit.zip', {'for': ['c', 'h', 'cpp', 'php', 'css', 'xml',
    \ 'vim', 'java', 'html', 'jinja', 'python', 'javascript']}
" match tags by %, and auto complete close tag
Plug 'othree/xml.vim', {'for': ['xml', 'html']}


"""""""""""""""""""""""""""""""" 配色缩进 """"""""""""""""""""""""""""""""
" 特殊字体符号
" Plug 'ryanoasis/vim-devicons'
" 配色方案
Plug 'altercation/vim-colors-solarized'
" place, toggle and display marks
Plug 'kshenoy/vim-signature'
" hilight search result runtime
Plug 'haya14busa/incsearch.vim'
" 括号匹配颜色(用下一个插件替代)
" Plug 'kien/rainbow_parentheses.vim', {'for': ['javascript']}
" 括号或配对标签颜色
Plug 'luochen1990/rainbow', {'for': ['c', 'h', 'cpp', 'php', 'css', 'xml', 'vim',
      \ 'java', 'html', 'jinja', 'python', 'javascript']}
" background color preview
Plug 'gko/vim-coloresque', {'for': ['php', 'css', 'xml', 'vim', 'html', 'java',
      \ 'jinja', 'python', 'javascript', 'xdefaults']}
" Plug 'chrisbra/Colorizer', {'for': ['css', 'html', 'javascript', 'jinja', 'python']}
" Vim diff display enhanced
Plug 'chrisbra/vim-diff-enhanced'
" 显示缩进引导符号
Plug 'Yggdroot/indentLine'

" 静态语法配色包
" Plug 'sheerun/vim-polyglot', {'for': []}
" Syntax for python2 and python3
" Plug 'hdima/python-syntax', { 'for': ['python'] }
" Syntax for jinja and html
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2'] }
" syntax highlighting for javascript, too slow ...
" Plug 'othree/yajs.vim'
" 可以试下这个js语法高亮，，，
" Plug ‘pangloss/vim-javascript'
" syntax for jquery etc. libs
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
" indent and syntax for html in vim
Plug 'othree/html5.vim', { 'for': ['htm', 'html', 'xhtml'] }
" Syntax highlighting for JSON in Vim
Plug 'leshill/vim-json', { 'for': ['json'] }
" It covers syntax, indenting, compiling, and more
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }

" Python语法折叠, 可增强折叠import&docstring
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
" Python缩进
Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }


"""""""""""""""""""""""""""""""" 编辑增强 """"""""""""""""""""""""""""""""
" Undo tree
Plug 'sjl/gundo.vim'
" Muti select and edit, <c-n>, <c-p>
Plug 'terryma/vim-multiple-cursors'
" Remove tail space when save
" Plug 'ntpeters/vim-better-whitespace'
" Repeat pre action by key '.'
Plug 'tpope/vim-repeat'
" Add or del parentheses symbols for word or selected
Plug 'tpope/vim-surround'
" Fast select by key "+" & "-"
Plug 'terryma/vim-expand-region'
" text object ...
Plug 'michaeljsmith/vim-indent-object'
" Range select for edit, :NR
Plug 'chrisbra/NrrwRgn', { 'on': ['NR', 'NRL', 'NRM', 'NRP', 'NRV', 'NLast', 'NRMulti'] }
" Provides automatic closing of quotes, parenthesis, brackets,
Plug 'Raimondi/delimitMate'
" Code comment
Plug 'scrooloose/nerdcommenter'
" my plugin
Plug 'icersong/timestamp.vim'

" text aligning, Dependenceied by SQLUtilities
Plug 'vim-scripts/Align'
" Configurable, flexible, intuitive text aligning, :Tabularize /,/l1r1c1 ....
Plug 'godlygeek/tabular', {'on': ['Tabularize']}


"""""""""""""""""""""""""""""""" 语法输入 """"""""""""""""""""""""""""""""
" 语法快速输入提示
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips', {'for': ['c', 'cpp', 'javascript', 'python']}
" 语法分析工具
" Plug 'scrooloose/syntastic'
" 语法分析工具, 异步运行(Vim8/NeoVim)，性能完爆syntastic
Plug 'w0rp/ale'
" 语法补全工具
if has('nvim')
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'),
        \ 'for': ['c', 'cpp', 'css', 'html'], 'frozen': 'true' }
  Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
else
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'),
        \ 'for': ['c', 'cpp', 'css', 'html', 'python'], 'frozen': 'true' }
  Plug 'davidhalter/jedi-vim', { 'for': [] }
endif
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jmcantrell/vim-virtualenv', { 'for': ['python'] }
" Plug 'rkulla/pydiction', { 'for': ['python'] }
" Plug 'python-rope/ropevim', { 'for': ['python'] }
" Autopep8 fixer
" Plug 'tell-k/vim-autopep8', { 'for': ['python'] }
" Plug 'hemerey/vim-project'
" provides support for expanding abbreviations similar to emmet
Plug 'mattn/emmet-vim', { 'for': ['php', 'css', 'xml', 'htm', 'html', 'xhtml', 'jinja'] }
" CSV file editor
" Plug 'chrisbra/csv.vim'
" Plug 'tpope/vim-markdown'
" Plug 'plasticboy/vim-markdown'
" Plug 'suan/vim-instant-markdown'

" SQL Utilites
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/SQLComplete.vim'


"""""""""""""""""""""""""""""""" 版本管理 """"""""""""""""""""""""""""""""
" VCS command
Plug 'vim-scripts/vcscommand.vim', { 'on': [
      \ 'VCSAdd', 'VCSAnnotate', 'VCSBlame', 'VCSCommit', 'VCSDelete', 'VCSDiff',
      \ 'VCSGotoOriginal', 'VCSLog', 'VCSRemove', 'VCSRevert', 'VCSReview',
      \ 'VCSStatus', 'VCSUpdate', 'VCSVimDiff',
      \]}
" Git wrapper
Plug 'tpope/vim-fugitive'
" VCS state signs display [GIT, SVN, HG, ...] (sn, sp)
" Plug 'mhinz/vim-signify'
" VCS state signs display [GIT, SVN, HG, ...] (gn, gp)
Plug 'airblade/vim-gitgutter'
" Git log graph display
Plug 'gregsexton/gitv', {'on': ['Gitv']}


"""""""""""""""""""""""""""""""" 辅助工具 """"""""""""""""""""""""""""""""
" Preview markdown in Google Chrome
Plug 'iamcco/markdown-preview.vim', { 'on': 'MarkdonwPreview' }
" 显示Python内建方法的文档，eg: Pydoc os.path
Plug 'fs111/pydoc.vim', {'on': ['Pydoc', 'PydocSearch']}

" python&php调试工具, 比较难配置，需要外部程序(pygdbp)支持
" Plug 'joonty/vdebug', {'do': 'VdebugStart'}
" Plug 'gotcha/vimpdb'
" python&php调试工具（异步）, 需要Komodo dbgp工具
Plug 'brookhong/DBGPavim', {'for': []}


"""""""""""""""""""""""""""""""" Shell & Tools """"""""""""""""""""""""""""""""
Plug 'Shougo/vimproc.vim', {
      \ 'on': ['VimShell', 'VimShellExecute', 'VimCurrentDir', 'VimShellPop'],
      \ 'build' : {
      \   'windows' : 'tools\\update-dll-mingw',
      \   'cygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'linux' : 'make -f make_unix.mak',
      \   'unix' : 'gmake -f make_unix.mak',
      \ }}
Plug 'Shougo/vimshell.vim', {
      \ 'on': ['VimShell', 'VimShellExecute', 'VimCurrentDir', 'VimShellPop']
      \ }
if has('nvim')
  command! -nargs=0 VimShell :e term://zsh
  tnoremap <Esc> <C-\><C-n>
endif
" Run command to tmux, <leader>vp, <leader>vq
Plug 'benmills/vimux'
" Navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'christoomey/vim-tmux-navigator'
" 异步运行命令
Plug 'skywind3000/asyncrun.vim'

if has('mac')
  " Libarary for dash.vim & greper.vim
  Plug 'rizzatti/funcoo.vim', { 'for': ['c', 'cpp', 'python', 'php'] }
  " Off line dash starter, Dash <keyword-for-search>
  Plug 'rizzatti/dash.vim', { 'for': ['c', 'cpp', 'python', 'php'] }
endif
" Plug 'itchyny/calendar.vim'
Plug 'mattn/calendar-vim', {'on': ['Calendar', 'CalendarH', 'CalendarT', 'CalendarVR']}
Plug 'icersong/vimwiki'
" 有道词典翻译, <leader>w
Plug 'iamcco/dict.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start page {{{1
" Plug 'mhinz/vim-startify'
let g:startify_session_dir = $VIMCACHE.'/session'
" let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme  {{{1
" Plug 'altercation/vim-colors-solarized'
let g:solarized_hitrail          = 1
let g:solarized_menu             = 0
let g:solarized_contrast   = "normal"
let g:solarized_visibility = "normal"
if !has('gui_running')
  let g:solarized_termcolors = 256
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
" FZF   {{{1

let g:fzf_history_dir = $VIMCACHE.'/fzf-history'

nmap <leader>fb :Buffers<CR>
nmap <leader>ff :Files<CR>
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
  \ 'dir':  '\v[\/](\.(git|hg|svn)|cache)$',
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
  " Ag is fast enough that CtrlP doesn't need to cache
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
" Grepper   {{{1
" Plug 'mhinz/vim-grepper'
" Search file content
let g:grepper           = {}
let g:grepper.tools     = ['ag', 'git', 'grep', 'file']
let g:grepper.repo      = ['.git', '.hg', '.svn']
let g:grepper.open      = 1
let g:grepper.jump      = 0
let g:grepper.stop      = 99
let g:grepper.highlight = 1
let g:grepper.next_tool = '<tab>'   " <TAB>键切换搜索工具
let g:grepper.ag = { 'grepprg': 'ag --vimgrep --smart-case' }
let g:grepper.file= { 'grepprg': 'ag --vimgrep --smart-case -g' }

" ---- 内容搜索 ----
" 用ag搜索当前目录
" nnoremap <leader>f. :Grepper -tool ag<cr>
" 用ag在当前目录下搜索光标下的单词
nnoremap <leader>*  :Grepper -tool ag -noprompt -cword<cr>
" 用ag在当前目录下搜索选中的内容
vnoremap <leader>* ""y:Grepper -noprompt -grepprg ag
    \ "<C-R>=escape(escape(@", '\'), '"/\ \|\(\))')<CR>"<CR>
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
"     \ "<C-R>=escape(escape(@", '\'), '"/\ \|\(\))')<CR>"<CR>


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
" 用ag在当前工程下搜索光标下的文件, gagiw, gagi', gagi"
" nnoremap <leader>gf yiw:AgFile! "<C-R>=escape(escape(@", '\'), '"/\ \|\(\))')<CR>"<CR>
" 用ag在当前工程下搜索选中文本的文件 gag
" vnoremap <leader>gf ""y:AgFile! "<C-R>=escape(escape(@", '\'), '"/\ \|\(\))')<CR>"<CR>

" vim-action-ag   {{{1
" Plug 'Chun-Yang/vim-action-ag'
" Dependency 'rking/ag.vim'
" Normal Mode
"   gagiw to search the word
"   gagi' to search the words inside single quotes.
" Visual Mode
"   gag to search the selected text

let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSF    {{{1
" Plug 'dyng/ctrlsf.vim'
" like ag.vim but show context with matches line
" CtrlSF [options] <patten> [path]

let g:ctrlsf_auto_close = 1
let g:ctrlsf_default_root = 'project+ww'
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_context = '-B 0 -A 0'
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_ignore_dir = ['bin', 'dist', 'build']

nmap <leader>f* <Plug>CtrlSFCwordPath
vmap <leader>f* <Plug>CtrlSFVwordExec


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch {{{1
" highlighting search results
" Plug 'haya14busa/incsearch.vim'
set hlsearch
let g:incsearch#auto_nohlsearch = 1
nmap n  <Plug>(incsearch-nohl-n)
nmap N  <Plug>(incsearch-nohl-N)
nmap *  <Plug>(incsearch-nohl-*)
nmap #  <Plug>(incsearch-nohl-#)
nmap g* <Plug>(incsearch-nohl-g*)
nmap g# <Plug>(incsearch-nohl-g#)


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

" let g:rbpt_loadcmd_toggle = 0
" let g:rbpt_max = 9
" " autocmd VimEnter * nested :RainbowParenthesesToggle
" autocmd VimEnter * RainbowParenthesesToggle
" autocmd Syntax * RainbowParenthesesLoadRound
" autocmd Syntax * RainbowParenthesesLoadSquare
" autocmd Syntax * RainbowParenthesesLoadBraces
" " autocmd Syntax * RainbowParenthesesLoadChevrons


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
let g:UltiSnipsSnippetsDir=simplify(expand($VIMFILES.'/vimrc/snippets/UltiSnips'))
let g:UltiSnipsSnippetDirectories=[simplify(expand($VIM_BUNDLE_PATH.'/vim-snippets/UltiSnips'))]

let g:snips_author = 'icersong'
let g:snips_email = 'icersong@gmail.com'
let g:snips_github = 'https://github.com/icersong'


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
let g:jedi#completions_enabled      = 0
let g:jedi#auto_initialization      = 1
let g:jedi#auto_vim_configuration   = 1
let g:jedi#use_tabs_not_buffers     = 1
let g:jedi#use_splits_not_buffers   = 1
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
let g:pydoc_window_lines=0.5


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
let g:dbext_default_history_size = 50
let g:dbext_default_history_max_entry = 4096
let g:dbext_default_history_file = $VIMCACHE . '/dbext_sql_history.txt'
let g:dbext_default_profile_MySQL = 'type=MYSQL:user=root:passwd=123456:dbname=wf2_colorprint3'
let g:dbext_default_profile = 'MySQL'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular  {{{1
" Plug 'godlygeek/tabular'
" let g:tabular_loaded = 1


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
" Raimondi/delimitMate {{{1
" automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'Raimondi/delimitMate'
" for python docstring "
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter   {{{1
" Plug 'scrooloose/nerdcommenter'
" <leader>cc add comment
" <leader>cu remove comment
let NERDCreateDefaultMappings = 0
let NERDSpaceDelims           = 1
let NERDAllowAnyVisualDelims  = 1
let NERDCommentEmptyLines     = 1
let NERDCompactSexyComs       = 1
let NERDDefaultAlign          = 'left'
let NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#', 'leftAlt': '#' },
\ }
vmap <BS> <plug>NERDCommenterToggle:nohls<CR>gv
nmap <BS> <plug>NERDCommenterToggle
nmap <leader>cc <plug>NERDCommenterToggle
vmap <leader>cc <plug>NERDCommenterAlignBoth:nohls<CR>gv
nmap <leader>cu <plug>NERDCommenterUncomment:nohls<CR>gv


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
if g:iswin
  let g:VCSCommandSVNExec="D:\\PROGRA~1\\TORTOI~1\\bin\\svn.exe"
  let g:VCSCommandVCSTypeOverride= [['D:/tmp', 'SVN'], ['D:/MyWork', 'SVN']]
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive   {{{1
" git wapper
" Plug 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
command GSpush :AsyncRun -post=copen git svn dcommit
command GSpull :AsyncRun -post=copen git svn rebase
" nnoremap <leader>gl :silent! Glog -1<CR>:copen 33<CR><C-W>p:silent! Glog<CR><C-W>
" nnoremap <leader>gl :Glog --graph --pretty=format:%h\ %ai\ %an\ %s<CR>
command Gput :Git stash
command Gpop :Git stash pop
nnoremap <leader>gv :Gitv!<CR>
nnoremap <leader>gl :AsyncRun -post=copen git --no-pager log --oneline --decorate --graph -40 --pretty=format:\%h\ \%ai\ \%an\ \%s<CR><CR>
" nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
" nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :AsyncRun -post=copen git push<CR>
nnoremap <leader>gpl :AsyncRun -post=copen git pull<CR>

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
" vimux  {{{1
" Plug 'benmills/vimux'

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>
" Restart Apache
map <Leader>rr :call VimuxRunCommand("sudo apachectl restart;")<CR>:call VimuxSendKeys('Space')<CR>:call VimuxSendKeys('Enter')<CR>
" map <Leader>rb :call VimuxRunCommand("clear; ls " . bufname("%"))<CR>

let g:VimuxHeight = "16"
let g:VimuxOrientation = "v"
let g:VimuxPromptString = "(tmux)$ "


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
" Plug 'iamcco/markdown-preview.vim'
" :MarkdownPreview
" :MarkdownPreviewStop
if g:ismacos
  " let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
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

call LoadConfigures($VIMFILES.'/vimrc/', g:plugs_order)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

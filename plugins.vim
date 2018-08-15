"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10
" Modified: 2018-08-15
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug {{{1

let $VIMPLUG = simplify(expand($VIMFILES.'/vim-plug'))
if !filereadable($VIMPLUG.'/autoload/plug.vim')
  " Git command
  if !executable('git')
    echoerr 'Command git not found, please instal git first.'
    finish
  endif
  " Clone vim-plug
  if !filereadable($VIMPLUG.'/plug.vim')
    execute '!git clone https://github.com/junegunn/vim-plug '.$VIMPLUG
  endif
  " Check plug.vim
  if !filereadable($VIMPLUG.'/autoload/plug.vim')
    if !filereadable($VIMPLUG.'/plug.vim')
      echomsg "Warning! Plugin vim-plug not found, plugins is not load."
      finish
    endif
    " make link to autoload for plug.vim
    execute '!echo "autoload" > '.$VIMPLUG.'/.gitignore'
    execute '!echo ".gitignore" >> '.$VIMPLUG.'/.gitignore'
    execute '!mkdir '.$VIMPLUG.'/autoload'
    execute '!ln -s '.$VIMPLUG.'/plug.vim '.$VIMPLUG.'/autoload/plug.vim'
  endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=$VIMPLUG
call plug#begin($VIMFILES)
Plug 'junegunn/vim-plug'


"""""""""""""""""""""""""""""""" Env & Misc """"""""""""""""""""""""""""""""
if $MACOS && has('g:disable_fcitx_remote') && !g:disable_fcitx_remote
  " $ brew install fcitx-remote-for-osx --with-input-method=<method>
  " <method>: osx-pinyin baidu-wubi osx-wubi general squirrel-rime
  "     squirrel-rime-upstream qingg qq-wubi baidu-pinyin sogou-pinyin
  if !executable('fcitx-remote')
    execute '!brew install fcitx-remote-for-osx'
  endif
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
" 平滑滚动
Plug 'terryma/vim-smooth-scroll'


"""""""""""""""""""""""""""""""" 文件搜索 """"""""""""""""""""""""""""""""
" -------- 文件标记浏览 ---------
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

" -------- 文件名称搜索 ---------
" Ctrl-P波峰式文件搜索利器
Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMRU', 'CtrlPBuffer', 'CtrlPFunky', '<plug>(ctrlp)']}
" Ctrl-P匹配加速器，利用python匹配提升速度
Plug 'FelikZ/ctrlp-py-matcher', {'on': ['CtrlP', 'CtrlPMRU', 'CtrlPBuffer', 'CtrlPFunky', '<plug>(ctrlp)']}
" Function搜索插件
Plug 'tacahiroy/ctrlp-funky', {'on': ['CtrlPFunky']}
" 搜索工具，比ctrl-p匹配准确，python异步完成, 可以搜索MRU Function etc.
" Plug 'Yggdroot/LeaderF'
" Ctrl-P匹配结果优化输出
" Plug 'nixprime/cpsm', { 'do': 'env PY3=OFF ./install.sh' }
" fzf搜索工具, 比Ctrl-P匹配更精准更快速, 可完全取代
Plug 'junegunn/fzf', { 'on': ['History', 'Files', 'GFiles', 'Buffers'],
      \ 'dir': '~/.fzf', 'do': 'yes \| ./install --bin' }
Plug 'junegunn/fzf.vim', { 'on': ['History', 'Files', 'GFiles', 'Buffers'] }
" 功能比较强悍的搜索工具
Plug 'Shougo/denite.nvim', { 'on': ['Denite'] }

" -------- 文件内容搜索 ---------
" 搜索当前工程内文件, Ag & AgFile
Plug 'rking/ag.vim', {'on': ['Ag', 'AgFile', 'AgBuffer']}
" Grepper当前目录文件内容搜索, CtrlSF替代
" Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)']}
" 搜索选中内容或光标下单词, <leader>f
Plug 'dyng/ctrlsf.vim', {'on': ['CtrlSF', '<plug>CtrlSFCwordPath', '<plug>CtrlSFVwordExec']}

" -------- 文件内光标定位 ---------
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
" Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
" place, toggle and display marks
Plug 'kshenoy/vim-signature'
" highlight search result runtime
" Plug 'haya14busa/incsearch.vim'
" quickly highlight <cword> or visually selected word
Plug 't9md/vim-quickhl'
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
" Plug 'pangloss/vim-javascript'
" syntax for jquery etc. libs
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
" indent and syntax for html in vim
Plug 'othree/html5.vim', { 'for': ['htm', 'html', 'xhtml'] }
" Syntax highlighting for JSON in Vim
Plug 'elzr/vim-json', { 'for': ['json'] }
" It covers syntax, indenting, compiling, and more
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
" for CSS3
Plug 'hail2u/vim-css3-syntax'

" Speed up Vim by updating folds only when called-for.
Plug 'Konfekt/FastFold'
" Python语法折叠, 可增强折叠import&docstring
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
" Python缩进
if has('mac')
  " Mac book is very slow on insert new line
  autocmd FileType python setlocal indentexpr=
else
  Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
  " Plug 'vim-scripts/indentpython.vim', { 'for': ['python'] }
endif


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
Plug 'chrisbra/NrrwRgn', " { 'on': ['NR', 'NRL', 'NRM', 'NRP', 'NRV', 'NLast', 'NRMulti'] }
" Provides automatic closing of quotes, parenthesis, brackets,
Plug 'Raimondi/delimitMate'
" Code comment
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary', {'on': ['Commentary', '<plug>Commentary']}
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
  if has('python3')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'),
          \ 'for': ['c', 'cpp', 'css', 'html'], 'frozen': 'true' }
    Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
  endif
else
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'),
        \ 'for': ['c', 'cpp', 'css', 'html', 'python'], 'frozen': 'true' }
  Plug 'davidhalter/jedi-vim', { 'for': [] }
endif
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jmcantrell/vim-virtualenv', { 'on': ['VirtualEnvActivate', 'VirtualEnvList'] }
" Plug 'rkulla/pydiction', { 'for': ['python'] }
" Plug 'python-rope/ropevim', { 'for': ['python'] }
" Autopep8 fixer
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
" Load plugins end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ' . simplify(expand($CONFROOT.'/plugins.config.vim'))


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

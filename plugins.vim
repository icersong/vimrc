"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10
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
if $MACOS
    if has('g:disable_fcitx_remote') && !g:disable_fcitx_remote
        " $ brew install fcitx-remote-for-osx --with-input-method=<method>
        " <method>: osx-pinyin baidu-wubi osx-wubi general squirrel-rime
        "     squirrel-rime-upstream qingg qq-wubi baidu-pinyin sogou-pinyin
        if !executable('fcitx-remote')
          execute '!brew install fcitx-remote-for-osx'
        endif
        Plug 'CodeFalling/fcitx-vim-osx'
    endif
else
    Plug 'lilydjwg/fcitx.vim'
endif

" 性能分析插件
" Plug 'hyiltiz/vim-plugins-profile'

" 打开大文件加速, 自动禁用性能插件
Plug 'vim-scripts/LargeFile'
" 窗口最大最小化工具
" if has('gui_running')
"   Plug 'vim-scripts/ZoomWin'
" endif

" 屏幕保护matrix
" Plug 'uguu-org/vim-matrix-screensaver'
" 启动页面
Plug 'mhinz/vim-startify'
" Buffer标签页&状态栏
Plug 'bling/vim-airline', {'configure': 'plug-airline.vim'}
" TODO: Plug 'itchyny/lightline.vim'

" 命令行窗口显示当前buffers
" Plug 'icersong/vim-bufferline'

" TODO: Plug 'ap/vim-buftabline'
" TODO: Plug 'akinsho/nvim-bufferline.lua'
" TODO: Plug 'mengelbrecht/lightline-bufferline'

" 缩略图显示显示代码及光标位置
" Plug 'severin-lemaignan/vim-minimap'
" Plug 'koron/minimap-vim'
" 打开文件检查.swp冲突并提示操作
Plug 'chrisbra/Recover.vim'
" 关灯编辑，Distraction edit on special width & heigth pannel
" Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" 命令窗口<c-n> or <c-p>自动补全
Plug 'vim-scripts/CmdlineComplete'
" 平滑滚动
" Plug 'terryma/vim-smooth-scroll'

" 显示当前搜索结果的位置
Plug 'osyo-manga/vim-anzu'

"""""""""""""""""""""""""""""""" 文件搜索 """"""""""""""""""""""""""""""""
" -------- 文件标记浏览 ---------
" 文件浏览器
" Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
if has('nvim')
  Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins', 'on': ['Defx']}
  Plug 'kristijanhusak/defx-icons', {'on': ['Defx']}
else
  Plug 'Shougo/defx.nvim', {'on': ['Defx']}
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Improve netrw
" Plug 'tpope/vim-vinegar'
" Buffer列表显示
" Plug 'fholgado/minibufexpl.vim', {'on': ['MBEOpen', 'MBEToggle']}
" Tag列表显示
Plug 'majutsushi/tagbar', {'on':  ['Tagbar', 'TagbarOpen', 'TagbarToggle', 'TagbarShowTags']}
Plug 'liuchengxu/vista.vim'
" 自定义目录数工具
Plug 'vim-voom/VOoM', {'on': ['Voom', '<plug>(Voom)']}
" List for TODO and XXX ...
Plug 'vim-scripts/TaskList.vim', {'on': ['TaskList', '<Plug>TaskList']}

" -------- 文件名称搜索 ---------
" 搜索工具，比ctrl-p匹配准确，python异步完成, 可以搜索MRU Function etc.
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh', 'on': ['Leaderf', 'LeaderfFile'] }
" fzf搜索工具, 比Ctrl-P匹配更精准更快速, 可完全取代
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim', { 'on': ['History', 'Files', 'GFiles', 'Buffers'] }
Plug 'junegunn/fzf.vim'

" 功能比较强悍的搜索工具(fzf.vim性能更佳)
" if has('nvim')
"   Plug 'Shougo/denite.nvim', {'on': ['Denite', 'DeniteBufferDir', 'DeniteCursorWord', 'DeniteProjectDir'],
"       \ 'do': 'UpdateRemotePlugins' }
" else
"   Plug 'Shougo/denite.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'Shougo/neomru.vim', {'on': ['Denite', 'DeniteBufferDir', 'DeniteCursorWord', 'DeniteProjectDir']}

" 颜值不错的POP搜索
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" -------- 文件内容搜索 ---------
" Grepper当前目录文件内容搜索, CtrlSF替代
" Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)']}
" 搜索选中内容或光标下单词, <leader>f
Plug 'dyng/ctrlsf.vim', {'on': ['CtrlSF', '<Plug>CtrlSFCwordPath', '<Plug>CtrlSFVwordPath', '<Plug>CtrlSFPrompt']}

" -------- 文件内光标定位 ---------
" 指定字母快速移动光标
Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
" 扩展%快速匹配跳转，支持XML的tag支持
Plug 'vim-scripts/matchit.zip', {'for': [
    \ 'c', 'h', 'cpp', 'php', 'css', 'xml', 'vue',
    \ 'vim', 'java', 'html', 'jinja', 'python', 'javascript']}
" match tags by %, and auto complete close tag
" Plug 'othree/xml.vim', {'for': ['xml', 'html']}

" -------- 查找项目根路径 ---------
Plug 'airblade/vim-rooter'


"""""""""""""""""""""""""""""""" 配色缩进 """"""""""""""""""""""""""""""""
" 特殊字体符号
" Plug 'ryanoasis/vim-devicons'
" 配色方案
" Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
" Plug 'junegunn/seoul256.vim'
" place, toggle and display marks
" Plug 'joshdick/onedark.vim'
Plug 'kshenoy/vim-signature'
" highlight search result runtime
" Plug 'haya14busa/incsearch.vim'
" quickly highlight <cword> or visually selected word -> relace by coc-highlight
" Plug 't9md/vim-quickhl'
" 括号匹配颜色(用下一个插件替代)
" Plug 'kien/rainbow_parentheses.vim', {'for': ['javascript']}
" 括号或配对标签颜色
Plug 'luochen1990/rainbow', {'for': ['c', 'h', 'cpp', 'php', 'css', 'xml', 'vim',
      \ 'java', 'html', 'jinja', 'python', 'javascript']}
" background color preview
" TODO: Plug 'RRethy/vim-hexokinase'
Plug 'gko/vim-coloresque', {'for': ['php', 'css', 'xml', 'vim', 'html', 'java',
      \ 'jinja', 'python', 'javascript', 'xdefaults']}
" Plug 'chrisbra/Colorizer', {'for': ['css', 'html', 'javascript', 'jinja', 'python']}
" Vim diff display enhanced
Plug 'chrisbra/vim-diff-enhanced'
" 显示缩进引导符号
Plug 'Yggdroot/indentLine'
" Hyperfocus-writing in Vim
" Plug"junegunn/limelight.vim"


" 静态语法配色包 slow load file
" Plug 'sheerun/vim-polyglot', {}
" Python语法配色方案
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Syntax for jinja and html
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2'] }
" syntax highlighting for javascript, too slow ...
" Plug 'othree/yajs.vim'
" syntax hilighting for javascript, conflict with rainbow plugin
" Plug 'pangloss/vim-javascript'
" syntax for jquery etc. libs
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
" indent and syntax for html in vim
Plug 'othree/html5.vim', { 'for': ['htm', 'html', 'xhtml'] }
" Syntax highlighting for JSON
Plug 'elzr/vim-json', { 'for': ['json'] }
" It covers syntax, indenting, compiling, and more
" Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
" for CSS3
Plug 'hail2u/vim-css3-syntax', {'for': ['css']}
" Syntax highlighting for vue
Plug 'posva/vim-vue', {'for': ['vue']}

" Speed up Vim by updating folds only when called-for.
Plug 'Konfekt/FastFold'
" Python语法折叠, 可增强折叠import&docstring
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
" Python缩进
" Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
" Plug 'vim-scripts/indentpython.vim', { 'for': ['python'] }


"""""""""""""""""""""""""""""""" 编辑增强 """"""""""""""""""""""""""""""""
" Undo tree
Plug 'sjl/gundo.vim', {'on': ['GundoShow', 'GundoToggle']}
" Muti select and edit, <c-n>, <c-p>
" Plug 'terryma/vim-multiple-cursors'
" Muti select and edit, <c-n> to start
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Remove tail space when save
" Plug 'ntpeters/vim-better-whitespace'
" smart replace
" TODO: Plug tpope/vim-abolish
" Repeat pre action by key '.'
Plug 'tpope/vim-repeat'
" Add or del parentheses symbols for word or selected
Plug 'tpope/vim-surround'
" Fast select by key "+" & "-"
Plug 'terryma/vim-expand-region'
" text object by parentheses charts
Plug 'wellle/targets.vim'
" indent textobject
Plug 'michaeljsmith/vim-indent-object'
" custom textobject
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'     " af if ac ic
Plug 'glts/vim-textobj-comment'   " ac ic
" Plug 'kana/vim-textobj-indent'  " duplicate vim-indent-object
" text swap, eg: cursor word1 cxiw -> cursor word2 cxiw, then tow words exchange
Plug 'tommcdo/vim-exchange'
" Text tbale
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown', 'on': ['TableModeEnable']}
" Range select for edit, :NR
Plug 'chrisbra/NrrwRgn', { 'on': [
            \ 'NR', 'NRL', 'NRM', 'NRP', 'NRV', 'NLast',
            \ 'NRMulti', 'NRPrepare', 'NRUnprepare'
            \ ] }
" Provides automatic closing parentheses, eg: quotes parenthesis brackets
" Plug 'Raimondi/delimitMate'
" Code comment
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary', {'on': ['Commentary', '<plug>Commentary']}
" my plugin
" Plug 'icersong/timestamp.vim'

" Configurable, flexible, intuitive text aligning, :Tabularize /,/l1r1c1 ....
Plug 'godlygeek/tabular', {'on': ['Tabularize']}
Plug 'junegunn/vim-easy-align', {'on': ['EasyAlign', '<Plug>EasyAlign']}
" clipboard with pbcopy & pbpaste for macos
Plug 'kana/vim-fakeclip'


"""""""""""""""""""""""""""""""" 语法输入 """"""""""""""""""""""""""""""""
" 语法快速输入提示
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/echodoc.vim'
" Plug 'tenfyzhong/CompleteParameter.vim'
" 语法分析工具
" Plug 'scrooloose/syntastic'
" 语法分析工具, 异步运行(Vim8/NeoVim)，性能完爆syntastic
" Plug 'w0rp/ale'
Plug 'dense-analysis/ale'

" 语法补全工具
if has('python3')
  if has('nvim')
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'release'}
  endif
endif

" " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'

" provides support for expanding abbreviations similar to emmet
Plug 'mattn/emmet-vim', {
      \ 'for': ['php', 'css', 'xml', 'htm', 'html', 'xhtml', 'jinja', 'jinja.html'],
      \ 'on': ['Emmet', 'EmmetInstall'],
      \ }
" CSV file editor
" Plug 'chrisbra/csv.vim'

" SQL Utilites
" Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-dadbod', {'on': ['DB', 'DBUI']}
Plug 'kristijanhusak/vim-dadbod-ui', {'on': ['DBUI', 'DBUIToggle']}
Plug 'kristijanhusak/vim-dadbod-completion', {'on': ['DBUI', 'DBUIToggle']}

" 命令行<leader>提示
"Plug 'hecal3/vim-leader-guide'

Plug 'chrisbra/unicode.vim'

"""""""""""""""""""""""""""""""" 版本管理 """"""""""""""""""""""""""""""""
" VCS command
" Plug 'vim-scripts/vcscommand.vim', { 'on': [
"       \ 'VCSAdd', 'VCSAnnotate', 'VCSBlame', 'VCSCommit', 'VCSDelete', 'VCSDiff',
"       \ 'VCSGotoOriginal', 'VCSLog', 'VCSRemove', 'VCSRevert', 'VCSReview',
"       \ 'VCSStatus', 'VCSUpdate', 'VCSVimDiff',
"       \]}
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
" command: InstantMarkdownPreview
" Plug 'suan/vim-instant-markdown', {'for': 'markdown', 'do': 'pip install --user smdv && npm -g install instant-markdown-d'}

" 支持toc dot flowchart plantuml katex mermaid js-sequence-diagrams chart 渲染
" command: MarkdownPreview
" Plug 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': 'cd app && yarn install'}

" 替代方法
" sudo pip isntall grip
" grip xxx.md 0.0.0.0 # start web sever to show markdown prieview

Plug 'jceb/vim-orgmode'

" 显示Python内建方法的文档，eg: Pydoc os.path
Plug 'fs111/pydoc.vim', {'on': ['Pydoc', 'PydocSearch']}

" 自动生成 Python 函数/类文档
" Plug 'kkoomen/vim-doge'

" chrome 同步编辑, 需要chrome安装firmnvim插件
" Plug 'glacambre/firenvim', {'do': {_ -> firenvim#install(0)}}

" python&php调试工具, 比较难配置，需要外部程序(pygdbp)支持
" Plug 'joonty/vdebug', {'do': 'VdebugStart'}
" Plug 'gotcha/vimpdb'
" python&php调试工具（异步）, 需要Komodo dbgp工具
" Plug 'brookhong/DBGPavim', {'for': []}
" 感觉不错的调试工具，比较复杂功能齐全
" Plug 'puremourning/vimspector'

" displays available keybindings in popup
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'liuchengxu/vim-which-key'


"""""""""""""""""""""""""""""""" Shell & Tools """"""""""""""""""""""""""""""""

" Language REPL
Plug 'metakirby5/codi.vim', {'on': ['Codi']}

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
Plug 'benmills/vimux', {'on': ['VimuxPromptCommand', 'VimuxRunLastCommand']}
" Navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'christoomey/vim-tmux-navigator'
" 异步运行命令
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop']}
" popup termial
Plug 'voldikss/vim-floaterm'

if has('mac')
  " Libarary for dash.vim & greper.vim
  Plug 'rizzatti/funcoo.vim', { 'for': ['c', 'cpp', 'python', 'php'] }
  " Off line dash starter, Dash <keyword-for-search>
  Plug 'rizzatti/dash.vim', { 'for': ['c', 'cpp', 'python', 'php'] }
endif
" Plug 'itchyny/calendar.vim'
Plug 'mattn/calendar-vim', {'on': ['Calendar', 'CalendarH', 'CalendarT', 'CalendarVR']}
Plug 'icersong/vimwiki', {'on': ['VimwikiIndex', 'VimwikiDiaryIndex',
            \ 'VimwikiMakeDiaryNote', 'VimwikiMakeYestordayDiaryNote']}
" 有道词典翻译, <leader>w
" Plug 'iamcco/dict.vim'
Plug 'voldikss/vim-translator'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto load plugin's config while plug valid
call plugin_config_loader#load_configs($CONFROOT."/plugins", g:plugs_order)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load my key maps
execute 'source ' . simplify(expand($CONFROOT.'/keymap.vim'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

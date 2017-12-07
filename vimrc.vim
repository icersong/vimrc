"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright @ 2013-2014 by icersong
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10 00:00:00
" Modified: 2017-12-07
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" platform
let g:ismacos = has('mac') || has('macunix')
let g:islinux = (has('linux') || has('unix') ) && !g:ismacos
let g:iswin = has("win64") || has("win32") || has("win16") || has("win95")

" basic
set nocompatible        " Must be first line

if g:iswin
  Windows Compatible
  let $VIMFILES = simplify(expand($VIM.'/vimfiles'))
  let $VIMCACHE = simplify(expand($VIM.'/cache'))
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
else
  let $VIMFILES = simplify(expand($HOME.'/.vim'))
  let $VIMCACHE = simplify(expand($HOME.'/.cache'))
  set nossl
  let g:skip_loading_mswin = 1  " do not load mswin.vim
endif

if !(isdirectory($VIMCACHE))
  call mkdir($VIMCACHE, 'p', 0700)
endif

let $BACKUPDIR = simplify(expand($VIMCACHE.'/backup/'))
if !(isdirectory($BACKUPDIR))
  call mkdir($BACKUPDIR, 'p', 0700)
endif

let $UNDODIR = simplify(expand($VIMCACHE.'/undo/'))
if !(isdirectory($UNDODIR))
  call mkdir($UNDODIR, 'p', 0700)
endif


" Arrow Key Fix
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

" leader
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use before config if available
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMFILES/vimrc/functions.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source <sfile>:p:h/vundle.vim
" $VIMFILES/vimrc/plugins.vim
if filereadable(simplify(expand($VIMFILES.'/vimrc/plugins.vim')))
      \ && filereadable(simplify(expand($VIMFILES.'/plugins/vim-plug/autoload/plug.vim')))
  source $VIMFILES/vimrc/plugins.vim
else
  colorscheme desert
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark         " Assume a dark background

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
scriptencoding utf-8

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

if has('mouse')
  set mouse=a " enable mouse (a, r, v)
  set mousehide               " Hide the mouse cursor while typing
  set selectmode=mouse,key
endif

set directory=$VIMCACHE         " 设置交换文件路径
set backupdir=$BACKUPDIR        " 设置自动备份路径
set undodir=$UNDODIR            " 设置undo备份路径
" Clean undo cache 7 days ago
au VimLeave * silent exe '!find "'.$VIMCACHE.'/undo" -mtime +7 -exec rm -f {} \;'

" 自动转换当前工作路径，替代autochdir，防止插件冲突
" autocmd BufEnter,BufRead * if isdirectory(expand('%:p:h')) | lcd %:p:h | endif
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" set shortmess+=I                " 启动时不显示介绍信息
set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
" set virtualedit=onemore       " Allow for cursor beyond last character
set virtualedit=all,onemore     " 虚环境编辑空间
set history=32                  " Store a ton of history (default is 20)
set spell                       " Spell checking on
set hidden                      " Allow buffer switching without saving, 放弃缓冲区时隐藏而不卸载
set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator
set iskeyword-=-                " '-' is an end of word designator
set undofile                    " So is persistent undo ...
set undolevels=32               " Maximum number of changes that can be undone
set undoreload=999              " Maximum number lines to save for undo on a buffer reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim ui
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  set guioptions=
  set showtabline=2
  set lines=48 columns=128
  " set switchbuf=usetab
  " au GUIEnter * simalt ~x
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi-encodingi & file format setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
  set fileformats=unix,dos,mac      " 文件格式支持
  set ambiwidth=double              " 当encoding=<unicode>编码时有效,使用ASCII字符两倍的宽度处理东亚字符类
  "set bomb
  " set formatoptions+=jmB            " centos vim7.2 not 'j' option
  set formatoptions+=mB             " formatoptions
  set fileencoding=utf-8
  " set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,gb2312,gbk,big5,euc-jp,euc-kr
  set encoding=utf8
  " CJK environment detection and corresponding setting
  if v:lang =~ "^zh_CN"
    " Use cp936 to support GBK, euc-cn == gb2312
    set encoding=cp936
    set termencoding=cp936
    set fileencoding=cp936
  elseif v:lang =~ "^zh_TW"
    " cp950, big5 or euc-tw
    " Are they equal to each other?
    set encoding=big5
    set termencoding=big5
    set fileencoding=big5
  elseif v:lang =~ "^ko"
    " Copied from someone's dotfile, untested
    set encoding=euc-kr
    set termencoding=euc-kr
    set fileencoding=euc-kr
  elseif v:lang =~ "^ja_JP"
    " Copied from someone's dotfile, untested
    set encoding=euc-jp
    set termencoding=euc-jp
    set fileencoding=euc-jp
  endif
  " Detect UTF-8 locale, and replace CJK setting if needed
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
  endif
else
  echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:iswin
  " set guifont=Inconsolata:h10:cDEFAULT
  " set guifontwide=YtYaHei:h8:cDEFAULT
  " set guifont=Menlo:h9:cDEFAULT
  " set guifontwide=Menlo:h9:cDEFAULT
  set guifont=Courier\ New:h9:cDEFAULT
  set guifontwide=Courier\ New:h9:cDEFAULT
endif

if g:ismacos
  set guifontwide=Menlo:h12
  set guifont=Menlo:h12
endif

if g:islinux
  set guifont=Courier\ New:h9:cDEFAULT
  set guifontwide=Courier\ New:h9:cDEFAULT
  " set guifontwide=WenQuanYi\ Micro\ Hei:h9:cDEFAULT
endif

" 解决菜单乱码
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=6                 " 光标所在行上下两侧最少保留的屏幕可见行数, 简写 set so=6
set cmdheight=1                 " 命令行占1行
set ruler                       " 显示行号和列号
set number                      " 显示行号，切换行号显隐 set nu!
set number relativenumber       " 显示相对行号
set showcmd                     " 显示输入的字符
set wildmenu                    " 加强自动补全
set numberwidth=1               " 显示光标位置的，行号列号和百分比，简写 set nuw
set backspace=indent,eol,start  " 置光标在行首时按退格键，光标会回到上一行行尾
set incsearch                   " 搜索时动态调到第一个匹配的位置
set ignorecase                  " 搜索时忽略大小写
set smartcase                   " 如果搜索模式包含大写字母，忽略ignorecase
set nohls                       " 快速查找，直接定位到文本
set hlsearch                    " 高亮显示搜索结果
set showmatch                   " 插入括号时，短暂的跳转到匹配的对应括号，显示匹配的时间由matchtime决定
set matchtime=1                 " 单位是十分之一秒
set matchpairs=(:),{:},[:],<:>  " 匹配括号的规则，增加针对html的<>
set mat=2                       " 配对符号高亮
set magic                       " 使用转义字符识别
set nosol                       " 普通模式下光标行间移动时不到行首的第一个非空白，而是尽量在同一列
set display=lastline            " 解决自动换行格式下, 如折行之后高在超过窗口高度看不到最后一行的问题
set report=0                    " 报告哪些行被修改过
set go+=a                       " 选择后自动进入系统剪切板
set pumheight=9                 " 设置智能补全菜单长度
set completeopt=menuone         " 去掉智能补全预览，只显示菜单并自动插入
set autoread                    " 文件变化自动载入
set t_vb=0                      " 关闭输出铃声
set selection=inclusive         " 设定选择区是否包含最后一个光标所在字符
set lazyredraw                  " 减少重绘
set nowrapscan                  " 搜索到文件末尾时，不再回绕到文件首
" set autochdir                   " 自动切换路径
" set noswapfile                  " 禁止交换文件
" set linespace=4                 " 设置行间距，单位是像素
" set cmdwinheight=2              " 命令行窗口的屏幕行数
" set clipboard+=unnamed          " 默认寄存器和系统剪贴板共享

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off            " 文件类型检测开
filetype indent on      " 自动缩进开
filetype plugin on
filetype plugin indent on
set expandtab           " 插入tab时换成合适数量的空格
set shiftwidth=4        " 缩进一步使用的空格数目
set smarttab            " 行首的tab用合适的空格代替
set tabstop=4 et        " 文件里tab代表的空格数
set softtabstop=4       " 输入tab后就跳了4格, set sts=4
set linebreak           " 打开linebreak
set list                " trail:拖尾空白显示字符; extends/precedes是wrap关闭时,所在行在右左指示字符
set autoindent          " 按语法自动缩进 ai
set smartindent         " 智能缩进
set cindent             " 按C的语法缩进
set wrap                " 到屏幕边会回绕
set iskeyword+=_,$,@,%,#,-,*    " 将这些字符作为关键字，带有这些符号的单词不换行
set whichwrap=b,s,<,>,[,]
set colorcolumn=80      " 设置第列高亮
" set textwidth=512       " textwidth, 一行的最大宽度
" listchars tabe用..显示，尾部空格用-显示，eol不显示 ˫ ￩ ￪ ￫ ￬ ˖ · ˽ ⊹ ∙ ⋅⋆⋇ ༓ » ‣
if &term == 'xterm' || &term == 'xterm-256color'
  set listchars=tab:»»,trail:·,extends:>,precedes:<
else
  set listchars=tab:￫￫,trail:·,extends:>,precedes:<
endif
let g:xml_syntax_folding = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File type
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.wsgi setlocal filetype=python syntax=python foldmethod=indent
autocmd BufRead,BufNewFile jquery.*.js setlocal filetype=javascript syntax=jquery
autocmd BufRead,BufNewFile *.json setlocal filetype=json
autocmd BufRead,BufNewFile *vimrc setlocal filetype=vim syntax=vim
autocmd FileType vim,css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.tpl setlocal filetype=jinja syntax=jinja
autocmd FileType xml,html,xhtml setlocal foldmethod=syntax tabstop=2 shiftwidth=2 softtabstop=2 smartindent smarttab expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer切换
nmap <silent><Left> :bp<CR>
nmap <silent><Right> :bn<CR>

" 定义空格键暂时取消高亮匹配
nmap <silent><space> :nohls<CR>za
nmap <silent>z0 :set foldlevel=0<CR>
nmap <silent>z9 :set foldlevel=9<CR>

" 删除尾部空格
nmap <S-Space> :%s/\s\+$//g<CR>

" 重做，用于撤销后返撤销
nmap <S-U> :redo<CR>

" 文件操作
" command! -nargs=0 Q :q!
nmap <silent><leader>q :bd<CR>
nmap <silent><leader><S-Q> :bd!<CR>
nmap <silent><leader>w :w<CR>
nmap <silent><leader><S-W> :w!<CR>
" 文件格式设置成dos :set ff=dos<CR>
" 文件格式设置成unix :set ff=unix<CR>

"缩进快捷键
nmap <silent>> V><esc>
nmap <silent>< V<<esc>
vmap <silent>> :><cr>gv
vmap <silent>< :<<cr>gv

" 上下移动一行文字
nmap <C-J> :m+<cr>
nmap <C-K> :m-2<cr>
vmap <S-K> :m'<-2<cr>gv
vmap <S-J> :m'>+1<cr>gv
" vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" visual mode: only paste but not replace cut table
vmap p pgvy

" abbreviations
abbreviate CDATE <esc>"=strftime("%F")<CR>gP
abbreviate CDATETIME <esc>"=strftime("%F %T")<CR>gP


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set nofoldenable        " 关闭折叠
set foldenable          " 开启折叠
set foldmethod=indent   " 设置语法折叠 syntax | indent
set foldlevel=9         " 默认折叠开始层数
" set foldcolumn=0        " 设置折叠区域的宽度
" set foldclose=all       " 设置为默认折叠所有
" set foldnestmax=9
" 用空格键来开关折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开文件时
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 恢复退出时viminfo保存的光标位置
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope & ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dir /b /s /w *.py | grep -v z.py > cscope.files
" c:\Python27\Scripts\pycscope.exe -i cscope.files
" $ctags -R . 在当前目录下递归生成tags文件
" 告诉vim在当前目录找不到tags文件时请到上层目录查找
set tags=tags;/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff command
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"高亮当前行当前列(十字光标)
" set cursorcolumn                " 设置光标十字坐标，高亮当前列
set cursorline                  " 设置光标十字坐标，高亮当前行
highlight CursorLine cterm=underline ctermbg=NONE ctermfg=NONE gui=underline guibg=NONE guifg=NONE

call SetCursorStyle()
autocmd ColorScheme * silent call SetCursorStyle()
" autocmd Syntax * silent call SetCursorStyle()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('xclip')
  command! -nargs=0 XCopy :!xclip -f -sel clip<CR>
  command! -nargs=0 XPaste :r !xclip -o -sel clip<CR>
  vmap <leader>y !xclip -f -sel clip<CR>u
  nmap <leader>p :r !xclip -o -sel clip<CR>
endif

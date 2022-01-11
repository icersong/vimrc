"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright @ 2013-2014 by icersong
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10 00:00:00
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set nossl

" platform
let $MACOS = has('mac') || has('macunix')
let $LINUX = (has('linux') || has('unix') ) && !$MACOS
let $WINDOWS = has("win64") || has("win32") || has("win16") || has("win95")
" paths
let $CONFROOT = fnamemodify(expand('<sfile>'), ':h')
let $WEBROOT = simplify(expand($HOME.'/sites'))
let $VIMCACHE = simplify(expand($HOME.'/.cache'))
let $VIMSWAP = simplify(expand($VIMCACHE.'/swap'))
let $VIMWIKI = simplify(expand($VIMCACHE.'/wiki'))
let $VIMUNDO = simplify(expand($VIMCACHE.'/undo/'))
let $VIMBKUP = simplify(expand($VIMCACHE.'/backup/'))
if has('nvim')
  let $VIMFILES = simplify(expand($VIMCACHE.'/nvimfiles/plugins'))
else
  let $VIMFILES = simplify(expand($VIMCACHE.'/vimfiles/plugins'))
endif

if !has('nvim') && !has('python') && !has('python3')
  echo "Warning! Vim is compiled without python support."
endif
if !has('nvim') && !has('ruby')
  echo "Warning! Vim is compiled without ruby support."
endif

if !$WINDOWS
  let g:skip_loading_mswin = 1  " do not load mswin.vim
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Working Path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
for path in [$VIMCACHE, $VIMSWAP, $VIMBKUP, $VIMUNDO, $VIMWIKI]
  if !(isdirectory(path))
    call mkdir(path, 'p', 0700)
  endif
endfor

" if exists('$VIRTUAL_ENV')
"   if !empty(pyenv)
"     let pyenv_prefix = resolve(s:trim(s:system(['pyenv', 'prefix'])))
"     if $VIRTUAL_ENV != pyenv_prefix
"       let virtualenv_inactive = 1
"     endif
"   elseif !empty(pyname) && exepath(pyname) !~# '^'.$VIRTUAL_ENV.'/'
"     let virtualenv_inactive = 1
"   endif
" endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Arrow Key Fix
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term == 'xterm'
  autocmd! VimEnter * set t_Co=256
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use before config if available
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clipboard plug config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ' . simplify(expand($CONFROOT.'/clipboard.vim'))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" internal plug config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ' . simplify(expand($CONFROOT.'/netrw.vim'))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load functions & utils
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" execute 'source ' . simplify(expand($CONFROOT.'/functions.vim'))
" execute 'source ' . simplify(expand($CONFROOT.'/utils.vim'))
call bufswitch#default_maps()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load extends
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" execute 'source ' . simplify(expand($CONFROOT.'/ext-fcitx.vim'))
" execute 'source ' . simplify(expand($CONFROOT.'/ext-colors.vim'))
" execute 'source ' . simplify(expand($CONFROOT.'/ext-vsearch.vim'))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ' . simplify(expand($CONFROOT.'/plugins.vim'))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
if has("termguicolors")
    " enable true color
    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if !has('nvim') && version < 802
        " fix bug for vim
        " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set t_8f=^[[38;2;%lu;%lu;%lum
        set t_8b=^[[48;2;%lu;%lu;%lum
    endif
    set termguicolors
endif
" enable color scheme
set background=dark             " Assume a dark background
syntax on                       " Syntax highlighting
for scheme in ['solarized8_flat', 'solarized8', 'solarized', 'onedark', 'desert']
  if strlen(globpath(&rtp, "colors/".scheme.".vim")) > 0
    execute "colorscheme " . scheme
    break
  endif
endfor


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on              " 自动缩进开
filetype plugin on

" 默认寄存器unnamed&unnamedplus和系统剪贴板共享
" 共享系统剪切板会导致列粘贴失效
" set clipboard=unnamedplus 
" let g:clipboard = {'cache_enabled': 1}

if has('mouse') && has('gui_running')
  set mouse=a                   " enable mouse (a, r, v)
  set mousehide                 " Hide the mouse cursor while typing
  set selectmode=mouse,key
else
  set mouse=                    " disable mouse on console
endif

set undodir=$VIMUNDO            " 设置undo备份路径
set directory=$VIMSWAP          " 设置交换文件路径
set backupdir=$VIMBKUP          " 设置自动备份路径
set nobackup
set nowritebackup
" Clean undo cache 7 days ago
au VimLeave * silent exe '!find "'.$VIMCACHE.'/undo" -mtime +7 -exec rm -f {} \;'

" 恢复退出时viminfo保存的光标位置
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" set autochdir                   " 自动切换路径
" 自动转换当前工作路径，替代autochdir，防止插件冲突
" autocmd BufEnter,BufRead * if isdirectory(expand('%:p:h')) | lcd %:p:h | endif
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set viminfo='999,f1,<999
" set shortmess+=I                " 启动时不显示介绍信息
set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=all,onemore     " 虚环境编辑空间, Allow for cursor beyond last character
set history=999                 " Store a ton of history (default is 20)
" set spell                       " Spell checking on
set hidden                      " Allow buffer switching without saving, 放弃缓冲区时隐藏而不卸载
set iskeyword=a-z,A-Z,48-57,_   " word designator
set undofile                    " So is persistent undo ...
set undolevels=999              " Maximum number of changes that can be undone
set undoreload=999              " Maximum number lines to save for undo on a buffer reload

set autoread                    " 文件变化自动载入
set t_vb=0                      " 关闭输出铃声
set lazyredraw                  " 减少重绘
" set noswapfile                  " 禁止交换文件
" set cmdwinheight=2              " 命令行窗口的屏幕行数


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim ui
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  set guioptions=
  set showtabline=2
  set lines=48 columns=128
  " set switchbuf=usetab
  " au GUIEnter * simalt ~x
  set showmode
  set tabpagemax=15
  " 解决菜单乱码
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif


" Font
if $MACOS
  " Please set font of iTerm2
  " brew tap homebrew/cask-fonts
  " brew cask install font-fira-code
elseif $LINUX
  " https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager
  set guifont=Fira\ Code:h9,Courier\ New:h9:cDEFAULT
  set guifontwide=Fira\ Code:h9,Courier\ New:h9:cDEFAULT
elseif $WINDOWS
  " scoop bucket add nerd-fonts
  " scoop install firacode
  set guifont=Fira\ Code:h9,Courier\ New:h9:cDEFAULT
  set guifontwide=Fira\ Code:h9,Courier\ New:h9:cDEFAULT
endif

" 高亮当前行当前列(十字光标)
" set cursorcolumn                " 设置光标十字坐标，高亮当前列
set cursorline                  " 设置光标十字坐标，高亮当前行
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
highlight clear CursorLineNr    " Remove highlight color from current line number
" mast call after setting 'syntax on'
call cursorstyle#set_cursor_style()

set noshowmode                  " 禁止显示当前输入模式
set ruler                       " 显示行号和列号
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set numberwidth=1               " 显示光标位置的，行号列号和百分比，简写 set nuw
set showcmd                     " 显示输入的字符
set cmdheight=1                 " 命令行占1行
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set relativenumber              " 显示相对行号
" set showmatch                   " Show matching brackets/parenthesis
set matchpairs+=<:>             " 匹配括号的规则，增加针对html的<>
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=6                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set foldmethod=indent           " 设置语法折叠 syntax | indent
set foldlevel=9                 " 默认折叠开始层数
set updatetime=333              " 设置键盘闲置执行时间，默认4000
" set foldcolumn=0                " 设置折叠区域的宽度
" set foldclose=all               " 设置为默认折叠所有
" set foldnestmax=9
set signcolumn=yes

set list                        " trail:拖尾空白显示字符; extends/precedes是wrap关闭时,所在行在右左指示字符
" listchars tab用..显示，尾部空格用-显示，eol不显示 ˫ ￩ ￪ ￫ ￬ ˖ · ˽ ⊹ ∙ ⋅⋆⋇ ༓ » ‣
if &term == 'xterm' || &term == 'xterm-256color'
  set listchars=tab:›»,trail:·,extends:>,precedes:<
else
  set listchars=tab:￫￫,trail:·,extends:>,precedes:<
endif
set fillchars=vert:ǀ
let g:xml_syntax_folding = 1

set nostartofline               " 普通模式下光标行间移动时不到行首的第一个非空白，而是尽量在同一列
set display=lastline            " 解决自动换行格式下, 如折行之后高在超过窗口高度看不到最后一行的问题
set report=0                    " 报告哪些行被修改过
set go+=a                       " 选择后自动进入系统剪切板
set pumheight=9                 " 设置智能补全菜单长度
set completeopt=menuone,noinsert " 去掉智能补全预览，只显示菜单并自动插入
set selection=inclusive         " 设定选择区是否包含最后一个光标所在字符
set nowrapscan                  " 搜索到文件末尾时，不再回绕到文件首


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi-encodingi & file format setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("multi_byte")
  echoerr "Warning, this version of (g,n)vim was not compiled with multi_byte"
endif
set fileformats=unix,dos,mac        " 文件格式支持
" set formatoptions+=jmB            " centos vim7.2 not 'j' option
if ! $MACOS
  set ambiwidth=double              " 未知字符默认宽度
endif
" utf8编码下，将不明宽度字符按双倍宽度显示, double|single
scriptencoding utf-8
set formatoptions+=mB               " formatoptions
set fileencoding=utf-8
" set nobomb
" set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gb2312,gbk,big5,euc-jp,euc-kr
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting & Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab           " 插入tab时换成合适数量的空格
set shiftwidth=4        " 缩进一步使用的空格数目
set smarttab            " 行首的tab用合适的空格代替
set tabstop=4 et        " 文件里tab代表的空格数
set softtabstop=4       " 输入tab后就跳了4格, set sts=4
set linebreak           " 打开linebreak
set autoindent          " 按语法自动缩进 ai
set smartindent         " 智能缩进
set cindent             " 按C的语法缩进
set wrap                " 到屏幕边会回绕
set iskeyword+=_,$,@,%,#,-,*    " 将这些字符作为关键字，带有这些符号的单词不换行
set colorcolumn=80      " 设置第列高亮
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set splitright          " Puts new vsplit windows to the right of the current
" set splitbelow          " Puts new split windows to the bottom of the current
" set matchpairs+=<:>     " Match, to be used with %
" set textwidth=512       " textwidth, 一行的最大宽度

au BufNewFile,BufRead *.tpl set filetype=jinja
au BufRead,BufNewFile *.wsgi setlocal filetype=python foldmethod=indent
au FileType vue set tabstop=2 softtabstop=2 shiftwidth=2
au FileType vim,yaml,css setlocal tabstop=2 softtabstop=2 shiftwidth=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope & ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dir /b /s /w *.py | grep -v z.py > cscope.files
" c:\Python27\Scripts\pycscope.exe -i cscope.files
" $ctags -R . 在当前目录下递归生成tags文件
" 告诉vim在当前目录找不到tags文件时请到上层目录查找
set tags=tags;/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save selected to file
command! -range -nargs=1 SaveSelectedAs call functools#write_select_lines(<f-args>)

" command Removing duplicate liens
" http://vim.wikia.com/wiki/Uniq_-_Removing_duplicate_lines
" command RMDL %s/^\(.*\)\(\n\1\)\+$/\1/
command RDL g/\(^.*$\)\n\1$/d

" Trailing whitespace
command TrailingWhitespace execute '%s/\s\+$//ge'

" Json format
command FormatJSON execute '%!python -m json.tool'

" Xml format
command FormatXML silent call formaters#format_xml()
command FmtXML silent call formaters#format_xml()

" SQL format
command! -nargs=? -bar -range=% -bang FormatSQL silent call formaters#format_sql()
command! -nargs=? -bar -range=% -bang FmtSQL silent call formaters#format_sql()

" command profile log
command ProfileStartLog profile start ~/profile.log
      \ | profile func *
      \ | profile file *
command ProfileStopLog profile pause
      \ | noautocmd qall!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrapped lines goes down/up to next row, rather than next line in file.
"noremap j gj
"noremap k gk

" clipboard
" visual mode: only paste but not replace cut table
" migrate to clipboard.vim
" vnoremap p pgvy
" noremap <silent> <leader>p "+p
" noremap <silent> <leader>y "+y

" increase decrease indent
vnoremap < <gv
vnoremap > >gv
" nnoremap <silent>> V><esc>
" nnoremap <silent>< V<<esc>

" move line up & dnow
vnoremap <S-K> :m'<-2<cr>gv
vnoremap <S-J> :m'>+1<cr>gv
" vnoremap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
" vnoremap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" redo，default key <c-r>
noremap <S-U> :redo<CR>

" buffer switch
nnoremap <silent>> :bn<cr>
nnoremap <silent>< :bp<cr>

" 定义空格键暂时取消高亮匹配
noremap <silent>zz :nohls<CR>za
noremap <silent>z0 :set foldlevel=0<CR>
noremap <silent>z1 :set foldlevel=1<CR>
noremap <silent>z2 :set foldlevel=2<CR>
noremap <silent>z3 :set foldlevel=3<CR>
noremap <silent>z4 :set foldlevel=4<CR>
noremap <silent>z5 :set foldlevel=5<CR>
noremap <silent>z6 :set foldlevel=6<CR>
noremap <silent>z7 :set foldlevel=7<CR>
noremap <silent>z8 :set foldlevel=8<CR>
noremap <silent>z9 :set foldlevel=9<CR>

" 文件操作
let SYSBUFS=["quickfix","terminal","nofile","nowrite"]
noremap <silent><expr><leader><space> ":TrailingWhitespace<CR>"
noremap <silent><expr>Q index(SYSBUFS, &buftype) >= 0 ? ":bd!<CR>" : ":bd<CR>"
noremap <silent><expr><leader>q index(SYSBUFS, &buftype) >= 0 ? ":bd!<CR>" : ":bd<CR>"
noremap <silent><expr><leader><S-Q> index(SYSBUFS, &buftype) >= 0 ? ":bd!<CR>" : ":bd!<CR>"
noremap <silent><expr>W &buftype ==# 'quickfix' ? "" : ":w<CR>"
noremap <silent><expr><leader>w &buftype ==# 'quickfix' ? "" : ":w<CR>"
noremap <silent><leader><S-W> &buftype ==# 'quickfix' ? "" : ":w!<CR>"
noremap <silent>X :x<CR>
noremap <silent><leader>x :wq<CR>
noremap <silent><leader>X :wq!<CR>
" 文件格式设置成dos :set ff=dos<CR>
" 文件格式设置成unix :set ff=unix<CR>

" For when you forget to sudo.. Really Write the file.
cnoremap w!! w !sudo tee % >/dev/null
" command line %% get current path
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
noremap <leader>ew :e %%

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" abbreviations
abbreviate CDATE <esc>"=strftime("%F")<CR>gP
abbreviate CDATETIME <esc>"=strftime("%F %T")<CR>gP


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
" Use fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has('mac')
"   vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
" else
"   if executable('xclip')
"     command! -nargs=0 XCopy :!xclip -f -sel clip<CR>
"     command! -nargs=0 XPaste :r !xclip -o -sel clip<CR>
"     vnoremap <leader>y !xclip -f -sel clip<CR>u
"     noremap <leader>p :r !xclip -o -sel clip<CR>
"   endif
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fcitx auto switch while normal model
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if executable('fcitx-remote')
"     autocmd InsertEnter * call FcitxVimInsertEnter()
"     autocmd InsertLeave * call FcitxVimInsertLeave()
"     autocmd CmdlineEnter * call FcitxVimCmdlineEnter()
"     autocmd CmdlineLeave * call FcitxVimCmdlineLeave()
"     autocmd FocusGained * call FcitxVimFocus()
"     autocmd FocusLost * call FcitxVimLost()
"     autocmd VimEnter * call FcitxVimFocus()
"     autocmd VimLeave * call FcitxVimLost()
" endif

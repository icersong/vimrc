"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright @ 2013-2014 by icersong
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10 00:00:00
" Modified: 2014-11-03 17:44:24 [182]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General ENV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:iswindows = 0
let g:ismacos = 0
let g:isunix = 0
let g:islinux = 0
if (has("win32") || has("win95") || has("win64") || has("win16"))
  let g:platform = "windows"
  let g:iswindows = 1
  let $VIMFILES = $VIM.'/vimfiles'
  let $VIMCACHE = $VIM.'/cache'
  au GUIEnter * set nossl
else
  if has('mac')
    let g:ismacos = 1
    let g:platform = "macos"
  elseif has('unix')
    let g:isunix = 1
    let g:platform = "unix"
  elseif has('linux')
    let g:islinux = 1
    let g:platform = "linux"
  endif
  let $VIMFILES = $HOME.'/.vim'
  let $VIMCACHE = $HOME.'/.cache'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                "不要vim模仿vi模式

if has('mouse')
  set mouse=a "允许使用鼠标
endif

" 鼠标启用
if(g:iswindows)
  " 窗口最大化
  if has('gui_running')
    au GUIEnter * simalt ~x
  endif
  "source $VIMRUNTIME/mswin.vim
  behave mswin
endif

set history=64      " 历史记录最高数目
set autoread        " 文件更新时重新读取
set autochdir       " 在打开文件、切换/删除缓冲区、打开/关闭窗口等操作时，选择文件所在的目录
set nobackup        " 无备份文件
set noswapfile      " 缓冲区不使用交换文件
set noerrorbells    " 关闭错误信息响铃
set novisualbell    " 关闭代替鸣叫的可视响铃
set vb t_vb=        " 取消可视铃声
set shortmess=at    " 减少hit-enter屏幕消息提示的次数
set autochdir       " 自动改变当前文件路径为工作路径

" 打开文件时自动转换当前工作路径
"autocmd BufEnter,BufRead * if isdirectory(expand('%:p:h')) | lcd %:p:h | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd                     " 显示输入的字符
set mousehide                   " 默认不显示鼠标
set scrolloff=6                 " 光标所在行上下两侧最少保留的屏幕可见行数, 简写 set so=6
set ruler                       " 显示行号和列号
set wildmenu                    " 加强自动补全
set cmdheight=1                 " 命令行占1行
set nu                          " 显示行号，切换行号显隐 set nu!
set numberwidth=1               " 显示光标位置的，行号列号和百分比，简写 set nuw
set lazyredraw                  " 减少重绘
set backspace=indent,eol,start  " 置光标在行首时按退格键，光标会回到上一行行尾
set incsearch                   " 搜索时动态调到第一个匹配的位置
set ignorecase                  " 搜索时忽略大小写
set smartcase                   " 如果搜索模式包含大写字母，忽略ignorecase
set nohls                       " 快速查找，直接定位到文本
set hlsearch                    " 高亮显示搜索结果
set showmatch                   " 插入括号时，短暂的跳转到匹配的对应括号，显示匹配的时间由matchtime决定
set matchtime=3                 " 单位是十分之一秒
set matchpairs=(:),{:},[:],<:>  " 匹配括号的规则，增加针对html的<>
set mat=2                       " 配对符号高亮"
set magic
set nosol                       " 普通模式下光标行间移动时不到行首的第一个非空白，而是尽量在同一列
set virtualedit=all,onemore
set display=lastline            " 解决自动换行格式下, 如折行之后高在超过窗口高度看不到最后一行的问题
set report=0                    " 报告哪些行被修改过
set go+=a                       " 选择后自动进入系统剪切板
set completeopt=longest,menu    " 去掉智能补全预览，只显示菜单并自动插入
"set nowrapscan                  " 搜索到文件末尾时，不再回绕到文件首
"set hid                         " 放弃缓冲区时隐藏而不卸载
"set selection=exclusive         " 设定选择区的行为为闭区间，选择的最后一个字符包含在操作范围之内
"set linespace=4                 " 设置行间距，单位是像素
"set shortmess+=I                " 启动时不显示介绍信息
"set cmdheight=2                 " 命令行使用的屏幕行数
"set cmdwinheight=2              " 命令行窗口的屏幕行数

if has("gui_running")
  "set switchbuf=usetab          " 打开缓冲时在原来的窗口打开
  set showtabline=2             " 至少有两个标签页时才显示标签栏
  set guioptions=               "菜单栏、工具栏都不要了
  let psc_style='cool'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"File format and encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions+=mB           " formatoptions
set fileformats=unix,dos,mac    " 文件格式支持
set encoding=utf-8              " 文件默认编码
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
if has('gui_running')
  set termencoding=Chinese      " 指定终端使用的编码,在+multi_byte特性下有效,也可用utf-8
  set fileencoding=Chinese
else
  set termencoding=utf-8        " 指定终端使用的编码,在+multi_byte特性下有效,也可用utf-8
  set fileencoding=utf-8
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color & Font & encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists("syntax_on")
  syntax enable                 " 语法高亮显示开
  syntax on                     " 语法高亮显示开
  "autocmd BufEnter * syntax on
  autocmd BufDelete * syntax on " 修正删除其它buffer导致syntax off
endif
"set t_Co=256
"colorscheme torte

"高亮当前行当前列(十字光标)
set cursorline                  " 设置光标十字坐标，高亮当前行
set cursorcolumn                " 设置光标十字坐标，高亮当前列

if g:iswindows
  "set guifont=consolas:h10:cANSI
  set guifont=Inconsolata:h10:cDEFAULT
  set guifontwide=YtYaHei:h10:cDEFAULT
endif

if g:ismacos
  set guifontwide=Menlo:h11
  set guifont=Menlo:h11
  au BufEnter * :set guifont=   " fixed sometime not show chinese
endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

if has('gui_running')
  "set langmenu=zh_CN.utf-8
else
  language messages zh_CN.utf-8   " 解决consle输出乱码
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on             " 文件类型检测开
filetype indent on      " 自动缩进开
filetype plugin on
filetype plugin indent on
set expandtab           " 插入tab时换成合适数量的空格
set shiftwidth=4        " 缩进一步使用的空格数目
set smarttab            " 行首的tab用合适的空格代替
set tabstop=4 et        " 文件里tab代表的空格数
set softtabstop=4       " 输入tab后就跳了4格, set sts=4
set lbr                 " 打开linebreak
set ambiwidth=double    " 当encoding=utf-8或别的unicode编码时有效,使用ASCII字符两倍的宽度处理东亚字符类
set list                " 显示不可见字符,trail:拖尾空白显示字符,extends/precedes是wrap关闭时,所在行在屏幕右边和左边显示的指示字符
set autoindent          " 按语法自动缩进 ai
set smartindent         " 智能缩进
set cindent             " 按C的语法缩进
set wrap                " 到屏幕边会回绕
set iskeyword+=_,$,@,%,#,-  " 将这些字符作为关键字，带有这些符号的单词不换行
set whichwrap=b,s,<,>,[,]
set colorcolumn=80      " 设置第列高亮
"set tw=512             " textwidth, 一行的最大宽度

"listchars tabe用..显示，尾部空格用-显示，eol不显示"
set listchars=tab:»»,trail:.,extends:>,precedes:<


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File type
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile jquery.*.js setl ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *vimrc setl ft=vim syntax=vim
"autocmd FileType python,php,c,java,javascript,html,htm,smarty call SetCodingOption()
"autocmd FileType c call CMode()
"autocmd FileType python call PythonMode()
"autocmd FileType xml call SetXmlOption()
"autocmd FileType html,xhtml call SetHtmlOption()
"autocmd FileType vim call SetVimOption()
autocmd FileType vim setlocal tabstop=2 et
autocmd FileType vim setlocal softtabstop=2
autocmd FileType vim setlocal shiftwidth=2
autocmd FileType xml setlocal tabstop=2 et
autocmd FileType xml setlocal softtabstop=2
autocmd FileType xml setlocal shiftwidth=2
autocmd FileType css setlocal tabstop=2 et
autocmd FileType css setlocal softtabstop=2
autocmd FileType css setlocal shiftwidth=2
autocmd FileType html setlocal tabstop=2 et
autocmd FileType html setlocal softtabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType xhtml setlocal tabstop=2 et
autocmd FileType xhtml setlocal softtabstop=2
autocmd FileType xhtml setlocal shiftwidth=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

" 屏蔽命令模式下windows粘贴，变为列编辑，等同<C-Q>
"unmap <C-V>

" 定义空格键暂时取消高亮匹配
nmap <silent><space> :nohl<CR>
" 删除尾部空格
nmap <S-Space> :%s/\s\+$//g<CR>

if has('gui_running')
  " 前一个标签 shift+left
  map <S-Left> :tabp<CR>
  " 后一个标签 shift+right
  map <S-Right> :tabn<CR>
  " 重做，用于撤销后返撤销
  "imap <C-U> <esc>:redo<CR>
  nmap <S-U> :redo<CR>
  if (has("mac"))
    nmap <M-S-TAB> :tabp<CR>
    nmap <M-TAB> :tabn<CR>
    imap <M-S-TAB> <esc>:tabp<CR>
    imap <M-TAB> <esc>:tabn<CR>
    nmap <D-0> :tabn<CR>
    nmap <D-1> :tabn 1<CR>
    nmap <D-2> :tabn 2<CR>
    nmap <D-3> :tabn 3<CR>
    nmap <D-4> :tabn 4<CR>
    nmap <D-5> :tabn 5<CR>
    nmap <D-6> :tabn 6<CR>
    nmap <D-7> :tabn 7<CR>
    nmap <D-8> :tabn 8<CR>
    nmap <D-9> :tabn 9<CR>
    imap <D-0> <esc>:tabn<CR>
    imap <D-1> <esc>:tabn 1<CR>
    imap <D-2> <esc>:tabn 2<CR>
    imap <D-3> <esc>:tabn 3<CR>
    imap <D-4> <esc>:tabn 4<CR>
    imap <D-5> <esc>:tabn 5<CR>
    imap <D-6> <esc>:tabn 6<CR>
    imap <D-7> <esc>:tabn 7<CR>
    imap <D-8> <esc>:tabn 8<CR>
    imap <D-9> <esc>:tabn 9<CR>
  else
    nmap <C-S-TAB> :tabp<CR>
    nmap <C-TAB> :tabn<CR>
    imap <C-S-TAB> <esc>:tabp<CR>
    imap <C-TAB> <esc>:tabn<CR>
    nmap <A-0> :tabn<CR>
    nmap <A-1> :tabn 1<CR>
    nmap <A-2> :tabn 2<CR>
    nmap <A-3> :tabn 3<CR>
    nmap <A-4> :tabn 4<CR>
    nmap <A-5> :tabn 5<CR>
    nmap <A-6> :tabn 6<CR>
    nmap <A-7> :tabn 7<CR>
    nmap <A-8> :tabn 8<CR>
    nmap <A-9> :tabn 9<CR>
    imap <A-0> <esc>:tabn<CR>
    imap <A-1> <esc>:tabn 1<CR>
    imap <A-2> <esc>:tabn 2<CR>
    imap <A-3> <esc>:tabn 3<CR>
    imap <A-4> <esc>:tabn 4<CR>
    imap <A-5> <esc>:tabn 5<CR>
    imap <A-6> <esc>:tabn 6<CR>
    imap <A-7> <esc>:tabn 7<CR>
    imap <A-8> <esc>:tabn 8<CR>
    imap <A-9> <esc>:tabn 9<CR>
  endif
endif


" 文件操作
command! -nargs=0 Q :q!
nmap <S-Q> :q!<CR>
nmap <leader>q :q<CR>
nmap <leader><S-Q> :q!<CR>
nmap <leader>w :w<CR>
nmap <leader><S-W> :w!<CR>
" 文件格式设置成dos :set ff=dos<CR>
" 文件格式设置成unix :set ff=unix<CR>
" 在可视模式下按<leader>再按*或＃可以对选中的部分进行搜索
"vnoremap <silent> * :call VisualSearch('f')<CR>
"vnoremap <silent> # :call VisualSearch('b')<CR>

"缩进快捷键
nmap <tab> V>
nmap <S-tab> V<
vmap <tab> >gv
vmap <S-tab> <gv
vmap > >gv
vmap < <gv

"可视模式下加各种括号和引号
vnoremap ( <esc>`>i)<esc>`<i(<esc>
vnoremap [ <esc>`>i]<esc>`<i[<esc>
vnoremap { <esc>`>i}<esc>`<i{<esc>
vnoremap ` <esc>`>i`<esc>`<i`<esc>
vnoremap ' <esc>`>i'<esc>`<i'<esc>
"vnoremap " <esc>`>i"<esc>`<i"<esc>

" 代码折叠
" set foldenable        " 开启自动折叠
" set foldclose=all     " 设置为自动关闭折叠
set nofoldenable        " 关闭自动折叠
set foldmethod=syntax   " 设置语法折叠 syntax | indent
set foldcolumn=0        " 设置折叠区域的宽度
set foldnestmax=2
set foldlevel=1         " 设置折叠层数为
" 用空格键来开关折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

xnoremap p pgvy         " only paset but not replace cut table


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动加载编辑后的_vimrc配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if(g:iswindows)
"  autocmd BufWritePost _vimrc :source $VIM\_vimrc
"  autocmd BufWritePost _vimrc :set fileencoding=utf8
"else
"  autocmd BufWritePost .vimrc :source ~\.vimrc
"  autocmd BufWritePost .vimrc :set fileencoding=utf8
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GetVisualRange 获取当前选中内容
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search for other instances of the current visual range
" This works by:
" <ESC>                Cancel the visual range (it's location is remembered)
" /                    Start the search
" <C-R>=               Insert the result of an expression on
"                      the search line (see :help c_CTRL-R_= )
" GetVisualRange()<CR> Call the function created below
" <CR>                 Run the search
"vmap ,/ <ESC>/<C-R>=GetVisualRange()<CR><CR>

" Create the function that extracts the contents of the visual range
function! GetVisualRange()
    " Get the start and end positions of the current range
    let StartPosition = getpos("'<")
    let EndPosition = getpos("'>")

    " Prefix the range with \V to disable "magic"
    " See :help \V
    let VisualRange = ''

    " If the start and end of the range are on the same line
    if StartPosition[1] == EndPosition[1]
      " Just extract the relevant part of the line
      let VisualRange .= getline(StartPosition[1])[StartPosition[2]-1:EndPosition[2]-1]
    else
      " Otherwise, get the end of the first line
      let VisualRange .= getline(StartPosition[1])[StartPosition[2]-1:]
      " Then the all of the intermediate lines
      for LineNum in range(StartPosition[1]+1, EndPosition[1]-1)
        let VisualRange .= "\r" . getline(LineNum)
      endfor
      " Then the start of the last line
      let VisualRange .= "\r" . getline(EndPosition[1])[:EndPosition[2]-1]
    endif
    " Replace legitimate backslashes with double backslashes to prevent
    " a literal \t being interpreted as a tab
    "let VisualRange = substitute(VisualRange, '\\[nV]\@!', '\\\\', "g")

    " Return the result
    return VisualRange

endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将所选内容写入指定文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! WriteLinePart(filename) range
    call writefile([GetVisualRange()], a:filename, 'b')
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SQLPP 格式化选中的SQL内容，并更新到当前光标处
" depends shell.vim, GetVisualRange
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! SQLPP()
"    call writefile([GetVisualRange()], $TEMP."\\~.sql", "b")
"    "exec 'r!D:\\Program\\SQL.P.P\\sqlpp_cmd.exe -mysql -stdout -config=D:\\Program\\SQL.P.P\\default.ini -F "%"'
"    exec 'r!D:\\Program\\SQL.P.P\\sqlpp_cmd.exe -mysql -stdout -config=D:\\Program\\SQL.P.P\\default.ini -F "'.$TEMP.'\\~.sql"'
"endfunction
"
"command! -nargs=0 SQL call SQLPP()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML格式化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! XMLFormat()
    set filetype=xml
    :%s/></>\r</g "把><替换成>回车<
    :normal gg=G<cr>
endfunction
map <leader>xml :call FormatXML()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope & ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dir /b /s /w *.py | grep -v z.py > cscope.files
" c:\Python27\Scripts\pycscope.exe -i cscope.files
" 告诉vim在当前目录找不到tags文件时请到上层目录查找
set tags=tags;/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vondle plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source <sfile>:p:h/.vundle.vim
source $VIMFILES/vimrc/.vundle.vim

" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer: icersong <icersong@gmail.com>
" Last change: 2014-02-14
"
" To use it, copy it to
"   for Unix and OS/2:  ~/.gvimrc
"   for Amiga:  s:.gvimrc
"   for MS-DOS and Win32:  $VIM\_gvimrc
"   for OpenVMS:  sys$login:.gvimrc

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html/css tools  {{{1
" fast create xml css html
" eg: root>elememnt#property*3>default<ctrl-y>,
" Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
function! ProxyEmmetInstall()
  if functools#has_command('EmmetInstall')
    execute('EmmetInstall')
  endif
endfunction
autocmd FileType php,css,xml,tpl,htm,html,xhtml,jinja call ProxyEmmetInstall()

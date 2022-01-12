"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dbext         {{{ 1
" SQLComplete   {{{ 1
" Plug 'vim-scripts/dbext.vim'
" Plug 'vim-scripts/SQLComplete.vim'
"
" let g:dbext_default_history_size = 1024
" let g:dbext_default_history_max_entry = 1024 * 1024
" let g:dbext_default_history_file = $VIMCACHE . '/dbext_sql_history.txt'
" let g:dbext_default_profile = 'MySQL'
" let g:dbext_default_type = 'MYSQL'
" let g:dbext_default_user = 'root'
" let g:dbext_default_passwd = '123456'
" let g:dbext_default_host = 'localhost'
" let g:dbext_default_buffer_lines = '100'
" let g:dbext_default_menu_mode = 0
" let g:dbext_default_profile_MySQL = 'type=MYSQL:user=root:passwd=123456:dbname=wf2_colorprint3'


" SHELL: export DBEXT_MYSQL_local='type=MYSQL:user=smartfactory:passwd=smartpw:dbname=demo'


" 切换MySQL连接
function! s:switch_mysql_profile(name)
    execute('let dburl $DBEXT_MySQL_' . name)
    echo dburl
endfunction


" 切换mysql database
function! s:switch_mysql_db(db)
    g:dbext_default_profile_MySQL
endfunction


command! -nargs=1 DBEXT_SWITCH call s:switch_mysql_profile(<f-args>)

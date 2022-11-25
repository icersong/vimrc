" ▾  ▸

let g:db_ui_save_location=$VIMCACHE . '/dbui'

let g:db_ui_icons = {
\   'expanded': '⮛',
\   'collapsed': '⮚',
\   'saved_query': '*',
\   'new_query': '+',
\   'tables': '~',
\   'buffers': '»',
\   'connection_ok': '✓',
\   'connection_error': '✕',
\ }

let g:db_ui_table_helpers = {
\   'postgresql': {
\       'Count': 'select count(*) from "{table}"',
\       'List': 'select * from "{table}" order by id asc',
\   },
\   'mysql': {
\       'Count': 'select count(*) from `{table}`',
\       'List': 'select * from `{table}` order by id asc',
\   },
\   'sql': {
\       'Count': 'select count(*) from `{table}`',
\       'List': 'select * from `{table}` order by id asc',
\   }
\ }

" let g:dbs = [
" \ {'name': 'local', 'url': 'mysql://smartfactory:smartpw@localhost:3306/demo'}
" \ ]

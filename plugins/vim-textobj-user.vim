"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-textobj-user  {{{1

call textobj#user#plugin('datetime', {
\   'datetime': {
\     'pattern': '\<\d\d\d\d-\d\d-\d\d\([ T]\d\d:\d\d:\d\d\)\?\>',
\     'select': ['ad', 'id'],
\   },
\   'date': {
\     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
\     'select': ['aD', 'iD'],
\   },
\   'time': {
\     'pattern': '\<\d\d:\d\d:\d\d\>',
\     'select': ['aT', 'iT'],
\   },
\ })

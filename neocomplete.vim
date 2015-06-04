"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_insert_char_pre = 0
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#max_list = 9
let g:neocomplete#min_keyword_length = 4
let g:neocomplete#sources#syntax#min_keyword_length = 6
let g:neocomplete#data_directory = $VIMCACHE.'/neocomplete'

if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.c = 'h,cpp'
let g:neocomplete#same_filetypes.cpp = 'c,h'
let g:neocomplete#same_filetypes.html = 'xml,xhtml'
let g:neocomplete#same_filetypes.python = 'py,wsgi'
let g:neocomplete#same_filetypes.javascript = 'html'
let g:neocomplete#same_filetypes.gitconfig = '_'
let g:neocomplete#same_filetypes.txt = '_'
" let g:neocomplete#same_filetypes._ = '_'

if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns.vim = ['#']
" let g:neocomplete#delimiter_patterns.cpp = ['::']
let g:neocomplete#delimiter_patterns.python = ['.']
" let g:neocomplete#delimiter_patterns.javascript = ['.']

" if !exists('g:neocomplete#sources')
"   let g:neocomplete#sources = {}
" endif
" let g:neocomplete#sources._ = ['buffer']
" let g:neocomplete#sources.cpp = ['buffer', 'dictionary', 'cache']
" let g:neocomplete#sources.python = ['-']
" let g:neocomplete#sources.javascript = ['-']

" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ }
" if !exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = ''
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" set completeopt+=longest

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction

" Enable omni completion.
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

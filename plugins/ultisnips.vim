"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips   {{{1
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnips = {}
let g:UltiSnipsListSnippets = '<C-L>'
"let g:UltiSnipsExpandTrigger = '<Tab>'
"let g:UltiSnipsJumpForwardTrigger = '<Tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
let g:UltiSnipsSnippetsDir=simplify(expand($CONFROOT.'/snippets/UltiSnips'))
let g:UltiSnipsSnippetDirectories=[simplify(expand($VIMFILES.'/vim-snippets/UltiSnips'))]

let g:snips_author = 'icersong'
let g:snips_email = 'icersong@gmail.com'
let g:snips_github = 'https://github.com/icersong'

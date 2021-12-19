"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag    {{{1
" Plug 'rking/ag.vim'
" Search by file name
" :AgFile [options] {pattern} [{directory}]
" Search file content
" :Ag [options] {pattern} [{directory}]
" :Ag '\\\#define foo' to search for #define foo
let g:ag_prg="ag --vimgrep --nocolor --nogroup --smart-case --ignore .git --ignore .svn --ignore .DS_Store"
let g:ag_working_path_mode="r"
let g:ag_format="%f:%l:%c:%m"
let g:ag_hightlight=1
let g:ag_qhandler="copen"
nnoremap <leader>gf  :AgFile<space>
" 用ag在当前工程下搜索光标下的文件名
nnoremap <leader>ff :AgFile! "<C-R>=escape(escape(expand('<cword>'), '\'), '"/\*\ \|\(\))')<CR>"
" 用ag在当前工程下搜索选中文本的文件名 gag
vnoremap <leader>ff ""y:AgFile! "<C-R>=escape(escape(@", '\'), '"/\*\ \|\(\))')<CR>"
vnoremap <leader>ff :AgFile! "<C-R>=escape(escape(GetVisualSelection(), '\'), '"/\*\ \|\(\))')<CR>"

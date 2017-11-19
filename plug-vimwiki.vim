"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki  {{{1
" Plug 'icersong/vimwiki'
" Plug 'vimwiki/vimwiki'

let g:vimwiki_list = [{
  \ 'path': simplify(expand($VIMWIKI.'/projects/technology')),
  \ 'path_html': simplify(expand($VIMWIKI.'/static/technology')),
  \ 'css_name': '/style.css',
  \ 'template_path': simplify(expand($VIMWIKI.'/templetes')),
  \ 'template_default': 'default',
  \ 'template_ext': '.tpl',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'auto_export': 1,
  \ 'auto_toc': 0,
  \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp', 'html': 'html',},
  \ 'custom_wiki2html': simplify(expand($VIM_TOOL_PATH.'/misaka_md2html/misaka_md2html.py')),
  \ 'diary_link_count': 5
  \ }, {
  \ 'path': simplify(expand($VIMWIKI.'/projects/soc')),
  \ 'path_html': simplify(expand($VIMWIKI.'/static/soc')),
  \ 'css_name': 'css/style.css',
  \ 'template_path': simplify(expand($VIMWIKI.'/templetes')),
  \ 'template_default': 'default',
  \ 'template_ext': '.tpl',
  \ 'auto_export': 1,
  \ 'auto_toc': 1,
  \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp','html': 'html',},
  \ 'diary_link_count': 5
  \ }]
let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_use_mouse = 1
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_user_htmls = '404.html,search.html'
let g:vimwiki_toc_header = 'Catalogue'
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 2
" 禁止添加vimwiki菜单到GUIVim菜单
let g:vimwiki_menu = ''
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
" 详见下文...
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1,nav'
" 是否开启按语法折叠  会让文件比较慢
" let g:vimwiki_folding = 'syntax'
autocmd BufNewFile $VIMWIKI/** set fileencoding=utf8

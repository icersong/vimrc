"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xml.vim  {{{1
" Plug 'othree/xml.vim'
" auto close tag
":help xml-plugin
"<para>|   ==>  <para>|</para>
"<para>>|  ==>  <para>\n..|\n</para>
"LocalLeader is '\'
"<LocalLeader> d or D del tags or with contant
"<LocalLeader> % jump to the matching tag
" let xml_tag_completion_map = "<C-l>"
let g:xml_warn_on_duplicate_mapping = 1

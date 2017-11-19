"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic   {{{1
" check syntax for all language while write file.
" Plug 'scrooloose/syntastic'
" examine debug messages with :mes
" let g:syntastic_debug               = 1
let g:syntastic_error_symbol        = "✘"
let g:syntastic_warning_symbol      = "⚠"
let g:syntastic_style_error_symbol  = "✗"
let g:syntastic_style_warning_symbol= "◬"
let g:syntastic_aggregate_errors    = 1
let g:syntastic_auto_loc_list       = 1
let g:syntastic_auto_jump           = 0
let g:syntastic_loc_list_height     = 3
let g:syntastic_ignore_files        = ['.*\.log$']
let g:syntastic_html_checkers       = ['tidy']  " 'jshint', 'jslint'
let g:syntastic_xhtml_checkers      = ['tidy']
let g:syntastic_javascript_checkers = ['jsl']
let g:syntastic_xml_checkers        = ['xmllint']
let g:syntastic_python_checkers     = ['pep8', 'pyflakes']
let g:syntastic_python_pep8_args='--ignore=C901 --max-line-length=120'
if !executable('pep8')
  if executable('/usr/local/bin/pep8')
    let g:syntastic_python_pep8_exec='/usr/local/bin/pep8'
  endif
endif
" let g:syntastic_python_pep8_options='-std=c++11 -I$ROOTSYS/include/'
let g:syntastic_python_pyflakes_quiet_messages={"regex": [
    \ 'unable to detect undefined names$']}
let g:syntastic_python_pep8_quiet_messages={"regex": [
    \ '^E111', '^E127', '^E128', '^E401', '^E402', '^E501', '^E701', '^E731', '^E721']}
let g:syntastic_javascript_jsl_quiet_messages={"regex": [
    \ 'redeclaration of var',
    \ 'variable rid hides argument',
    \ 'missing default case in switch statement',
    \ 'missing break statement for last case in switch',
    \ 'anonymous function does not always return a value',
    \ 'function {\\w}\+ does not always return a value',
    \ 'extra comma is not recommended in array initializers',
    \ 'trailing comma is not legal in ECMA-262 object initializers',
    \ 'increment (++) and decrement (--) operators used as part of greater statement',
    \ 'unexpected end of line; it is ambiguous whether these lines are part of the same statement']}
let g:syntastic_css_csslint_quiet_messages={
    \ "regex": ["^Duplicate property",
    \ 'Using width with border can sometimes make elements larger than you expect. (box-model)',
    \ 'Using height with border can sometimes make elements larger than you expect. (box-model)']}
let g:syntastic_html_tidy_quiet_messages={"regex":
    \ ['unescaped & which should be written as &amp;']}
let g:syntastic_xhtml_tidy_quiet_messages={"regex":
    \ ['unescaped & which should be written as &amp;']}
let g:syntastic_po_msgfmt_quiet_messages={"regex":
    \ ['header field ''Last-Translator'' still has the initial default value']}

if g:iswin
  let $PATH=$VIM.'\\Utilities;'.$PATH
  let $PATH=$VIM.'\\Utilities\\GNU;'.$PATH
  let $PATH=$VIM.'\\Utilities\\jsl;'.$PATH
  let $PATH='C:\\Python27\\Scripts;'.$PATH
  let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python', 'xml'],
      \ 'passive_filetypes': [] }
endif

if g:ismacos
  let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['javascript', 'html', 'xhtml', 'css', 'python', 'xml'],
      \ 'passive_filetypes': [] }
endif

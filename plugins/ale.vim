"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale     {{{1
" check syntax for all language while write file.

nmap <silent> <leader>jp <Plug>(ale_previous_wrap)
nmap <silent> <leader>jn <Plug>(ale_next_wrap)

let g:ale_maximum_file_size = 999999
let g:ale_max_signs = 99
let g:ale_sign_error = "✘"
let g:ale_sign_warning = "⚠"
let g:ale_sign_style_error = "✗"
let g:ale_sign_style_warning = "◬"
let g:ale_echo_msg_format = '[ALE] [%severity%] [%linter%] %code: %%s'
let g:ale_echo_delay = 333
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 3333
let g:ale_completion_enabled = 0
let g:ale_completion_delay = 666
let g:ale_completion_max_suggestions = 9

" let g:ale_python_flake8_executable = system('pyenv root').'/versions/nvim-py2/bin/flake8'
let g:ale_python_flake8_executable = 'python -m flake8'
let g:ale_python_flake8_options = '--max-line-length=120'

" let g:ale_python_pylint_executable = 'python -m pylint'
let g:ale_python_pylint_options = '-d line-too-long -d invalid-name -d too-few-public-methods'

" let g:ale_linters_explicit = 1
let g:ale_linters = {
    \ 'javascript': [],
    \ 'python': [],
    \ }

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'xml': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'eslint',
      \ ],
      \ 'css': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'php': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'html': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'json': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'eslint',
      \ ],
      \ 'jinja': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'python': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'isort',
      \   'add_blank_lines_for_python_control_statements',
      \   'autopep8',
      \   'yapf',
      \ ],
      \ 'javascript': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'vue': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'eslint',
      \ ],
      \}

      " \ 'javascript': [
      " \   'eslint',
      " \   {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
      " \ ],

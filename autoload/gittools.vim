"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 获取Git项目根路径
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! gittools#get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

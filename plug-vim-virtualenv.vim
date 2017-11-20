"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-virtualenv    {{{1
" Plug 'jmcantrell/vim-virtualenv'

" ----------------------------------------
" function to list virtualenvs
" change the directory path to point to your virtualenvs
" default load virtualenv VIRTUAL_ENV
" .bash_profile or .zshrc
" export VIRTUAL_ENV=$WORKON_HOME/<virtual_env_name>

" function _VirtualEnvActivate()
" py << EOF
" import os
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
"   print 'Activate', os.environ['VIRTUAL_ENV']
" else:
"   print 'VIRTUAL_ENV not found.'
" EOF
" endfunction
" ----------------------------------------

" changing virtualenv should restart ycmserver
" Venv <Virtualenv-name>
let g:virtualenv_directory = simplify(expand('~/.virtualenvs'))
fun ReturnVirtualEnvs(A,L,P)
  return system("ls -d ~/.virtualenvs/*/ \| cut -d'/' -f5")
endfun
if g:ismacos && !has('nvim')
  command -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args> | YcmRestartServer
else
  command -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args>
endif

# coc plugin


## Using CocList

* Show all diagnostics

    : nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

* Manage extensions

    : nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

* Show commands

    : nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

* Find symbol of current document

    : nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

* Search workspace symbols

    : nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

* Do default action for next item.

    : nnoremap <silent> <space>j  :<C-u>CocNext<CR>

* Do default action for previous item.

    : nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

* Resume latest coc list

    :nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


## install

### install yarn (node module management)

    $ npm install -g yarn

### install plugin coc-eslint

    $ sudo npm install -g yarn

    $ yarn add eslint babel-eslint \
      eslint-standard eslint-plugin-standard eslint-config-standard \
      eslint-plugin-promise eslint-plugin-import eslint-plugin-node

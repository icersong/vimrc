# neovim install


## install nodejs

  install nodejs

    $ brew install nodejs

  install node module neovim

    $ sudo npm install neovim

  install pack manager yarn

    $ sudo npm install -g yarn

  install for plugin coc-eslint

    $ yarn add eslint babel-eslint \
      eslint-standard eslint-plugin-standard eslint-config-standard \
      eslint-plugin-promise eslint-plugin-import eslint-plugin-node


## install ruby & rvm

  install rvm

    $ curl -L get.rvm.io | bash -s stable

  show version

    $ rvm -v

  change ruby source

    $ echo "ruby_url=https://cache.ruby-china.com/pub/ruby" > ~/.rvm/user/db

  show known ruby list

    $ rvm list known

  install ruby

    $ rvm install 2.6.5 --disable-binary

  set default ruby

    $ rvm use 2.6.5 --default

  install ruby module neovim

    $ gem install neovim

  install for plugin tmuxinator

    $ gem install tmuxinator


## install pyenv & nvim-py2 & nvim-py3

  install xcode    

    $ xcode-select --install

  install pyenv

    $ brew install pyenv

  install python2

    $ CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v 2.7.16

  install python3

    $ pyenv install -v 3.8

  install nvim-py2

    $ pyenv virtualenv 2.7.16 nvim-py2
    $ pyenv activate nvim-py2
    $ pip install pynvim
    $ pip install flake8 pycodestyle pyflakes sqlparse

  install nvim-py3

    $ pyenv virtualenv 3.8 nvim-py3
    $ pyenv activate nvim-py3
    $ pip install pynvim
    $ pip install flake8 pycodestyle pyflakes sqlparse

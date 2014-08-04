.vim
====

~~Mark's~~ My vim config

Set up
------

1. clone to ~/.vim
2. install submodules
  1. `git submodule init`
  2. `git submodule update`
  3. `git submodule foreach git pull origin master` (to get latest code)
3. make link to vimrc: `ln -s ~/.vim/vimrc ~/.vimrc`


Adding new plugins
-----------------

1. cd ~/.vim
2. git submodule init
3. git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
4. git commit -m 'Added vim-fugitive'
5. git push


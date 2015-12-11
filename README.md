.vim
--

My vim config

Set up
----

1. clone to ~/.vim
2. install submodules
 1. `git submodule init`
 2. `git submodule update`
 3. `git submodule foreach git pull origin master` (to get latest code)
3. make link to vimrc: `ln -s ~/.vim/vimrc ~/.vimrc`


Adding new plugins
----

1. cd ~/.vim
2. git submodule init
3. git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
4. git commit -m 'Added vim-fugitive'
5. git push

Configuring neovim to run alongside vim
-----

    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

Making clipboard paste work in Neovim
-----

sudo apt-get install xclip

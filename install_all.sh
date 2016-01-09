#! /bin/bash

NVIM_FOLDER="nvim/.config/nvim"
# only a single file is needed from some submodules' repo
# so we put the submodules in submodules/ and then copy the file needed
function submodule_install {
  git submodule update --init --recursive
  mkdir -p $NVIM_FOLDER/autoload
  ln -s `pwd`/submodules/vim-plug/plug.vim `pwd`/$NVIM_FOLDER/autoload/
  vim +PlugInstall +qall
}

submodule_install

TARGET=$HOME
programs=('terminator'
          'aliases'
          'awesome'
          'git'
          'lxterminal'
          'vim'
          'zsh'
	  'nvim'
          )
for i in "${programs[@]}"
do
  stow $i -t $TARGET
done

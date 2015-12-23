#! /bin/bash

NVIM_FOLDER="nvim/.config/nvim"
# only a single file is needed from some submodules' repo
# so we put the submodules in submodules/ and then copy the file needed
function submodule_install { 
  mkdir -p $NVIM_FOLDER/autoload
  cp submodules/vim-plug/plug.vim $NVIM_FOLDER/autoload/
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

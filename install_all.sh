#! /bin/bash

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

#! /bin/bash

TARGET=$HOME
programs=('terminator' 
          'aliases'
          'awesome'
          'git'
          'lxterminal'
          'vim'
          'zsh'
          )
for i in "${programs[@]}"
do
  stow $i -t $TARGET
done

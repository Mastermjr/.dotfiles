#!/bin/bash

#SCRIPT TO SYNC FILES
BASE=~/.dotfiles

#vim
ln -s $BASE/vimrc ~/.vimrc
ln -sn $BASE/vim/ ~/.vim
#make vim dirs
  if [ ! -d vim/undo/ ];
    then
      mkdir vim/undo/
    fi
  if [ ! -d vim/tmp/ ];
    then
      mkdir vim/tmp/
    fi

#zsh

ln -s $BASE/zshrc ~/.zshrc

#tmux
ln -s $BASE/tmux.conf ~/.tmux.conf

#oh-my-zsh custom
cd oh-my-zsh/
ln -s $BASE/custom-oh-my-zsh/mikey_theme.zsh-theme custom/themes/mikey_theme.zsh-theme

#add in .local_aliases file
if [ -f ~/.local_alias ]; then
  exit
else
  touch .local_alias
fi

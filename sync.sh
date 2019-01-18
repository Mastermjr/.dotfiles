#!/bin/bash

#SCRIPT TO SYNC FILES
BASE=~/.dotfiles

#vim
ln -s $BASE/vimrc ~/.vimrc
ln -sn $BASE/vim/ ~/.vim

#zsh
ln -s $BASE/zshrc ~/.zshrc

#tmux
ln -s $BASE/tmux.conf ~/.tmux.conf

#oh-my-zsh custom
cd oh-my-zsh/
ln -s $BASE/custom-oh-my-zsh/mikey_theme.zsh-theme custom/themes/mikey_theme.zsh-theme

#add in .local_aliases file
if [ -f ~/.local_aliases ]; then
  exit
else
  touch .local_alisases
fi

#!/bin/bash

#SCRIPT TO SYNC FILES
BASE=~/.dotfiles

#vim
ln -s $BASE/vimrc ~/.vimrc
ln -s $BASE/vim/ ~/.vim

#zsh
ln -s $BASE/zshrc ~/.zshrc

#tmux
ln -s $BASE/tmux.conf ~/.tmux.conf

#oh-my-zsh custom
cd oh-my-zsh/
ln -s $BASE/custom-oh-my-zs/mikey_theme.zsh-theme custom/themes/mikey_theme.zsh-theme

#!/bin/bash

#SCRIPT TO SYNC FILES
BASE=~/.dotfiles

#vim
ln -s $BASE/vimrc ~/.vimrc
ln -s $BASE/vim ~/.vim

#zsh
ln -s $BASE/zshrc ~/.zshrc

#tmux
ln -s $BASE/tmux.conf ~/.tmux.conf



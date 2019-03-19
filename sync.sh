#!/bin/bash

#SCRIPT TO SYNC FILES
BASE=~/.dotfiles

#setup gitconfig
ln -s $BASE/gitconfig ~/.gitconfig

# setup shortcuts
if [ ! -f ~/.scrc ];
  then
  touch .scrc
fi
#vim
ln -s $BASE/vimrc ~/.vimrc
ln -sn $BASE/vim/ ~/.vim

#make vim dirs
if [ -f ~/.viminfo ];
  then
  cp ~/.viminfo $BASE/vim/viminfo
  rm ~/.viminfo
  ln -sn $BASE/vim/viminfo ~/.viminfo
  else
  ln -sn $BASE/vim/viminfo ~/.viminfo
fi

if [ ! -d vim/undo/ ];
  then
    mkdir vim/undo/
fi
if [ ! -d vim/tmp/ ];
  then
    mkdir vim/tmp/
fi
#generate helptags
vim -c ":helptags ALL" -c q

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

#submodules update
git submodule foreach git checkout master; git pull origin master;

#grab vim modules:
$BASE/vim/pack/install.sh

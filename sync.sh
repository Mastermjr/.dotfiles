#!/bin/bash

#SCRIPT TO SYNC FILES
BASE=$HOME/.dotfiles

#setup gitconfig
ln -sf $BASE/gitconfig $HOME/.gitconfig

# setup shortcuts
if [ ! -f $HOME/.scrc ];
  then
  touch $HOME/.scrc
fi 
#setup linux_sync dir
if [ ! -d ./linux_sync ];
  then
  mkdir linux_sync
  touch ./linux_sync/local_alias
fi

#vim
ln -sf $BASE/vimrc $HOME/.vimrc
ln -sf $BASE/vim/ $HOME/.vim

#make vim dirs
if [ ! -f $HOME/.viminfo ];
  then
  cp $HOME/.viminfo $BASE/vim/viminfo
  rm $HOME/.viminfo
  ln -sn $BASE/vim/viminfo $HOME/.viminfo
  else
  ln -sf $BASE/vim/viminfo $HOME/.viminfo
fi
if [ ! -d vim/undo/ ];
  then
    mkdir $BASE/vim/undo/
fi
if [ ! -d vim/tmp/ ];
  then
    mkdir $BASE/vim/tmp/
fi

#nvim config
if [ ! -d $HOME/.config/nvim/ ];
  then
    ln -s $BASE/nvim/ $HOME/.config/nvim/
  else
    echo "NVIM DIRECTORY EXISTS"
fi

<<<<<<< HEAD

=======
>>>>>>> 2f076795bb57fcf880a8be21fc21f386fb171844
#update vim-plug
if [ ! -d vim/pack/ ];
  then
    mkdir $BASE/vim/pack/
    #generate helptags and install plugins
    nvim --headless +PlugInstall +q +q
  else
  nvim --headless +PlugUpgrade +q +q
  nvim --headless +PlugUpdate +q +q
fi

#zsh
if [ ! -d $BASE/linux_sync/bin/ ];
  then
    mkdir $BASE/linux_sync/bin/
fi

ln -sf $BASE/zshrc $HOME/.zshrc

#tmux
ln -sf $BASE/tmux.conf $HOME/.tmux.conf

#rust


#GO dir setups
if [ ! -d "${GOPATH}" ];
then
  mkdir "${GOPATH}"
fi

#submodules update
git submodule foreach git checkout master; git pull origin master;

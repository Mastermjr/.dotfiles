#!/bin/bash

#SCRIPT TO SYNC FILES
BASE=~/.dotfiles

#setup gitconfig
ln -s $BASE/gitconfig $HOME/.gitconfig

# setup shortcuts
if [ ! -f $HOME/.scrc ];
  then
  touch $HOME/.scrc
fi

#setup linux_sync dir
if [ ! -f ./linux_sync ];
  then
  mkdir linux_sync
  touch ./linux_sync/local_alias
fi

#vim
ln -s $BASE/vimrc $HOME/.vimrc
ln -sn $BASE/vim/ $HOME/.vim

#make vim dirs
if [ ! -f $HOME/.viminfo ];
  then
  cp $HOME/.viminfo $BASE/vim/viminfo
  rm $HOME/.viminfo
  ln -sn $BASE/vim/viminfo $HOME/.viminfo
  else
  ln -sn $BASE/vim/viminfo $HOME/.viminfo
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
    ln -sn $BASE/nvim/ $HOME/.config/nvim/
  else
    echo "MAY NEED TO REPLACE CURRENT NVIM"
fi

#coc-nvim config
echo '{
  "languageserver": {
    "metals": {
      "command": "metals-vim",
      "rootPatterns": ["build.sbt"],
      "filetypes": ["scala", "sbt"]
    },
     "latex": {
    "command": "$HOME/.dotfiles/texlab/target/release/texlab",
    "ignoredRootPaths": ["~"],
    "filetypes": ["tex", "bib", "plaintex", "context"]
    }
  }
}' > $HOME/nvim/coc-settings.json


#update vim-plug
nvim -c ":PlugUpgrade" -c q

if [ ! -d vim/pack/ ];
  then
    mkdir $BASE/vim/pack/
    #generate helptags and install plugins
    nvim -c ":PlugInstall" -c q
  else
    nvim -c ":PlugUpdate" -c q
fi

#zsh
if [ ! -d $BASE/linux_sync/bin/ ];
  then
    mkdir $BASE/linux_sync/bin/
fi

ln -s $BASE/zshrc $HOME/.zshrc

#tmux
ln -s $BASE/tmux.conf $HOME/.tmux.conf

#rust


#GO dir setups
if [ ! -d "${GOPATH}" ];
then
  mkdir "${GOPATH}"
fi

#submodules update
git submodule foreach git checkout master; git pull origin master;

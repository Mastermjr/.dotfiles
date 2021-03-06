# .dotfiles
Syncing my Dotfiles

**git clone --recurse-submodules** https://github.com/Mastermjr/.dotfiles.git  
**git clone --recurse-submodules** git@github.com:Mastermjr/.dotfiles.git

## tmux-resurrect info: 
  saves to: **.tmux/resurrect/**

## After Clone:
1.  Change login shell to zsh
```shell
chsh -s /bin/zsh
```

2. Setup files
```shell
./sync.sh
```

3.  Install binary depends
```shell 
sudo apt install -y \
  vim \
  tmux 
``` 

4. Install vim packages:
```
#launch vim
:PlugInstall
```

5. Autocomplete: 
#### Linux: 
[Link](https://github.com/ycm-core/YouCompleteMe#linux-64-bit)
Steps:
  1. sudo apt install build-essential cmake vim-nox python3-dev
  2. `cd ~/.dotfiles/vim/pack/YouCompleteMe`
  3. git submodule update --init --recursive
  4. ./install.py --clang-completer
     
#### MAC:
**TODO:**

##MAC: emap cmd to ctrl-a: 
  - [link](https://superuser.com/questions/259614/bind-tmux-prefix-to-os-x-cmd-key-or-any-other-binding)
  - ctrl-a == 0x02

## fun submodule commands:
  `'FolderName' already exists in the index` 

  git ls-files --stage

  git rm -r --cached [file path

## update submodules
  **forgot --recurse:** git submodule update --init
  git submodule foreach git pull origin [master||BRANCH]
  git submodule update

## ignore changes
  Add `ignore = dirty` to each problematic `submodule` section in `.gitmodules` files placed at root of repo. Example:

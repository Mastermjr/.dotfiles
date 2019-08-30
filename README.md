# .dotfiles
Syncing my Dotfiles

**git clone --recurse-submodules** https://github.com/Mastermjr/.dotfiles.git  
**git clone --recurse-submodules** git@github.com:Mastermjr/.dotfiles.git

## tmux-resurrect info: 
  saves to: **.tmux/resurrect/**

## After Clone:
**TODO: add in all downloads needed**
1. ```shell
chsh -s /bin/zsh
``s
e``
2. ./sync.sh
3. ```shell 
sudo apt install neovim 
brew install neovim
```
4. python3 -m pip install pynvim
5. Linters: 
  - sbt/scalac (apt/brew)
  ``` shell
  brew install scala sbt
  sudo apt install scala sbt
  ```
  - pylint,flake8 (python)
  - vint (python)
  ``` shell
  pip3 isntall pylint flake8 vim-vint
  ```

#sMAC:
emap cmd to ctrl-a: https://superuser.com/questions/259614/bind-tmux-prefix-to-os-x-cmd-key-or-any-other-binding
ctrl-a == 0x02


## fun submodule commands:
  `'FolderName' already exists in the index` 

  git ls-files --stage

  git rm -r --cached [file path

## vim load after update/package:
  :packloadall

## update submodules
  **forgot --recurse:** git submodule update --init
  git submodule foreach git pull origin [master||BRANCH]
  git submodule update

## ignore changes
  Add `ignore = dirty` to each problematic `submodule` section in `.gitmodules` files placed at root of repo. Example:

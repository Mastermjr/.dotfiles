# .dotfiles
Syncing my Dotfiles

**git clone --recurse-submodules** https://github.com/Mastermjr/.dotfiles.git  
**git clone --recurse-submodules** git@github.com:Mastermjr/.dotfiles.git

## After Clone:
**TODO: add in all downloads needed**
```shell
chsh -s /bin/zsh
```
./sync.sh
sudo apt install neovim **OR** brew install neovim
python3 -m pip install pynvim

#### OLD:
pip3 install jedi-vim --user


## fun submodule commands:
  `'FolderName' already exists in the index` 

  git ls-files --stage

  git rm -r --cached [file path

## vim load after update/package:
  :packloadall

## update submodules
  git submodule foreach git pull origin [master||BRANCH]
  git submodule update

## ignore changes
  Add `ignore = dirty` to each problematic `submodule` section in `.gitmodules` files placed at root of repo. Example:

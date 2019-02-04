# .dotfiles
Syncing my Dotfiles

**git clone --recurse-submodules** https://github.com/Mastermjr/.dotfiles.git  
**git clone --recurse-submodules** git@github.com:Mastermjr/.dotfiles.git

## After Clone:
**git submodule update --init**  
```shell
chsh -s /bin/zsh
```

## fun submodule commands:
  `'FolderName' already exists in the index` 

  git ls-files --stage

  git rm -r --cached [file path

## update submodules
  git submodule foreach git pull origin [master||BRANCH]

  git submodule update

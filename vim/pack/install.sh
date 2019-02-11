#!/bin/bash

# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}

#Confirm clone/update for repo
# 
# Arguments:
#   repo_url
function confirm () {
  while true
  do
    read -p "Are you sure you wish to install: $1 [Y/N]? " in </dev/tty
    case "$in" in 
      [yY])
        return
        ;;
      [nN])
        exit
        ;;
       *)
       echo "Invalid"
       ;;
    esac
  done
}

# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git checkout master; git pull --force ) #may need --force
    echo "$expected_repo: $result"
  else
    confirm "$repo_url"
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url"
  fi
}

# ( executes a subshell
#SETGROUPS


( 
set_group python
package https://github.com/davidhalter/jedi-vim &
wait
) &

( 
set_group syntax
package https://github.com/tpope/vim-surround &
package https://github.com/vim-syntastic/syntastic & 
#package https://github.com/kchmck/vim-coffee-script.git &
#package https://github.com/tpope/vim-markdown.git &
#package https://github.com/ap/vim-css-color.git &
wait
) &

(
set_group utility
package https://github.com/scrooloose/nerdtree &
package https://github.com/lervag/vimtex &
wait
) &


#(
#set_group colorschemes
#package https://github.com/altercation/vim-colors-solarized.git &
#wait
#) &

#waits until all subshells done
wait

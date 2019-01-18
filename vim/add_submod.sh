#!/bin/bash

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

for x in $(find . -type d) ; do
    if [ -d "${x}/.git" ] ; then
        cd "${x}"
        origin="$(git config --get remote.origin.url)"
        cd - 1>/dev/null
        confirm "git submodule add '${origin}' '${x}'"  
        git submodule add "${origin}" "${x}"
    fi
done

#check to see if tmp && undo
if [ ! -d tmp ] && [ ! -d undo ];
  then
  mkdir tmp; 
  mkdir undo;
fi

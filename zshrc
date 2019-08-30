#Add to path, stop repeats!
function add_to_path () {
  for d; do
    d=$({ cd -- "$d" && { pwd -P || pwd; } } 2>/dev/null)  # canonicalize symbolic links
    if [ -z "$d" ]; then continue; fi  # skip nonexistent directory
    case ":$PATH:" in
      *":$d:"*) :;;
      *) PATH=$PATH:$d;;
    esac
  done
}

function check_os (){
  os="$(uname -a | awk '{print $1}')"
  case $os in
    "Linux")
      export LINUX=1
    ;;
    "Darwin")
      export MAC=1
    ;;
  esac
}

#BASH PATH
add_to_path $HOME/bin /usr/local/bin 

#.local/bin PATH
if [ ! -z $MAC ]
then
  add_to_path $HOME/.local/bin
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

#export path to zsh scripts
add_to_path $HOME/.dotfiles/bin

if [ ! -z "$(ls $HOME/.dotfiles/linux_sync/bin/)" ];
then
 for s in $HOME/.dotfiles/linux_sync/bin/*;
 do
  source $s  
 done
fi

#export path to ruby 
add_to_path $HOME/.gem/ruby/2.5.0/bin

#export path to go  and make dir
add_to_path GOPATH=$HOME/go/

# setup root
if [ -z $MAC ]
then
  export GOROOT="$(brew --prefix golang)/libexec"
elif $LINUX
then
  export GOROOT=/usr/local/go/
fi

add_to_path "$GOPATH"bin
add_to_path "$GOROOT"bin

#supcom
test -d "~/Games" || export INSTALL4J_JAVA_HOME=~/Games/javaFafClient/jdk-10.0.2

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#bira,amuse,candy,dpoggi,gnzh,xiong-chiamiov-plus,ys
ZSH_THEME="mikey_theme"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.dotfiles/custom-oh-my-zsh/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# zsh-syntax-highlighting must be last
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

### other aliases ####
alias 1920="xrandr --output eDP1 --mode 1920x1080"
alias zsh-history-fix="mv .zsh_history .zsh_history_bad; strings .zsh_history_bad > .zsh_history; fc -R .zsh_history"

#editing files
alias zsh-source="source ~/.zshrc"
alias zsh-edit="vim ~/.zshrc"
alias add-alias="vim ~/.dotfiles/linux_sync/local_alias; zsh-source"
alias vim="nvim"

#add_local_alias
source ~/.dotfiles/linux_sync/local_alias 

#check for linux setx
if [ ! -z $MAC ];
then
  if xset q &>/dev/null; then
    setxkbmap -option caps:swapescape
  fi
fi

#shortcuts function
#also have pushd (move to dir) dir (list)  popd (move back to old dir)
function sc() {
  if [ $2 ]
  then
    shortcut $1 $2
  elif [ $1 ]
  then
    cd "$(shortcut $1)"
  else
    printf "Usage:\n\tSet shortcut: sc <name> <path>\n\tGo to shortcut: sc <name>\n"
  fi
}

#BASH PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH 

#.local/bin PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

#export path to zsh scripts
export PATH=$HOME/.dotfiles/bin:$PATH

if [ ! -z "$(ls $HOME/.dotfiles/linux_sync/bin/)" ];
then
 for s in $HOME/.dotfiles/linux_sync/bin/*;
 do
  source $s  
 done
fi

#export path to ruby 
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH

#export path to go 
export GOPATH=$HOME/go/
export GOROOT=/usr/local/go/
export PATH=$PATH:"$GOPATH"bin
export PATH=$PATH:"$GOROOT"bin

#supcom
export INSTALL4J_JAVA_HOME=~/Games/javaFafClient/jdk-10.0.2

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

#add_local_alias
source ~/.dotfiles/linux_sync/local_alias 

# easily edit configs #
alias add-vim-plug="vim ~/.dotfiles/vim/pack/install.sh +65; curr_dir=$(pwd);cd ~/.dotfiles/vim/pack; ./install.sh; cd ~/.dotfiles/vim/; ./add_submod.sh; cd $curr_dir" #auto jump to group lines

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

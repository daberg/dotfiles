# Path to oh-my-zsh installation
ZSH=/usr/share/oh-my-zsh/

# Name of theme to load
ZSH_THEME="daberg"

# Disable auto-updates
DISABLE_AUTO_UPDATE="true"

# Change custom folder
ZSH_CUSTOM=~/.config/oh-my-zsh-custom

# Plugin list
plugins=(
  git
)

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set cache dir
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Launch oh-my-zsh
# All oh-my-zsh configuration variables have to defined before this point
source $ZSH/oh-my-zsh.sh

# Enable Vi-like editing
bindkey -v

# Add script folder to path
path+=~/Software/scripts


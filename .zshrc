## Oh My Zsh
ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM=~/.config/oh-my-zsh-custom
DISABLE_AUTO_UPDATE="true"

# Plugin list
plugins=(
  git
)

ZSH_THEME="daberg"

# All oh-my-zsh configuration variables have to defined before this point
source $ZSH/oh-my-zsh.sh
##

# Generic options
setopt appendhistory         # Immediately append history instead of overwriting
setopt autocd                # if only directory path is entered, cd there.
setopt correct               # Auto correct mistakes
setopt histignorealldups     # If a new command is a duplicate, remove the older one
setopt nobeep                # No beep
setopt numericglobsort       # Sort filenames numerically when it makes sense
setopt rcexpandparam         # Array expension with parameters

# Globbing
setopt extendedglob          # Extended globbing. Allows using regular expressions with *
setopt nocaseglob            # Case insensitive globbing

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Automatically find new executables in path
zstyle ':completion:*' rehash true
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# History
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500

WORDCHARS=${WORDCHARS//\/[&.;]}    # Don't consider certain characters part of the word

# Preferred editor for local and remote sessions
export EDITOR=/usr/bin/vi
export VISUAL=/usr/bin/vim

# Enable Vi-like bindings
bindkey -v

# Aliases
alias cp="cp -i"        # Confirm before overwriting something
alias cp="mv -i"        # Confirm before overwriting something
alias df='df -h'        # Human-readable sizes
alias free='free -m'    # Show sizes in MB

# Theming
autoload -U compinit colors zcalc
compinit -d
colors

## Plugins
ZSH_PLUGIN_DIR=/usr/share/zsh/plugins

# Syntax highlighting 
source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History substring search plugin
source $ZSH_PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh

# Use autosuggestion
source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
##

# Add script folder to path
path+=~/Software/scripts

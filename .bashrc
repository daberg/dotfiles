# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    # Last return value, needs to be saved before anything else
    local EXVAL="$?"

    # Prompt variable
    PS1=''

    local RED='\[\e[0;31m\]'
    local ENDCOL='\[\e[0m\]'

    if [ $EXVAL != 0 ]; then PS1+="${RED}[${EXVAL}]${ENDCOL}\n"; fi

    PS1+="\u at \h in \w\n-> "
}

# ls aliases
alias   l='ls --color=auto --group-directories-first -al'
alias  la='ls --color=auto --group-directories-first -al'
alias  ll='ls --color=auto --group-directories-first -l'
alias  ls='ls --color=auto --group-directories-first'
alias lsa='ls --color=auto --group-directories-first -a'

# Vi mode
set -o vi

# Clear screen binding in insert mode
bind -m vi-insert "\C-l":clear-screen

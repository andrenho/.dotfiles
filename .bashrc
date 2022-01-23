#!/bin/sh

#
# aliases
#
alias diff='colordiff'
alias grep='grep --color=auto'			          # colored grep
alias bc='bc -ql'				                      # extended bc
alias ls='ls --color -hF'			                # colored ls

# 
# application color & configuration
# 
eval `dircolors -b ~/.dir_colors`		          # load ls default colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# 
# global variables
#
export EDITOR=/usr/bin/vim			              # default editor is VIM
# export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# 
# default prompt
#
source /usr/share/git-core/contrib/completion/git-prompt.sh
export PS1='\H: $(__git_ps1 "(%s) ")\w\$ '

# 
# BASH options
#
export HISTCONTROL=ignoredups
shopt -s autocd
shopt -s checkwinsize
shopt -s globstar

#
# PATH expansions
#
export PATH="/usr/lib/ccache/bin/:$PATH"

# Manual colors
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

#
# sconsify
#
export LD_LIBRARY_PATH=/usr/local/lib
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# vim: ts=2:sw=2:sts=2:expandtab

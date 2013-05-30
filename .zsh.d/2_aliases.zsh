#!/bin/zsh

#############
# 2 Aliases #
#############

alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'

alias grep='grep --color=auto'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'

alias ll='ls -l -I __pycache__'
alias la='ls -a'
alias lla='ls -la'

alias cls='clear'

alias c='rsync -ahP'
alias m='rsync -ahP --remove-source-files'

alias py='python2.7'
alias pym='python2.7 -m'

alias df='df --human-readable'
alias du='du --human-readable'
alias duh="du -h | sort -h"
alias md='mkdir'
alias rd='rmdir'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcp='git cherry-pick'
alias gd='git diff --word-diff'
alias gf='git fetch'
alias gh='git push'
alias gk='git checkout'
alias gl='git log'
alias gm='git merge'
alias gn='git clone'
alias go='git remote'
alias gp='git pull'
alias gr='git reset'
alias gsf='git submodule foreach --recursive'
alias gsu='git submodule update'
alias gsfu='git submodule foreach --recursive git submodule update'
alias gt='git status -sb'

alias resource='source ~/.zshrc'
alias pacaur='BUILDDIR="/src/aur/" pacaur'

alias sudo='sudo '
alias §='sudo'
alias §§='sudo -s'
alias ç='sudo'
alias Ç='sudo -s'
alias çu='sudo -u'
alias Çu='sudo -su'


alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'
alias -g .........='../../../../../../../..'

# alias x='emacsclient -c -n'
# alias y='emacsclient -n'
alias d='cdproject'
alias azerty='sudo loadkeys fr-dvorak-bepo'

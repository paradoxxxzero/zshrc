#!/bin/zsh

#############
# 6 History #
#############

export HISTORY=1000000
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=$HOME/.history

setopt append_history
setopt share_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups

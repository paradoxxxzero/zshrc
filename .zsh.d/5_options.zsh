#!/bin/zsh

#############
# 5 Options #
#############

setopt correct            # Command correction
setopt chase_links        # Follow symlinks
setopt auto_cd            # No command ->  cd
setopt auto_pushd         # Pushd on cd
setopt pushd_ignore_dups  # Only pushd if not in stack
setopt pushd_to_home      # Pushd -> pushd $HOME
setopt prompt_subst       # Eval prompt
setopt extended_glob      # Expand ~

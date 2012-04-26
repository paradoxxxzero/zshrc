#!/bin/zsh

autoload -U colors
autoload -U compinit

fpath=($ZDOTDIR/.zsh.d/zsh-completions $fpath)

fpath=($ZDOTDIR/.zsh.d/vc_functions/ $fpath)
autoload -U $ZDOTDIR/.zsh.d/vc_functions/*(:t)

fpath=($ZDOTDIR/.zsh.d/rehash_hooks/ $fpath)
autoload -U $ZDOTDIR/.zsh.d/rehash_hooks/*(:t)

colors
compinit -u

# for version control status :
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
preexec_functions+='preexec_update_vc_vars.zsh'
precmd_functions+='precmd_update_vc_vars.zsh'
chpwd_functions+='update_current_vc_vars.zsh'

preexec_functions+='preexec_rehash.zsh'
precmd_functions+='precmd_rehash.zsh'

autoload -U add-zsh-hook
update_current_vc_vars.zsh

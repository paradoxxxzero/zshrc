#!/bin/zsh

## zsh rc file made by paradoxx.zero
## Thanks to all the people which made their zshrc public
## Loading zsh configurations from ~/.zsh.d directory
if [[ "$TERM" == "dumb" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  unfunction preexec
  PS1='$ '
else
    export ZSHRC_HOME="/home/zero"
    setopt extendedglob
    for file in $ZSHRC_HOME/.zsh.d/*(.);
    do
        echo " `basename $file` ... \c"
        local t=$(date +%s%N)
        source $file
        echo "[" $(( ($(date +%s%N) - $t) / 1000000)) "ms ]"
    done

    __motd

    export REPORTTIME=1
    export TIMEFMT="
${blue_}Total: ${blue__}%*E)         ${magenta_}User: ${magenta__}%*U)         ${yellow_}Kernel: ${yellow__}%*S)         ${green_}System: ${green__}%P)$____"
fi

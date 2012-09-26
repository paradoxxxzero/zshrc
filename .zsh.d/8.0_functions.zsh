#!/bin/zsh

###############
# 8 functions #
###############

_ () {
    if [[ `type workon` == "workon not found" ]]; then
        source /usr/bin/virtualenvwrapper.sh
    fi
    workon $*
}

init_venv () {
}

self_update () {
    cd $HOME/.zerorc
    gp
    gsu --init
    gsfu --init
}

self_upgrade () {
    cd $HOME/.zerorc
    self_update
    gk master
    gsf --recursive git checkout master
    gsf --recursive git pull origin master
    emacs_recompile
    zsh_recompile
}

self_commit () {
    cd $HOME/.zerorc/emacsrc
    gc -am "Submodule"
    gh
    cd $HOME/.zerorc/zshrc
    gc -am "Submodule"
    gh
    cd $HOME/.zerorc
    gc -am "Submodule"
    gh
}

emacs_recompile () {
    rm -f ~/.zerorc/emacsrc/.emacs.d/elisp/**/*.elc
    emacs -batch -f batch-byte-compile ~/.zerorc/emacsrc/.emacs.d/elisp/**/*.el
}

zsh_recompile () {
  autoload -U zrecompile
  rm -f ~/.zsh.d/**/*.zwc
  [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
  [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

  for f in ~/.zsh.d/**/*.zsh; do
    [[ -f $f ]] && zrecompile -p $f
    [[ -f $f.zwc.old ]] && rm -f $f.zwc.old
  done

  [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
  [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

  source ~/.zshrc
}


# Fuzzy find
f() {
    find . -name "*"$1"*" ${(@)argv[2,$#]}
}
# Strict find
sf() {
    find . -name $*
}

# Colorize stderr
#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

# Parse last command content
autoload -U read-from-minibuffer
zmodload -i zsh/parameter
insert-last-command-output() {
    local last_out="$(eval $history[$((HISTCMD-1))])"
    if [[ -z $last_out ]]; then
        return
    fi
    local -a out_array
    out_array=(${(f)last_out})
    if [[ $#out_array -eq 1 ]]; then
        LBUFFER+=$last_out
    else
        local disp
        disp=""
        local i=1
        for line in $out_array; do
            disp+="$i"
            disp+=":"
            disp+=$line
            disp+="
"
            ((i++))
        done
        read-from-minibuffer $disp
        LBUFFER+=$out_array[$REPLY]
    fi
}
zle -N insert-last-command-output
bindkey "^[[1;3A" insert-last-command-output
bindkey "^[[1;5A" insert-last-command-output

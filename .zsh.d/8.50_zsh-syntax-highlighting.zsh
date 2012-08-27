#!/bin/zsh

####################
# 8.5 Highlighting #
####################

source $ZDOTDIR/.zsh.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

ZSH_HIGHLIGHT_STYLES[default]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

ZSH_HIGHLIGHT_TOKENS_FOLLOWED_BY_COMMANDS+=('sudo')

ZSH_HIGHLIGHT_KEYWORD_KEYWORDS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_KEYWORD_KEYWORDS+=('rm -fr *' 'fg=white,bold,bg=red')

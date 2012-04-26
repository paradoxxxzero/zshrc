#!/bin/zsh

if [ -n "$__NEED_REHASH" ]; then
    rehash
    unset __NEED_REHASH
fi

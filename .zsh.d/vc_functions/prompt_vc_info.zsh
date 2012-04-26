#!/bin/zsh
local s=""
if [ -n "$__CURRENT_GIT_BRANCH" ]; then
    s+="${__green}git:${__yellow}$__CURRENT_GIT_BRANCH"
    case "$__CURRENT_GIT_BRANCH_STATUS" in
    ahead)
        s+="${__green}"
        for i in {1..$__CURRENT_GIT_BRANCH_UP}
        do
        s+="↑"
        done
        ;;
    diverged)
        s+="${__blue}↕"
        s+="${__green}"
        for i in {1..$__CURRENT_GIT_BRANCH_UP}
        do
        s+="↑"
        done
        s+="${__magenta}"
        for i in {1..$__CURRENT_GIT_BRANCH_DOWN}
        do
        s+="↓"
        done
        ;;
    behind)
        s+="${__magenta}"
        for i in {1..$__CURRENT_GIT_BRANCH_DOWN}
        do
        s+="↓"
        done
        ;;
    esac
    if [ -n "$__CURRENT_GIT_BRANCH_IS_DIRTY" ]; then
    s+="${__red}!"
    fi
fi

#if [ -n "$__CURRENT_SVN_REV" ]; then
#    s+="${__white}<${__green}svn:${__yellow}$__CURRENT_SVN_REV"
#    if [ -n "$__CURRENT_SVN_BRANCH_IS_DIRTY" ]; then
#    s+="${__red}!"
#    fi
#    s+="${__white}>"
#fi
printf "%s" $s

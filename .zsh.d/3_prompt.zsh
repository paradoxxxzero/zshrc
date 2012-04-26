#!/bin/zsh

############
# 3 Prompt #
############

# Create var shorcuts for colors
___="%{${reset_color}%}"
____="${reset_color}"
for c in red green yellow white black cyan magenta blue; do
    # escaped with %{ %} for use in prompt
    eval _${c}='%{$fg_no_bold[${(L)c}]%}'
    eval __${c}='%{$fg_bold[${(L)c}]%}'
    # not escaped for use anywhere else
    eval ${c}_='$fg_no_bold[${(L)c}]'
    eval ${c}__='$fg_bold[${(L)c}]'
done
typeset -Ag F256 B256
for color in {000..255}; do
    F256[$(( color ))]="%{[38;5;${color}m%}"
    B256[$(( color ))]="%{[48;5;${color}m%}"
done

local prmpt_color=""

# Are we root ?
if [ "`id -u`" -eq 0 ];
then
    prmpt_color="${__red} "
else
    local host_sum="$(echo $HOST | md5sum -)"
    if [[ -e /usr/share/terminfo/$TERM[0,1]/${TERM}-256color ]]; then
        host_sum="0x$host_sum[0,2]"
        host_sum=$(( host_sum % (255 - 16) + 1))
        prmpt_color="%B$F256[$host_sum]"
    else
        host_sum="0x$host_sum[0,1]"
        host_sum=$(( host_sum % 12 + 1))
        if (( host_sum > 6 )); then
            host_sum=$(( host_sum - 6))
            prmpt_color="%B"
        fi
        prmpt_color="${prmpt_color}%F{$host_sum}"
    fi
fi

prmpt_color="%(?,${prmpt_color},${__yellow})"

local top="${prmpt_color}"
local bottom="${prmpt_color}"
local time="%*"
local user="${prmpt_color}%n"
local at="${__white}@"
local host="${prmpt_color}%m"
local term="${prmpt_color}/${__blue}$TERM"
local colon="${_magenta}:"
local dollar="${prmpt_color}%#"
local ret="${__white}|${_magenta}%?${__white}|"
local stat="%(?,${__blue}^_^ ,${__yellow}-_-')"
local num="${__white}(${prmpt_color}%h${__white})"

local dir="${prmpt_color}%~"
local vcinfo='$(prompt_vc_info.zsh)'

bottom="${bottom}${dollar}"

# Sub shell level indicator
if [ $SHLVL -gt 1 ];
then
    for i in {2..$SHLVL}
    do
      bottom="%{%F{$i}%}(${bottom}%{%F{$i}%})"
    done
fi

local prmpt="${top}${dir}${__white}/"
local bprmpt="${bottom}${___} "
local prmpt2="${bottom}${__blue} %_ ${__white}>${___} "
local prmpt4="${bottom}${__green} %_ ${__white}>${___} "
local rprmpt="${prmpt_color}${user}${at}${host} ${prmpt_color}${time}${___}"

export PS1="
$prmpt
$bprmpt"

export PS2="${prmpt2}"
export RPS1="${rprmpt}"
export PS4="${prmpt4}"

padd_prompt() {
  local bprmpt=$bprmpt
  local frprmpt="$(prompt_vc_info.zsh) "
  local tprmpt="${${(%)prmpt}//\//${__white}/${__red}}"
  if [ -n "$VIRTUAL_ENV" ]; then
    bprmpt="${__yellow}`basename \"$VIRTUAL_ENV\"` $bprmpt"
  fi
  local tprmpt_width=${#${(S%%)prmpt//(\%([KF1]|)\{*\}|\%[Bbkf])}}
  local frprmpt_width=${#${(S%%)frprmpt//(\%([KF1]|)\{*\}|\%[Bbkf])}}
  local padding_size=$(( COLUMNS - tprmpt_width - frprmpt_width ))

  if (( padding_size > 0 )); then
    local padding="[${padding_size}C"
    PS1="
$tprmpt$padding$frprmpt
$bprmpt"
  fi
}
add-zsh-hook precmd padd_prompt

# xterm title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        preexec () { print -Pn "\e]0;$1\a" }
        ;;
esac

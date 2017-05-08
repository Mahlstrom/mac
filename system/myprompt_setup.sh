#!/usr/bin/env bash
if ! type -t "__git_icon" > /dev/null; then
    source ~/.dotfiles/git/git_icon
fi
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    local BGL=""
    local FGL=""

	local gicon
    local LOR='\e[0;34m';
    local BTA="\e[47m"
    local Bla='\e[0;30m'
    local Red='\e[0;31m'
    local Gre='\e[0;32m'
    local Yel='\e[0;33m'
    local Blu='\e[1;34m'
    local Pur='\e[0;35m'
    local RCol='\e[0m'

    local BBla="\e[40m"
    local BRed="\e[41m"
    local BYel='\e[43m'
    local BBlu='\e[44m'
    local BPur='\e[45m'

    local triangle=""

	gicon=$(__git_icon)

    PS1=""

    # Draw path
    FGL="$Pur"
    PS1+="${BPur}"
    PS1+="\w"



    # Draw virtualenv
    if test -z "$VIRTUAL_ENV" ; then
      BGL+=""
    else
      PS1+="${FGL}${BBlu}${triangle}"
      PS1+="${Bla}${BBlu}"
      FGL=${Blu}
      PS1+="${Bla}${BBlu}"
      PP=$(basename $(dirname $VIRTUAL_ENV))
      PS1+="${PP}"
    fi



    #GIT
    if [ ${gicon} ];then
      PS1+="${FGL}${BYel}${triangle}"
      PS1+="${Bla}${BYel}"
      FGL=${Yel}
      PS1+="$gicon "
      THISGIT=$(git rev-parse --show-toplevel)
      PS1+="$(parse_git_branch)"
      PS1+=${Yel}
    fi
    # EXIT
    if [ $EXIT != 0 ]; then
      PS1+=${BRed}
      PS1+=$triangle
      PS1+="${Bla}${BRed}$EXIT"      # Add red if exit code non 0
      FGL="${Red}"
    fi

    PS1+="${FGL}${BBla}"
    PS1+=$triangle
    PS1+="$RCol "
}
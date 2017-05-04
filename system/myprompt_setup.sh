#!/usr/bin/env bash
if ! type -t "__git_icon" > /dev/null; then
    source ~/.dotfiles/git/git_icon
fi
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
__prompt_command() {
    local EXIT="$?"             # This needs to be first
	local gicon
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local Yel='\[\e[0;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'
    local RCol='\[\e[0m\]'

	gicon=$(__git_icon)
    if test -z "$VIRTUAL_ENV" ; then
      PS1=""
    else
      PP=$(basename $(dirname $VIRTUAL_ENV))
      PS1="${BBlu}[${PP}]${RCol} "
    fi

	if [ ${gicon} ];then
		PS1+="$gicon "
        THISGIT=$(git rev-parse --show-toplevel)
 	fi

    PS1+="${Pur}\w"
    if [ ${gicon} ];then
        PS1+=${Yel}
        PS1+=$(parse_git_branch)
    fi
    if [ $EXIT != 0 ]; then
        PS1+="${BBlu}[$EXIT]${RCol}"      # Add red if exit code non 0
    fi
    PS1+="$RCol "
}
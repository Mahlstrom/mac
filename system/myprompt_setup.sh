#!/usr/bin/env bash
if ! type -t "__git_icon" > /dev/null; then
    source ~/.dotfiles/git/git_icon
fi
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
#OLD_PATH=$PATH
#export OLD_PATH
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
    PS1=""
	if [ ${gicon} ];then
        THISGIT=$(git rev-parse --show-toplevel)
        #if [[ -d ${THISGIT}/bin ]]; then
        #    PATH=${THISGIT}/bin:$OLD_PATH
        #fi
        #if [[ -d ${THISGIT}/node_modules/.bin ]]; then
        #    PATH=${THISGIT}/node_modules/.bin:$PATH
        #fi
		PS1+="$gicon "
    #else
        #PATH=$OLD_PATH
	fi

    PS1+="${Pur}\w"
    if [ $EXIT != 0 ]; then
        PS1+="${Red}[$EXIT]${RCol}"      # Add red if exit code non 0
    fi
    PS1+="$RCol "
}

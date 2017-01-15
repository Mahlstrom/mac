#!/usr/bin/env bash
if ! type -t "__git_icon" > /dev/null; then
    source ~/.bash_scripts/git_icon
fi

Color_Off="\[\033[0m\]"       # Text Reset
Yellow="\[\033[0;33m\]"       # Yellow
PathShort="\w"

function __prompter(){
	local gicon
	gicon=$(__git_icon)
	if [ ${gicon} ];then
		echo -ne "$gicon "
	fi
}
export PS1='$(__prompter)'$Yellow$PathShort$Color_Off' '

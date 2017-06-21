#!/usr/bin/env bash
if ! type -t "__git_icon" > /dev/null; then
    source ~/.dotfiles/git/git_icon
fi
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
export BGL=""
export FGL=""
export EE=""

do_the_arrow () {
  local nBG=$1;
  varname=B$nBG
  echo -n "${FGL}${!varname}${triangle}${Bla}"
}
__prompt_command() {
    local EXIT="$?"             # This needs to be first
    local gicon
    local triangle=""

    local Bla="\[$(tput setaf 0)\]"
    local BBla="\[$(tput setab 0)\]"

    local Gra="\[$(tput setaf 236)\]"
    local BGra="\[$(tput setab 236)\]"

    local Blu="\[$(tput setaf 4)\]"
    local BBlu="\[$(tput setab 4)\]"

    local Red="\[$(tput setaf 1)\]"
    local BRed="\[$(tput setab 1)\]"

    local Yel="\[$(tput setaf 3)\]"
    local BYel="\[$(tput setab 3)\]"

    local RCol="\[$(tput sgr0)\]"
    local EE=""


    gicon=$(__git_icon)

    PS1=""
    #PS1=""

    # Draw path
    PS1+="${BGra}"
    PS1+="\w"
    FGL="$Gra"
 
    # Draw virtualenv
    if test -z "$VIRTUAL_ENV" ; then
      BGL+=""
    else
      PS1+=$(do_the_arrow "Blu")
      FGL=${Blu}

      PP=$(basename $(dirname $VIRTUAL_ENV))
      PS1+="${PP}"
    fi



    #GIT
    if [ ${gicon} ];then
      PS1+=$(do_the_arrow "Yel")     
      FGL=${Yel}

      THISGIT=$(git rev-parse --show-toplevel)
      PS1+="$(parse_git_branch)"
      PS1+="$gicon "
    fi

    # EXIT
    if [ $EXIT != 0 ]; then
      PS1+=$(do_the_arrow "Red")     
      FGL=${Red}

      PS1+="$EXIT"      # Add red if exit code non 0
    fi

    PS1+=$(do_the_arrow "Bla")
    PS1+="$RCol "
}
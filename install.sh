#!/usr/bin/env bash
SCRIPTPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPTPATH/func.sh"
check_link ".bashrc"
check_link ".bash_profile"

find ~/.dotfiles -name install.sh -mindepth 2 | while read installer ; do sh -c "${installer}" ; done

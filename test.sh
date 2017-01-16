#!/usr/bin/env bash
for file in $(find ~/.dotfiles -name *_alias.sh) ; do
	echo $file
done

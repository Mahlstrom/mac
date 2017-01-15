#!/usr/bin/env bash
cd ~/.dotfiles/
rm -f ~/.bashrc
rm -f ~/.bash_profile
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

find ~/.dotfiles -name install.sh -mindepth 2 | while read installer ; do sh -c "${installer}" ; done

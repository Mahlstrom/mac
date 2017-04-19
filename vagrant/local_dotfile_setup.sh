#!/usr/bin/env bash
export VAGRANT_DOTFILE_PATH=$(hostname | sed 's/\.local//' | sed 's/^/.vagrant./')


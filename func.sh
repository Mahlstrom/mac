#!/usr/bin/env bash
function check_link(){
    target_path="$HOME/$1"
    src_path="$HOME/.dotfiles/$1"
    if [[ -L "$target_path" && -f "$target_path" && "$(readlink "$target_path")" = "$src_path" ]]; then
        echo "$1 already exists"
    else
        rm -f "$target_path"
        ln -s "$src_path" "$target_path"
        echo "$1 created"
    fi
}


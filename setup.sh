#!/bin/bash

# 1. Backup current dot files
# Going to have to save path to a variable
# mkdir .dotfile/backup/YYYY/mm-dd h:i:s/
# @Todo add /backup dir to git ignore
# cp .* to the above dir

# 2. Make symlinks

link() {

    local filename=$1
    local new_filename=$1
    local add_dot_prefix=${2:-false} # defaults to false
    local force_symlink=${3:-false}  # defaults to false

    # If forcing the dot prefix, check that it isn't there already.
    if [[ $add_dot_prefix ]]; then
        if [[ ! $filename == .* ]]; then
            new_filename=".${1}"
        fi
    fi

    # If the symlink doesn't exist, or if we are forcing.
    if [ ! -h "$HOME/$new_filename" ] || [ "$force_symlink" == true ]; then
        echo "$HOME/.dotfiles/$filename $HOME/$new_filename"
        ln -sf "$HOME/.dotfiles/$filename" "$HOME/$new_filename"
    fi
}

touch ~/.dotfiles/.gitconfig.local
touch ~/.dotfiles/.profile.local

link ".gitconfig" true true
link "profile" true false
link ".zshrc" true true

source ~/.profile
printf '=> Profile reset.\n'

#!/bin/bash

# 1. Backup current dot files
# Going to have to save path to a variable
# mkdir .dotfile/backup/YYYY/mm-dd h:i:s/
# @Todo add /backup dir to git ignore
# cp .* to the above dir

# 2. Make symlinks

link() {
    if [ ! -h $HOME/.$1 ]; then
        ln -s "$HOME/.dotfiles/$1" "$HOME/.$1"
    fi
}

touch ~/.dotfiles/gitconfig.local
touch ~/.dotfiles/profile.local

link "gitconfig"
link "profile"
link "inputrc"

source ~/.profile
printf '=> Bash profile reset.\n'

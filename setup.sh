#!/bin/bash

# 1. Backup current dot files
# Going to have to save path to a variable
# mkdir .dotfile/backup/YYYY/mm-dd h:i:s/
# @Todo add /backup dir to git ignore
# cp .* to the above dir



# 2. Make symlinks

link() {
    if [ ! -h $HOME/.$1 ]; then
       ln -s "`pwd`/$1" "$HOME/.$1"
    fi
}

link "gitconfig"
link "gitconfig.local"
link "profile"
link "profile.local"

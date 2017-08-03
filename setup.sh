#!/bin/bash

# set date so we have a consistent path to move copies of backup files to
DATE=$(date +%Y-%m-%d"_"%H:%M:%S)

link() {
    if [ ! -h $HOME/.$1 ]; then
       ln -s "$HOME/.dotfiles/$1" "$HOME/.$1"
    fi
}

backup() {
    if [ ! $2 ]; then
        printf " !! No date passed - Backup could not be created\n"
        return
    else
        if [ ! -h $HOME/.$1 ]; then
            mkdir -p "$HOME/.dotfiles/~backup/$2/"
            mv "$HOME/.$1" "$HOME/.dotfiles/~backup/$2/.$1"
        fi
    fi
}

restore() {
    if [ ! $2 ]; then
        printf " !! No date passed - Restore could not occur\n"
        return
    else
        if [ ! -h $HOME/.dotfiles/~backup/$2/.$1 ]; then
            mv "$HOME/.dotfiles/~backup/$2/.$1" "$HOME/.$1"
        fi
    fi
}

# make sure local config files exist
touch ~/.dotfiles/gitconfig.local
touch ~/.dotfiles/profile.local

# backup and link the git config
backup "gitconfig" $DATE
link "gitconfig"

# backup and link profile information
backup "profile" $DATE
backup "bash_profile" $DATE
link "profile"

# reset the terminal with the latest profile settings
source ~/.profile
printf '=> Bash profile reset.\n'

# backup and restore debugging
#backup "hgignore_global" $DATE
#REVERT="2017-07-31_16:27:45"
#restore "hgignore_global" $REVERT

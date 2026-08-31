#!/bin/bash

# 0. Backup current dot files
# Going to have to save path to a variable
# mkdir .dotfile/backup/YYYY/mm-dd h:i:s/
# @Todo add /backup dir to git ignore
# cp .* to the above dir

# link <name> [<target>]
#
# Creates symlink from ~/.<name> → ~/.dotfiles/<target>; target overrides are optional and default to <name>.
#
# @example
# link "gitconfig" "gitconfig.local"
# link "profile"

link() {
    local name="$1"
    # If a second argument is provided, use it as the target file name, otherwise default to the first argument.
    local target="${2:-$1}"
    local dest="$HOME/.$name"
    local src="$HOME/.dotfiles/$target"

    echo "Linking $dest to $src"

    if [ ! -h "$dest" ]; then
        ln -s "$src" "$dest"
    fi
}

link_curlrc() {
    local target="$HOME/.dotfiles/curlrc.local"

    if [ ! -f "$target" ]; then
        cp "$HOME/.dotfiles/curlrc.sample" "$target"
    fi

    link "curlrc" "curlrc.local"
}

# 1. Create local files, if not present
touch ~/.dotfiles/gitconfig.local
touch ~/.dotfiles/profile.local
touch ~/.dotfiles/secrets.local

# 2. Make symlinks
link "gitconfig"
link "profile"
link "zshrc"
link "zshenv"
link_curlrc

# 3. Have the terminal reload the profile
source ~/.profile
printf '=> Profile reset.\n'

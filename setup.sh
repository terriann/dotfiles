#!/bin/bash

# 0. Backup current dot files
# Going to have to save path to a variable
# mkdir .dotfile/backup/YYYY/mm-dd h:i:s/
# @Todo add /backup dir to git ignore
# cp .* to the above dir

# link <name> [<target>] [<force>]
#
# Creates symlink from ~/.<name> → ~/.dotfiles/<target>; target overrides are optional and default to <name>.
# Pass force=true to re-create the symlink even if it already exists (e.g. when the target path has changed).
#
# @example
# link "gitconfig" ".gitconfig" true
# link "profile"

link() {
    local name="$1"
    # If a second argument is provided, use it as the target file name, otherwise default to the first argument.
    local target="${2:-$1}"
    local force="${3:-false}"
    local dest="$HOME/.$name"
    local src="$HOME/.dotfiles/$target"

    echo "Linking $dest to $src"

    if [ ! -h "$dest" ] || [ "$force" == true ]; then
        ln -sf "$src" "$dest"
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
touch ~/.dotfiles/.gitconfig.local
touch ~/.dotfiles/.profile.local

# 2. Make symlinks
link "gitconfig" ".gitconfig" true
link "profile" ".profile" true
link "zshrc" ".zshrc" true
link_curlrc

# 3. Have the terminal reload the profile
source ~/.profile
printf '=> Terminal profile reset.\n'

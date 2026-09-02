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

# Destinations that link() couldn't create because something was in the way.
SKIPPED_LINKS=()

link() {
    local name="$1"
    # If a second argument is provided, use it as the target file name, otherwise default to the first argument.
    local target="${2:-$1}"
    local dest="$HOME/.$name"
    local src="$HOME/.dotfiles/$target"

    # Already the correct symlink — nothing to do.
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "✔ $dest already links to $src"
        return 0
    fi

    # A real file, directory, or a symlink pointing elsewhere is in the way.
    # Don't clobber it — record it and carry on so the rest of setup runs.
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "⚠ $dest already exists and is not a link to $src — skipping."
        SKIPPED_LINKS+=("$dest → $src")
        return 1
    fi

    echo "Linking $dest → $src"
    ln -s "$src" "$dest"
}

link_curlrc() {
    local target="$HOME/.dotfiles/curlrc.local"

    if [ ! -f "$target" ]; then
        cp "$HOME/.dotfiles/curlrc.sample" "$target"
    fi

    link "curlrc" "curlrc.local"
}

link_zshenv() {
    local target="$HOME/.dotfiles/zshenv.local"

    # Seed from the sample and lock it down — this file holds secrets.
    if [ ! -f "$target" ]; then
        cp "$HOME/.dotfiles/zshenv.sample" "$target"
        chmod 600 "$target"
    fi

    link "zshenv" "zshenv.local"
}

# 1. Create local files, if not present
touch ~/.dotfiles/gitconfig.local
touch ~/.dotfiles/profile.local

# 2. Make symlinks
link "gitconfig"
link "profile"
link "zshrc"
link_zshenv
link_curlrc

# 3. Silence the "Last login:" banner in new terminal windows.
#    login(1) only checks whether ~/.hushlogin exists; its contents are ignored,
#    so there's nothing to track in the repo — just create it here.
touch ~/.hushlogin

# 4. Have the terminal reload the profile
source ~/.profile
printf '=> Profile reset.\n'

# 5. Re-surface anything that couldn't be linked, so it isn't lost in the scroll
if [ "${#SKIPPED_LINKS[@]}" -gt 0 ]; then
    printf '\n⚠ %d symlink(s) skipped because the destination already exists:\n' "${#SKIPPED_LINKS[@]}"
    for entry in "${SKIPPED_LINKS[@]}"; do
        printf '    %s\n' "$entry"
    done
    printf 'Move or remove each destination, then re-run this script.\n'
fi

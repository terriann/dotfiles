[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile%

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Adds timestamp to ~/.zsh_history
# Ex: history -E -15
setopt EXTENDED_HISTORY
# Prevent duplicates entries in ~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS

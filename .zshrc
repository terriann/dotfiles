# Load .profile first
if [[ -s "$HOME/.profile" ]]; then
  source "$HOME/.profile"
fi

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Adds timestamp to ~/.zsh_history
# Ex: history -E -15
setopt EXTENDED_HISTORY
# Prevent duplicates entries in ~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS

# Load NVM and ensure it takes precedence
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH"

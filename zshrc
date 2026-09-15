# Load .profile first
if [[ -s "$HOME/.profile" ]]; then
  source "$HOME/.profile"
fi

# Load NVM and ensure it takes precedence
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Homebrew's python@3.13 keeps unversioned python3/pip3 out of the main bin;
# add its libexec so `python3` resolves to Homebrew, not the broken Xcode stub.
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Completion system + case-insensitive matching (lowercase input matches
# uppercase results, and partial word matches are allowed).
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'

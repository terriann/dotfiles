# Load .profile first
if [[ -s "$HOME/.profile" ]]; then
  source "$HOME/.profile"
fi

# Load NVM and ensure it takes precedence
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH"

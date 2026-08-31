# Source local secrets (not tracked in git)
if [[ -s "$HOME/.dotfiles/secrets.local" ]]; then
  source "$HOME/.dotfiles/secrets.local"
fi

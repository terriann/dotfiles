# Brewfile — declarative Homebrew manifest for this machine.
#
# Apply with:   brew bundle --file=~/.dotfiles/Brewfile
# Verify with:  brew bundle check --file=~/.dotfiles/Brewfile
# Reconcile:    brew bundle cleanup --file=~/.dotfiles/Brewfile   (add --force to remove)
#
# This is the source of truth for a baseline install. Handy-but-optional tools
# (databases, language runtimes, sync utilities) are intentionally left out and
# installed ad hoc per project.

# ── Languages ────────────────────────────────────────────────────────────────
brew "php"              # PHP (latest)
brew "composer"         # PHP dependency manager (requires php)
brew "python@3.13"      # Python 3.13 (zshrc puts its python3/pip3 on PATH)

# ── CLI ──────────────────────────────────────────────────────────────────────
brew "bash"             # Modern Bash (macOS ships an ancient 3.2)
brew "exiftool"         # Read/write image and media metadata
brew "gh"               # GitHub CLI
brew "git"              # Git (newer than Xcode's bundled build)
brew "imagemagick-full" # Image manipulation (full feature set)
brew "jq"               # Command-line JSON processor
brew "tree"             # Directory tree viewer
brew "wget"             # Network file downloader
brew "zizmor"           # Security auditing for GitHub Actions workflows

# ── Commit signing ───────────────────────────────────────────────────────────
brew "gnupg"            # GPG for signing commits (replaces GPG Suite / MacGPG2)
brew "pinentry-mac"     # GUI passphrase entry + Keychain caching for gpg-agent

# ── GUI apps ─────────────────────────────────────────────────────────────────
cask "1password-cli"    # 1Password command-line tool
cask "devtoys"          # Developer utilities (Swiss-army knife)
cask "homebrew-app"     # Homebrew's official GUI (BrewUI)
cask "iterm2"           # Terminal emulator

# ── Fonts ────────────────────────────────────────────────────────────────────
cask "font-fira-code-nerd-font"
cask "font-hack-nerd-font"
cask "font-jetbrains-mono"
cask "font-jetbrains-mono-nerd-font"

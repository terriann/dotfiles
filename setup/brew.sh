#!/bin/bash
#
# Install and update Homebrew packages from the repo Brewfile.
#
# Usage:
#   ./setup/brew.sh
#
# The Brewfile at the repo root is the source of truth. To add or remove a
# package, edit the Brewfile and re-run this script — `brew bundle` is
# idempotent and skips anything already current.
#
# NOTE: this script deliberately does NOT run `brew bundle cleanup`. The
# Brewfile is a minimal baseline, so cleanup would try to uninstall handy
# tools installed ad hoc (databases, language runtimes, etc.). Run cleanup by
# hand only when you truly want to reconcile down to the Brewfile.

set -euo pipefail

# Resolve paths relative to this script so it works from any working directory.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$SCRIPT_DIR/../Brewfile"

# Homebrew must be installed first (its installer also pulls the Xcode CLI tools).
if ! command -v brew >/dev/null 2>&1; then
    echo "⚠ Homebrew not found. Install it first:"
    echo '    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    echo "  Then re-run this script. See https://brew.sh for details."
    exit 1
fi

if [ ! -f "$BREWFILE" ]; then
    echo "⚠ Brewfile not found at $BREWFILE"
    exit 1
fi

# Freshen formulae metadata so we install current versions.
echo "==> Updating Homebrew"
brew update

# Install everything declared in the Brewfile.
echo "==> Applying Brewfile: $BREWFILE"
brew bundle --file="$BREWFILE"

echo "✔ Homebrew packages are in sync with the Brewfile."

# Load .profile first
if [[ -s "$HOME/.profile" ]]; then
  source "$HOME/.profile"
fi

# Lazy-load nvm. Sourcing nvm.sh costs ~200ms per shell; instead put the
# "default" Node on PATH now (cheap) and only source the full nvm machinery
# the first time `nvm` is actually run.
export NVM_DIR="$HOME/.nvm"

# Resolve the `default` alias to a concrete version, following alias
# indirection (default -> lts/* -> lts/<name> -> vX.Y.Z), then prepend that
# version's bin to PATH. Fall back to the newest installed version.
() {
  local aliasdir="$NVM_DIR/alias" want dir hops=0
  want=default
  while [ -f "$aliasdir/$want" ] && [ "$hops" -lt 10 ]; do
    want="$(<"$aliasdir/$want")"
    hops=$((hops + 1))
  done
  if [ -n "$want" ] && [ -d "$NVM_DIR/versions/node/$want/bin" ]; then
    dir="$NVM_DIR/versions/node/$want/bin"
  else
    local cand=("$NVM_DIR"/versions/node/*/bin(Nn))
    (( $#cand )) && dir="${cand[-1]}"
  fi
  [ -n "$dir" ] && path=("$dir" $path)
}

# First `nvm` call swaps this stub for the real thing. --no-use because the
# default Node is already on PATH; `nvm use` / `nvm install` still work after.
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
  nvm "$@"
}

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Completion system + case-insensitive matching (lowercase input matches
# uppercase results, and partial word matches are allowed).
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'

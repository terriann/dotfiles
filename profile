# set the editor for SVN
export SVN_EDITOR=/usr/bin/vi

# Shell Shortcuts
alias ..="cd ../"
alias ...="cd ../../"
alias ~="cd ~"
alias mkdir="mkdir -p"
alias ll="ls -lhaG"
alias ls="ls -GA"
alias grep='grep --color=auto'
alias ps="ps -ax"
alias catn="cat -n"

# Utility Mini-scripts
alias reload-profile="source ~/.profile && printf '=> Terminal profile reset.\n'"
alias clear-history="read -q 'REPLY?Are you sure you want to clear history? [y/N] ' && [[ $REPLY == [yY] ]] && cat /dev/null > $HISTFILE && history -p && exit"
# Recent history, one row per command:
#   <event#>  <weekday date time>  <elapsed m:ss>  <command>
# Times are LOCAL (the history file stores UTC epochs; fc renders them local).
# Re-run an entry by its event number with '!<n>'.
# Needs EXTENDED_HISTORY (set below) for the time and elapsed columns.
# 'histt' = last 16; 'histt -100' = last 100; 'histt 1' = everything.
alias histt="fc -l -D -t '%a %Y-%m-%d %H:%M:%S'"
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias npmup='bash ~/.dotfiles/scripts/npm-packages.sh before && nvm install-latest-npm  && npm update -g && bash ~/.dotfiles/scripts/npm-packages.sh after'
alias nodeup='source ~/.dotfiles/scripts/nvm-update.sh'
eject-all() {
  # Two-line warning
  echo "🚨 Ejecting all volumes (external drives, disk images, and network shares)."
  echo "This could disrupt important mounted drives or unsaved work. Continue? (y/N)"

  # Read user confirmation
  read ans
  if [[ $ans == [yY] ]]; then
    diskutil eject /Volumes/*; diskutil unmountDisk /Volumes/*
    echo "✅ Ejected all volumes."
  else
    echo "🙅‍♀️ Aborted."
  fi
}

alias git-prune-branches="git checkout main && git branch --merged main | grep -v '^[ *]*main$' | xargs git branch -d"

## Utility command to make and move into a directory
mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

# Customize Prompt
## Add display when in an ssh session
if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"; fi

## ZSH command prompt
export PROMPT='
%F{magenta}%n%f:%F{cyan}%m%f %B%F{240}%~%f%b
%(?.%F{green}√.%F{red}X)%f $ '

# Shortcuts for Common Applications
alias affinity="open -a Affinity"
alias brave="open -a Brave\ Browser"
alias chrome="open -a Google\ Chrome"
alias finder="open ."
# Launch by bundle ID so the alias survives Photoshop's yearly rename (…CS, …2026, …).
alias photoshop="open -b com.adobe.Photoshop"
alias preview="open -a Preview"
alias safari="open -a Safari"
alias sublime="open -a Sublime\ Text"
alias terminal="open -a Terminal ."

# MacOS related Aliases
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias unquarantine="xattr -r -d com.apple.quarantine "
alias rmdropboxattr="xattr -r -d com.dropbox.attributes "
alias stdchmod="find . -type d | xargs chmod 755; find . -type f | xargs chmod 644"

alias utctime="date -u"

## Networking Shortcuts
alias flushdns='dscacheutil -flushcache; echo "Flushed. You may also need to visit chrome://net-internals/#dns to flush Chrome internal DNS"'
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1'
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ip2='curl -s "https://en.wordpress.com/whatismyip?" | awk "{print $1}"'

## Quick Access Projects
alias dotfiles="print \"Opening dotfiles directory in VS code\"; code ~/.dotfiles/dotfiles.code-workspace"

# Load interactive-shell secrets, if present (see secrets.local.sample).
# Static secrets for every shell — including non-interactive tools — belong in
# ~/.zshenv instead; this file is only sourced from ~/.zshrc.
[ -r ~/.dotfiles/secrets.local ] && source ~/.dotfiles/secrets.local

# Load local settings/overrides, if present
[ -r ~/.dotfiles/profile.local ] && source ~/.dotfiles/profile.local

# zsh history tuning (skipped when this file is sourced from bash, e.g. setup.sh)
if [ -n "$ZSH_VERSION" ]; then
  # Add a timestamp to each ~/.zsh_history entry (view with: history -E -15)
  setopt EXTENDED_HISTORY
  # Drop older duplicates from ~/.zsh_history
  setopt HIST_IGNORE_ALL_DUPS
fi

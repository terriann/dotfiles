# set the editor for SVN
export SVN_EDITOR=/usr/bin/vi

# Shell Shortcuts
# alias ..="cd ../"
# alias ...="cd ../../"
# alias ~="cd ~"
alias mkdir="mkdir -p"
alias ll="ls -lhaG"
alias ls="ls -GA"
alias grep='grep --color=auto'
alias ps="ps -ax"
alias catn="cat -n"

# Utility Mini-scripts
alias bash-reload="source ~/.profile && printf '=> Terminal profile reset.\n'"
alias terminal-reload="source ~/.profile && printf '=> Profile reset.\n'"
alias bash-clear-history="cat /dev/null > ~/.bash_history && history -c && exit"
alias zsh-clear-history="cat /dev/null > $HISTFILE && history -p && exit"
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias npmup='bash ~/.dotfiles/scripts/npm-packages.sh before && nvm install-latest-npm  && npm update -g && bash ~/.dotfiles/scripts/npm-packages.sh after'
alias nodelts='bash ~/.dotfiles/scripts/npm-packages.sh before && nvm install --lts && nvm use --lts && bash ~/.dotfiles/scripts/npm-packages.sh after'
alias nodeup=nodelts
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy && printf '=> Public key copied to pasteboard.\n'"
alias eject-all="diskutil eject /Volumes/*;diskutil unmountDisk /Volumes/*"
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

# Date time in the right of the prompt
# @link https://gist.github.com/zulhfreelancer/9c410cad5efa9c5f7c74cd0849765865
# @todo - Make UTC instead of local. Accepting PRs
export RPROMPT="%F{yellow}[ %D{%f-%m-%y} %D{%L:%M:%S} ]"

# Shortcuts for Common Applications
alias sublime="open -a Sublime\ Text"
alias photoshop="open -a Adobe\ Photoshop\ CS"
alias preview="open -a Preview"
alias chrome="open -a Google\ Chrome"
alias brave="open -a Brave\ Browser"
alias safari="open -a Safari"
alias finder="open ."

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

# Load local settings/overrides
source ~/.dotfiles/profile.local

# Adds timestamp to ~/.zsh_history
# Ex: history -E -15
setopt EXTENDED_HISTORY
# Prevent duplicates entries in ~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

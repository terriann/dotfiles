# Prevent duplicates when hitting the up arrow in the shell
setopt HIST_IGNORE_DUPS

# set the editor for SVN
export SVN_EDITOR=/usr/bin/vi

# Server related Aliases
alias phpmamp="/Applications/MAMP/bin/php/php5.4.10/bin/php"
alias composer="php /usr/local/bin/composer.phar"
# Include composer to run phpcs and other Composer libraries globally
export PATH="$PATH:$HOME/.composer/vendor/bin"

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
alias bash-reload="source ~/.profile && printf '=> Bash profile reset.\n'"
alias bash-clear-history="cat /dev/null > ~/.bash_history && history -c && exit"
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy && printf '=> Public key copied to pasteboard.\n'"

# Customize Bash Prompt
## Add display when in an ssh session
if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"; fi

## Bash command prompt
#export PS1="
#\[\033[1;35m\]\u\[\033[0m\]:\[\033[1;36m\]\W\[\033[1;32m\]${text}
#\[\033[0;37m\]$ "

## ZSH command prompt
export PROMPT='
%F{magenta}%n%f:%F{cyan}%m%f %B%F{240}%~%f%b
%(?.%F{green}√.%F{red}?%?)%f $ '

# Shortcuts for Common Applications
alias sublime="open -a Sublime\ Text"
alias code="open -a Visual\ Studio\ Code"
alias phpstorm="open -a PhpStorm"
alias photoshop="open -a Adobe\ Photoshop\ CS"
alias preview="open -a Preview"
alias chrome="open -a Google\ Chrome"
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

## Networking Shortcuts
alias flushdns="dscacheutil -flushcache"
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

## WordPress Resources
### Include WP-CLI tab completion.
### @link http://wp-cli.org/
source ~/.dotfiles/includes/wp-completion.bash

# Load local settings/overrides
source ~/.dotfiles/profile.local

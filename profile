# Server related Aliases
alias phpmamp="/Applications/MAMP/bin/php/php5.4.10/bin/php"
alias composer="php /usr/local/bin/composer.phar"

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
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy && printf '=> Public key copied to pasteboard.\n'"

# Customize Bash Prompt
## Add display when in an ssh session
if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"; fi
## Formatting the command prompt
export PS1="
\[\033[1;35m\]\u\[\033[0m\]:\[\033[1;36m\]\W\[\033[1;32m\]${text}
\[\033[0;37m\]$ "

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

# Bash tab completion resources
source ~/.dotfiles/wordpress/wp-completion.bash

# Load local settings/overrides
source ~/.dotfiles/profile.local

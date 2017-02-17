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
alias reload='source ~/.bash_profile'
alias refresh='reload'

alias catn="cat -n"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

PS1_OLD=${PS1}
export PS1="
\[\033[1;35m\]\u\[\033[0m\]:\[\033[1;36m\]\W\[\033[0m\]
$ "

# Shortcuts for Common Applications
alias sublime="open -a Sublime\ Text\ 2"
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


## Networking Shortcuts
alias flushdns="dscacheutil -flushcache"
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"


# Load local settings/overrides
source ~/.dotfiles/profile.local
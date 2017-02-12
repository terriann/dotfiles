# Server related Aliases
alias phpmamp="/Applications/MAMP/bin/php/php5.4.10/bin/php"
alias composer="php /usr/local/bin/composer.phar"

# Terminal utility aliases
alias ..="cd ../"
alias ...="cd ../../"
alias ~="cd ~"
alias mkdir="mkdir -p"
alias ll="ls -lhaG"
# Always ls with color
alias ls="ls -GA"
# always grep with color
alias grep='grep --color=auto'
# processes
alias ps="ps -ax"
# refresh shell
alias reload='source ~/.bash_profile'
alias refresh='reload'

# Concatenate and print content of files (add line numbers)
alias catn="cat -n"

#IP based aliases
# simple ip
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
# more details
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# external ip
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

# Application related Aliases
alias sublime="open -a Sublime\ Text\ 2"
alias phpstorm="open -a PhpStorm"
alias photoshop="open -a Adobe\ Photoshop\ CS"
alias preview="open -a Preview"
alias chrome="open -a Google\ Chrome"
alias safari="open -a Safari"
alias finder="open ."

# MacOS related Aliases
# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

PS1_OLD=${PS1} #\h:\W \u\$ --> Terris-MacBook-Pro:Sites Terriann$
export PS1="
\[\033[1;35m\]\u\[\033[0m\]:\[\033[1;36m\]\W\[\033[0m\]
$ "

# Load local settings/overrides
source ~/.dotfiles/profile.local

#!/bin/bash


#This looks promising:

#    defaults read com.apple.dock

#This resource might be helpful too
#https://www.jamf.com/jamf-nation/discussions/19686/set-hot-corners-with-configuration-profile

#https://gist.github.com/klynch/827581


defaults write com.apple.dock wvous-tl-corner -int 0

defaults write com.apple.dock wvous-tr-corner -int 0

# Bottom left : Start Screensaver
defaults write com.apple.dock wvous-bl-corner -int 0

# Bottom right: Disable Screensaver
defaults write com.apple.dock wvous-br-corner -int 0


defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
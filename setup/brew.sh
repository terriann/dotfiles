#!/bin/bash

# Install homebrew (will also install Xcode CLI tool)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install git
brew install git

# install exiftool
brew install exiftool

# install tree command
brew install tree

# Install wget
brew install wget

# Install cask
brew tap caskroom/cask

# Install Core Casks Apps
echo Install Core Apps
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" spotify


# Developer Tools
echo Install Developer Tools
brew cask install --appdir="~/Applications" cyberduck
brew cask install --appdir="~/Applications" visual-studio-code
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" sublime-text
brew cask install --appdir="~/Applications" mysqlworkbench
brew cask install --appdir="~/Applications" docker
brew cask install --appdir="~/Applications" docker-toolbox
brew cask install --appdir="/Applications" charles
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" dash



# Google Things
#echo Do not Install Chrome - there were issue with 1pass extension.
#brew cask install --appdir="/Applications" google-chrome
#brew cask install --appdir="~/Applications" chrome-devtools
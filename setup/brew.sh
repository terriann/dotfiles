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
brew install --cask alfred
brew install --cask dropbox
brew install --cask little-snitch
brew install --cask 1password
brew install --cask firefox
brew install --cask spotify

# Developer Tools
echo install Xcode
xcode-select —install

echo install php
brew install php

echo Install Applications & Tools Tools
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

brew install --cask google-chrome
brew install --cask chrome-devtools
brew install --cask brave-browser

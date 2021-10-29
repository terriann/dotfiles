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

echo Install Developer Tools
brew install --cask cyberduck
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask mysqlworkbench
brew install --cask docker
brew install --cask docker-toolbox
brew install --cask charles
brew install --cask google-chrome
brew install --cask chrome-devtools
brew install --cask brave-browser
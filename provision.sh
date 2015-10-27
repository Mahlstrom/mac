#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap josegonzalez/php
brew update
# Install cask
brew install caskroom/cask/brew-cask
brew cask update

# Install other good stuff
brew install watch

# Install good programs to have
brew cask install xquartz phpstorm sublime-text virtualbox vagrant

# Installing sharing apps
brew cask install dropbox copy box-sync

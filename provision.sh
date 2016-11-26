#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap mahlstrom/awsssh
brew update
brew install aws
brew install awsssh
# Install cask
brew install caskroom/cask/brew-cask
brew cask update

# Install other good stuff
brew install watch

# Install good programs to have
brew cask install xquartz phpstorm sublime-text virtualbox vagrant

# Installing sharing apps
brew cask install dropbox

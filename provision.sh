#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap josegonzalez/php
brew update
# Install cask
brew install caskroom/cask/brew-cask
brew cask update

# Install webstuff
brew install php56 php56-xdebug composer nginx uwsgi postgresql node nginx

# Install other good stuff
brew install watch


# Install good programs to have
brew cask install xquartz phpstorm sublime-text virtualbox vagrant istat-menus 

# Installing sharing apps
brew cask install dropbox copy box-sync

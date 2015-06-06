#!/usr/bin/env bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
# Install cask
brew install caskroom/cask/brew-cask

# Install webstuff
brew install php56 php56-xdebug composer nginx uwsgi postgresql node nginx

brew cask update
brew cask install xquartz phpstorm sublime-text virtualbox vagrant istat-menus 

# Installing sharing apps
brew cask install dropbox copy box-sync

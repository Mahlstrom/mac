#!/usr/bin/env bash
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap mahlstrom/awsssh
brew update
brew install awscli
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
brew cask install google-chrome iterm2
brew cask install coreutils

#!/usr/bin/env bash
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

set +e

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Show the ~/Library folder
chflags nohidden ~/Library

# Set a really fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Avoid the creation of .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the 'Are you sure you want to open this application?' dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Set dark interface style
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Show battery percent
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Set up trackpad & mouse speed to a reasonable number
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Auto Hide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true


# Photos:
# Disable it from starting everytime a device is plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Set function keys as standard function keys
defaults write -g com.apple.keyboard.fnState true

# Do auto-hide
defaults write com.apple.dock autohide -bool true

# Position on Right of screen
defaults write com.apple.dock orientation -string right

# Pin the Dock at the top right of the screen
defaults write com.apple.dock pinning -string start

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

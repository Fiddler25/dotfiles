#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

#
# General
#

defaults write -g AppleInterfaceStyle -string "Dark"

#
# Dock
#

defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "show-process-indicators" -bool "true"

#
# Trackpad
#

defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool "true"

#
# Clock
#

defaults write com.apple.menuextra.clock "DateFormat" -string "EEE MMM d  H:mm"

for app in "Dock" \
	"Trackpad" \
	"Clock"; do
	killall "${app}" &> /dev/null
done
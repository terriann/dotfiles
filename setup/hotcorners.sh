#!/bin/bash

# Hot Corner actions:
# 0 = No action
# 2 = Mission Control
# 3 = Application windows
# 4 = Desktop
# 5 = Start screen saver
# 6 = Disable screen saver
# 7 = Dashboard
# 10 = Put display to sleep
# 11 = Launchpad
# 12 = Notification Center
# 13 = Lock Screen
# 14 = Quick Note

# Modifier keys:
# Sum modifiers for multi-key activation.
# 0 = No modifier
# 131072 = Shift
# 262144 = Control
# 524288 = Option
# 1048576 = Command

# Set top-left corner to No action
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# Set top-right corner to Launchpad
defaults write com.apple.dock wvous-tr-corner -int 11
defaults write com.apple.dock wvous-tr-modifier -int 0

# Set bottom-left corner + Command(⌘) to Lock Screen
# + Command so navigating to the unmute button in Zoom doesn't trigger the lock screen mid-meeting.
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 1048576

# Set bottom-right corner to Disable Screen Saver
defaults write com.apple.dock wvous-br-corner -int 6
defaults write com.apple.dock wvous-br-modifier -int 0

echo "Hot corners set. Restarting Dock to apply changes..."
echo "🚨 This will cause the screen to flash briefly - do not be alarmed"

sleep 3

# Restart Dock to apply changes
killall Dock

echo "✅ Dock restarted. Hot corners are now active."

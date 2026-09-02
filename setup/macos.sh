#!/bin/bash
#
# Opinionated macOS system tweaks.
#
# Run with no arguments to choose interactively (apply everything, or one
# class of settings at a time). Or pass a section name to apply just that
# one without prompts:
#
#   bash setup/macos.sh              # interactive
#   bash setup/macos.sh all          # apply everything
#   bash setup/macos.sh hotcorners   # just hot corners
#   bash setup/macos.sh screenshots  # just screenshots
#   bash setup/macos.sh gestures     # just trackpad gestures
#
# Safe to re-run.

set -u

RESTART_DOCK=false
RESTART_SUISERVER=false

# Prompt "$1 [y/N]"; succeeds only on an explicit yes.
ask() {
  local reply
  read -r -p "$1 [y/N] " reply
  [[ "$reply" == [yY] || "$reply" == [yY][eE][sS] ]]
}

# ---------------------------------------------------------------------------
# Hot corners
#
# Each corner takes two keys: -corner (the action) and -modifier (keys that
# must be held for it to fire). Corner prefixes: tl, tr, bl, br.
#
# Actions (-int):
#   0  = No action
#   2  = Mission Control
#   3  = Application windows
#   4  = Desktop
#   5  = Start screen saver
#   6  = Disable screen saver
#   7  = Dashboard
#   10 = Put display to sleep
#   11 = Launchpad
#   12 = Notification Center
#   13 = Lock Screen
#   14 = Quick Note
#
# Modifiers (-int), summed for multi-key combos:
#   0       = none
#   131072  = Shift
#   262144  = Control
#   524288  = Option
#   1048576 = Command
#
# Example — top-left = Desktop, only while holding Control+Option:
#   defaults write com.apple.dock wvous-tl-corner   -int 4
#   defaults write com.apple.dock wvous-tl-modifier -int 786432   # 262144 + 524288
# ---------------------------------------------------------------------------
apply_hotcorners() {
  echo "› Hot corners: tl=none, tr=Launchpad, bl+Command=Lock Screen, br=Disable Screen Saver"

  # Top-left — No action
  defaults write com.apple.dock wvous-tl-corner   -int 0
  defaults write com.apple.dock wvous-tl-modifier -int 0

  # Top-right — Launchpad
  defaults write com.apple.dock wvous-tr-corner   -int 11
  defaults write com.apple.dock wvous-tr-modifier -int 0

  # Bottom-left + Command — Lock Screen
  # Command is required so grazing the corner (e.g. reaching for the Zoom
  # unmute button) doesn't lock the screen mid-meeting.
  defaults write com.apple.dock wvous-bl-corner   -int 13
  defaults write com.apple.dock wvous-bl-modifier -int 1048576

  # Bottom-right — Disable screen saver
  defaults write com.apple.dock wvous-br-corner   -int 6
  defaults write com.apple.dock wvous-br-modifier -int 0

  RESTART_DOCK=true
}

# ---------------------------------------------------------------------------
# Screenshots
#
# Save screenshots to a dated "retention" folder on the Desktop instead of
# scattering them loose. Pair with a Hazel rule (or similar) to clear the
# folder every 30 days.
# ---------------------------------------------------------------------------
apply_screenshots() {
  local dir="$HOME/Desktop/30 Day Retention"
  echo "› Screenshots: save to $dir"

  mkdir -p "$dir"
  defaults write com.apple.screencapture location "$dir"

  RESTART_SUISERVER=true
}

# ---------------------------------------------------------------------------
# Trackpad gestures
#
# Mirrors what's set in System Settings > Trackpad. Every key is written to
# both trackpad domains:
#   com.apple.AppleMultitouchTrackpad                    - built-in trackpad
#   com.apple.driver.AppleBluetoothMultitouch.trackpad   - Magic Trackpad
#
# Gesture enum values in this macOS version: 2 = on for the *FingerSwipe /
# *Pinch keys, 3 = on for the two-finger-from-edge key, 0 = off.
#
# Most of these match Apple's defaults; they're set explicitly so a new
# machine matches this one regardless of OS version. Recapture a tuned
# value with, e.g.:  defaults read -g com.apple.trackpad.scaling
# ---------------------------------------------------------------------------
apply_gestures() {
  echo "› Trackpad gestures: tap-to-click, 2-finger secondary click, medium click, 3-finger swipes"

  # Write one key to both trackpad domains.
  tp() {
    defaults write com.apple.AppleMultitouchTrackpad "$@"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "$@"
  }

  # -- Point & Click --------------------------------------------------------
  tp Clicking -bool true                               # tap to click (one finger)
  defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
  defaults write -g com.apple.mouse.tapBehavior -int 1

  tp TrackpadRightClick -bool true                     # secondary click: two fingers
  tp TrackpadCornerSecondaryClick -int 0               #   ...not a bottom corner
  defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool true

  tp FirstClickThreshold -int 1                        # click pressure: 0 light / 1 medium / 2 firm
  tp SecondClickThreshold -int 1

  tp ForceSuppressed -bool false                       # Force Click + haptics on
  defaults write -g com.apple.trackpad.forceClick -bool true
  tp TrackpadThreeFingerTapGesture -int 0              # Look up = Force Click, not three-finger tap

  defaults write -g com.apple.trackpad.scaling -float 0.6875   # tracking speed

  # -- More Gestures ------------------------------------------------------
  tp TrackpadThreeFingerHorizSwipeGesture -int 2       # full-screen app switch: three fingers
  tp TrackpadFourFingerHorizSwipeGesture -int 2        #   (four fingers also works)
  tp TrackpadThreeFingerVertSwipeGesture -int 2        # Mission Control up / App Expose down: three fingers
  tp TrackpadFourFingerVertSwipeGesture -int 2
  defaults write com.apple.dock showAppExposeGestureEnabled -bool true
  tp TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3 # Notification Center
  tp TrackpadFiveFingerPinchGesture -int 2             # Show Desktop: spread thumb + three fingers
  tp TrackpadFourFingerPinchGesture -int 2             # Launchpad: pinch thumb + three fingers

  # -- Scroll & Zoom -----------------------------------------------------
  # Changing scroll direction only takes effect after a re-login, so only
  # nag about it when the value actually flips.
  local scroll_was
  scroll_was=$(defaults read -g com.apple.swipescrolldirection 2>/dev/null)
  defaults write -g com.apple.swipescrolldirection -bool true   # natural scrolling (content follows fingers)
  if [ "$(defaults read -g com.apple.swipescrolldirection 2>/dev/null)" != "$scroll_was" ]; then
    echo "  note: log out and back in for the scroll-direction change to take effect"
  fi

  RESTART_DOCK=true
  RESTART_SUISERVER=true
}

apply_all() {
  apply_hotcorners
  apply_screenshots
  apply_gestures
}

# Restart only the services whose settings actually changed.
restart_services() {
  [ "$RESTART_DOCK" = true ] || [ "$RESTART_SUISERVER" = true ] || return 0

  echo
  echo "🚨 Restarting affected services — the screen may flash briefly."
  sleep 2
  [ "$RESTART_DOCK" = true ]      && killall Dock
  [ "$RESTART_SUISERVER" = true ] && killall SystemUIServer
  echo "✅ Done."
}

case "${1:-}" in
  all)         apply_all ;;
  hotcorners)  apply_hotcorners ;;
  screenshots) apply_screenshots ;;
  gestures)    apply_gestures ;;
  "")
    if ask "Apply all macOS tweaks?"; then
      apply_all
    else
      ask "  Apply hot corners?"         && apply_hotcorners
      ask "  Apply screenshot settings?" && apply_screenshots
      ask "  Apply trackpad gestures?"   && apply_gestures
    fi
    ;;
  *)
    echo "Usage: bash setup/macos.sh [all|hotcorners|screenshots|gestures]" >&2
    exit 1
    ;;
esac

restart_services

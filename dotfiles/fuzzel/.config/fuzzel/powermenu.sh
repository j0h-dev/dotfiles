#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e "$entries" | fuzzel --dmenu --placeholder "Select action..." --lines 4 --width 30)

case "$selected" in
  "⇠ Logout")
    echo "Logging out..."
    exec hyprctl dispatch exit;;
  "⏾ Suspend")
    hyprlock &
    exec systemctl suspend;;
  "⭮ Reboot")
    exec systemctl reboot;;
  "⏻ Shutdown")
    exec systemctl poweroff -i;;
esac

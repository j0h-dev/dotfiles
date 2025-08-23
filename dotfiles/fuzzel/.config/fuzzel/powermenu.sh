#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

CHOICE=$(echo -e "$entries" | fuzzel --dmenu --placeholder "Select action..." --lines 4 --width 30)

case $selected in
  logout)
    exec hyprctl dispatch exit;;
  suspend)
    hyprlock &
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac

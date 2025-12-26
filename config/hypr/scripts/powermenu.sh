#!/usr/bin/env bash

set -euo pipefail

choice=$(printf " Lock\n Suspend\n󰍃 Logout\n Reboot\n⏻ Power Off" |
  rofi -dmenu -p "Power")

[[ -z "$choice" ]] && exit 0

case "$choice" in
" Lock")
  hyprlock
  ;;
" Suspend")
  systemctl suspend
  ;;
"󰍃 Logout")
  loginctl terminate-session ${XDG_SESSION_ID-}
  ;;
" Reboot")
  systemctl reboot
  ;;
"⏻ Power Off")
  systemctl poweroff
  ;;
esac

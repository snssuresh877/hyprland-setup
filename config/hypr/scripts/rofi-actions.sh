#!/bin/bash

choice=$(printf \
  "󰣆 Apps\n󰖯 Windows\n󰌌 Clipboard\n󰒓 System\n󰐥 Power\n󰎔 Scripts" |
  rofi -dmenu -p "Search")

case "$choice" in
*Apps*) rofi -show drun ;;
*Windows*) rofi -show window ;;
*Clipboard*) ~/.config/hypr/scripts/clipboard-clean.sh ;;
*System*) ~/.config/hypr/scripts/system.sh ;;
*Power*) ~/.config/hypr/scripts/powermenu.sh ;;
*Scripts*) ~/.config/hypr/scripts/switch_wallpaper.sh ;;
esac

#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache/wal"

# Ensure daemon
pgrep -x swww-daemon >/dev/null || swww-daemon &
sleep 0.5

# Pick wallpaper
WALLPAPER=$(ls "$WALLPAPER_DIR" | grep -Ei '\.(jpg|jpeg|png|webp)$' | shuf -n 1)
[ -z "$WALLPAPER" ] && exit 1
FULL_PATH="$WALLPAPER_DIR/$WALLPAPER"

# Set wallpaper
swww img "$FULL_PATH" \
  --transition-type grow \
  --transition-duration 0.6 \
  --transition-fps 60

# Generate colors (no terminal color pollution)
wal -n -q -i "$FULL_PATH"

# Reload Waybar smoothly
pkill -USR2 waybar

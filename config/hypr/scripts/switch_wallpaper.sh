#!/usr/bin/env bash

# ================================
# Wallpaper Switcher (Hyprland)
# + pywal + Waybar sync
# ================================

set -e
WALL_DIR="$HOME/Pictures/wallpapers"
CACHE_FILE="$HOME/.cache/current_wallpaper"
MONITOR="eDP-1"

# safety check
[ ! -d "$WALL_DIR" ] && exit 1

# pick random wallpaper (different from last)
WALL=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

# fallback
[ -z "$WALL" ] && exit 1

# save current wallpaper
echo "$WALL" >"$CACHE_FILE"

# preload & set wallpaper (hyprpaper)
hyprctl hyprpaper preload "$WALL"
hyprctl hyprpaper wallpaper "$MONITOR,$WALL"
hyprctl hyprpaper unload unused

# generate pywal colors (no wallpaper setter)
wal -i "$WALL" -n -q

# reload waybar safely
pkill waybar
waybar &
disown

exit 0

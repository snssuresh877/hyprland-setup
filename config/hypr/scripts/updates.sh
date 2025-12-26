#!/usr/bin/env bash

# ---- FIXED & STABLE ----
export PATH="/usr/bin:/bin:$PATH"

# pacman updates
pac=$(checkupdates 2>/dev/null | wc -l)

# paru (AUR) updates
if command -v paru >/dev/null; then
  aur=$(paru -Qua 2>/dev/null | wc -l)
else
  aur=0
fi

total=$((pac + aur))

# ALWAYS print something (Waybar requirement)
if [ "$total" -eq 0 ]; then
  echo " 0"
else
  echo " $total"
fi

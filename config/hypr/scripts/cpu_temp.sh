#!/usr/bin/env bash

# Ryzen CPU temperature for Waybar (decimal-safe)

TEMP_RAW=$(sensors | awk '/Tctl:/ {print $2}' | head -n1)

# Remove +°C and keep decimal
TEMP=$(echo "$TEMP_RAW" | tr -d '+°C')

[ -z "$TEMP" ] && exit 0

# Convert to integer for comparison
TEMP_INT=${TEMP%.*}

if [ "$TEMP_INT" -ge 90 ]; then
  echo " ${TEMP}°C"
elif [ "$TEMP_INT" -ge 75 ]; then
  echo " ${TEMP}°C"
else
  echo " ${TEMP}°C"
fi

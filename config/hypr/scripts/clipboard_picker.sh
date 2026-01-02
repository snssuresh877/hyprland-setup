#!/usr/bin/env bash

cliphist list | rofi -dmenu \
  -config ~/.config/rofi/config-cliphist.rasi |
  cliphist decode | wl-copy

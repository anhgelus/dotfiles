#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/colorblocks"

# Launch the bar
polybar -q external -c "$DIR"/config.ini &
 

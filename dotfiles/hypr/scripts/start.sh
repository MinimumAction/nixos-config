#!/usr/bin/env bash

# initialize wallpaper daemon
# swww init &
# swww img ~/Wallpapers/path-to-image.png &
hyprpaper &

# start network manager
nm-applet --indicator &

# start waybar
waybar &

# start dunst
dunst
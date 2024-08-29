#!/usr/bin/env bash

# make scripts executable
chmod +x ~/.config/hypr/scripts/reload-waybar.sh &

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
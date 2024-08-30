#!/usr/bin/env bash

# make scripts executable
chmod +x ~/.config/hypr/scripts/reload-waybar.sh &

# initialize wallpaper daemon
# swww init 
# sleep 1 
# swww img ~/Pictures/cityscape.png 
# hyprpaper &

# start network manager
nm-applet --indicator &

# start waybar
waybar &

# start dunst
dunst
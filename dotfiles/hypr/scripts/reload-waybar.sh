#!/usr/bin/env bash

# Restart waybar
pkill waybar
sleep 1
waybar &

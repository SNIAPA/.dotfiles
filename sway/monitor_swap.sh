#!/bin/bash

# Name of the laptop monitor (usually eDP-1, but check with xrandr)
LAPTOP_MONITOR="eDP-1"

# Check if an external monitor is connected
EXTERNAL_MONITOR=$(xrandr --query | grep ' connected' | grep -v "$LAPTOP_MONITOR" | awk '{ print $1 }')

if [ -n "$EXTERNAL_MONITOR" ]; then
    # External monitor is connected, disable the laptop monitor
    xrandr --output "$LAPTOP_MONITOR" --off
    xrandr --output "$EXTERNAL_MONITOR" --auto
else
    # No external monitor, enable the laptop monitor
    xrandr --output "$LAPTOP_MONITOR" --auto
fi

nitrogen --set-zoom-fill $HOME/.config/wallpapers/wallpaper.png

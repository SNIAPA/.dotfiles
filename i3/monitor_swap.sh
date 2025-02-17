#!/bin/bash

# Name of the laptop monitor (usually eDP-1, but check with xrandr)
LAPTOP_MONITOR="eDP-1"

# Check if an external monitor is connected
EXTERNAL_MONITOR=$(xrandr --query | grep ' connected' | grep "DP-1" | grep -v "eDP-1" | awk '{ print $1 }')
EXTERNAL_MONITOR2=$(xrandr --query | grep ' connected' | grep "HDMI-1" | awk '{ print $1 }')

if [ -n "$EXTERNAL_MONITOR" ]; then
    # External monitor is connected, disable the laptop monitor
    xrandr --output "$LAPTOP_MONITOR" --off

  if [ -n "$EXTERNAL_MONITOR2" ]; then
    echo $EXTERNAL_MONITOR2
    xrandr --output "$EXTERNAL_MONITOR2" --auto --primary 
    echo xrandr --output "$EXTERNAL_MONITOR" --auto --left-of "$EXTERNAL_MONITOR2" --pos 0x0
  else 
    xrandr --output "$EXTERNAL_MONITOR" --auto
  fi
else
    # No external monitor, enable the laptop monitor
    xrandr --output "$LAPTOP_MONITOR" --auto
fi

# Fix wallpaper
nitrogen --force-setter=xinerama  --restore

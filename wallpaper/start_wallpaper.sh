#!/bin/bash

until swaymsg -t get_outputs &>/dev/null; do
    sleep 0.5
done

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run with absolute paths
mpvpaper -o "--loop --no-audio --glsl-shader=${SCRIPT_DIR}/plasma.glsl" '*' "${SCRIPT_DIR}/black.mp4"

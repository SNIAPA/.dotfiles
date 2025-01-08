#!/bin/bash

# Name of the tmux session
SESSION_NAME="my_session"

# Start a new tmux session with the specified name
tmux new-session -d -s $SESSION_NAME

# Send the command to open neovim inside the tmux session
tmux send-keys -t $SESSION_NAME "nvim" C-m

# Attach to the tmux session
tmux attach-session -t $SESSION_NAME

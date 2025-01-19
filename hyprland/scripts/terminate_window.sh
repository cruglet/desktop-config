#!/bin/bash

# get the PID of the active window
PID=$(hyprctl activewindow -j | jq '.pid')

# check if PID is not empty
if [ -n "$PID" ]; then
    # send SIGTERM to the process
    kill -15 "$PID"
else
    echo "No active window found or unable to retrieve PID."
fi

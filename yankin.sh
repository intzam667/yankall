#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: yankin <file>"
    exit 1
fi

FILE="$1"

if [ "$(id -u)" -eq 0 ]; then
    echo "Consider using 'sudo -E' to preserve user environment variables."
fi

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

if command -v wl-paste &> /dev/null; then
    export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
    export WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-0}

    > "$FILE"
    
    wl-paste --type "text/plain" > "$FILE"
    echo "Clipboard content has been pasted into '$FILE'."
else
    echo "Error: wl-paste not found. Install wl-clipboard for Wayland clipboard support."
    exit 1
fi

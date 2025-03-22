#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: yankall <file>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

if command -v wl-copy &> /dev/null; then
    cat "$FILE" | wl-copy
    echo "Content of '$FILE' copied to clipboard using wl-copy."
elif command -v xclip &> /dev/null; then
    cat "$FILE" | xclip -selection clipboard
    echo "Content of '$FILE' copied to clipboard using xclip."
elif command -v xsel &> /dev/null; then
    cat "$FILE" | xsel --clipboard --input
    echo "Content of '$FILE' copied to clipboard using xsel."
else
    echo "Error: No clipboard utility found. Install wl-clipboard (Wayland) or xclip/xsel (X11)."
    exit 1
fi

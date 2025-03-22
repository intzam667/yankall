#!/bin/bash

YANKALL="yankall.sh"
YANKIN="yankin.sh"
BIN_DIR="/usr/bin"

if [ -f "$YANKALL" ]; then
    sudo chmod +x "$YANKALL"
    sudo chmod +x "$YANKIN"
else
    exit 1
fi

sudo cp "$YANKALL" "$BIN_DIR/yankall"
sudo cp "$YANKIN" "$BIN_DIR/yankin"

echo "Installation completed. You can now use 'yankall' and 'yankin' from anywhere."
echo "Do not forget to use yankin with 'sudo -E' privileges."


#!/bin/bash

# Purpose: Setup symlink submenu
# Author: The bois

# Attempt to follow the symlink with readlink -f (Linux)
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || realpath "${BASH_SOURCE[0]}" 2>/dev/null || echo "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

# Import colors
source "$(dirname "$SCRIPT_DIR")/colors.sh"

# Check if the symlink destination directory is in PATH
if [[ ":$PATH:" != *":/usr/local/bin:"* ]]; then
    print_colored YELLOW "==>"
    print_colored WHITE " Your /usr/local/bin directory isn't in the PATH. Adjusting...\n"
    export PATH=$PATH:/usr/local/bin
fi

# Create a symbolic link for main.sh
sudo ln -s "$(pwd)/scripts/main.sh" ~/bin/repodex

# Check if Repodex symlink was successful
if command -v "repodex" &> /dev/null; then
    print_colored GREEN "==>"
    print_colored WHITE " Repodex has been set up. You can now run 'repodex' from anywhere."
else
    print_colored RED "==>"
    print_colored WHITE " Repodex setup failed. The 'repodex' command is not available.\n"
    exit 1
fi

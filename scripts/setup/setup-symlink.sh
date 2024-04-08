#!/bin/bash

# Purpose: Setup symlink for repodex
# Author: The bois

# Attempt to follow the symlink with readlink -f (Linux)
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || realpath "${BASH_SOURCE[0]}" 2>/dev/null || echo "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

# Import colors
source "$(dirname "$SCRIPT_DIR")/colors.sh"

# Check if the symlink destination directory is in PATH
if [[ ":$PATH:" != *":/usr/local/bin:"* ]]; then
  print_colored YELLOW "==>"
  print_colored WHITE " Your /usr/local/bin directory isn't in the PATH. Adjusting...\n"
  export PATH="$PATH":/usr/local/bin
fi

# Destination of the symlink
link_destination="$HOME/bin/repodex"

# Target file for the symlink
symlink_target="$PWD/scripts/main.sh"

# Check if the symlink already exists
if [ -L "$link_destination" ]; then
  # Check if the existing symlink points to the target
  if [ "$(readlink "$link_destination")" = "$symlink_target" ]; then
    print_colored BLUE "==>"
    print_colored WHITE " Symlink already exists and points to the correct target. No action required.\n"
  else
    # Symlink exists but points to a different target, remove it
    sudo rm "$link_destination"
    sudo ln -s "$symlink_target" "$link_destination"
  fi
elif [ -e "$link_destination" ]; then
  print_colored RED "==>"
  print_colored WHITE " A file or directory exists at the symlink location. Please remove it manually.\n"
  exit 1
else
  # Create a symbolic link for main.sh
  sudo ln -s "$symlink_target" "$link_destination"
fi

# Check if Repodex symlink was successful
if command -v "repodex" &>/dev/null; then
  print_colored GREEN "==>"
  print_colored WHITE " Repodex has been set up. You can now run 'repodex' from anywhere."
else
  print_colored RED "==>"
  print_colored WHITE " Repodex setup failed. The 'repodex' command is not available.\n"
  exit 1
fi

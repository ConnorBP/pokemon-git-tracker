#!/bin/bash

# Purpose: Setting up Git and GitHub CLI
# Author: The bois

# Attempt to follow the symlink with readlink -f (Linux)
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || realpath "${BASH_SOURCE[0]}" 2>/dev/null || echo "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

# Import colors
source "$(dirname "$SCRIPT_DIR")/colors.sh"

# Function to check for required commands
check_command() {
    if ! command -v "$1" &> /dev/null; then
        print_colored RED "==>"
        print_colored WHITE " Required command not found: $1\n Please install it and try again.\n"
        exit 1
    fi
}

# Check for required commands
check_command ping
check_command gh
check_command git

# Check if connected to the internet
check_connection() {
  print_colored YELLOW "==>"
  print_colored WHITE " Checking Internet Connection...\n"
  if ping -q -c 1 -W 1 google.com &>/dev/null; then
    print_colored GREEN "==>"
    print_colored WHITE " Internet Connection Detected.\n"
  else
    print_colored RED "==>"
    print_colored WHITE " No Internet Connection. Please connect to the internet and try again.\n"
    exit 1
  fi
}

# Main function
check_connection
gh auth login

# Check if GitHub CLI login was successful
if gh auth status; then
    print_colored GREEN "==>"
    print_colored WHITE " GitHub CLI authentication successful. Continue to use the watchdog.\n"
else
    print_colored RED "==>"
    print_colored WHITE " GitHub CLI authentication failed. Please try again or check your authentication method.\n"
    exit 1
fi

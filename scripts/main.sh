#!/bin/bash

# Purpose: Repodex Entry
# Author: The bois

# Attempt to follow the symlink with readlink -f (Linux)
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || realpath "${BASH_SOURCE[0]}" 2>/dev/null || echo "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

# Import colors
source "$SCRIPT_DIR/colors.sh"

# Variables
install_label='Install'
install_script="$SCRIPT_DIR/install.sh"

setup_label='Setup'
setup_script="$SCRIPT_DIR/setup.sh"

watchdog_label='Watchdog'
watchdog_script="$SCRIPT_DIR/watchdog.sh"

# Function to display the menu
show_menu() {
  echo "Welcome to Repodex's Installer!"
  echo "Select an option:"
  echo "1) $install_label"
  echo "2) $setup_label"
  echo "3) $watchdog_label"
  echo "4) Exit"
  echo
}

# Function to run the selected option
run_option() {
  case $1 in
    1)
      print_colored BLUE "==>"
      print_colored WHITE " Running $install_label script...\n"
      # Add the command to run your first script here
      "$install_script"
      echo
      ;;
    2)
      print_colored BLUE "==>"
      print_colored WHITE " Running $setup_label script...\n"
      # Add the command to run your second script here
      "$setup_script"
      echo
      ;;
    3)
      print_colored BLUE "==>"
      print_colored WHITE " Running $watchdog_label script...\n"
      # Add the command to run your third script here
      "$watchdog_script"
      echo
      ;;
    4)
      print_colored RED "==>"
      print_colored WHITE " Exiting...\n"
      exit 0
      ;;
    *)
      print_colored RED "==>"
      print_colored WHITE " Exiting...\n"
      echo
      ;;
  esac
}

# Main loop
while true; do
  show_menu
  read -p "Enter your choice [1-4]: " choice
  echo
  run_option "$choice"
done

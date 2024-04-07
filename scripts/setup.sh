#!/bin/bash

# Purpose: Setup submenu
# Author: The bois

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Import colors
source "$SCRIPT_DIR/colors.sh"

# Variables
git_label='Git & Github'
git_script="$SCRIPT_DIR/setup/setup-git.sh"

# Submenu for the setup option
show_menu() {
  echo "Welcome to the setup submenu!"
  echo "1) $git_label"
  echo "2) Go back"
  echo
}
# Function to handle user selection in the setup submenu
handle_selection() {
  case $1 in
    1)
      print_colored BLUE "==>"
      print_colored WHITE " Running $git_label setup script...\n"
      "$git_script"
      echo
      ;;
    3)
      print_colored YELLOW "==>"
      print_colored WHITE " Returning to main menu..."
      exit 0
      ;;
    *)
      print_colored RED "==>"
      print_colored WHITE " Invalid option. Please try again.\n"
      ;;
  esac
}

# Loop for the setup submenu
while true; do
  show_menu
  read -p "Select software to setup: " setup_choice
  echo
  handle_selection "$setup_choice"
done

#!/bin/bash

# Purpose: Setup submenu
# Author: The bois

# Attempt to follow the symlink with readlink -f (Linux)
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || realpath "${BASH_SOURCE[0]}" 2>/dev/null || echo "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

# Import colors
source "$SCRIPT_DIR/colors.sh"

# Variables
git_label='Git & Github'
git_script="$SCRIPT_DIR/setup/setup-git.sh"

symlink_label='Symbiotic Link'
symlink_script="$SCRIPT_DIR/setup/setup-symlink.sh"

post_commit_label='Post-Commit'
post_commit_script="$SCRIPT_DIR/setup/setup-post-commit.sh"

discord_webhook_label='Discord Webhook'
discord_webhook_script="$SCRIPT_DIR/setup/setup-discord-webhook.sh"

# Submenu for the setup option
show_menu() {
  echo "Welcome to the setup submenu!"
  echo "1) $git_label"
  echo "2) $symlink_label"
  echo "3) $discord_webhook_label"
  echo "4) $post_commit_label"
  echo "5) Go back"
  echo "5) Exit"
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
    2)
      print_colored BLUE "==>"
      print_colored WHITE " Running $symlink_label setup script...\n"
      "$symlink_script"
      echo
      ;;
    3)
      print_colored BLUE "==>"
      print_colored WHITE " Running $discord_webhook_label setup script...\n"
      "$discord_webhook_script"
      echo
      ;;
    4)
      print_colored BLUE "==>"
      print_colored WHITE " Running $post_commit_label setup script...\n"
      "$post_commit_script"
      echo
      ;;
    5)
      print_colored YELLOW "==>"
      print_colored WHITE " Returning to main menu..."
      exit 0
      ;;
    6)
      print_colored RED "==>"
      print_colored WHITE " Exiting...\n"
      exit 1
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

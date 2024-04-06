#!/bin/bash

# Purpose: Installation submenu
# Author: The bois

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Import colors
source "${SCRIPT_DIR}/colors.sh"

# Variables
git_label='Git'
git_script="${SCRIPT_DIR}/install/install-git.sh"

github_cli_label='Github CLI'
github_cli_script="${SCRIPT_DIR}/install/install-github-cli.sh"


# Submenu for the Install option
show_install_menu() {
    echo "Welcome to the installer submenu!"
    echo "1) $git_label"
    echo "2) $github_cli_label"
    echo "3) Go back"
    echo
}
# Function to handle user selection in the install submenu
handle_install_selection() {
    case $1 in
        1)
            print_colored BLUE "==>"
            print_colored WHITE " Running $git_label installation Script...\n"
            $git_script
            echo
            ;;
        2)
            print_colored BLUE "==>"
            print_colored WHITE " Running $github_cli_label installation Script...\n"
            $github_cli_script
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

# Loop for the install submenu
while true; do
    show_install_menu
    read -p "Select software to install: " install_choice
    echo
    handle_install_selection "$install_choice"
done

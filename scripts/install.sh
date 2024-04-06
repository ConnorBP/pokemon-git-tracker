#!/bin/bash

source ./colors.sh

# Variables
git_label='Git'
git_script='install-git.sh'

github_cli_label='Github CLI'
github_cli_script='install-github-cli.sh'


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
            # Add the command to run your first script here
            "./install/$git_script"
            echo
            ;;
        2)
            print_colored BLUE "==>"
            print_colored WHITE " Running $github_cli_label installation Script...\n"
            # Add the command to run your second script here
            "./install/$github_cli_script"
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
    handle_install_selection $install_choice
done

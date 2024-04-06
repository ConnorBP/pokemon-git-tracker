#!/bin/bash

# Purpose: Install Github CLI
# Author: The bois

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Import colors
source "$(dirname ${SCRIPT_DIR})/colors.sh"

# Check if connected to the internet
check_connection() {
    print_colored YELLOW "==>"
    print_colored WHITE " Checking Internet Connection...\n"
    if ping -q -c 1 -W 1 google.com &> /dev/null
    then
        print_colored GREEN "==>"
        print_colored WHITE " Internet Connection Detected.\n"
    else
        print_colored RED "==>"
        print_colored WHITE " No Internet Connection. Please connect to the internet and try again.\n"
        exit 1
    fi
}

# Function to install Git via APT
install_gh_apt() {
    print_colored GREEN "==>"
    print_colored WHITE " Detected Debian/Ubuntu.\n"

    #@info: Update the package repository 
    sudo apt-get update

    #@info: Check if GitHub CLI is installed
    if command -v gh &> /dev/null
    then
        print_colored GREEN "==>"
        print_colored WHITE " GitHub CLI is already installed. Proceed to the next step.\n"
        exit 0
    fi
    print_colored BLUE "==>"
    print_colored WHITE " Installing "
    print_colored GREEN "GitHub CLI...\n"
    sudo apt-get install gh -y
}

# Function to install Git via YUM
install_gh_yum() {
    print_colored GREEN "==>"
    print_colored WHITE " Detected CentOS/RHEL.\n"

    #@info: Update the package repository 
    sudo yum update

    #@info: Check if GitHub CLI is installed
    if command -v gh &> /dev/null
    then
        print_colored GREEN "==>"
        print_colored WHITE " GitHub CLI is already installed. Proceed to the next step.\n"
        exit 0
    fi
    print_colored BLUE "==>"
    print_colored WHITE " Installing "
    print_colored GREEN "GitHub CLI...\n"
    sudo yum install -y gh
}

# Function to install Git via DNF
install_gh_dnf() {
    print_colored GREEN "==>"
    print_colored WHITE " Detected Fedora.\n"

    #@info: Update the package repository 
    sudo dnf update

    #@info: Check if GitHub CLI is installed
    if command -v gh &> /dev/null
    then
        print_colored GREEN "==>"
        print_colored WHITE " GitHub CLI is already installed. Proceed to the next step.\n"
        exit 0
    fi
    print_colored BLUE "==>"
    print_colored WHITE " Installing "
    print_colored GREEN "GitHub CLI...\n"
    sudo dnf install -y gh
}


# Function to install Git on macOS
install_gh_brew() {
    print_colored GREEN "==>"
    print_colored WHITE " Detected MacOS.\n"

    #@info: Check if Homebrew is installed
    if ! command -v brew &> /dev/null
    then 
        print_colored YELLOW "Homebrew is not installed.\n"
        print_colored BLUE "==>"
        print_colored WHITE " Installing "
        print_colored GREEN "Homebrew...\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    #@info: Update Homebrew and installed formulas
    brew update
    brew upgrade

    #@info: Check if GitHub CLI is installed
    if command -v gh &> /dev/null
    then
        print_colored GREEN "==>"
        print_colored WHITE " GitHub CLI is already installed. Proceed to the next step.\n"
        exit 0
    fi
    
    print_colored BLUE "==>"
    print_colored WHITE " Installing "
    print_colored GREEN "GitHub CLI...\n"
    brew install gh
}

# Main function
check_connection
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt &> /dev/null
    then
        install_gh_apt
    elif command -v yum &> /dev/null
    then
        install_gh_yum
    elif command -v dnf &> /dev/null
    then
        install_gh_dnf
    else
        print_colored RED "==>"
        print_colored WHITE " Unsupported package manager. Please install Git manually.\n"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    install_gh_brew
else
        print_colored RED "==>"
        print_colored WHITE " Unsupported operating system. Please install Git manually.\n"
fi


#!/bin/bash

# Script to setup Discord webhook values in the current Git repository

# Define the config file name
config_filename=".discord_webhook_config"

# Check if we're in a Git repository
if git rev-parse --git-dir > /dev/null 2>&1; then
    config_file_path="$(git rev-parse --show-toplevel)/$config_filename"

    # Prompt for Discord Webhook ID
    read -p "Enter your Discord Webhook ID: " webhook_id

    # Prompt for Discord Webhook Token (input not shown)
    read -sp "Enter your Discord Webhook Token: " webhook_token
    echo # Move to a new line after input

    # Confirm before saving
    echo "You're about to save this information. Continue? (y/n)"
    read -n 1 -r
    echo # Move to a new line for output

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # Save the values to the config file
        echo "webhook_id=$webhook_id" > "$config_file_path"
        echo "webhook_token=$webhook_token" >> "$config_file_path"

        # Add the config file to .gitignore to ensure it's not tracked
        gitignore_path="$(git rev-parse --show-toplevel)/.gitignore"

        if ! grep -q "$config_filename" "$gitignore_path"; then
            echo "$config_filename" >> "$gitignore_path"
            echo "$config_filename has been added to .gitignore."
        fi

        echo "Webhook details saved to $config_filename."
    else
        echo "Setup canceled by user."
    fi
else
    echo "This directory is not a Git repository."
fi

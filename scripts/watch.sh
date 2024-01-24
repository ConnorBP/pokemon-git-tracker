#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if cargo is installed
if ! command -v cargo; then # check if cargo is in the path, if not, exit
        echo "cargo could not be found"
        exit 1
fi

CURRENT_PATH="$(pwd)"
FINAL_PATH="$CURRENT_PATH/lambdas/repodex/"

echo "Navigating to the lambda directory..."
cd "$FINAL_PATH"

echo "Watching lambda function..."
cargo lambda watch;

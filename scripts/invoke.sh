#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if cargo is installed
if ! command -v cargo; then # check if cargo is in the path, if not, exit
        echo "cargo could not be found"
        exit 1
fi

FUNCTION_NAME=${1:-repodex} # default to repodex
FUNCTION_PAYLOAD=${2:-'{ "name": "ben" }'} # default to '{ "name": "ben" }'

CURRENT_PATH="$(pwd)"
FINAL_PATH="$CURRENT_PATH/lambdas/repodex/"

echo "Navigating to the lambda directory..."
cd "$FINAL_PATH"

echo "Invoking lambda function..."
cargo lambda invoke "$FUNCTION_NAME" --data-ascii "$FUNCTION_PAYLOAD"

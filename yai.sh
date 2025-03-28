#!/bin/bash

# Determine home directory using multiple fallback methods
get_home_dir() {
    # Try $HOME first
    if [ -n "$HOME" ]; then
        echo "$HOME"
        return
    fi
    
    # Try getent if available
    if command -v getent >/dev/null 2>&1; then
        HOME=$(getent passwd "$(whoami)" | cut -d: -f6)
        if [ -n "$HOME" ]; then
            echo "$HOME"
            return
        fi
    fi
    
    # Fallback to ~ expansion
    echo ~
}

HOME_DIR=$(get_home_dir)
SCRIPT_DIR="$HOME_DIR/repos/projects/sh-scripts"
LOADER_PATH="$SCRIPT_DIR/shloader.sh"

# Verify and source the loader
if [ -f "$LOADER_PATH" ]; then
    source "$LOADER_PATH"
else
    echo "Error: Could not find shloader.sh"
    echo "Searched in: $LOADER_PATH"
    echo "Please ensure the file exists at the expected location"
    exit 1
fi

# Function to concatenate strings and evaluate the result
main() {
  # Input string
  input_string=$1
  
  # Other strings to concatenate
  raw_query="echo '$input_string' | fabric -p raw_query"

  # Evaluate the concatenated string and color the output in cyan
  eval "$raw_query" | while IFS= read -r line; do
    echo -e "\033[36m${line}\033[0m"
  done
}


# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_string>"
  exit 1
fi

# Call the function with the input string
shloader -l dots2 -m "Running raw query..." -e "Done!"

main "$1"

# end_shloader

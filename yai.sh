#!/bin/bash

# Load shloader
source /home/jvegar/repos/projects/sh-scripts/shloader.sh &>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Could not load shloader.sh"
    echo "Looking for: $HOME/repos/projects/sh-scripts/shloader.sh"
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

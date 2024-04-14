#!/bin/bash

# Path to the directory containing the folders
directory="/home/notroot/engagements/"

# Path to the foundsites.txt file
foundsites_file="$1"

# Check if the foundsites.txt file exists
if [ ! -f "$foundsites_file" ]; then
    echo "Error: $foundsites_file not found."
    exit 1
fi

# Iterate over each folder in the directory
for folder in "$directory"/*/; do
    folder_name=$(basename "$folder")
    # Check if the folder name exists in foundsites.txt
    if grep -q "^$folder_name$" "$foundsites_file"; then
        echo "Keeping folder: $folder_name"
    else
        echo "Removing folder: $folder_name"
        rm -rf "$folder"
    fi
done

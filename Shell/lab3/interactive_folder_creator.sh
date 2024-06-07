#!/bin/bash

# Function to interactively create two folders with user input
createFolder() {
    read -p "Enter folder 1 path: " folderONEPATH  # Prompt user for folder 1 path
    read -p "Enter folder 1 name: " folderONE  # Prompt user for folder 1 name
    read -p "Enter folder 2 path: " folderTWOPATH  # Prompt user for folder 2 path
    read -p "Enter folder 2 name: " folderTWO  # Prompt user for folder 2 name

    # Create the first folder
    mkdir -p "$folderONEPATH$folderONE"

    # Create the second folder
    mkdir -p "$folderTWOPATH$folderTWO"

    echo "Folders created successfully:"
    echo "$folderONEPATH$folderONE"
    echo "$folderTWOPATH$folderTWO"
}

# Call the function to interactively create folders
createFolder

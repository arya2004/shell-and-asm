#!/bin/bash

# Function to interactively rename a file
renameFile() {
    read -p "Enter file path: " filePATH  # Prompt user for the file path
    read -p "Enter old name: " OLD_NAME  # Prompt user for the old name of the file
    read -p "Enter new name: " NEW_NAME  # Prompt user for the new name of the file

    # Rename the file
    mv "$filePATH$OLD_NAME" "$filePATH$NEW_NAME"
    echo "File renamed successfully."
}

# Call the function to interactively rename a file
renameFile

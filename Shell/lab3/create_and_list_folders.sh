#!/bin/bash

# Function to create two folders and list the contents of the current directory
createAndListFolders() {
    mkdir -p "$1"  # Create the first folder using the first argument
    mkdir -p "$2"  # Create the second folder using the second argument
    echo "Created folders successfully."

    ls  # List the contents of the current directory
}

# Example usage of the function with command-line arguments
createAndListFolders "$1" "$2"

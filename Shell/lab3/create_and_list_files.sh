#!/bin/bash

# Function to create two files and list their details
createAndListFiles() {
    touch "$1"  # Create the first file using the first argument
    touch "$2"  # Create the second file using the second argument
    echo "Created files successfully."

    ls -l "$1"  # List details of the first file
    ls -l "$2"  # List details of the second file
}

# Example usage of the function with command-line arguments
createAndListFiles "$1" "$2"

#!/bin/bash

# Function to interactively create two files with user input
createFile() {
    read -p "Enter file 1 path: " fileONEPATH  # Prompt user for file 1 path
    read -p "Enter file 1 name: " fileONE  # Prompt user for file 1 name
    read -p "Enter file 2 path: " fileTWOPATH  # Prompt user for file 2 path
    read -p "Enter file 2 name: " fileTWO  # Prompt user for file 2 name

    # Create the first file
    touch "$fileONEPATH$fileONE"

    # Create the second file
    touch "$fileTWOPATH$fileTWO"

    echo "Files created successfully:"
    echo "$fileONEPATH$fileONE"
    echo "$fileTWOPATH$fileTWO"
}

# Call the function to interactively create files
createFile

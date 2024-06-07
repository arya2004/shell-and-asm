#!/bin/bash

# Function to create two folders at specified paths
createFolders() {
    local folderONEPATH="$1"  # Path for the first folder
    local folderONE="$2"  # Name of the first folder
    local folderTWOPATH="$3"  # Path for the second folder
    local folderTWO="$4"  # Name of the second folder

    # Create the first folder
    mkdir -p "$folderONEPATH$folderONE"

    # Create the second folder
    mkdir -p "$folderTWOPATH$folderTWO"
}

# Example usage of the function
createFolders "C:/Users/arya2/source/repos/LinuxCode/lab3/" "folder1" "C:/Users/arya2/source/repos/LinuxCode/lab3/" "folder2"

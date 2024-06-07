#!/bin/bash

# Function to create two files at specified paths
createFile() {
    local fileONEPATH="$1"  # Path for the first file
    local fileONE="$2"  # Name of the first file
    local fileTWOPATH="$3"  # Path for the second file
    local fileTWO="$4"  # Name of the second file

    # Create the first file
    touch "$fileONEPATH$fileONE"

    # Create the second file
    touch "$fileTWOPATH$fileTWO"
}

# Example usage of the function
createFile "C:/Users/arya2/source/repos/LinuxCode/lab3/" "testinf.js" "C:/Users/arya2/source/repos/LinuxCode/lab3/" "anotherfile.txt"

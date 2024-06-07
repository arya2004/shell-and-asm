#!/bin/bash

# Function to create multiple files with a loop
multipleFiles() {
    for i in 1 2 3; do  # Loop through values 1, 2, 3
        filename="f$i"  # Construct the file name
        touch "$filename"  # Create the file
        echo "Created $filename"  # Display a message indicating file creation
    done
}

# Call the function to create multiple files
multipleFiles

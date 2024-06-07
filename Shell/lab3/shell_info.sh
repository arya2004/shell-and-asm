#!/bin/bash

# Function to display shell and system information
shellDetails() {
    echo "My current shell is"  # Display message indicating current shell
    echo "$SHELL"  # Display the current shell being used
    echo "Shell Version: $(bash --version | head -n 1)"  # Display the version of the shell
    echo  # Add a blank line for spacing

    echo "$PATH"  # Display the PATH environment variable
    echo  # Add a blank line for spacing

    echo "$HOME"  # Display the user's home directory
    echo  # Add a blank line for spacing

    ps -p $$  # Display process information for the current shell
    echo  # Add a blank line for spacing

    echo "User: $(whoami)"  # Display the current user
}

# Call the function to display shell information
shellDetails

#!/bin/bash

# Function to list files in a directory
longlist() {
    local pathOfFile="$1"
    ls "$pathOfFile"  # List files in the specified directory
}

# Function to get the current date and time
getDate() {
    date  # Display the current date and time
}

# Function to clear the terminal and print a message
print() {
    local string="$1"
    clear  # Clear the terminal screen
    echo "$string"  # Print the specified message
}

# Example usage of the functions
longlist "C:/Users/arya2/desktop"  # List files in the specified directory
getDate  # Display the current date and time
sleep 2  # Pause execution for 2 seconds
print "hello world"  # Print the message "hello world"

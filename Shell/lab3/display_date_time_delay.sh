#!/bin/bash

# Function to display the current date and time with a delay
displayDelay() {
    date +"%d-%m-%y"  # Display the current date in dd-mm-yy format
    sleep 1  # Pause for 1 second
    date "+%T"  # Display the current time in HH:MM:SS format
}

# Call the function to display date and time with delay
displayDelay

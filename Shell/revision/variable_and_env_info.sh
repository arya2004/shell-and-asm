#!/bin/bash

# Define and display a variable
VARIA="thierteh"
echo "VARIA: $VARIA"

# Perform arithmetic operation and display the result
A=2
B=3
echo "A + B: $((A + B))"

# Display script name, first command-line argument, and current user
echo "Script name: $0"
echo "First argument: $1"
echo "Current user: $USER"

# Generate and display a random number
NUMBER=$RANDOM
echo "Random number: $NUMBER"

# Display script execution time, command-line arguments, exit status, process ID, line number, and number of arguments
echo "Script execution time (seconds): $SECONDS"
echo "Command-line arguments: $@"
echo "Exit status of last command: $?"
echo "Process ID: $$"
echo "Current line number: $LINENO"
echo "Number of command-line arguments: $#"

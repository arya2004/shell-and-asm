#!/bin/bash

# Script Name: basic_shell_commands.sh
# Description: Demonstrates basic shell commands and their usage

# Display the location of the Bash executable
which bash

# Find the location of the Firefox executable
whereis firefox

# Print the path of the home directory
echo $HOME

# Print the current working directory
pwd

# Change to the previous directory (using 'cd -')
cd -

# Change to the root directory
cd /

# Change to the home directory
cd $HOME

# List all files and directories (including hidden ones)
ls -a

# List files and directories in long format
ls -l

# List all files and directories in long format, including hidden ones
ls -a -l

# View the file tree structure starting from the current directory
tree 

# Display the directory stack
dirs

#!/bin/bash

# Define a function 'moew' that takes one argument
function moew()
{
    echo "moew! $1"
}

# Define a function 'yett' that calls a non-existing function 'ret'
function yett()
{
    ret
}

# Uncomment to call the 'moew' function
# moew qww

# Uncomment to create a directory 'Dir' and then remove it
# mkdir -p Dir
# rmdir Dir

# Check if directory 'Dir' exists
a=Dir
if [ -d "$a" ]
then 
    echo "Directory exists"
else    
    echo "Directory does not exist"
fi

# Create a file 'fil' and check if it exists
touch fil
b=fil
if [[ -f "$a" ]]
then 
    echo "File 'fil' exists"
else    
    echo "File 'fil' does not exist"
fi

#!/bin/bash

# Function to find the largest number among three input numbers
biggestNumber() {
    local num1="$1"  # First input number
    local num2="$2"  # Second input number
    local num3="$3"  # Third input number

    # Compare the input numbers to find the largest
    if [ $num1 -gt $num2 ] && [ $num1 -gt $num3 ]; then
        largest=$num1
    elif [ $num2 -gt $num1 ] && [ $num2 -gt $num3 ]; then
        largest=$num2
    else
        largest=$num3
    fi

    echo "The largest number is: $largest"
}

# Call the function to find the largest number among 2, 4, and 6
biggestNumber 2 4 6

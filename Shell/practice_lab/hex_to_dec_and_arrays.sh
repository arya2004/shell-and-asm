#!/bin/bash

# Arithmetic operations using $((...)) and expr command
a=34
b=4
echo $(( a + b ))   # Addition
echo $(( a - b ))   # Subtraction
echo $(( a * b ))   # Multiplication
echo $(( a / b ))   # Division
echo $(( a % b ))   # Modulus

echo $(expr $a + $b)    # Using 'expr' for addition
echo $(expr $a \* $b)   # Using 'expr' for multiplication (escaping '*')

# Convert hexadecimal to decimal
echo "Enter hexadecimal number:"
read hex
echo "obase=10; ibase=16; $hex" | bc   # Using 'bc' to perform conversion

# Array demonstration
car=('bmw' 'toyota' 'honda')    # Define an array 'car' with elements
echo "${car[0]}"               # Print the first element of the array

# Print all indexes of the array elements
echo "${!car[@]}"

# Print the total count of elements in the array
echo "${#car[@]}"

# Modify array element and print all elements
unset car[2]                    # Unset element at index 2
car[2]='tataa'                  # Set new value at index 2
echo "${car[@]}"               # Print all elements of the array

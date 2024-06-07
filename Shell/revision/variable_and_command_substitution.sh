#!/bin/bash

# Define a variable and use single quotes to print it (variable won't be expanded)
VAR="lol"
echo 'hello, $VAR'  # Prints: hello, $VAR

# Use double quotes to print the variable (variable will be expanded)
echo "hello, $VAR"  # Prints: hello, lol

# Use double quotes and escape the variable to print it as a string literal
echo "hello, $VAR \$VAR"  # Prints: hello, lol $VAR

# Use backticks or $() to perform command substitution and store the output in a variable
TIM=$(uptime)
echo "System uptime: $TIM"

LEL=$(who)
echo "Logged in users: $LEL"

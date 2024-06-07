#!/bin/bash

# Function to count occurrences of a substring in a string
count_substring_occurrences() {
  local input_string="$1"
  local substring="$2"
  local input_length=${#input_string}
  local substring_length=${#substring}
  local count=0

  # Check if substring length is greater than input string length
  if [ $substring_length -gt $input_length ]; then
    echo "Substring length is greater than input string length"
    return 1
  fi

  # Loop through each character in the input string
  for (( i=0; i<input_length; i++ )); do
    local found=true

    # Inner loop to compare characters for substring match
    for (( j=0; j<substring_length; j++ )); do
      if [ "${input_string:i+j:1}" != "${substring:j:1}" ]; then
        found=false
        break
      fi
    done

    # If substring is found, increment count
    if $found; then
      count=$((count+1))
    fi
  done

  echo "Number of occurrences of '$substring' in the input string: $count"
}

# Test case
input="hairnrairh hh hair"
substring="air"
count_substring_occurrences "$input" "$substring"

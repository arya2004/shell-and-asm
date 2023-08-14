#!/bin/bash


count_substring_occurrences() {
  local input_string="$1"
  local substring="$2"
  local input_length=${#input_string}
  local substring_length=${#substring}
  local count=0

  if [ $substring_length -gt $input_length ]; then
    echo "len of suubstring is more than mainstinrg"
    return 1
  fi

  for (( i=0; i<input_length; i++ )); do
    local found=true

    
    for (( j=0; j<substring_length; j++ )); do
      if [ "${input_string:i+j:1}" != "${substring:j:1}" ]; then
        found=false
        break
      fi
    done

   
    if $found; then
      count=$((count+1))
    fi
  done

  echo "Number of occurrences of '$substring' in the input string: $count"
}

input="hairnrairh hh hair"
substring="air"
count_substring_occurrences "$input" "$substring"
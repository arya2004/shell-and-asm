#!/bin/bash

# Function to count words in a given string
countwordscli()
{
    MAIN_STRING=$1
    WORD_COUNT=0

    # Loop through each word in the string
    for var in $MAIN_STRING
    do 
        WORD_COUNT=$((WORD_COUNT+1))
    done

    echo $WORD_COUNT
}

# Function to count occurrences of a specific word in a string
countspecific()
{
    MAIN_STRING="hello the every one, the  i am  the atyr pathal"
    WORD="the"
    WORD_COUNT=0

    # Loop through each word in the string
    for var in $MAIN_STRING
    do 
        # Check if the current word matches the specified word
        case $WORD in
        $var) WORD_COUNT=$((WORD_COUNT+1));;
        esac
    done
    echo $WORD_COUNT
}

# Function to count occurrences of a specific word in a file
countspecific2()
{
    FILE_NAME="app.txt"  # Assuming the file name is "app.txt"
    WORD="the"
    WORD_COUNT=0

    # Read each word from the file
    while IFS= read -r word
    do 
        # Check if the current word matches the specified word
        if [ "$word" == "$WORD" ]; then
            WORD_COUNT=$((WORD_COUNT+1))
        fi
    done < "$FILE_NAME"

    echo $WORD_COUNT
}

# Call the function to count occurrences of "the" in "app.txt"
countspecific2

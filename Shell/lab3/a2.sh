#!/bin/bash


shellDetails()
{   
    echo "My current shell is "
    echo "$SHELL"
    echo "Shell Version: $(bash --version | head -n 1)"
    echo
    echo
    echo "$PATH"
    echo
    echo
    echo "$HOME"
    echo
    echo
    ps -p $$
    echo
    echo
    echo "User: $(whoami)"
}


shellDetails
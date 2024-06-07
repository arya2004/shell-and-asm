#!/bin/bash

# This script demonstrates various shell commands and their usage

# Word count of file "01.sh"
wc 01.sh

# Print the contents of file "01.sh"
cat 01.sh

# Print the contents of file "note.txt" with line numbers
cat -n note.txt

# Display contents of "note.txt" with scrolling (press Enter for next page)
less note.txt

# Display contents of "note.txt" with line numbers and scrolling
less -N note.txt

# Display the top lines of "note.txt"
head note.txt

# Display the first 20 lines of "note.txt"
head -20 note.txt

# Display the bottom lines of "note.txt"
tail note.txt

# Display the last 20 lines of "note.txt"
tail -20 note.txt

# Display the content of "02.sh" in reverse order
tac 02.sh

# Change the modification time of "filename.txt" to a specific date and time
touch -t 201804301015 filename.txt

# Rename file "kek" to "kek-new"
mv kek kek-new

# List files with "kek" in their name
ls -l *kek*

# Create a directory "dir2" and two files inside it
mkdir dir2
touch dir2/f1
touch dir2/f2

# List all directories starting with "dir" and their contents recursively
ls -lR dir*

# Redirect the output of "man touch" to a file "kek-nia.txt"
man touch > kek-nia.txt

# Redirect all output (including errors) of "man touch" to "kek-nia" file
man touch > kek-nia 2>&1

# Find files with "note" in their name using 'locate' and 'find'
locate note
find . -name "note" -ls

# Display disk usage of files starting with 'a' and other patterns
du -sh a*
du -sh a[p-z]*
du *.?.*

# Find files larger than 10MB in "lin*" directories
find lin* -size +10M -exec ls -shF {} ';'

# Find directories and files in the current directory with various options
find . -type d -maxdepth 1
find . -type f -ls
find . -size 0

# Display specific sections from "man" pages
man touch | head -6
man -f sysctl
man -k sysctl

# Execute previous command again using '!!'
!!

# Change file ownership, group ownership, and permissions
chown
chgrp
chmod

# Examples of using 'chmod' command
chmod uo+x,g-w somefile
chmod 755 somefile

# File operations using 'cat' and 'tac'
cat redme.MD
cat f1 f2
cat f1 f2 > newfile
cat f1 f2 >> newfile
cat > file
cat >> file

tac

# Create multiple files using brace expansion
touch a{v..z}.c

# Display top and bottom lines of a file, and follow changes in a file
head -n 5 /etc/default/grub
tail -n 5 /etc/default/grub
tail -f file

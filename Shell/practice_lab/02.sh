#!/bin/bash

#prints wordcount
wc 01.sh

#print file
cat 01.sh
#print line no too
cat -n note.txt

#one at a tine, enter to go nxts
less note.txt
less -N note.txt #line nos

#top lines
head note.txt
#20-lines
head -20 note.txt

#botton lines
tail note.txt
tail -20 note.txt

#ulti file
tac 02.sh

#touch
touch -t 201804301015 filename.txt #sets file date to specific value

#remove dir with all content
#rm -rf
#rm -i : interactive remove
#rename file
mv kek kek-new
ls -l *kek*

mkdir dir2
touch dir2/f1
touch dir2/f2

ls -lR dir*  #display all directories


#io redirect
man touch > kek-nia.txt
man touch > kek-nia 2>&1 #redirects everythign
man touch >$ kek-nia #same aas above

#find
locate note # prints all files with 'note' in name
find . -name "note" -ls  #find in current dir with name note and ls
#find's db updates quickly, better latest


#disk usage of files starting with a
du -sh a*
du -sh a[p-z]* #prints ap* to az*
du *.?.* #auth.log.2.gz
#wildcard

find lin* -size +10M -exec ls -shF {} ';' #find file bgier than 10m

find . -type d -maxdepth 1
find . -type f -ls #files in current dir in detail
find . -size 0 #all files with size 0


#man
man touch | head -6 #displays 6 line
man -f sysctl #all pages
man -k sysctl #all pages without header

man 7 socket #ch7 of socket
man -k socket | head -2 #prints 2 of top

!! #exec prev cmd

chown
chgrp
chmod

chmod uo+x,g-w somefile #give owenr and other xec, removev grp write perm
chmod 755 somefile #rwxr-xr-x


#File opr
cat redme.MD
cat f1 f2  #shw f1 then f2
cat f1 f2 > newfile #save above ip to newfile
cat f1 f2 >> newfile #append above ip to newfile
cat > file #subsequent lines until ctrl+D goes in file
cat >> file #subsequent lines until ctrl+D append in file

tac #prints in reverse order of lines. same as above
touch a{v..z}.c #creates av, aw, ax,az


head -n 5 /etc/default/grub #print top 5
tail -n 5 /etc/default/grub #print bottom 5
tail -f file #displays last line and update after file update


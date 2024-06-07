# Unix Commands Cheat Sheet

## Bootloader
- **Definition**: Program that boots OS.

## Desktop Environments
- **Types**: GNOME, KDE, XFCE.

## File Operations
- `cat`: Type or combine files.
- `head`: Show few lines of files.
- `tail`: Show last few lines of file.
- `man`: View documentation.
- `|`: Pipe - used to pass output of one command as input to another.

## Command Structure
- Format: `cmd -options args`.

## Application Locations
- Applications can be found in `/bin`, `/opt`, or `/sbin`.

## File Paths
- **Absolute Path**: Starts with `/`.
- **Relative Path**:
  - `./`: Current directory.
  - `../`: Parent directory.
  - `~`: Home directory.
- Examples: `///usr//bin` is equivalent to `/usr/bin`.

## Hard Links
- Creating: `ln existfile linkfile`.
- Checking inode numbers: `ls -li file1 file2`.

## Soft Links
- Creating symbolic link: `ln -s existfile linkname`.
- Can point to files/objects in other directories or non-existing objects.
- Dangling link: Points to non-existing objects.

## Prompt Customization
- Use `PS1` to change username in the prompt.

## File Streams
- Three streams available when a command is executed: stdin, stdout, stderr.
- I/O Redirection:
  - `>`: Redirects stdout to a file.
  - `<`: Redirects a file to stdin.
  - `2>`: Redirects stderr to a file.

## Pipes
- `|`: Pipe output of one command to input of another.
- Avoids the need to store intermediate results in temporary files.

## Searching and Filtering
- `locate`: Searches a pre-built database for files matching a pattern.
- `grep`: Prints lines matching a specified pattern.

## Wildcards
- `?`: Matches a single character.
- `*`: Matches any string of characters.
- `[set]`: Matches any character in the set.
- `[!set]`: Matches any character not in the set.

## File Manipulation
- `cp`: Copy files.
- `rsync`: Efficiently synchronize files between systems.

## History
- `history`: View command history.

## File Permissions
- Permissions: Read (r), Write (w), Execute (x).
- Permission structure: User/Group/Other (e.g., `drwxrwxrwx`).

## Text Processing
- `sed`: Stream editor for text manipulation.
- `awk`: Powerful tool for data manipulation.
- `sort`: Sorts lines in a file.
- `uniq`: Removes duplicate consecutive lines.

## Regular Expressions (Regex)
- Patterns for searching and matching text.
- Used in commands like `sed` and `grep`.

## Additional Tools
- `diff`: Compares text files.
- `cmp`: Compares binary files.
- `file`: Determines file type.

## Miscellaneous
- `paste`: Combines lines from multiple files.
- `join`: Joins lines based on a common field.
- `split`: Splits a file into smaller parts.
- `tr`: Translates or deletes characters.
- `tee`: Displays output and saves it to a file.

---

**Note:** For detailed information about commands, refer to their respective manual pages (e.g., `man touch`, `help cd`).

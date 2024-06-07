# NASM Assembly Code Notes

## Command to Compile and Run NASM Code
```bash
nasm -felf64 hello.asm && ld hello.o && ./a.out
```

## Assembly Language Basics
- `dd`: Represents 32-bit data.
- `dw`: Represents 16-bit data.
- `db`: Represents 8-bit data.
- `dq`: Represents 64-bit data.

## Registers and Macros
- `rdi`: Represents the file handle number.
- `%1` in a macro denotes the first parameter.

## Memory Segments
- Data Section: Resides in external memory.
- Code Segment: Also resides in external memory.

## Function Assignment
### Steps:
1. Shift the number right to get the least significant bit (LSB).
2. If the data is less than or equal to 9, add `30h`; otherwise, add `37h`.
3. Call the display function.
4. Bitwise AND the number with `0fh`.
5. If the data is less than or equal to 9, add `30h`; otherwise, add `37h`.
6. Call the display function again.

## Code Optimization Techniques
- Use macros to avoid repetitive coding:
  - Use a macro to display a single number.
  - Use a function to display two numbers.


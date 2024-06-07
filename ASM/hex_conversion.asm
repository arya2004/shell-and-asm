; File name: hex_conversion.asm

%macro println 2
    mov rax, 1        ; sys_write system call
    mov rdi, 1        ; File descriptor 1 (stdout)
    mov rsi, %1       ; Address of the message to print
    mov rdx, %2       ; Length of the message
    syscall
%endmacro

section .data
    msg1 db 10, 'Enter key :'
    len1 equ $ - msg1

    msg2 db 10, 'Eq Hex :'
    len2 equ $ - msg2

section .bss
    accept resb 2    ; Buffer to accept input
    display resb 2   ; Buffer to display hex result

section .text
    global _start

_start:
    ; Print "Enter key :" message
    println msg1, len1

    ; Accept input from user
    mov rax, 0        ; sys_read system call
    mov rdi, 0        ; File descriptor 0 (stdin)
    mov rsi, accept   ; Buffer to store input
    mov rdx, 2        ; Number of bytes to read
    syscall

    ; Print "Eq Hex :" message
    println msg2, len2

    ; Convert the input to hexadecimal and print
    mov al, [accept]  ; Get the input byte
    and al, 0F0h      ; Mask the upper 4 bits
    shr al, 4         ; Shift right to get the hexadecimal value
    add al, 30h       ; Convert to ASCII
    mov [display], al ; Store the first hexadecimal digit

    mov al, [accept]  ; Get the input byte again
    and al, 0Fh       ; Mask the lower 4 bits
    add al, 30h       ; Convert to ASCII
    cmp al, 39h       ; Check if it's above '9' (ASCII)
    jle dontAdd       ; Jump if below or equal to '9'

    add al, 07h       ; Add 7 to convert to 'A'-'F'

dontAdd:
    mov [display + 1], al  ; Store the second hexadecimal digit

    ; Print the hexadecimal result
    println display, 02h

    ; Exit the program
    mov rax, 60       ; sys_exit system call
    xor rdi, rdi      ; Exit status 0
    syscall

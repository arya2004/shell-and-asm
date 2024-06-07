; Filename: hello_world.asm

global _start

section .text
_start:
    ; Write "Hello, World" to stdout
    mov rax, 1            ; System call for write
    mov rdi, 1            ; File handle 1 is stdout
    mov rsi, message      ; Address of the string to output
    mov rdx, 13           ; Number of bytes to write (including newline)
    syscall               ; Invoke operating system to write the message

    ; Exit the program
    mov rax, 60           ; System call for exit
    xor rdi, rdi          ; Exit code 0
    syscall               ; Invoke operating system to exit

section .data
message: db "Hello, World", 10  ; String to be printed (with newline)

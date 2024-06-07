; File name: print_success.asm

%macro println 2
    mov rax, 1     ; sys_write system call
    mov rdi, 1     ; File descriptor 1 (stdout)
    mov rsi, %1    ; Address of the message to print
    mov rdx, %2    ; Length of the message
    syscall
%endmacro

section .data
    msg db 'Success'       ; Define a message to print
    len equ $ - msg        ; Calculate the length of the message

    msg1 db 10, 'Is Always'    ; Define another message with newline
    len1 equ $ - msg1           ; Calculate the length of the second message

section .bss
    ; Define any uninitialized data variables here

section .text
    global _start

_start:
    ; Print the first message using the println macro
    println msg, len

    ; Call the print subroutine to print the second message
    mov rsi, msg1    ; Address of the second message
    mov rdx, len1    ; Length of the second message
    call print

    ; Exit the program
    mov rax, 60      ; sys_exit system call
    xor rdi, rdi     ; Exit status 0
    syscall

print:
    ; Print the message using sys_write system call
    mov rax, 1       ; sys_write system call
    mov rdi, 1       ; File descriptor 1 (stdout)
    syscall

    ret               ; Return from the subroutine

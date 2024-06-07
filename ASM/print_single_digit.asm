; File Name: print_single_digit.asm
; Description: This program converts a single-digit number to its ASCII representation and prints it.

section .data
    num db 06h  ; single-digit number
    num_len equ $-num  ; length of num

global _start
section .text
_start:
    ; Convert the single-digit number to ASCII representation
    mov bl, [num]    ; Load the single-digit number into bl
    add bl, 30h      ; Convert the number to ASCII character

    mov [num], bl   ; Store the ASCII character back into num

    ; Print the ASCII character
    mov rax, 1       ; syscall number for sys_write
    mov rdi, 1       ; file descriptor for stdout
    mov rsi, num     ; address of the ASCII character to print
    mov rdx, num_len ; length of the ASCII character
    syscall          ; invoke syscall to print the character

    ; Terminate the program
    mov rax, 60      ; syscall number for sys_exit
    mov rdi, 0       ; exit status 0
    syscall          ; terminate the program

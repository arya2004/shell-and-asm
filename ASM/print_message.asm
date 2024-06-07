; File Name: print_message.asm
; Description: This program prints a message stored in an external data segment.

section .data
    msg db "Enter no"  ; Message stored in an external data segment memory
    msg_len equ $-msg  ; Length of the message

%macro prnt 2
    mov rax, 1       ; Syscall number for write operation
    mov rdi, 1       ; File handle number for stdout device
    mov rsi, %1      ; Loading offset address
    mov rdx, %2      ; Length of the message
    syscall          ; Invoke syscall to print the message
%endmacro

global _start
section .text
_start:
    prnt msg, msg_len  ; Print the message
    syscall            ; Perform another syscall (redundant)
    mov rax, 60        ; Syscall number for sys_exit
    mov rdi, 0         ; Exit status 0
    syscall            ; Terminate the program

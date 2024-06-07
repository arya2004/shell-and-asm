; File name: print_data.asm

%macro println 2
    mov rax, 1        ; sys_write system call
    mov rdi, 1        ; File descriptor 1 (stdout)
    mov rsi, %1       ; Address of the message to print
    mov rdx, %2       ; Length of the message
    syscall
%endmacro

section .data
    src dq 0031h     ; Define a quadword (64-bit) integer
    srclen equ $ - src   ; Calculate the length of 'src'

    msg0 db 10, 'uyewfvrwuyevf'   ; Define a message
    len0 equ $ - msg0             ; Calculate the length of the message

section .text
    global _start

_start:
    ; Print the quadword integer 'src'
    println src, 8  ; 8 bytes for a quadword

    ; Print the message 'msg0'
    println msg0, len0

    ; Terminate the program
    mov rax, 60     ; sys_exit system call
    xor rdi, rdi    ; Exit status 0
    syscall

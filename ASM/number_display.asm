; File name: number_display.asm

section .data
    msg1 db "Enter no: "
    msg1_len equ $ - msg1

    num dq 00h
    num_len equ $ - num

    num1 dq 2Ah
    num1_len equ $ - num1

%macro print 2
    mov rax, 1     ; sys_write system call
    mov rdi, 1     ; File descriptor 1 (stdout)
    mov rsi, %1    ; Address of the message to print
    mov rdx, %2    ; Length of the message
    syscall
%endmacro

global _start
section .text
_start:
    print msg1, msg1_len  ; Print the "Enter no: " message
    call display          ; Call the display subroutine

    mov rax, 60  ; Terminate the program
    xor rdi, rdi
    syscall

display:
    ; Extract the upper 4 bits of num1 and convert to ASCII
    mov bl, [num1]
    shr bl, 04h
    cmp bl, 09h
    jbe skip_add
    add bl, 07h
skip_add:
    add bl, 30h
    mov [num], bl

    ; Print the ASCII character for the upper 4 bits
    mov rax, 1
    mov rdi, 1
    mov rsi, num
    mov rdx, num_len
    syscall

    ; Extract the lower 4 bits of num1 and convert to ASCII
    mov rbx, [num1]
    and rbx, 0fh
    cmp bl, 09h
    jbe skip_add2
    add bl, 07h
skip_add2:
    add bl, 30h
    mov [num], bl

    ; Print the ASCII character for the lower 4 bits
    mov rax, 1
    mov rdi, 1
    mov rsi, num
    mov rdx, num_len
    syscall
    ret

; File name: increment_and_print.asm

section .data
    num db 01                ; Define a byte variable 'num' with initial value 01
    num_len equ $ - num      ; Calculate the length of 'num'

section .text
    global _start

_start:
    ; Increment the value of 'num' by adding 65 (ASCII value for 'A')
    mov bl, [num]
    add bl, 65
    mov [num], bl

    ; Print the incremented value of 'num'
    mov rax, 1               ; sys_write system call
    mov rdi, 1               ; File descriptor 1 (stdout)
    mov rsi, num             ; Address of 'num' to print
    mov rdx, num_len         ; Length of 'num'
    syscall

    ; Terminate the program
    mov rax, 60              ; sys_exit system call
    xor rdi, rdi             ; Exit status 0
    syscall

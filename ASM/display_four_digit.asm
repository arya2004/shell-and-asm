; Filename: display_four_digit.asm
section .data
    msg1 db "Enter no: ";;, 0Ah
    msg1_len equ $-msg1
    temp dq 00h
    num dq 00h
    num_len equ $-num
    num1 dq 00h
    num1_len equ $-num1
    numfour dw 0FEA4h
    numfour_len equ $-numfour

%macro print 2
    mov rax, 1
    mov rdi, 1 
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

global _start
section .text

_start: 
    print msg1, msg1_len
    mov rbx, [numfour]
    mov [num1], bh
    push rbx
    call display
    pop rbx
    mov [num1], bl
    call display

    mov rax, 60 ;; termination function
    mov rdi, 0  ;;
    syscall

display:
    mov bl, [num1]
    shr bl, 04h
    cmp bl, 09h
    jbe l1
        add bl, 07h
    l1: add bl, 30h
    mov [num], bl

    mov rax, 1
    mov rdi, 1
    mov rsi, num ;; pass num address
    mov rdx, num_len
    syscall

    mov rbx, [num1]
    and rbx, 0fh ;; even though rbx is 64-bit
    cmp bl, 09h
    jbe l2
        add bl, 07h
    l2: add bl, 30h
    mov [num], bl

    mov rax, 1
    mov rdi, 1
    mov rsi, num ;; pass num address
    mov rdx, num_len
    syscall
    ret

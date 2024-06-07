%macro println 2
    ; Macro to print a string using the syscall
    ; %1 - address of the string
    ; %2 - length of the string
    mov rax, 01h         ; syscall number for sys_write
    mov rdi, 01h         ; file descriptor 1 (stdout)
    mov rsi, %1          ; address of the string
    mov rdx, %2          ; length of the string
    syscall              ; invoke the syscall
%endmacro

section .data
    ; Define data section containing the strings to be printed
    msg1 db 10, 'Enter 4 digit Hex ::'
    len1 equ $ - msg1

    intromsg db 10, 'Name : Arya Pathak'
             db 10, 'Roll no. 57'
             db 10, 'PRN: 12210060'
    introlen equ $ - intromsg

    msg2 db 10, 'Eq BCd :: '
    len2 equ $ - msg2

section .bss
    ; Define uninitialized data section for variables
    quo resb 1   ; Quotient
    accept resb 2   ; Input buffer
    hex resb 2   ; Hexadecimal input
    remd resb 2  ; Remainder

section .text
global _start

_start:
    println intromsg, introlen
    println msg1, len1
    call acceptNo
    mov [hex+1], bl  ; Store the first digit of the hexadecimal number
    call acceptNo
    mov [hex], bl    ; Store the second digit of the hexadecimal number

    println msg2, len2

    ; Perform BCD conversion
    mov dx, 0000h
    mov ax, [hex]
    mov bx, 2710h
    div bx
    mov [remd], dx
    add al, 30h
    mov [quo], al
    println quo, 01h

    mov dx, 0000h
    mov ax, [remd]
    mov bx, 03e8h
    div bx
    mov [remd], dx
    add al, 30h
    mov [quo], al
    println quo, 01h

    mov dx, 0000h
    mov ax, [remd]
    mov bx, 0064h
    div bx
    mov [remd], dx
    add al, 30h
    mov [quo], al
    println quo, 01h

    mov dx, 0000h
    mov ax, [remd]
    mov bx, 000Ah
    div bx
    mov [remd], dx
    add al, 30h
    mov [quo], al
    println quo, 01h

    mov ax, [remd]
    add al, 30h
    mov [quo], al
    println quo, 01h

    mov rax, 60
    syscall

acceptNo:
    ; Function to accept input
    mov rax, 00h
    mov rdi, 00h
    mov rsi, accept
    mov rdx, 02h
    syscall
    mov al, [accept]
    sub al, 30h
    cmp al, 09h
    jle dontSub
    sub al, 07h
dontSub:
    mov cl, 04h
    shl al, cl
    mov bl, al
    mov al, [accept+1]
    sub al, 30h
    cmp al, 09h
    jle dontSubb
    sub al, 07h
dontSubb:
    or bl, al
    ret

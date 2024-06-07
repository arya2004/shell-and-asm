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
    intromsg db 10, 'Name : Arya Pathak'
             db 10, 'Roll no. 57'
             db 10, 'PRN: 12210060'
    introlen equ $ - intromsg

    msg0 db 10, 'How Many Ele :: '
    len0 equ $ - msg0

    msg1 db 10, 'Enter 5 array Elements :'
    len1 equ $ - msg1

    msg2 db 10, 'Before Transfer :'
    len2 equ $ - msg2

    msg3 db 10, 'SRC is ::'
    len3 equ $ - msg3

    msg4 db 10, 'Dest is::'
    len4 equ $ - msg4

    msg5 db 10, 'After Transfer :'
    len5 equ $ - msg5

    space db ' '

section .bss
    ; Define uninitialized data section for input and output
    src resb 25
    dest resb 25
    cnt resb 1
    display resb 2
    accept resb 3

section .text
global _start

_start:
    ; Start of the program
    println intromsg, introlen
    println msg0, len0
    call acceptNo
    mov [cnt], bl
    println msg1, len1

    ; Accept array elements
    mov cl, [cnt]
    mov rsi, src
movNext:
    push rcx
    push rsi
    call acceptNo
    pop rsi
    pop rcx
    mov [rsi], bl
    inc rsi
    dec cl
    jnz movNext

    println msg2, len2
    println msg3, len3

    ; Display SRC array contents
    mov cl, [cnt]
    mov rsi, src
dispNext:
    mov bl, [rsi]
    push rcx
    push rsi
    call displayNo
    println space, 02h
    pop rsi
    pop rcx
    inc rsi
    dec cl
    jnz dispNext

    println msg4, len4

    ; Display Dest array contents
    mov cl, [cnt]
    mov rsi, dest
dispNext1:
    mov bl, [rsi]
    push rcx
    push rsi
    call displayNo
    println space, 02h
    pop rsi
    pop rcx
    inc rsi
    dec cl
    jnz dispNext1

    ; Transfer contents from SRC to Dest
    mov cl, [cnt]
    mov rsi, src
    mov rdi, dest
next:
    mov al, [rsi]
    mov [rdi], al
    inc rsi
    inc rdi
    dec cl
    jnz next

    println msg5, len5
    println msg3, len3

    ; Display SRC array contents after transfer
    mov cl, [cnt]
    mov rsi, src
dispNext2:
    mov bl, [rsi]
    push rcx
    push rsi
    call displayNo
    println space, 02h
    pop rsi
    pop rcx
    inc rsi
    dec cl
    jnz dispNext2

    println msg4, len4

    ; Display Dest array contents after transfer
    mov cl, [cnt]
    mov rsi, dest
dispNext3:
    mov bl, [rsi]
    push rcx
    push rsi
    call displayNo
    println space, 02h
    pop rsi
    pop rcx
    inc rsi
    dec cl
    jnz dispNext3

    ; Exit the program
    mov rax, 60
    syscall

acceptNo:
    ; Function to accept input
    mov rax, 00h
    mov rdi, 00h
    mov rsi, accept
    mov rdx, 03h
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

displayNo:
    ; Function to display a byte in hexadecimal format
    mov al, bl
    and al, 0f0h
    mov cl, 04h
    shr al, cl
    add al, 30h
    cmp al, 39h
    jle dontAdd
    add al, 07h
dontAdd:
    mov [display], al
    mov al, bl
    and al, 0fh
    add al, 30h
    cmp al, 39h
    jle dontAddd
    add al, 07h
dontAddd:
    mov [display+1], al
    println display, 02h
    ret

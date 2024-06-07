; Filename: math_operations.asm
; Description: This program presents a menu for performing mathematical operations based on user input.

%macro println 2
    mov rax, 01h         ; Syscall number for sys_write
    mov rdi, 01h         ; File descriptor for stdout
    mov rsi, %1          ; Address of the string
    mov rdx, %2          ; Length of the string
    syscall              ; Invoke syscall to print the string
%endmacro

section .data
    ; Define data section containing the strings to be printed
    intromsg db 10, 'Name : Arya Pathak'
             db 10, 'Roll no. 57'
             db 10, 'PRN: 12210060'

    menumsg db 10, 'Menu'
             db 10, '1. Add & Shift'
             db 10, '2. Successive Add'
             db 10, '3. Exit'
             db 10, 10, 'Enter Choice'
    lenmenu equ $ - menumsg
    introlen equ $ - intromsg

    msg1 db 10, 'Enter Muld :'
    len1 equ $ - msg1

    msg2 db 10, 'Enter Mulr :'
    len2 equ $ - msg2

    msg3 db 10, 'Product is :'
    len3 equ $ - msg3

section .bss
    ; Define uninitialized data section for input and output
    choice resb 2
    muld resb 1
    mulr resb 1
    result resb 2
    display resb 2
    accept resb 3

section .text
global _start

_start:
menuDisp:
    println intromsg, introlen
    println menumsg, lenmenu

    ; Accept user choice
    mov rax, 00h
    mov rdi, 00h
    mov rsi, choice
    mov rdx, 02h
    syscall

    cmp byte[choice], '1'
    je addShift
    cmp byte[choice], '2'
    je successive
    cmp byte[choice], '3'
    je exit
    jmp menuDisp

exit:
    ; Exit the program
    mov rax, 60
    syscall

addShift:
    ; Perform Add & Shift operation
    println msg1, len1
    call acceptNo
    mov [muld], bl

    println msg2, len2
    call acceptNo
    mov [mulr], bl

    mov dx, 0000h
    mov bh, 00h
    mov bl, [muld]
    mov cl, 08h
chkNext:
    shr al, 01h
    jnc onlyShift
    add dx, bx
onlyShift:
    shl bx, 01h
    dec cl
    jnz chkNext

    mov [result], dx
    println msg3, len3
    mov bl, [result+1]
    call displayNo
    mov bl, [result]
    call displayNo
    ret

successive:
    ; Perform Successive Add operation
    println msg1, len1
    call acceptNo
    mov [muld], bl

    println msg2, len2
    call acceptNo
    mov [mulr], bl

    mov cl, [mulr]
    mov dx, 0000h
    mov bh, 00h
    mov bl, [muld]
again:
    add dx, bx
    dec cl
    jnz again

    mov [result], dx
    println msg3, len3
    mov bl, [result+1]
    call displayNo
    mov bl, [result]
    call displayNo
    ret

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
    mov [display+1],
    mov [display+1], al
    println display, 02h
    ret

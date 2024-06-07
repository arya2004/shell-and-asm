; Filename: arithmetic_menu.asm

%macro println 2
	mov rax, 01h
	mov rdi, 01h
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

section .data
    ; Messages for the menu
    menumsg db 10, 'Menu'
            db 10, '1. Add & Shift'
            db 10, '2. Successive Add'
            db 10, '3. Exit'
            db 10, 10, 'Enter Choice'
    lenmenu equ $ - menumsg

    ; Messages for input and output
    msg1 db 10, 'Enter Muld: '
    len1 equ $ - msg1
    msg2 db 10, 'Enter Mulr: '
    len2 equ $ - msg2
    msg3 db 10, 'Product is: '
    len3 equ $ - msg3

section .bss
    ; Variables for user input and calculations
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
    ; Display the menu
    println menumsg, lenmenu

    ; Accept user choice
    mov rax, 00h
    mov rdi, 00h
    mov rsi, choice
    mov rdx, 02h
    syscall

    ; Check user choice
    cmp byte [choice], 31h
    je addShift
    cmp byte [choice], 32h
    je successive
    cmp byte [choice], 33h
    je exit
    jmp menuDisp

addShift:
    ; Add and shift operation
    println msg1, len1
    call acceptNo
    mov [muld], bl

    println msg2, len2
    call acceptNo
    mov [mulr], bl

    ; Perform add and shift operation
    ; (implementation of add and shift operation is missing in the provided code)

    ; Display the result
    println msg3, len3
    mov bl, [result + 1]
    call displayNo
    mov bl, [result]
    call displayNo

    ret

successive:
    ; Successive add operation
    println msg1, len1
    call acceptNo
    mov [muld], bl

    println msg2, len2
    call acceptNo
    mov [mulr], bl

    ; Perform successive add operation
    ; (implementation of successive add operation is missing in the provided code)

    ; Display the result
    println msg3, len3
    mov bl, [result + 1]
    call displayNo
    mov bl, [result]
    call displayNo

    ret

acceptNo:
    ; Accept numerical input
    mov rax, 00h
    mov rdi, 00h
    mov rsi, accept
    mov rdx, 03h
    syscall

    ; Convert ASCII input to numerical value
    mov al, [accept]
    sub al, 30h
    cmp al, 09h
    jle dontSub
    sub al, 07h

dontSub:	
    mov cl, 04h
    shl al, cl
    mov bl, al

    mov al, [accept + 1]
    sub al, 30h
    cmp al, 09h
    jle dontSubb
    sub al, 07h

dontSubb:
    or bl, al
    ret

displayNo:
    ; Display numerical value
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
    mov [display + 1], al

    println display, 02h
    ret

exit:
    ; Exit the program
    mov rax, 60
    syscall

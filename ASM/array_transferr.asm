; File Name: array_transfer.asm
; Description: This program demonstrates transferring elements from one array to another.

%macro println 2
	mov rax, 01h       ; syscall number for sys_write
	mov rdi, 01h       ; file descriptor for stdout
	mov rsi, %1        ; address of the string to print
	mov rdx, %2        ; length of the string
	syscall            ; invoke syscall to print the string
%endmacro

section .data
    intromsg db 10, "Name : Arya Pathak", 10, "Roll no. 57", 10, "PRN : 12210060", 0ah  ; introduction message
    introlen equ $-intromsg  ; length of intromsg
    msg0 db 10, 'How Many Ele :: '  ; prompt message
    len0 equ $-msg0  ; length of msg0
    msg1 db 10, 'Enter 5 array Elements :'  ; prompt message
    len1 equ $-msg1  ; length of msg1
    msg2 db 10, 'Before Transfer :'  ; message
    len2 equ $-msg2  ; length of msg2
    msg3 db 10, 'SRC is ::'  ; message
    len3 equ $-msg3  ; length of msg3
    msg4 db 10, 'Dest is::'  ; message
    len4 equ $-msg4  ; length of msg4
    msg5 db 10, 'After Transfer :'  ; message
    len5 equ $-msg5  ; length of msg5
    space db '  '  ; space character

section .bss
    src resb 25  ; source array
    dest resb 25  ; destination array
    cnt resb 1  ; counter
    display resb 2  ; display buffer
    accept resb 3  ; input buffer

section .text
    global _start

_start:
    println intromsg, introlen  ; print introduction message
    println msg0, len0  ; print prompt for number of elements
    call acceptNo  ; accept user input for number of elements
    mov [cnt], bl  ; store the count in cnt

    println msg1, len1  ; print prompt for array elements

    mov cl, [cnt]  ; load count
    mov rsi, src  ; point to source array
movNext:
    push rcx  ; preserve cl
    push rsi  ; preserve rsi
    call acceptNo  ; accept user input for array elements
    pop rsi  ; restore rsi
    pop rcx  ; restore cl

    mov [rsi], bl  ; store the input in src array
    inc rsi  ; move to next element
    dec cl  ; decrement counter
    jnz movNext  ; loop until counter is zero

    println msg2, len2  ; print "Before Transfer" message
    println msg3, len3  ; print "SRC is ::" message

    mov cl, [cnt]  ; load count
    mov rsi, src  ; point to source array

dispNext:
    mov bl, [rsi]  ; load byte from source array
    push rcx  ; preserve cl
    push rsi  ; preserve rsi
    call displayNo  ; display byte
    println space, 02h  ; print space
    pop rsi  ; restore rsi
    pop rcx  ; restore cl
    inc rsi  ; move to next element
    dec cl  ; decrement counter
    jnz dispNext  ; loop until counter is zero

    println msg4, len4  ; print "Dest is::" message

    mov cl, [cnt]  ; load count
    mov rsi, dest  ; point to destination array

dispNext1:
    mov bl, [rsi]  ; load byte from destination array
    push rcx  ; preserve cl
    push rsi  ; preserve rsi
    call displayNo  ; display byte
    println space, 02h  ; print space
    pop rsi  ; restore rsi
    pop rcx  ; restore cl
    inc rsi  ; move to next element
    dec cl  ; decrement counter
    jnz dispNext1  ; loop until counter is zero

    mov cl, [cnt]  ; load count
    mov rsi, src  ; point to source array
    mov rdi, dest  ; point to destination array

next:
    mov al, [rsi]  ; load byte from source array
    mov [rdi], al  ; store byte in destination array
    inc rsi  ; move to next element in source array
    inc rdi  ; move to next element in destination array
    dec cl  ; decrement counter
    jnz next  ; loop until counter is zero

    println msg5, len5  ; print "After Transfer" message
    println msg3, len3  ; print "SRC is ::" message

    mov cl, [cnt]  ; load count
    mov rsi, src  ; point to source array

dispNext2:
    mov bl, [rsi]  ; load byte from source array
    push rcx  ; preserve cl
    push rsi  ; preserve rsi
    call displayNo  ; display byte
    println space, 02h  ; print space
    pop rsi  ; restore rsi
    pop rcx  ; restore cl
    inc rsi  ; move to next element
    dec cl  ; decrement counter
    jnz dispNext2  ; loop until counter is zero

    println msg4, len4  ; print "Dest is::" message

    mov cl, [cnt]  ; load count
    mov rsi, dest  ; point to destination array

dispNext3:
    mov bl, [rsi]  ; load byte from destination array
    push rcx  ; preserve cl
    push rsi  ; preserve rsi
    call displayNo  ; display byte
    println space, 02h  ; print space
    pop rsi  ; restore rsi
    pop rcx  ; restore cl
    inc rsi  ; move to next element
    dec cl  ; decrement counter
    jnz dispNext3  ; loop until counter is zero

    mov rax, 60  ; syscall number for sys_exit
    syscall  ; terminate the program

acceptNo:
    mov rax, 00h  ; syscall number for sys_read
    mov rdi, 00h  ; file descriptor for stdin
    mov rsi, accept  ; buffer to store input
    mov rdx, 03h  ; number of bytes to read
    syscall  ; invoke syscall to read input

    mov al, [accept]  ; extract first digit
    sub al, 

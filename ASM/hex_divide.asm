; File Name: hex_divide.asm
; Description: This program takes a 4-digit hexadecimal number as input, divides it by constants, and prints the quotient.

%macro println 2
    mov rax, 01h       ; Syscall number for sys_write
    mov rdi, 01h       ; File descriptor for stdout
    mov rsi, %1        ; Offset address of the string to print
    mov rdx, %2        ; Length of the string
    syscall            ; Invoke syscall to print the string
%endmacro

section .data
    msg1 db 10, 'Enter 4 digit Hex ::'
    len1 equ $-msg1
    intromsg db 10, 'Name : Omkar Lolage', 10, 'Roll no. 11', 10, 'PRN: 12210614'
    introlen equ $-intromsg
    msg2 db 10, 'Eq BCd :: '
    len2 equ $-msg2

section .bss
    quo resb 1         ; Quotient buffer
    accept resb 2      ; Input buffer
    hex resb 2         ; Hexadecimal number buffer
    remd resb 2        ; Remainder buffer

section .text
    global _start

_start:
    println intromsg, introlen  ; Print introduction message
    println msg1, len1          ; Print prompt for 4-digit hexadecimal number
    call acceptNo               ; Accept user input
    mov [hex+1], bl            ; Store first digit of the hexadecimal number
    call acceptNo               ; Accept user input
    mov [hex], bl              ; Store second digit of the hexadecimal number
    println msg2, len2         ; Print message for quotient calculation

    ; Divide by 10000 (2710h in decimal)
    mov dx, 0000h              ; Clear dx
    mov ax, [hex]              ; Load the 4-digit hexadecimal number
    mov bx, 2710h              ; Constant divisor
    div bx                      ; Divide ax by bx
    mov [remd], dx             ; Store remainder
    add al, 30h                ; Convert quotient to ASCII
    mov [quo], al              ; Store quotient
    println quo, 01h           ; Print quotient

    ; Divide by 1000 (03e8h in decimal)
    mov dx, 0000h              ; Clear dx
    mov ax, [remd]             ; Load remainder from previous division
    mov bx, 03e8h              ; Constant divisor
    div bx                      ; Divide ax by bx
    mov [remd], dx             ; Store remainder
    add al, 30h                ; Convert quotient to ASCII
    mov [quo], al              ; Store quotient
    println quo, 01h           ; Print quotient

    ; Divide by 100 (0064h in decimal)
    mov dx, 0000h              ; Clear dx
    mov ax, [remd]             ; Load remainder from previous division
    mov bx, 0064h              ; Constant divisor
    div bx                      ; Divide ax by bx
    mov [remd], dx             ; Store remainder
    add al, 30h                ; Convert quotient to ASCII
    mov [quo], al              ; Store quotient
    println quo, 01h           ; Print quotient

    ; Divide by 10 (000Ah in decimal)
    mov dx, 0000h              ; Clear dx
    mov ax, [remd]             ; Load remainder from previous division
    mov bx, 000Ah              ; Constant divisor
    div bx                      ; Divide ax by bx
    mov [remd], dx             ; Store remainder
    add al, 30h                ; Convert quotient to ASCII
    mov [quo], al              ; Store quotient
    println quo, 01h           ; Print quotient

    ; Print the last remainder directly as it's a single digit
    mov ax, [remd]             ; Load the last remainder
    add al, 30h                ; Convert to ASCII
    mov [quo], al              ; Store the ASCII character
    println quo, 01h           ; Print the ASCII character

    mov rax, 60                ; Syscall number for sys_exit
    syscall                    ; Terminate the program

acceptNo:
    mov rax, 00h               ; Syscall number for sys_read
    mov rdi, 00h               ; File descriptor for stdin
    mov rsi, accept            ; Buffer to store input
    mov rdx, 02h               ; Number of bytes to read
    syscall                    ; Invoke syscall to read input

    mov al, [accept]           ; Extract first digit
    sub al, 30h                ; Convert from ASCII to hexadecimal
    cmp al, 09h                ; Check if it's less than or equal to '9'
    jle dontSub                ; If yes, skip subtraction
    sub al, 07h                ; Convert from ASCII to hexadecimal (A-F)
dontSub:
    mov cl, 04h                ; Shift left by 4 bits (multiply by 16)
    shl al, cl                 ; Shift left
    mov bl, al                 ; Store the result in bl

    mov al, [accept+1]         ; Extract second digit
    sub al, 30h                ; Convert from ASCII to hexadecimal
    cmp al, 09h                ; Check if it's less than or equal to '9'
    jle dontSubb               ; If yes, skip subtraction
    sub al, 07h                ; Convert from ASCII to hexadecimal (A-F)
dontSubb:
    or bl, al                  ; Combine the two digits
    ret                         ; Return from the subroutine

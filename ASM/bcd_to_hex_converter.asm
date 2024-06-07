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
    msg1 db 10, 'Enter 5 digit BCD Number :'
    len1 equ $ - msg1

    intromsg db 10, "Name : Arya Pathak"
    db 10, "Roll no. 57"
    db 10, "PRN : 12210060", 0ah
    introlen equ $ - intromsg

    msg2 db 10, 'Eq Hex is :: '
    len2 equ $ - msg2

section .bss
    ; Define uninitialized data section for input and output
    display resb 2
    number resb 1
    hex resb 2
    carry resb 1

section .text
global _start

_start:
    ; Start of the program
    println intromsg, introlen     ; Print introduction message
    println msg1, len1             ; Print prompt message

    ; Process each BCD digit
    mov rax, 00h                   ; syscall number for sys_read
    mov rdi, 00h                   ; file descriptor 0 (stdin)
    mov rsi, number                ; buffer to store input
    mov rdx, 01h                   ; number of bytes to read
    syscall                        ; invoke the syscall
    mov al, [number]
    sub al, 30h                    ; convert ASCII to digit
    mov ah, 00h
    mov bx, 2710h                  ; multiply by 10000 (BCD place value)
    mul bx
    mov [hex], ax                  ; store result
    cmp dx, 0000h
    je goAhead
    inc byte [carry]
goAhead:

    ; Repeat for remaining 4 digits
    mov rax, 00h
    mov rdi, 00h
    mov rsi, number
    mov rdx, 01h
    syscall
    mov al, [number]
    sub al, 30h
    mov ah, 00h
    mov bx, 03e8h                  ; multiply by 1000 (BCD place value)
    mul bx
    add [hex], ax
    jnc goAhead1
    inc byte [carry]
goAhead1:

    mov rax, 00h
    mov rdi, 00h
    mov rsi, number
    mov rdx, 01h
    syscall
    mov al, [number]
    sub al, 30h
    mov ah, 00h
    mov bx, 0064h                  ; multiply by 100 (BCD place value)
    mul bx
    add [hex], ax
    jnc goAhead2
    inc byte [carry]
goAhead2:

    mov rax, 00h
    mov rdi, 00h
    mov rsi, number
    mov rdx, 01h
    syscall
    mov al, [number]
    sub al, 30h
    mov ah, 00h
    mov bx, 000ah                  ; multiply by 10 (BCD place value)
    mul bx
    add [hex], ax
    jnc goAhead3
    inc byte [carry]
goAhead3:

    mov rax, 00h
    mov rdi, 00h
    mov rsi, number
    mov rdx, 01h
    syscall
    mov al, [number]
    sub al, 30h
    mov ah, 00h
    add [hex], ax
    jnc goAhead4
    inc byte [carry]
goAhead4:

    println msg2, len2             ; Print result message

    ; Check for carry and display
    cmp byte [carry], 00h
    je dispNext
    add byte [carry], 30h          ; convert carry to ASCII
    println carry, 01h
dispNext:

    ; Display the hexadecimal result
    mov bl, [hex + 1]
    call displayNo
    mov bl, [hex]
    call displayNo

    ; Exit the program
    mov rax, 60                    ; syscall number for sys_exit
    syscall                        ; invoke the syscall

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
    mov [display + 1], al
    println display, 02h
    ret

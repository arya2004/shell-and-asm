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
    msg db "Enter the number :", 0ah
    len equ $ - msg

    posmsg db "Number is positive", 0ah
    poslen equ $ - posmsg

    negmsg db "Number is negative", 0ah
    neglen equ $ - negmsg

    intromsg db 10, "Name : Arya Pathak"
    db 10, "Roll no. 57"
    db 10, "PRN : 12210060", 0ah
    introlen equ $ - intromsg

section .bss
    ; Define uninitialized data section for input
    accept resb 2

section .text
global _start

_start:
    ; Start of the program
    println intromsg, introlen     ; Print introduction message
    println msg, len               ; Print prompt message
    call acceptNo                  ; Call the function to accept the number

    ; Check if the number is positive or negative
    mov al, bl
    shl al, 1                      ; Shift left to check the sign bit
    jc negative                    ; If carry flag is set, number is negative
    jnc positive                   ; If no carry, number is positive

negative:
    println negmsg, neglen         ; Print negative message
    jmp continue

positive:
    println posmsg, poslen         ; Print positive message

continue:
    ; Exit the program
    mov rax, 60                    ; syscall number for sys_exit
    mov rdi, 0                     ; exit code 0
    syscall                        ; invoke the syscall

acceptNo:
    ; Function to accept a 2-digit number
    mov rax, 00h                   ; syscall number for sys_read
    mov rdi, 00h                   ; file descriptor 0 (stdin)
    mov rsi, accept                ; buffer to store input
    mov rdx, 02h                   ; number of bytes to read
    syscall                        ; invoke the syscall

    ; Convert input characters to numerical value
    mov al, [accept]
    sub al, 30h                    ; convert ASCII to digit
    cmp al, 09h                    ; check if it's a valid digit
    jle dontSub
    sub al, 07h                    ; adjust for hexadecimal digits
dontSub:
    mov cl, 04h                    ; shift left by 4 bits to make it higher nibble
    shl al, cl
    mov bl, al

    mov al, [accept + 1]
    sub al, 30h                    ; convert ASCII to digit
    cmp al, 09h                    ; check if it's a valid digit
    jle dontSubb
    sub al, 07h                    ; adjust for hexadecimal digits
dontSubb:
    or bl, al                      ; combine the two nibbles

    ret                            ; return from the function

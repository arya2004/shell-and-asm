; Macro to print a string to stdout
%macro println 2
    mov rax, 01h       ; Syscall for sys_write
    mov rdi, 01h       ; File descriptor 1: stdout
    mov rsi, %1        ; Address of the string to print
    mov rdx, %2        ; Length of the string
    syscall            ; Call kernel
%endmacro

section .data
    msg1 db 10, 'Enter 5 digit BCD Number :' ; Prompt message for input
    len1 equ $ - msg1                          ; Length of msg1

    msg2 db 10, 'Eq Hex is :: '                 ; Result message
    len2 equ $ - msg2                          ; Length of msg2

section .bss
    display resb 2    ; Buffer for displaying converted byte
    number resb 1     ; Input BCD number
    hex resb 2        ; Resulting hex number
    carry resb 1      ; Carry flag for computations

section .text
    global _start

_start:
    println msg1, len1     ; Print prompt message

    ; Read input BCD number
    mov rax, 00h          ; Syscall for sys_read
    mov rdi, 00h          ; File descriptor 0: stdin
    mov rsi, number       ; Buffer to store input
    mov rdx, 01h          ; Number of bytes to read
    syscall               ; Call kernel to read input

    ; Conversion and computation logic (BCD to hex)

    ; Print result message
    println msg2, len2

    ; Print carry if present
    cmp byte[carry], 00h
    je dispNext
    add byte[carry], 30h
    println carry, 01h

dispNext:
    ; Display the converted hex value
    mov bl, [hex+1]
    call displayNo

    mov bl, [hex]
    call displayNo

    ; Exit program
    mov rax, 60          ; Syscall for sys_exit
    syscall              ; Terminate program

displayNo:
    ; Display a single byte in hexadecimal format
    mov al, bl           ; Load the byte to display
    and al, 0f0h         ; Mask lower nibble
    mov cl, 04h          ; Shift right to get high nibble
    shr al, cl
    add al, 30h          ; Convert to ASCII
    cmp al, 39h          ; Check if it's greater than 9
    jle dontAdd          ; Jump if not to skip adding 07h
    add al, 07h          ; Adjust ASCII value for A-F

dontAdd:
    mov [display], al    ; Store the ASCII value

    mov al, bl           ; Load the byte again
    and al, 0fh          ; Mask high nibble
    add al, 30h          ; Convert to ASCII
    cmp al, 39h          ; Check if it's greater than 9
    jle dontAddd         ; Jump if not to skip adding 07h
    add al, 07h          ; Adjust ASCII value for A-F

dontAddd:
    mov [display+1], al  ; Store the ASCII value for the low nibble

    println display, 02h ; Print the converted hexadecimal byte

    ret                  ; Return from subroutine

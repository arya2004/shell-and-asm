; File Name: hex_to_ascii.asm
; Description: This program reads a hexadecimal input, converts it to ASCII, and prints the result.

%macro println 2
	mov rax, 01h   ; Syscall number for sys_write
	mov rdi, 01h   ; File descriptor for stdout
	mov rsi, %1    ; Offset address of the string to print
	mov rdx, %2    ; Length of the string
	syscall        ; Invoke syscall to print the string
%endmacro

section .data
    msg1 db 10, 'Enter key :'  ; Message for input prompt
    len1 equ $ - msg1          ; Length of message 1

    msg2 db 10, 'Eq Hex :'     ; Message for hex equivalent
    len2 equ $ - msg2          ; Length of message 2

section .bss
    accept resb 2      ; Buffer for input
    display resb 2     ; Buffer for converted ASCII

section .text
    global _start

_start:
    println msg1, len1   ; Print input prompt message

    mov rax, 00h         ; Syscall number for sys_read
    mov rdi, 00h         ; File descriptor for stdin
    mov rsi, accept      ; Buffer to store input
    mov rdx, 02h         ; Number of bytes to read
    syscall              ; Invoke syscall to read input

    println msg2, len2   ; Print message for hex equivalent

    mov al, [accept]     ; Load the input
    and al, 0f0h         ; Extract the most significant digit
    mov cl, 04h          ; Shift count for right shift
    shr al, cl           ; Shift to get the value of the most significant digit

    add al, 30h          ; Convert to ASCII
    mov [display], al    ; Store the ASCII value

    mov al, [accept]     ; Load the input again
    and al, 0fh          ; Extract the least significant digit

    add al, 30h          ; Convert to ASCII
    cmp al, 39h          ; Compare with '9'
    jle dontAdd          ; Jump if not greater than '9'
    add al, 07h          ; Adjust for letters A-F

dontAdd:
    mov [display + 1], al  ; Store the ASCII value of the least significant digit

    println display, 02h   ; Print the converted ASCII value

    mov rax, 60           ; Syscall number for sys_exit
    syscall               ; Terminate the program

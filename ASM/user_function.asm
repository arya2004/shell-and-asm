section .data
    msg1 db "Enter no: ", 0Ah  ; Prompt message with newline character
    msg1_len equ $ - msg1      ; Length of the prompt message
    num dq 00h                 ; Variable to store the processed number
    num_len equ $ - num        ; Length of the num variable in bytes
    num1 dq 2Ah                ; Initial value for processing
    num1_len equ $ - num1      ; Length of the num1 variable in bytes

%macro print 2
    mov rax, 1      ; Syscall number for sys_write
    mov rdi, 1      ; File descriptor for stdout
    mov rsi, %1     ; Address of the string to print
    mov rdx, %2     ; Length of the string
    syscall         ; Invoke syscall to print
%endmacro

section .text
    global _start

_start:
    ; Print the prompt message
    print msg1, msg1_len

    ; Process and print the upper nibble
    mov bl, [num1]      ; Load the initial value into bl
    shr bl, 04h         ; Shift right to get the upper nibble
    cmp bl, 09h         ; Compare with 9 for adjustment
    jbe skip_add        ; Jump if below or equal to 9
    add bl, 07h         ; Adjust for ASCII conversion (A-F)
skip_add:
    add bl, 30h         ; Convert to ASCII
    mov [num], bl       ; Store the ASCII character in num

    ; Print the upper nibble
    mov rax, 1          ; Syscall number for sys_write
    mov rdi, 1          ; File descriptor for stdout
    mov rsi, num        ; Address of the converted nibble
    mov rdx, num_len    ; Length of the converted nibble (1 byte)
    syscall             ; Invoke syscall to print

    ; Process and print the lower nibble
    mov rbx, [num1]     ; Reload the initial value into rbx
    and rbx, 0fh        ; Mask to get the lower nibble
    cmp bl, 09h         ; Compare with 9 for adjustment
    jbe skip_add2       ; Jump if below or equal to 9
    add bl, 07h         ; Adjust for ASCII conversion (A-F)
skip_add2:
    add bl, 30h         ; Convert to ASCII
    mov [num], bl       ; Store the ASCII character in num

    ; Print the lower nibble
    mov rax, 1          ; Syscall number for sys_write
    mov rdi, 1          ; File descriptor for stdout
    mov rsi, num        ; Address of the converted nibble
    mov rdx, num_len    ; Length of the converted nibble (1 byte)
    syscall             ; Invoke syscall to print

    ; Exit the program
    mov rax, 60         ; Syscall number for exit
    xor rdi, rdi        ; Exit status 0 (success)
    syscall             ; Invoke syscall to exit

section .data
    num db 36h  ; Hexadecimal value to extract nibbles from
    num_len equ $ - num  ; Length of the num variable in bytes

    num1 db 00h  ; Placeholder for the converted nibble

section .text
    global _start

_start:
    ; Extract and convert the upper nibble
    mov bl, [num]      ; Load the value from num into bl
    shr bl, 04h        ; Shift right to get the upper nibble
    add bl, 30h        ; Convert to ASCII
    mov [num1], bl     ; Store the ASCII character in num1

    ; Print the upper nibble
    mov rax, 1         ; Syscall number for sys_write
    mov rdi, 1         ; File descriptor for stdout
    mov rsi, num1      ; Address of the converted nibble
    mov rdx, num_len   ; Length of the converted nibble (1 byte)
    syscall            ; Invoke syscall to print

    ; Extract and convert the lower nibble
    mov bl, [num]      ; Reload the value from num into bl
    and bl, 0fh        ; Mask to get the lower nibble
    add bl, 30h        ; Convert to ASCII
    mov [num1], bl     ; Store the ASCII character in num1

    ; Print the lower nibble
    mov rax, 1         ; Syscall number for sys_write
    mov rdi, 1         ; File descriptor for stdout
    mov rsi, num1      ; Address of the converted nibble
    mov rdx, num_len   ; Length of the converted nibble (1 byte)
    syscall            ; Invoke syscall to print

    ; Exit the program
    mov rax, 60        ; Syscall number for exit
    mov rdi, 0         ; Exit status 0 (success)
    syscall            ; Invoke syscall to exit

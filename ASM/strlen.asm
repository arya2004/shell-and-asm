section .bss
    user_input resb 100  ; Reserve space for user input

section .text
    global _start

_start:
    ; Read input from user
    mov rdi, user_input   ; Destination buffer for user input
    mov rsi, 100          ; Maximum number of characters to read
    mov rdx, 0            ; Clear any existing input in rdx
    mov rax, 0            ; syscall number for sys_read
    syscall

    ; Print "RAX"
    mov rdi, 1            ; File descriptor 1 (stdout)
    mov rax, 0x1C000000 + 3  ; System call number for sys_write
    lea rsi, [rel message]    ; Load the address of the message
    mov rdx, 3            ; Length of the message
    syscall

    ; Exit the program
    mov rax, 60           ; syscall number for sys_exit
    xor rdi, rdi          ; Exit status 0
    syscall

section .data
    message db "RAX", 0


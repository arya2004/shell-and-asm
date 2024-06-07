%macro println 2
    mov rax, 01h        ; System call number for sys_write
    mov rdi, 1          ; File descriptor for stdout
    mov rsi, %1         ; Address of the string to print
    mov rdx, %2         ; Length of the string
    syscall             ; Invoke the syscall to print the string
%endmacro

section .data
    msg db 'Success', 10  ; Include newline character in the string
    len equ $ - msg       ; Calculate the length of the string

    msg1 db 10, 'Is Always', 10  ; Include newline characters in the string
    len1 equ $ - msg1             ; Calculate the length of the string

section .bss
    ; Define uninitialized data section if needed

section .text
    global _start

_start:
    println msg, len  ; Print the first message

    mov rsi, msg1    ; Load address of the second message
    mov rdx, len1    ; Load length of the second message
    call print       ; Call the print subroutine

    mov rax, 60      ; Exit syscall
    syscall

print:
    mov rax, 01h     ; Syscall number for sys_write
    mov rdi, 1       ; File descriptor for stdout
    syscall          ; Invoke the syscall to print the message
    ret              ; Return from the subroutine

; Filename: success_message.asm

section .data
    msg db "Success", 10, 13  ; Message with newline and carriage return

section .code
    global _start

_start:
    mov ax, 0x0000          ; Set AX to 0 (segment base)
    mov ds, ax              ; Load DS with the segment base

    mov dx, msg             ; Load DX with the offset of msg
    mov ah, 09h             ; AH = 09h for displaying string
    int 21h                 ; Call interrupt 21h to display the message

    mov ax, 4C00h           ; Set exit code 0 and terminate program
    int 21h                 ; Call interrupt 21h to terminate program

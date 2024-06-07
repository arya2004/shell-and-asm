; File Name: block_transfer.asm
; Description: This program performs a non-overlapping block transfer from sourceBlock to destBlock.

section .data
    sourceBlock db 11h,54h,62h,24h,33h  ; Source block data
    count equ 05  ; Number of elements in the block
    naem db "Name: Arya Pathak", 10  ; Name data
    naem_len equ $ - naem  ; Length of name data
    rrr db "Roll no. 57", 10  ; Roll number data
    rrr_len equ $ - rrr  ; Length of roll number data
    prn db "PRN: 12210060", 10  ; PRN data
    prn_len equ $ - prn  ; Length of PRN data
    msg db "ALP for non overlapped block transfer : ", 10  ; Message
    msg_len equ $ - msg  ; Length of message
    msgSource db 10, "The source block contains the elements : ", 10  ; Message for source block
    msgSource_len equ $ - msgSource  ; Length of message for source block
    msgDest db 10, 10, "The destination block contains the elements : ", 10  ; Message for destination block
    msgDest_len equ $ - msgDest  ; Length of message for destination block
    bef db 10, "Before Block Transfer : ", 10  ; Message before transfer
    beflen equ $ - bef  ; Length of message before transfer
    aft db 10, 10, "After Block Transfer : ", 10  ; Message after transfer
    aftlen equ $ - aft  ; Length of message after transfer

section .bss
    destBlock resb 5  ; Destination block
    result resb 4  ; Result buffer

%macro write 2
    mov rax, 1     ; Syscall number for sys_write
    mov rdi, 1     ; File descriptor for stdout
    mov rsi, %1    ; Offset address of the string to print
    mov rdx, %2    ; Length of the string
    syscall        ; Invoke syscall to print the string
%endmacro

section .text
    global _start

_start:
    write naem, naem_len  ; Print name
    write rrr, rrr_len    ; Print roll number
    write prn, prn_len    ; Print PRN
    write msg, msg_len    ; Print message
    write bef, beflen     ; Print message before transfer
    write msgSource, msgSource_len  ; Print message for source block
    mov rsi, sourceBlock  ; Point to source block
    call dispBlock        ; Display source block
    write msgDest, msgDest_len      ; Print message for destination block
    mov rsi, destBlock    ; Point to destination block
    call dispBlock        ; Display destination block

    mov rsi, sourceBlock  ; Point to source block
    mov rdi, destBlock    ; Point to destination block
    mov rcx, count        ; Load count of elements
    cld                    ; Clear direction flag for rep movsb
    rep movsb              ; Perform block transfer

    write aft, aftlen     ; Print message after transfer
    write msgSource, msgSource_len  ; Print message for source block
    mov rsi, sourceBlock  ; Point to source block
    call dispBlock        ; Display source block
    write msgDest, msgDest_len      ; Print message for destination block
    mov rsi, destBlock    ; Point to destination block
    call dispBlock        ; Display destination block

    mov rax, 60           ; Syscall number for sys_exit
    mov rdi, 0            ; Exit status 0
    syscall               ; Terminate the program

dispBlock:
    mov rbp, count        ; Load count of elements
next:
    mov al, [rsi]         ; Load element from source block
    push rsi              ; Preserve rsi
    call disp             ; Display the element
    pop rsi               ; Restore rsi
    inc rsi               ; Move to next element
    dec rbp               ; Decrement element count
    jnz next              ; Repeat until count is zero
    ret

disp:
    mov bl, al            ; Store number in bl
    mov rdi, result       ; Point rdi to result variable
    mov cx, 02            ; Load count of rotations in cx
up1:
    rol bl, 04            ; Rotate number left by four bits
    mov al, bl            ; Move lower byte in al
    and al, 0fh           ; Get only LSB
    cmp al, 09h           ; Compare with '9'
    jg add_37             ; If greater than '9', skip adding 37
    add al, 30h           ; Add 30 to convert to ASCII
    jmp skip1             ; Jump to skip addition of 37
add_37:
    add al, 37h           ; Add 37 to convert to ASCII (A-F)
skip1:
    mov [rdi], al         ; Store ASCII code in result variable
    inc rdi               ; Move to next byte
    dec cx                ; Decrement the count of digits to display
    jnz up1               ; Repeat until count is zero
    write result, 4       ; Print the result
    ret

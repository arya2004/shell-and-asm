section .data
    ; Define data section containing the strings to be printed
    msg1 db 10, 10, 'Source array contents before Overlap : '
    len1 equ $ - msg1

    intromsg db 10, "Name : Arya Pathak"
    db 10, "Roll no. 57"
    db 10, "PRN : 12210060", 0ah
    introlen equ $ - intromsg

    msg2 db 10, 'Source array contents after Overlap : '
    len2 equ $ - msg2

    posmsg db 10, 10, 'Enter position to overlap: ', 10
    posmsg_len equ $ - posmsg

    space db 20h
    length equ $ - space

    src db 11h, 22h, 33h, 44h, 55h, 00h, 00h, 00h, 00h, 00h

section .bss
    ; Define uninitialized data section for input and output
    optionbuff resb 2
    dispbuff resb 2
    numascii resb 3
    pos resb 1

%macro display 2
    ; Macro to display a string using the syscall
    ; %1 - address of the string
    ; %2 - length of the string
    mov rax, 01h         ; syscall number for sys_write
    mov rdi, 01h         ; file descriptor 1 (stdout)
    mov rsi, %1          ; address of the string
    mov rdx, %2          ; length of the string
    syscall              ; invoke the syscall
%endmacro

%macro accept 2
    ; Macro to accept input using the syscall
    ; %1 - address to store input
    ; %2 - length of the input
    mov rax, 00h         ; syscall number for sys_read
    mov rdi, 00h         ; file descriptor 0 (stdin)
    mov rsi, %1          ; address to store input
    mov rdx, %2          ; length of the input
    syscall              ; invoke the syscall
%endmacro

section .text
global _start

_start:
    ; Start of the program
    display intromsg, introlen    ; Print introduction message
    display msg1, len1            ; Print message before overlap
    call display1                 ; Display source array contents

    display posmsg, posmsg_len    ; Print prompt for overlap position
    accept numascii, 3            ; Accept input for position
    call packnum_proc             ; Convert ASCII input to number

    ; Menu handling
menu:
    jmp wos                       ; Jump to overlap handling

exit:
    ; Exit the program
    mov rax, 60                   ; syscall number for sys_exit
    mov rbx, 00                   ; exit code 0
    syscall                       ; invoke the syscall

display1:
    ; Display the source array contents
    mov rsi, src
    mov rcx, 05h                  ; Display first 5 elements of src
    add cl, [pos]                 ; Adjust the count by overlap position
up1:
    push rcx
    mov bl, [rsi]
    push rsi
    call display3                 ; Convert and display byte
    display space, length         ; Display a space
    pop rsi
    inc rsi
    pop rcx
    loop up1
    ret

wos:
    ; Perform overlap
    mov rsi, src + 4              ; Start from the 5th element
    mov rdi, rsi
    add rdi, [pos]                ; Adjust destination by position
    mov rcx, 05                   ; Number of elements to overlap
blkup1:
    mov al, [rsi]
    mov [rdi], al
    dec rsi
    dec rdi
    loop blkup1

    display msg2, len2            ; Print message after overlap
    call display1                 ; Display source array contents after overlap
    jmp exit

display3:
    ; Convert and display a byte in hexadecimal format
    mov ecx, 2
    mov edi, dispbuff
dup1:
    rol bl, 4
    mov dl, bl
    and dl, 0fh
    cmp dl, 09
    jbe dskip
    add dl, 07h
dskip:
    add dl, 30h
    mov [edi], dl
    inc edi
    loop dup1
    display dispbuff, 2
    ret

packnum_proc:
    ; Convert ASCII input to number
    mov bx, 0
    mov ecx, 2
    mov esi, numascii
up2:
    rol bl, 4
    mov al, [esi]
    sub al, 30h
    cmp al, 09h
    jbe skip5
    sub al, 07h
skip5:
    add bl, al
    inc esi
    loop up2
    mov [pos], bl
    ret

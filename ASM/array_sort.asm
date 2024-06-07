; Filename: array_sort.asm
%macro print 2
    mov rax, 1
    mov rdi, 1 
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

section .data
    arr db 11h, 55h, 33h, 22h, 44h
    
section .bss
    cnt resb 1
    idk resb 1
    len1 equ $-idk

section .text
    global _start
_start:
    mov byte [cnt], 05      ; Initialize counter to array length
    mov rsi, arr            ; Load the address of the array into RSI
    mov al, 0               ; Initialize AL as 0
    
Lp:                         ; Loop to compare and swap elements
    cmp al, [rsi]           ; Compare AL with the value at current array index
    jg skip                 ; Jump to skip if AL is greater than current element
    xchg al, [rsi]          ; Exchange AL with the current element if not greater
skip:
    inc rsi                 ; Move to the next element in the array
    dec byte [cnt]          ; Decrement the counter
    jnz Lp                  ; Jump back to Lp if counter is not zero

print idk, len1            ; Print the sorted array element
mov rax, 60                ; System call for exit
xor rdi, rdi               ; Exit code 0
syscall

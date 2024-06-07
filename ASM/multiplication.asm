; File Name: add_and_print.asm
; Description: This program calculates the sum of two hexadecimal numbers and prints the result.

%macro println 2
	mov rax, 01h        ; syscall number for sys_write
	mov rdi, 01h        ; file descriptor for stdout
	mov rsi, %1         ; address of the string to print
	mov rdx, %2         ; length of the string
	syscall             ; invoke syscall to print the string
%endmacro

section .data
    num     db 54h    ; first hexadecimal number
    num_len equ $-num ; length of num
    n1      db 54h    ; second hexadecimal number
    n1_len  equ $-n1  ; length of n1
    n2      db 65h    ; second hexadecimal number
    n2_len  equ $-n2  ; length of n2

section .bss
    result  resb 02   ; storage for the result

global _start
section .text
_start: 
    mov cl, [n1]       ; load length of n1
    mov dx, 0000h      ; initialize dx to 0 for sum calculation
    mov bl, [n2]       ; load least significant byte of n2
    mov bh, 00h        ; clear upper part of bx
Addnext: 
    add dx, bx         ; add bx to dx
    dec cl             ; decrement cl (counter)
    jnz Addnext        ; loop until cl becomes zero

    mov [result], dx   ; store the result in memory
    mov bl, [result + 1] ; load most significant byte of result
    println result, 02 ; print the result (2 bytes)

    mov rax, 60        ; syscall number for sys_exit
    mov rdi, 0         ; exit status 0
    syscall            ; terminate the program

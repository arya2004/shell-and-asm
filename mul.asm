

%macro println 2
	mov rax,01h
	mov rdi,01h
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro
 
    section     .data
num db 54h
num_len equ $-num
n1 db 54h
n1_len equ $-n1
n2 db 65h
n2_len equ $-n2
num1 dw 00h
idk equ $-num1

            section     .bss
            result resb 02





            global      _start
            section     .text
_start: 
    
            mov cl, [n1]
            mov dx, 0000h
            mov bl, [n2]
            mov bh, 00h
Addnext: add dx, bx
            dec cl
            jnz Addnext


            mov [result], dx
            mov bl, [result + 1]
            println result, idk
            mov bl, [result]
            
           ;;println [bl], n1_len

            mov      rax, 60 ;; termination fuction. all three lines
            mov      rdi, 0  ;;
            syscall
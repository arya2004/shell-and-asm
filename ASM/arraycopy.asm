%macro println 2
	mov rax,01h
	mov rdi,01h
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro

section .data

src dq 0031h
srclen equ $-src

msg0 db 10,'uyewfvrwuyevf'
len0 equ $-msg0




section .text
global _start

_start:
     
           

               println src, 01

               
        

        mov rax, 60 ;;terminalr
        syscall


%macro	println 2
	mov rax,01h
	mov rdi,01h
	mov rsi,%1
	mov rdx,%2
	syscall


section .data
msg db 'Success'
len equ $-msg

msg1 db 10,'Is Always'
len1 equ $-msg1

section .bss
section .text
	global _start
_start:

	println msg,len


	mov rsi,msg1
	mov rdx,len1
	call print 



	mov rax,60
	syscall


print:
	mov rax,01h
	mov rdi,01h
	syscall

ret













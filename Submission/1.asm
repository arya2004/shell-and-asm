%macro println 2
mov rax,01h
mov rdi,01h
mov rsi,%1
mov rdx,%2
syscall
%endmacro
section .data
msg db "Enter the number :", 0ah
len equ $-msg
posmsg db "Number is positive", 0ah
poslen equ $-posmsg
negmsg db "Number is negative", 0ah
neglen equ $-negmsg
intromsg db 10, "Name : Arya Pathak"
db 10, "Roll no. 57"
db 10, "PRN : 12210060",0ah
introlen equ $-intromsg
section .bss
accept resb 2
section .text
global _start
_start:
println intromsg,introlen
println msg,len
call acceptNo
mov al,bl
shl al,1
jc negative
jnc positive
negative : println negmsg,neglen
jmp continue
positive: println posmsg,poslen
continue:
mov rax, 60
mov rdi, 0
syscall
acceptNo:
mov rax,00h
mov rdi,00h
mov rsi,accept
mov rdx,02h
syscall
mov al,[accept]
sub al,30h
cmp al,09h
jle dontSub
sub al,07h
dontSub:
mov cl,04h
shl al,cl
mov bl,al
mov al,[accept+1]
sub al,30h
cmp al,09h
jle dontSubb
sub al,07h
dontSubb:
or bl,al
ret
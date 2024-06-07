section .data
msg1 db 10,10,'Source array contents before Overlap : '
len1 equ $-msg1
intromsg db 10, "Name : Arya Pathak"
db 10, "Roll no. 57"
db 10, "PRN : 12210060",0ah
introlen equ $-intromsg
msg2 db 10,'Source array contents after Overlap : ',
len2 equ $-msg2
posmsg db 10,10,'Enter position to overlap: ',10
posmsg_len equ $-posmsg
space db 20h
length equ $-space
src db 11h,22h,33h,44h,55h,00h,00h,00h,00h,00h
section .bss
optionbuff resb 02
dispbuff resb 02
numascii resb 03
pos resb 00
%macro display 2
mov rax,01
mov rdi,01
mov rsi,%1
mov rdx,%2
syscall
%endmacro
%macro accept 2
mov rax,00
mov rdi,00
mov rsi,%1
mov rdx,%2
syscall
%endmacro
section .text
global _start
_start:
display intromsg,introlen
display msg1,len1
call display1
display posmsg,posmsg_len
accept numascii,3
call packnum_proc
menu:
jmp wos
exit:
mov rax,60
mov rbx,00
syscall
display1:
mov rsi,src
mov rcx,05h
add cl,[pos]
up1:
push rcx
mov bl,[rsi]
push rsi
call display3
display space,length
pop rsi
inc rsi
pop rcx
loop up1
ret
wos:
mov rsi,src+4
mov rdi,rsi
add rdi,[pos]
mov rcx,05
blkup1:
mov al,[rsi]
mov [rdi],al
dec rsi
dec rdi
loop blkup1
display msg2,len2
call display1
jmp exit
display3:
mov ecx,2
mov edi,dispbuff
dup1:
rol bl,4
mov dl,bl
and dl,0fh
cmp dl,09
jbe dskip
add dl,07h
dskip:
add dl,30h
mov [edi],dl
inc edi
loop dup1
display dispbuff,2
ret
packnum_proc:
mov bx,0
mov ecx,2
mov esi,numascii
up2:
rol bl,4
mov al,[esi]
sub al,30h
cmp al,09h
jbe skip5
sub al,07h
skip5:
add bl,al
inc esi
loop up2
mov [pos],bl
ret
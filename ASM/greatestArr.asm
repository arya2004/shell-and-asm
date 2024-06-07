

%macro print 2
    mov rax, 1
    mov rdi, 1 
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

section.data:
    arr db 11h, 55h, 33h, 22h, 44h
    

section.bss:
    cnt resb 1
    idk resb 1
    len1 equ $-idk

section.text:
    global _start
    _start: mov byte[cnt], 05
            mov rsi, arr
            mov al, 0
        Lp: cmp al, [rsi]
            Jg skip
            Xchg al, [rsi]
        skip: inc rsi
                dec byte[cnt]
                Jnz Lp
      
        
        print idk, len1
         mov       rax, 60                 ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall       

    section     .data
num db 36h
num_len equ $-num

num1 db 00h


            global      _start
            section     .text
_start: 
    
            mov      bl, [num]
            shr      bl, 04h
            add      bl, 30h
            mov      [num1], bl

            mov      rax, 1
            mov      rdi, 1
            mov      rsi, num1
            mov      rdx, num_len
            syscall

            mov     bl, [num]
            and     bl, 0fh
            add     bl, 30h
            mov     [num1], bl


            mov      rax, 1
            mov      rdi, 1
            mov      rsi, num1
            mov      rdx, num_len
            syscall

            mov      rax, 60 ;; termination fuction. all three lines
            mov      rdi, 0  ;;
            syscall
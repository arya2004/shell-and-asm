    section     .data
num db 01
num_len equ $-num




            global      _start
            section     .text
_start: 
    
            mov      bl, [num]
            add      bl, 65
            mov      [num], bl

            mov      rax, 1
            mov      rdi, 1
            mov      rsi, num
            mov      rdx, num_len
            syscall

            mov      rax, 60 ;; termination fuction. all three lines
            mov      rdi, 0  ;;
            syscall
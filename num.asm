    section     .data
num db 06h
num_len equ $-num




            global      _start
            section     .text
_start: 
    
            mov      bl, [num]
            add      bl, 30h
            mov      [num], bl

            mov      rax, 1
            mov      rdi, 1
            mov      rsi, num
            mov      rdx, num_len
            syscall

            mov      rax, 60 ;; termination fuction. all three lines
            mov      rdi, 0  ;;
            syscall

;;rax 64 bit gp reg
;; eax 32 bit
;; ax 16 biy => ah, al 8-bit
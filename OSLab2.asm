section.data
    msg db "Enter no"  ;;stored in external data seg memory
    msg_len equ $-msg

%macro prnt 2
    mov rax, 1  ;;sys function for write operation
    mov rdi, 1  ;; file handle number for std out device
    mov rsi, %1 ;; loading offset address
    ;;ascii stored in data segment. 'E' in 1000, then 'n' in 1001 and so on. msg len in 1008
    mov rdx, %2
    syscall
%endmacro


    global_start
    section.text
    _start:
    prnt msg, msg_len
    syscall
    mov rax, 60 ;; termination fuction. all three lines
    mov rdi, 0  ;;
    syscall

;;num db 05  => holds byte data
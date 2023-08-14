.small:
.100:
.data:
    msg db "Success", 10, 13

.code:
    start:
    mov ax, @data
    mov ds, ax
    mov dx, offset msg
    mov ax, 09
    INT 21h
    mov ax, 4ch
    INT 21h
    end:
    endstart:
; Filename: block_transfer.asm
section .data
    ; Strings for display
    naem db "Name: Arya Pathak",10
    naem_len equ $ - naem
    rrr db "Roll no. 57",10
    rrr_len equ $ - rrr
    prn db "PRN: 12210060",10
    prn_len equ $ - prn

    ; Menu messages
    menumsg db 10,'##Menu for overlapped Block Transfer##',10
            db 10,'1.Block Overlap without using string instructions'
            db 10,'2.Block Overlap with using string instructions'
            db 10,'3.Exit',10,10
    menumsg_len equ $-menumsg

    ; Messages for block operations
    blk_bfrmsg db 10,10,'Block contents before Overlap'
    blk_bfrmsg_len equ $-blk_bfrmsg
    blk_afrmsg db 10,'Block contents after Overlap',10
    blk_afrmsg_len equ $-blk_afrmsg
    srcmsg db 10,'Source block contents::'
    srcmsg_len equ $-srcmsg
    posmsg db 10,10,10,'Enter position to overlap::'
    posmsg_len equ $-posmsg
    spacechar db 20h
    spchlength equ $-spacechar
    srcblk db 01h,02h,03h,04h,05h,00h,00h,00h,00h,00h

section .bss
    ; Buffers and variables
    optionbuff resb 02
    dispbuff resb 02
    numascii resb 03
    pos resb 00

section .text
    global _start

_start:
    ; Display information
    display naem, naem_len
    display rrr, rrr_len
    display prn, prn_len
    display blk_bfrmsg, blk_bfrmsg_len
    call disp_src_blk_proc
    display posmsg, posmsg_len
    accept numascii, 3
    call packnum_proc

menu:
    ; Display menu and accept input
    display menumsg, menumsg_len
    accept optionbuff, 02

    cmp byte [optionbuff], 31H
    je wos
    cmp byte [optionbuff], 32H
    je ws

exit:
    ; Exit program
    mov rax, 60
    mov rbx, 00
    syscall

disp_src_blk_proc:
    ; Display source block
    display srcmsg, srcmsg_len
    mov rsi, srcblk
    mov rcx, 05h
    add cl, [pos]

up1:
    push rcx
    mov bl, [rsi]
    push rsi
    call disp8_proc
    display spacechar, spchlength
    pop rsi
    inc rsi
    pop rcx
    loop up1
    ret

wos:
    ; Block overlap without string instructions
    mov rsi, srcblk+4
    mov rdi, rsi
    add rdi, [pos]
    mov rcx, 05

blkup1:
    mov al, [rsi]
    mov [rdi], al
    dec rsi
    dec rdi
    loop blkup1

    display blk_afrmsg, blk_afrmsg_len
    call disp_src_blk_proc
    jmp exit

ws:
    ; Block overlap with string instructions
    mov esi, srcblk+4
    mov edi, esi
    add edi, [pos]
    mov ecx, 05

    std
    rep movsb

    display blk_afrmsg, blk_afrmsg_len
    call disp_src_blk_proc
    jmp exit

disp8_proc:
    ; Display procedure for 8-bit numbers
    mov ecx, 2
    mov edi, dispbuff

dup1:
    rol bl, 4
    mov dl, bl
    and dl, 0fh
    cmp dl, 09
    jbe dskip
    add dl, 07h

dskip:
    add dl, 30h
    mov [edi], dl
    inc edi
    loop dup1
    
    display dispbuff, 2
    ret

packnum_proc:
    ; Convert ASCII input to packed BCD
    mov bx, 0
    mov ecx, 2
    mov esi, numascii

up2:
    rol bl, 4
    mov al, [esi]
    sub al, 30h
    cmp al, 09h
    jbe skip5
    sub al, 07h

skip5:
    add bl, al
    inc esi
    loop up2
    mov [pos], bl
    ret

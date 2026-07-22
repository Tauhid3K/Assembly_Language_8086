.model small
.stack 100h
.data

msg1 db 13,10, 'Enter row number(0-9): $'
msg2 db 13,10, 'Enter column number(0-9): $'
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    mov bl, al
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    mov bh, al
    
    
    mov ch, 0
    mov cl, bl
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    outer_loop:
    
    push cx
    
    mov ch, 0
    mov cl, bh
    
    inner_loop:
    
    mov ah, 2
    mov dl,'x'
    int 21h
    
    loop inner_loop
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    pop cx
    loop outer_loop
    
    mov ah, 4ch
    int 21h
    
    main endp
end main
    
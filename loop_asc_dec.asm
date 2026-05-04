.model small
.stack 100h
.data
a db 'Enter the range: $'
r db ?
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov r,al
    
    mov dl,32
    mov ah,2
    int 21h
    
    mov cx,0
    mov cl,r
    
    top:
    mov dl,'x'
    mov ah,2
    int 21h
    
    mov dl,32
    int 21h
    
    loop top
    
    mov dl,32
    int 21h
    
    mov cx,0
    mov cl,r
    mov bl,1
    
    asc_loop:
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    mov dl,32
    int 21h
    
    inc bl
    
    loop asc_loop
    
    mov dl,32
    int 21h
    
    mov cl,r
    
    dec_loop:    
    mov ah,2
    mov dl,r
    add dl,48
    int 21h
    
    mov dl,32
    int 21h
    
    dec r
    
    loop dec_loop
     
    
    mov ah,4ch
    int 21h
    
    main endp
end main
.model small
.stack 100h
.data

m1 db 'Enter starting number $'
m2 db 10,13,'Enter ending number $'

n db ?
m db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov n,al
    
    mov ah,9
    lea dx,m2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov m,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov al,n
    sub al,m
    inc al
    mov cx,0
    mov cl,al
    
    mov bl,n
    
    top:
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    mov dl,32
    int 21h
    
    dec bl
    
    loop top
    
    mov ah,4ch
    int 21h
    main endp
end main
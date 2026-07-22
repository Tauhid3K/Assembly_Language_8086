.model small
.stack 100h

.data
q1 db 'Enter first number $'
q2 db 10,13,'Enter second number $'
r1 db 10,13,'Largest number $'
r2 db 10,13, 'They are equal $'

.code 
main proc 
    
    mov ax, @data
    mov ds, ax
    
    mov ah,9
    lea dx, q1
    int 21h
    
    mov ah, 1
    int 21h
    
    mov bl,al
    
    mov ah,9
    lea dx,q2
    int 21h
    
    mov ah,1
    int 21h
    
    mov bh,al
    
    cmp bl,bh
    jg greater
    jl lower
    je equal
    
    greater:
    mov ah,9
    lea dx,r1
    int 21h
    
    mov dl, bl
    
    mov ah,2
    int 21h
    jmp exit
           
    lower:
    mov ah,9
    lea dx,r1
    int 21h
    
    mov dl, bh
    mov ah,2
    int 21h
    jmp exit
    
    equal:
    mov ah,9
    lea dx,r2
    int 21h
    jmp exit       
        
    exit:
    mov ah,4ch
    int 21h
main endp
end main

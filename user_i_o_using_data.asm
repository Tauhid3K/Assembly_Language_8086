.model small
.stack 100h
.data

num1 db 'Enter first number$'
num2 db 'Enter second number$'
result db 'Result: $'

main proc
    ;initiate data
    mov ax, @data
    mov ds, ax
    
    ;print string 1
    mov ah,9
    lea dx, num1
    int 21h
    
    ;for space
    mov dl, ' '
    mov ah,2
    int 21h
    
    ;input first number
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    ;for next line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    ;print string 2
    mov ah,9
    lea dx, num2
    int 21h
    
    ;for space
    mov dl, 32
    mov ah,2
    int 21h
    
    ;input second number
    mov ah,1
    int 21h
    sub al,48
    mov bh,al
    
    add bl,bh
    
    add bl,30h
    
    ;for next line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    ;print string 3
    mov ah,9
    lea dx, result
    int 21h
    
    ;result
    mov dl,bl
    mov ah, 2
    int 21h
        
    ;for end
    mov ah,4ch
    int 21h
    
    main endp
end main
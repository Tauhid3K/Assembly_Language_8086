
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
a DB 'Enter two numbers$'
b DB 10,13,'Largest number$'    ; 10 next line and 13 cursor at beginning
c Db 10,13,'They are equal$'

.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1 
    int 21h
    mov bl, al  ;First number
    
    mov ah, 1
    int 21h
    mov bh, al  ;Second number
                              
    biggest:                           
    cmp bl, bh
    jg label11  ; jump grater = jg
    jl label12  ; actual jump
    je equal
    
    label12:
    mov ah, 9
    lea dx, b
    int 21h
    
    mov dl, bh
    mov ah, 2
    int 21h
    jmp exit
    
    
    label11:
    mov ah, 9
    lea dx, b
    int 21h
    
    mov dl, bl
    mov ah, 2
    int 21h
    jmp exit
     
    
    equal:
    mov ah, 9
    lea dx, c
    int 21h      
    
    exit:
    mov ah, 4ch
    int 21h           
    
main endp
end main
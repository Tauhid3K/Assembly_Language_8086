
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.code

main proc   
    
    ; for user input
    
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48  ;asci to decimal
    
    mov cx, 3
    mov cl, bl  ; moving value of bl to cl in cx to count
    
    mov ah, 2
    mov dl, 13
    int 21h

    mov ah, 2
    mov dl, 10
    int 21h
    
    ;mov cx,3 
             
    ; for seiral print
             
    ;mov ah,2
    ;mov dl, 'x'
    ;top:
    ;int 21h
    ;loop top
                
    ; for line by line print            
    top: 
    mov ah,2
    mov dl,'x'
    int 21h 
    
    mov ah, 2
    mov dl, 13
    int 21h

    mov ah, 2
    mov dl, 10
    int 21h
    
    loop top
             
             
    exit:
    mov ah, 4ch
    int 21h
        
main endp
end main
.model small
.stack 100h
.code 

main proc
    mov ah,1    ;for 1 ah become input function
    int 21h     ;stored in al
    mov bl,al   ;store input to bl low part 
    
    mov dl,32   ;move space to dl output (using ascii)
    mov ah,2
    int 21h     ;pritn space
    
    mov ah,1    ;for 1 ah become input function
    int 21h     ;stored in al
    mov bh,al   ;store input to bh high part
    
    mov dl,32   ;move space to dl output (using ascii)
    mov ah,2
    int 21h     ;pritn space
    
    mov dl,bl   ;move value to print
    mov ah,2    ;for 2 ah become output function
    int 21h     ; print 
    
    mov dl,' '  ;move space to dl output
    mov ah,2
    int 21h     ;pritn space
    
    
    mov dl,bh   ;move value to print
    mov ah,2    ;for 2 ah become output function
    int 21h     ; print  
    
    mov ah,4ch  ;terminate program
    int 21h     ;exicute it
main endp

end main

.model small
.stack 100h
.data

msg0 db 4              ;db = Define Byte
msg1 db 5
msg2 db 2
num db ? 
string db "I am Tauhid shahriar$"

.code
main proc
    mov ax, @data     ;load the address of the data segment into ax
    mov ds, ax        ;ds is set so that programm can access variables like msg
    
    ;print 
    mov ah,2          ;output function 
    mov dl, msg0      ;load the value stored at msg into dl
    add dl, 48  
    int 21h   
                      
    mov dl,32         ;print space
    mov ah,2
    int 21h
    
    mov al, msg1      ; load 1st number
    
    add al, msg2      ; load 2nd number and add with 1st
    
    add al, 48        ; convert it to ascii
    
    mov dl,al         ;print result 
    mov ah,2
    int 21h 
    
    mov dl,32         ;print space
    mov ah,2
    int 21h
    
    mov ah,1          ;user input
    int 21h
    
    mov num, al       ;stores into varables  
    
    mov ah, 2         ;print next line
    mov dl, 13
    int 21h
    mov dl, 10 
    int 21h         
    
    mov dl,num        ;print it
    mov ah,2
    int 21h  
    
    mov ah, 2         ;print next line
    mov dl, 13
    int 21h
    mov dl, 10 
    int 21h                   
    
    mov ah,9          ;function to print string
    lea dx, string    ;load address of string
    int 21h   
                        
    mov ah, 4ch
    int 21h
main endp
end main
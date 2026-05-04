.model small
.stack 100h

.data
q1 db 'Enter first number $'
q2 db 'Enter second number $'
r db 'Result: $'
num1 db ?
num2 db ?
msg db 'Finish$'

.code 
main proc 
    
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx, q1
    int 21h
      
    ;For print space
    mov ah,2
    mov dl,32
    int 21h
    
    ;For input number 1
    mov ah,1
    int 21h
    sub al,48         
    mov num1,al
    
    
    ;For print new line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx, q2
    int 21h
    
    ;For input number 2
    mov ah,1
    int 21h 
    sub al,48         
    mov num2,al
    
     
    ;For print new line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
     
    mov ah,9
    lea dx,r
    int 21h
    
    ;For print new line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;Addition  
    mov al,num1
    add al,num2
    add al,48         
    
    ;Print Addition result
    mov ah,2
    mov dl,al
    int 21h 
    
    
    ;For print new line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    
    ;Subtraction 
    mov al, num1
    sub al, num2
    add al,48         
    
    ;Print Subtraction result
    mov ah,2
    mov dl,al
    int 21h 
    
    
    ;For print new line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    
    ;Multiplication
    mov al, num1
    mul num2
    add al,48
    
    mov dl,al
    mov ah,2
    int 21h
    
    
    ;For print new line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
           
           
           
    ; (Division) 
    mov ah,0
    mov al,num1
    div num2
    add al,48
    
    mov dl, al
    mov ah,2
    int 21h
    
    
    
    ;For print new line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
           
    ;For print string   
    mov ah,9
    lea dx,msg
    int 21h  
    
    
    mov ah,4ch
    int 21h
main endp
end main
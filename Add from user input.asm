.model small
.stack 100h
.code 

main proc
    ; first input
    mov ah,1
    int 21h
    sub al,48      ;converting to number
    mov bl,al

    ; space
    mov dl,32
    mov ah,2
    int 21h

    ; second input
    mov ah,1
    int 21h
    sub al,48      ; converting to number
    mov bh,al

    ; add
    add bl,bh      ;

    ; convert result to ASCII
    add bl,30h     ;(30h is hexadecimal of 48)

    ; new line
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h

    ; print result
    mov dl,bl
    mov ah,2
    int 21h

    ; exit
    mov ah,4ch
    int 21h

main endp
end main

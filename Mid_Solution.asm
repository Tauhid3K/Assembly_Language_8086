.model small
.stack 100h

.data
msg1 db 10,13,"1.Add 2.Sub 3.Mul 4.Div 5.Exit $"
msg2 db 10,13,"Enter first number (0-9): $"
msg3 db 10,13,"Enter second number (0-9): $"
msg4 db 10,13,"Choose option (1-5): $"
msg5 db 10,13,"Result: $"
msg6 db 10,13,"Error: Division by zero $"
msg7 db 10,13,"Continue? (1/0): $"
msg8 db 10,13,"Error: Negative result $"
msg9 db 10,13,"Error: Result > 9 $"

.code
main proc
    mov ax,@data
    mov ds,ax

start:
    ; show menu
    mov ah,9
    lea dx,msg1
    int 21h

    ; choose operation
    mov ah,9
    lea dx,msg4
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov cl,al

    cmp cl,5
    je exit_prog

    ; input first number
    mov ah,9
    lea dx,msg2
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bl,al

    ; input second number
    mov ah,9
    lea dx,msg3
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bh,al

    ; print result label
    mov ah,9
    lea dx,msg5
    int 21h

    ; operations
    cmp cl,1
    je addi

    cmp cl,2
    je subi

    cmp cl,3
    je muli

    cmp cl,4
    je divi

addi:
    mov al,bl
    add al,bh
    cmp al,9
    ja add_error
    jmp print

subi:
    mov al,bl
    sub al,bh
    cmp al,0
    jl sub_error
    jmp print

muli:
    mov al,bl
    mul bh
    cmp al,9
    ja mul_error
    jmp print

divi:
    cmp bh,0
    je div_error
    mov al,bl
    mov ah,0
    div bh
    jmp print

add_error:
    mov ah,9
    lea dx,msg9
    int 21h
    jmp conti

sub_error:
    mov ah,9
    lea dx,msg8
    int 21h
    jmp conti

mul_error:
    mov ah,9
    lea dx,msg9
    int 21h
    jmp conti

div_error:
    mov ah,9
    lea dx,msg6
    int 21h
    jmp conti

print:
    add al,48
    mov dl,al
    mov ah,2
    int 21h

conti:
    mov ah,9
    lea dx,msg7
    int 21h

    mov ah,1
    int 21h

    cmp al,'1'
    je start

exit_prog:
    mov ah,4ch
    int 21h

main endp
end main
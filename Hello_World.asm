.model small
.stack 100h

.data
msg db "Hello, World!$"

.code
start:
    mov ax, @data
    mov ds, ax

    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
end start

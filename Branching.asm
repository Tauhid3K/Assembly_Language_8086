.model small
.stack 100h

.data
msg1 db 10,13,"1.Addition 2.Subtraction 3.Multiplication 4.Division 5.Exit $"
msg2 db 10,13,"Enter first number (0-9): $"
msg3 db 10,13,"Enter second number (0-9): $"
msg4 db 10,13,"Choose option (1-5): $"
msg5 db 10,13,"Result: $"
msg6 db 10,13,"Error: Division by zero $"
msg7 db 10,13,"Continue? (1/0): $"
msg8 db 10,13,"Error: Invalid option $"
msg9 db 10,13,"Error: Result > 9 (only single digit allowed) $"
msg10 db 10,13,"Error: Negative result $"
msg11 db 10,13,"--- Demonstrating JMP, JE, JNE, JC --- $"

.code
main proc
    mov ax,@data
    mov ds,ax

start:
    ; Show heading
    mov ah,9
    lea dx,msg11
    int 21h

    ; Show menu
    mov ah,9
    lea dx,msg1
    int 21h

    ; Choose operation
    mov ah,9
    lea dx,msg4
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov cl,al

    ; Using JE (Jump if Equal) - check for exit
    cmp cl,5
    je exit_prog          ; JE - if CL equals 5, jump to exit

    ; Using JNE (Jump if Not Equal) - check invalid option
    cmp cl,1
    jne check_two         ; JNE - if CL not equal 1, jump to check_two
    
    ; If CL = 1, fall through to get numbers
    jmp get_numbers       ; JMP - unconditional jump

check_two:
    cmp cl,2
    jne check_three
    jmp get_numbers

check_three:
    cmp cl,3
    jne check_four
    jmp get_numbers

check_four:
    cmp cl,4
    jne invalid_option
    jmp get_numbers

get_numbers:
    ; Input first number
    mov ah,9
    lea dx,msg2
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bl,al

    ; Input second number
    mov ah,9
    lea dx,msg3
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bh,al

    ; Print result label
    mov ah,9
    lea dx,msg5
    int 21h

    ; Perform operation based on CL
    cmp cl,1
    je addition           ; JE - if CL equals 1

    cmp cl,2
    je subtraction        ; JE - if CL equals 2

    cmp cl,3
    je multiplication     ; JE - if CL equals 3

    cmp cl,4
    je division           ; JE - if CL equals 4

addition:
    mov al,bl
    add al,bh
    ; Using JC (Jump if Carry) - check if result > 9
    jc add_overflow       ; JC - if carry flag is set (result > 9)
    jmp display_result    ; JMP - unconditional jump to display

add_overflow:
    mov ah,9
    lea dx,msg9
    int 21h
    jmp continue_prog     ; JMP - unconditional jump

subtraction:
    mov al,bl
    sub al,bh
    ; Using JC (Jump if Carry) - check if result is negative
    jc sub_negative       ; JC - if carry flag is set (negative result)
    jmp display_result    ; JMP - unconditional jump

sub_negative:
    mov ah,9
    lea dx,msg10
    int 21h
    jmp continue_prog

multiplication:
    mov al,bl
    mul bh
    ; Using JC (Jump if Carry) - check if result > 9
    jc mul_overflow       ; JC - if carry flag is set
    jmp display_result

mul_overflow:
    mov ah,9
    lea dx,msg9
    int 21h
    jmp continue_prog

division:
    cmp bh,0
    je div_error          ; JE - if BH equals 0
    mov al,bl
    mov ah,0
    div bh
    ; Using JC - check if division caused overflow
    jc div_overflow       ; JC - if carry flag is set
    jmp display_result

div_error:
    mov ah,9
    lea dx,msg6
    int 21h
    jmp continue_prog

div_overflow:
    mov ah,9
    lea dx,msg9
    int 21h
    jmp continue_prog

invalid_option:
    mov ah,9
    lea dx,msg8
    int 21h
    jmp continue_prog

display_result:
    ; Check if result is single digit using JNE
    cmp al,9
    jne single_digit      ; JNE - if AL not equal 9, jump to single_digit
    
    ; If AL = 9, it's still a single digit
    jmp print_result

single_digit:
    cmp al,10
    jb print_result       ; JB - Jump if Below (unsigned < 10)
    
    ; If result >= 10, show overflow
    mov ah,9
    lea dx,msg9
    int 21h
    jmp continue_prog

print_result:
    add al,48
    mov dl,al
    mov ah,2
    int 21h

continue_prog:
    mov ah,9
    lea dx,msg7
    int 21h

    mov ah,1
    int 21h

    cmp al,'1'
    je start              ; JE - if AL equals '1'

exit_prog:
    mov ah,4ch
    int 21h

main endp
end main
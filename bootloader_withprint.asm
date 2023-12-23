org 0x7c00
bits 16
start: jmp boot
msg: db "Welcome to My Operating System!", 0ah, 0dh, 0h
opsystem_name: db "The Most Useless and Purposeless about Anything Entertainment and Usage System (aka w****)", 0x0

print:
    push bp ; saving ebp
    mov bp, sp

    mov bx, [bp+0x4]
    mov cx, [bp+0x8]
    sub bx, 0x1
    print_loopstart:
        add bx, 0x1
        sub cx, 0x1
        mov al, [bx]
        int 0x10
        ;cmp cx, 0x0
        ;je returner
        cmp al, 0x0
        jne print_loopstart
    returner:
        pop bp
        sub sp, 0x8
        ret



boot:

reserve_stack:
    mov bp, 0x8000
    mov sp, bp

mov ah, 0x0e ; tty mode

; saving the registers
push ax
push cx
push dx

; parameters
push 0x5
push opsystem_name

; function
call print

; restoring registers
pop dx
pop cx
pop ax

cli
cld
jmp $ ; infinite loop


times 510 - ($-$$) db 0
dw 0xAA55

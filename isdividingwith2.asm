section .text
	global _start

_start:
	; Writing "Input:"
	mov eax, 4
	mov ebx, 1
	mov ecx, inputMsg
	mov edx, lenInputMsg
	int 0x80

	; Inputting control number 
	mov eax, 3
	mov ebx, 0
	mov ecx, inputNumber
	mov edx, 1
	int 0x80

	mov eax, [inputNumber]
	sub eax, '0'
	cmp eax, 0 
	je outprog

	mov ebx, '1' ; 00001
	sub ebx, '0'
	and ebx, eax
	jz tt

	mov eax, 4
	mov ebx, 1
	mov ecx, falseMsg
	mov edx, lenFl
	int 0x80
	jmp restart

tt:
	mov eax, 4
	mov ebx, 1
	mov ecx, trueMsg
	mov edx, lenTr
	int 0x80
	jmp restart

restart:
	jmp _start ; looping program

outprog:
	mov eax, 1
	int 0x80


section .data



trueMsg db "TRUE",0xA
lenTr  equ $-trueMsg
falseMsg db "FALSE",0xA
lenFl equ $-falseMsg
inputMsg db "Number:"
lenInputMsg equ $-inputMsg

segment .bss 
inputNumber resb 2
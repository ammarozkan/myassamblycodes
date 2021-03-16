section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, firstNumMsg
	mov edx, lenFirstNumMsg
	int 0x80

	; getting first number
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, secondNumMsg
	mov edx, lenSecondNumMsg
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 1
	int 0x80

	; printing multi result text
	mov eax, 4
	mov ebx, 1
	mov ecx, resultMsg
	mov edx, lenResultMsg
	int 0x80

	; Multi
	mov eax, [num1]
	sub eax, '0'
	mov ebx, [num2]
	sub ebx, '0'
	MUL ebx
	add eax, '0'
	mov [res], eax 

	; Printing Multi Result
	mov ecx, res 
	mov edx, 2
	mov ebx, 1
	mov eax, 4
	int 0x80

	; Printing 'Adding Result' text
	mov eax, 4
	mov ebx, 1
	mov ecx, addingMsg
	mov edx, lenAddingMsg
	int 0x80

	; Adding
	mov eax, [num1]
	sub eax, '0'
	mov ebx, [num2]
	sub ebx, '0'
	add eax, ebx
	add eax, '0'
	mov [res], eax 

	; Printing adding result
	mov eax, 4
	mov ebx, 1
	mov ecx, res 
	mov edx, 2
	int 0x80

	; Printing 'Subtract Result' text
	mov eax, 4
	mov ebx, 1
	mov ecx, subtractMsg
	mov edx, lenSubtractMsg
	int 0x80

	; Subtracting
	mov eax, [num1]
	sub eax, '0'
	mov ebx, [num2]
	sub ebx, '0'
	sub eax, ebx 
	add eax, '0'
	mov [res], eax 

	;  Printing subtract result
	mov eax, 4
	mov ebx, 1
	mov ecx, res 
	mov edx, 2
	int 0x80

	; Printing 'Division Result' text
	mov eax, 4
	mov ebx, 1
	mov ecx, divisionMsg
	mov edx, lenDivisionMsg
	int 0x80

	; Division 
	mov eax, [num1]
	sub eax, '0'
	mov ebx, [num2]
	sub ebx, '0'
	DIV ebx 
	add eax, '0'
	mov [res], eax

	; Printing division result
	mov eax, 4
	mov ebx, 1
	mov ecx, res 
	mov edx, 2
	int 0x80

	; EXIT
	mov eax, 1 
	int 0x80



section .data
	firstNumMsg db 'Please gimme first:'
	lenFirstNumMsg equ $-firstNumMsg
	secondNumMsg db 'Please gimme second:'
	lenSecondNumMsg equ $-secondNumMsg
	resultMsg db "M:"
	lenResultMsg equ $-resultMsg
	addingMsg db "A:"
	lenAddingMsg equ $-addingMsg
	subtractMsg db "S:"
	lenSubtractMsg equ $-subtractMsg
	divisionMsg db "D:"
	lenDivisionMsg equ $-divisionMsg

	newline db ".",0x0a
	lenNewLine equ $-newline

segment .bss 
	num1 resb 2
	num2 resb 2
	res resb 1
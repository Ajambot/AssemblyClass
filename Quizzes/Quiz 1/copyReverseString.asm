COMMENT !
Program: ReverseString
Name: Martin Morales Arana
Student ID: 1172178
Quiz 1, Q2

Description: Copies a string from source to target, reversed
!

ExitProcess PROTO
 
.data
source BYTE "Hello World!", 0
target BYTE 20 DUP(?)
 
.code
main PROC
mov ecx, LENGTHOF source
mov rdi, OFFSET target
mov rsi, OFFSET source ; pointer to first element
; Move pointer to last element
mov rbx, LENGTHOF source-1
add rsi, rbx

L1:
	mov al, [rsi]
	mov [rdi], al
	add rdi, 1
	sub rsi, 1
	loop L1

; Return 0
mov   ecx,0	
call  ExitProcess
main ENDP
END 
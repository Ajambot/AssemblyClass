COMMENT !
Program: FibToN
Name: Martin Morales Arana
Student ID: 1172178
Assignment 2, Q4

Description: 
Generates first N numbers of fibonacci sequence
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
fib DWORD 1, 1, 100 DUP(?) ; fib output array
N DWORD 47 ; number of elements to be output
 
.code
main PROC
mov esi, OFFSET fib
mov ecx, N
sub ecx, 2
call fibonacci ; call fibonacci procedure with array pointer, and number of fibonacci numbers to generate


; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

; Fibonacci procedure generates fibonacci sequence up to N
fibonacci PROC
	; Offset start index by 2
	mov eax, TYPE fib 
	imul eax, eax, 2
	add esi, eax
L1:
	mov ebx, [esi-4] ; get element i-1
	add ebx, [esi-8] ; get element i-2
	mov [esi], ebx ; generate current fibonacci
	add esi, TYPE fib ; next index
	loop L1
fibonacci ENDP

END main
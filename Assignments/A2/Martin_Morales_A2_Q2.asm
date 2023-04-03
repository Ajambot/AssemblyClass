COMMENT !
Program: MovArrUp
Name: Martin Morales Arana
Student ID: 1172178
Assignment 2, Q2

Description: 
Moves all elements of an array forward one index
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
arr DWORD 10h, 20h, 30h, 40h

.code
main PROC
mov esi, OFFSET arr ; get pointer to first element 
mov ecx, LENGTHOF arr ; loop 1 time for each element

; Get last element (previous) and store in eax
mov eax, OFFSET arr 
mov ebx, LENGTHOF arr-1
imul ebx, ebx, TYPE arr
add eax, ebx
mov eax, [eax]

L1:
	xchg eax, [esi] ; change previous with current
	add esi, TYPE arr ; Move pointer to next element
	loop L1 ; loop

; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

END main
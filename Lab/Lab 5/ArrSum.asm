COMMENT !
Program: arrSum.asm
Name: Martin Morales Arana
Student ID: 1172178
Lab 5, Q1

Description: 
Returns sum of elements of array in range [j, k]
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
j DWORD 3
k DWORD 6
arr DWORD 1, 2, 3, 4, 5, 6, 7, 8
 
.code
main PROC
mov esi, OFFSET arr ; pass pointer to array
mov ebx, j ; pass j
mov ecx, 2 ; Repeat call 2 times
mov edx, k ; pass k
L1:
	; Push registers to restore after call
	push esi
	push ebx
	push ecx
	push edx
	mov ecx, LENGTHOF arr ; pass length of array
	call arrSum ; call procedure
	; restore values
	pop edx
	pop ecx
	pop ebx
	pop esi
	loop L1

; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

arrSum PROC
	; Calculate amount of elements to add and store in ecx (loop counter)
	mov ecx, edx
	sub ecx, ebx
	inc ecx ; k-j+1 (inclusive)
	; Offset start of array by j indexes
	imul ebx, ebx, 4
	sub ebx, 4
	add esi, ebx
	mov eax, 0 ; clear eax register for sum
L2:
	; add current element, increase index and loop
	add eax, [esi]
	add esi, TYPE arr
	loop L2
	ret
arrSum ENDP

END main
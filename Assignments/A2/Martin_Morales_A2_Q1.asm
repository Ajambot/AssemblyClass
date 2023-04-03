COMMENT !
Program: ReverseString 
Name: Martin Morales Arana
Student ID: 1172178
Assignment 2, Q1

Description: 
Copies a source string to a target string, but reversed
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')

.code
main PROC
mov ecx, LENGTHOF source-1 ; loop counter = lengthof source-1 to ignore nul character
mov esi, 0 ; first position of source string
mov edi, LENGTHOF source-1 ; move edi to last index of target string
mov target[edi], 0 ; insert a null character
dec edi ; start from lengthof source-2

L1:
	mov al, source[esi] ; copy current character to al
	mov target[edi], al ; copy current character to target
	dec edi ; next index
	inc esi ; next index
	loop L1

mov edx, OFFSET target ; store address of string to be printed
call WriteString

; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

END main
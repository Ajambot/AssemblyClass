COMMENT !
Program: String4Colors.asm
Name: Martin Morales Arana
Student ID: 1172178
Lab 4, Q1

Description: 
Prints a string in 4 combinations of colors
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
sentence BYTE "Hello World! ",0
foreground DWORD 6
background DWORD 0
 
.code
main PROC
mov ecx, 4 ; loop counter 4 colors
mov edx, OFFSET sentence ; String to be printed

L1:
	imul eax, foreground, 16 ; foreground*16
	add eax, background ; background+foreground*16
	call SetTextColor
	call WriteString
	inc foreground ; Next foreground color
	inc background ; Next background color
	loop L1

; Reset default colors
mov  eax, white+(black*16)
call SetTextColor

; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

END main
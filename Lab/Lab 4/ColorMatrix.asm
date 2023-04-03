COMMENT !
Program: ColorMatrix.asm
Name: Martin Morales Arana
Student ID: 1172178
Lab 4, Q2

Description: 
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
character BYTE "X", 0
foreground DWORD 0
background DWORD 0
 
.code
main PROC
mov ecx, 16 ; loop for each color from 0 to 15
mov edx, OFFSET character ; character to be printed
L1:
	push ecx ; push outer loop counter
	mov ecx, 16 ; set inner loop counter
	mov background, 0 ; reset background counter
L2: 
	imul eax, foreground, 16 ; foreground color
	add eax, background ; background color
	call SetTextColor
	call WriteString
	inc background ; generate next background color
	loop L2
	pop ecx ; pop outer counter loop
	inc foreground ; increment foreground color
	call CRLF ; Insert endline
	loop L1
	
; Reset default colors
mov  eax, white+(black*16) 
call SetTextColor

; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

END main
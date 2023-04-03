COMMENT !
Program: RanStrings.asm
Name: Martin Morales Arana
Student ID: 1172178
Assignment 2, Q3

Description: 
The program generates 20 random strings (with only uppercase letters) of length L
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
asciiOffset DWORD 65 ; ASCII code for A. Offset for ASCII code
L BYTE 10 ; Length of strings
ranStr BYTE 100 DUP(?) ; Store randomly generated string here
 
.code
main PROC
movzx eax, L
mov ebx, OFFSET ranStr
mov ecx, 20
call Randomize ; Call procedure passing length of string, and pointer to output string
; Generate 20 random strings
L1:
	; Save current values of ecx and eax
	push ecx
	push eax
	call ranString
	; Restore values of ecx and eax
	pop eax
	pop ecx
	; Print string
	mov edx, OFFSET ranStr
	call WriteString
	call CRLF
	loop L1

; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

; ranString procedure generates a random string with uppercase letters
ranString PROC
	mov ecx, eax ; Move length of string to loop counter
	mov esi, 0 ; start index
L2:
	mov eax, 26 ; Select character
	call RandomRange
	add eax, asciiOffset ; Add ascii offset to get upper case letter
	mov ranStr[esi], al ; Add character to string
	inc esi ; next index
	loop L2
	mov ranStr[esi], 0 ; null character
	ret
ranString ENDP



END main
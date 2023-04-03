COMMENT !
Program: 
Name: Martin Morales Arana
Student ID: 1172178
Lab 5, Q2

Description: 
Generates letter grade given a number grade
!
INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
 
.data
grades BYTE 'A', 'B', 'C', 'D', 'F' ; Letter Grades
format BYTE " -> " ; string for format
 
.code
main PROC
call Randomize ; seed the randomizer
mov ecx, 10 ; loop 10 times
mov edx, OFFSET format ; point to format string
L1:
	mov eax, 51 ; Generate random number from 0-50
	call RandomRange
	add eax, 50 ; Add 50 so it's in range 50-100
	mov ebx, eax ; pass random number in ebx
	call CalcGrade ; call CalcGrade procedure
	call WriteChar ; Write letter grade in al
	call WriteString ; Write format string
	mov eax, ebx
	call WriteDec ; write number grade for reference
	call CRLF ; carriage return
	loop L1


; Return 0
mov   ecx,0	
INVOKE ExitProcess, eax
main ENDP

CalcGrade PROC
	CMP ebx, 60 ; if grade below 60 -> F
	jb F
	CMP ebx, 70 ; else if grade below 70 -> D
	jb D
	CMP ebx, 80 ; else if grade below 80 -> C
	jb CGrade
	CMP ebx, 90 ; else if grade below 90 -> B
	jb B
	jmp A ; else grade -> A
A:
	mov eax, 'A'
	ret
B:
	mov eax, 'B'
	ret
CGrade:
	mov eax, 'C'
	ret
D:
	mov eax, 'D'
	ret
F:
	mov eax, 'F'
	ret

CalcGrade ENDP

END main
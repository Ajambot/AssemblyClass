COMMENT ! 
Morales_Martin_Lab2_Q2
Name: Martin Morales Arana
Student ID: 1172178
Lab 1, Q2
The program declares 4 variables A, B, C and sum, with initialized values.
It then adds A, B, and C together and it stores it in sum
!

ExitProcess proto

; Declare A, B, C and sum as variables and initialize with values
.data
A qword 5
B qword 9
C qword 37
sum qword 0

.code
main proc
	; Clear registers
	mov rax,0
	mov rbx,0
	mov rcx,0

	mov rax,A		; Put value of variable A in register rax
	mov rbx,B		; Put value of variable B in register rbx
	mov rcx,C		; Put value of variable A in register rax
	add rax, rbx	; A+=B 	(5+9=14=0xE)
	add rax, rcx	; A+=C (14+37=51=0x33)
	mov sum,rax		; Put result of sum in sum variable

	; Return 0
	mov   ecx,0	
	call  ExitProcess

main endp
end

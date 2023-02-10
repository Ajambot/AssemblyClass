COMMENT !
Morales_Martin_Lab2_Q1
Name: Martin Morales Arana
Student ID: 1172178
Lab 1, Q1
The program declares 5 variables A, B, C, D and sum with initialized values and
then it does the following operation A=(A+B)-(C+D) and it stores it in sum
!

ExitProcess proto

.data
A qword 5
B qword 9
C qword 1
D qword 12
sum qword 0

.code
main proc
	; Clear registers
	mov rax,0
	mov rbx,0
	mov rcx,0
	mov rdx,0

	mov	rax,A	; rax=A=5=0x5
	mov rbx,B	; rbx=B=9
	mov rcx,C	; rcx=C=1
	mov rdx,D	; rdx=D=12
	add	rax,rbx	; A=A+B=14
	add rcx,rdx	; C=C+D=13
	sub rax,rcx	; A = (A+B)-(C+D) = 1
	mov   sum,rax ; Move the sum to our sum variable

	; Return 0
	mov   ecx,0	
	call  ExitProcess

main endp
end

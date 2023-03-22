COMMENT !
Program: MoveArrUp
Name: Martin Morales Arana
Student ID: 1172178
Quiz 1, Q1

Description: Moves all elements of an array up one index
!

ExitProcess PROTO
 
.data
arr DWORD 40h, 10h, 20h, 30h
 
.code
main PROC
mov eax, arr ; get first element (previous)
mov ecx, LENGTHOF arr ; loop 1 time for each element
mov rsi, OFFSET arr ; pointer to first element
; Move pointer to last element
mov rbx, LENGTHOF arr-1
imul rbx, rbx, 4
add rsi, rbx

L1:
	xchg eax, [rsi] ; change previous with current
	sub rsi, 4 ; Move one position back
	loop L1 ; loop

; Return 0
mov   ecx,0	
call  ExitProcess
main ENDP
END 
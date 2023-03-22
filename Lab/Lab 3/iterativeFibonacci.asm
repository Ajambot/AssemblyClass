COMMENT !
Program: Iterative Fibonacci
Name: Martin Morales Arana
Student ID: 1172178
Lab 3, Q2

Description: Finds the first 7 fibonacci numbers
!

ExitProcess PROTO
 
.data
n DWORD 7h
fibonacci WORD 1h, 1h, 5 DUP(?)
 
.code
main PROC

mov ecx, n ; loop counter
sub ecx, 2 ; reduce counter by 2 since we already have the first two elements
mov rsi, OFFSET fibonacci+4 ; pointer to element 2 (0 indexed) of the array

Fib:
	mov rax, 0 ; clear register
	add ax, [rsi-2] ; fetch the previous number
	add ax, [rsi-4] ; fetch the second previous number
	mov [rsi], ax ; Move result of addition of two previous numbers to fib array
	add rsi, 2 ; Increase index by 1
	loop Fib

; Return 0
mov   ecx,0	
call  ExitProcess
main ENDP
END 
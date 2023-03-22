COMMENT !
Program:  wordtodwordarr.asm
Name: Martin Morales Arana
Student ID: 1172178
Lab 3, Q1

Description: Program copies all the values form an unsigned word array to an unsigned double word array
!

ExitProcess PROTO
 
.data
wArray WORD 7623h, 1237h, 2133h, 83CDh, 1237h, 64A3h ; Word array
dArray DWORD 4 DUP(?) ; Uninitialized DoubleWord array
 
.code
main PROC

mov ecx, LENGTHOF wArray ; Loop counter for each element in source array
mov rsi, OFFSET wARRAY ; Pointer to start of word array
mov rdi, OFFSET dArray ; Pointer to start of double array

Copy:
	mov eax, 0 ; clear eax for 0 extension
	mov ax, [rsi] ; mov value of current element to lower 16 bits of eax
	mov [rdi], eax ; mov eax to copy array
	add rsi, TYPE wArray ; increment element by 1
	add rdi, TYPE dArray ; increment element by 1
	
	loop Copy 

; Return 0
mov ecx, 0
call ExitProcess

main ENDP
END
 

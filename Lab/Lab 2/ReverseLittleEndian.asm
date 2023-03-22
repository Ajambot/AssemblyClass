COMMENT !
Program: ReverseLittleEndian.asm
Name: Martin Morales Arana
Student ID: 1172178
Lab 2, Q1

Description: Transforms the order of a variable from little endian to big endian
!

ExitProcess PROTO
 
.data
num DWORD 12345678h
 
.code
main PROC
mov al, BYTE PTR num ; Load the first byte (78) into al
mov rsi, OFFSET num ; Pointer to front of array
xchg al, [rsi+3] ; Exchange the last byte (12) with al (78)
xchg al, [rsi] ; Exchange al (12) with first byte (78)
mov al, BYTE PTR [rsi+1] ; Load al with second byte (56)
xchg al, [rsi+2] ; Exchange al (56) with the third byte (34)
xchg al, [rsi+1] ; Exchange al (34) with the second byte (56)

; Return 0
mov   ecx,0	
call  ExitProcess
main ENDP
END 
 

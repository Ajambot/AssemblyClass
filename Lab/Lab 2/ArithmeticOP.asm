COMMENT !
Program: ArithmeticOP.asm
Name: Martin Morales Arana
Student ID: 1172178
Lab 2, Q2

Description: Calculates the following arithmetic Operation R = -X + (Y-Z)
!

ExitProcess PROTO
 
.data
X WORD 26
Y WORD 30
Z WORD 40
sum WORD ?
 
.code
main PROC
mov ax, X ; ax=26
mov bx, Y ; bx = 20
mov cx, Z ; cx = 30
neg ax ; ax=-26
sub bx, cx ; bx = -10
add ax, bx ; ax = -36
mov sum, ax ; sum = ax = -36

; Return 0
mov   ecx,0	
call  ExitProcess
main ENDP
END 
 

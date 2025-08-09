; This program repeatedly adds the value 0x0A (10 decimal) to the accumulator, 
; using a counter in R0 to track the number of additions, 
; and stops after performing the addition 10 times.
; Date: 09-08-2025
; Author: Harshak V P
		
		ORG 00H
		MOV R0, #00H ; Initializing the counter to 0.
		MOV A, #00H ; Initializing the accumulator to 0.
		MOV B, #0AH ; Initializing the register B to 0x0A.
	
REPEAT: ADD A, B ; Adding A and B.
		INC R0 ; Increamenting the counter.
	
		CJNE R0, #0AH, REPEAT ; Checking if the counter value is not equal to 10, if yes repeating the addition, else exiting.
		MOV R5, A ; Moving Results to R5.
		END
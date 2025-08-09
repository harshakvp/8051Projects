; The program loads 16 into the accumulator and uses a loop with DEC and JNZ to count down to zero.
; Date: 09-08-2025
; Author: Harshak V P
		
		ORG 00H
		MOV A, #10H
REPEAT: DEC A
		JNZ REPEAT
		END
; This program sums 10 bytes stored in consecutive RAM locations starting from 40H, 
; counts the number of carries generated during the additions, and stores the 16-bit result (LSB at the first free address, 
; MSB at the next) in RAM.
; Date: 09-08-2025
; Author: Harshak V P
		
		ORG 00H
        CLR PSW.7 ; Clear the carry flag (CY) in the Program Status Word.
        MOV R0, #0AH ; Loop counter = 10 (number of additions to perform).
        MOV R1, #40H ; R1 holds the starting internal RAM address of the data.
        MOV R3, #00H ; R3 will store the number of carry occurrences (carry counter).
        MOV A, #00H ; Accumulator starts at 0 (sum initially zero).
	
REPEAT: ADD A, @R1 ; Add A with the value in RAM location pointed by R1.
        JNC NEXT ; If no carry is generated, skip incrementing the carry counter.
        INC R3 ; If a carry occurred, increment carry counter (R3).
NEXT:   INC R1 ; Move R1 to point to the next RAM location.
        DJNZ R0, REPEAT ; Repeat until all additions are done (R0 decrements to zero).
        
        MOV @R1, A ; Store the LSB of the sum in the next RAM location.
        INC R1 ; Move to the next RAM address.
		MOV A, R3 ; Move the carry counter from R3 into the accumulator for storing.
        MOV @R1, A ; Store the carry count (MSB of sum) in the next RAM location.
        
        SJMP $ ; Infinite loop to end program execution.
        END
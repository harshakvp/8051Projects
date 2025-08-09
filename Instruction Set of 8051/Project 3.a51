; This program reads two bytes from external memory at addresses 3000H and 3001H, adds them, and stores the result at address 3002H.
; Data: 09-08-2025
; Author: Harshak V P

ORG 00H
MOV DPTR, #3000H ; Storing the initial address of 3000H of the external memory in DPTR.
MOVX A, @DPTR 	 ; Moving the data in the 3000H memory location to accumulator.
MOV R0, A 		 ; Moving the data in the accumulator to R0.
INC DPTR 		 ; Increamenting the DPTR address from 3000H to 3001H.
MOVX A, @DPTR 	 ; Moving the data in the 3001H memory location to accumulator.
ADD A, R0 		 ; Adding both the data.
INC DPTR         ; Increamenting the DPTR address from 3001H to 3002H.
MOVX @DPTR, A 	 ; Moving the result in the accumulator to 3002H memory location.
END
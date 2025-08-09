; This program switches to register bank 1 to load values into R2 and R3, adds them using the accumulator, 
; then switches back to register bank 0 and stores the sum in R4.
; Date: 09-08-2025
; Author: Harshak V P

ORG 00H
; Selecting register bank 1.
CLR PSW.4
SETB PSW.3

; Loading the data into registers R2 & R3.
MOV R2, #40H
MOV R3, #50H
MOV A, R2

; Adding the data in the registers.
ADD A, R3

; Selecting the register bank 0.
CLR PSW.4
CLR PSW.3

; Moving the results to R4
MOV R4, A
END
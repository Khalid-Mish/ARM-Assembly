.section .text
.align 2
.global _start
_start: MOV R0,#2
	MOV R1, #4
	MOV R2, #2
	MOV R3, #3
	MUL R4, R0, R3
	MUL R5, R1, R2
	SUB R6, R4, R5
_end:   b _end

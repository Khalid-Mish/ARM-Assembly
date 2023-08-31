.section .text
.align 2
.global _start

_start:
    mov r2, r0      
    b check_divisor

euclid_loop:
    mov r3, r2      
    mov r2, r1      
    mov r0, r3      
    b check_divisor

check_divisor:
    cmp r1, #0      
    beq halt        
    udiv r1, r0, r1 
    mls r1, r1, r2, r0  
    b euclid_loop   

halt:
    b halt          


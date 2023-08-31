.section .text
.align 2
.global _start

_start: 
       MOV R0, #10 
       MOV R1, #3    

_loop:
       TST R0, #1   
       BEQ _even     
       
      
       MUL R0, R0, R1  
       ADD R0, R0, #1  
       B _checkEnd     

_even:
       LSR R0, R0, #1  
       
_checkEnd:
       CMP R0, #1     
       BNE _loop       

_end:
       B _end

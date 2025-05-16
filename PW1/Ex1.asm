 ;Fibonacci

.data 0 
.global INPUT
    12

.data 32
.global OUTPUT
    0 1

.program 16
    li R0, (INPUT)     --load first INPUT value to the register R0
    brz R0, EXIT       --check INPUT with value 0
    sub R0, R0, 1      --check INPUT with value 1
    brz R0, EXIT       --check (INPUT - 1) with value 0
    add R1, OUTPUT, 2  --R1: pointer to next fibonacci need to compute
    li R2, 0
    li R3, 1

.loop
    ; compute value of next Fibonacci number  
    add R4, R2, R3      -- R4 = R2 + R3.  
    si (R1), R4         -- Indirectly R4 into the memory location pointed to by R1.  
    add R1, R1, 1       
    move R2, R3         -- Move R3 into R2 (R2 = R3)
    move R3, R4         -- Move R4 into R3 --> Next loop will be new R2 + new R3 = new R4

    sub R0, R0, 1       -- Subtract 1 from R0. 
    brp R0, loop        


.Exit  
    exit
.end
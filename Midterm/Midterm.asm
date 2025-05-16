.data 0
.global ARR1
1 7 0 7 2 0 0 4         -- Input

.data 16
.global ARR2
1 9 1 2 2 0 0 4         -- Weight

.data 32
.global ARR3
0 0 0 0 0 0 0 0 

.data 48
.global OUT             -- Output (out1 / out2)
0 0

.alias SIZEARR 8        -- Limit the size of the input to end the loop

.program 0
li R0, ARR1
li R1, ARR2
li R5, ARR3
li R11, OUT
li R7, SIZEARR

.LOOP
li R2, (R0)
add R0, R0, 1
li R3, (R1)
add R1, R1, 1

mult R4, R2, R3
add R5, R5, 1

add R10, R10, R4
si (R5), R4

sub R7, R7, 1
li R4, 0
brnz R7, LOOP
nop

si (R11), R10
brn R10, OUT2_2

.OUT2_1
add R11, R11, 1
si (R11), R10

.OUT2_2
add R11, R11, 1
li R11, 0

.EXIT
    EXIT
.end
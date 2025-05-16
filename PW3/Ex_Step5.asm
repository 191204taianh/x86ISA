    .global a
    1 1 1 1 1 1 1 1 
    2 2 2 2 2 2 2 2 
    3 3 3 3 3 3 3 3 
    4 4 4 4 4 4 4 4 
    5 5 5 5 5 5 5 5
    6 6 6 6 6 6 6 6 
    7 7 7 7 7 7 7 7 
    8 8 8 8 8 8 8 8 

.global b
    1 1 1 1 1 1 1 1 
    2 2 2 2 2 2 2 2 
    3 3 3 3 3 3 3 3 
    4 4 4 4 4 4 4 4 
    5 5 5 5 5 5 5 5
    6 6 6 6 6 6 6 6 
    7 7 7 7 7 7 7 7 
    8 8 8 8 8 8 8 8 

.global c
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 

.alias RLEN 8           -- Define alias for the length of a row/column (8)
.alias SIZE 64          -- Define alias for the size of the matrix (8x8 = 64)
.program 0
    li R8, a            -- Load base address of matrix a into R8
    li R9, b            -- Load base address of matrix b into R9
    li R10, c           -- Load base address of matrix c into R10

.Loop
    add R15, R8, R7     -- R15 = R8 + R7 (compute address offset for current element in a)
    add R8, R8, 1       -- Increment pointer for a
    li R1, (R15)        -- Load current element of a into R1

    li R2, (R9)         -- Load current element of b into R2
    add R9, R9, RLEN    -- Move to the next row in matrix b
    
    mult R3, R1, R2     -- Multiply R1 and R2, store result in R3
    add R4, R4, R3      -- Add result to R4 (accumulator)
    si (R10), R4        -- Store accumulator result in current position of c

    sub R5, R5, 1       -- Decrement R5 (loop counter)
    add R6, R5, RLEN    -- R6 = R5 + RLEN
    brnz R6, Loop       -- If R6 is not zero, continue Loop
    nop
    nop
    nop
    
    add R10, R10, 1     -- Increment pointer for c
    br Loop2

.Loop2              
    li R4, 0            -- Set R4 to 0
    li R5, 0            -- Set R5 to 0
    li R8, 0            -- Set R8 to 0

    sub R9, R9, 63      -- R9 = R9 - (SIZE - 1) to move to next column of b

    add R11, R11, 1     -- Increment column counter
    sub R29, R11, RLEN  -- R29 = R11 - RLEN
    brnz R29, Loop      -- If R29 is not zero, continue Loop
    nop
    nop
    nop

    add R7, R7, RLEN    -- Move to next row of a
    br Loop3

.Loop3 
    li R11, 0           -- Reset column counter
    li R9, SIZE         -- Reset pointer for b to start of the next column

    add R12, R12, 1     -- Increment row counter
    sub R28, R12, RLEN  -- R28 = R12 - RLEN

    brnz R28, Loop      -- If R28 is not zero, continue Loop
    nop
    nop
    nop
    
.EXIT
    exit                -- Exit the program
    
.end 

.data 0
.global ARR             
    4 7 8 1 5 2         -- Initialize an array named ARR with some values

.alias LEN 6            -- Alias LEN to represent the length of the array (6 elements)

.program 100            -- Start of the program with program counter set to 100
    sub R0, (LEN), 1    -- Initialize R0 to (LEN - 1), used for looping

.WHILE                  -- Start of the main WHILE loop
    li R1, ARR          -- Initialize R1 to point to the start of the array ARR

.FOR                    -- Start of the inner FOR loop
    add R3, R1, 0       -- R3 points to the current element of the array
    add R4, R3, 1       -- R4 points to the next element of the array

    li R5, (R3)         -- Load the value at memory location pointed by R3 into R5
    li R6, (R4)         -- Load the value at memory location pointed by R4 into R6

    sub R7, R5, R6      -- Subtract the value of R6 from R5 and store the result in R7
    brn R7, NOSWAP      -- If R7 is negative, jump to NOSWAP

    si (R3), R6         -- Swap: Store the value of R6 into the memory location pointed by R3
    si (R4), R5         -- Swap: Store the value of R5 into the memory location pointed by R4

.NOSWAP                 -- Label indicating the end of the conditional swap

    add R1, R1, 1       -- Increment R1 to point to the next element in the array

    sub R2, R0, R1      -- Calculate the number of iterations left in the loop
    brnz R2, FOR        -- If R2 is non-zero, continue the inner FOR loop

    sub R0, R0, 1       -- Decrement R0 to reduce the length of the array to be sorted
    brnz R0, WHILE      -- If R0 is non-zero, continue the outer WHILE loop

.EXIT                   -- End of the program, exit

    exit                -- Exit instruction
.end                    -- End of the program

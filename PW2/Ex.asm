data 32
.global ARR
    4 7 8 1 5 2

.alias LEN 6            -- length of the array

.program 0
    li R10, ARR         -- R10 = 16 (array base address)
    li R14, LEN         -- load the length of the array

.WHILE
    li R0, 0            -- initialize swapped flag to false
    sub R14, R14, 1     -- decrement length for outer loop
    li R15, 0           -- reset inner loop counter
    brz R14, EXIT      -- if length is zero, exit

.FOR
    sub R13, R15, R14   -- compute inner loop limit
    brz R13, CHECK     -- if inner loop counter reaches limit, check swapped flag

    add R11, R10, R15   -- calculate address of current element
    li R1, (R11)        -- load current element into R1

    add R12, R11, 1     -- calculate address of next element
    li R2, (R12)        -- load next element into R2
          
    sub R3, R1, R2      -- compare current element with next element
    add R15, R15, 1     -- increment inner loop counter
    brn R3, FOR        -- if current element <= next element, continue loop

    si (R11), R2        -- swap: store next element in current position
    si (R12), R1        -- swap: store current element in next position
    li R0, 1            -- set swapped flag to true
    br FOR      -- continue inner loop

.CHECK
    brz R0, EXIT       -- if no swaps were made, array is sorted
    br WHILE           -- otherwise, continue outer loop

.EXIT
    exit

.end

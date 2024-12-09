# Author: Ahmed Raza
# Program: EvenPositiveNumbers.S
# Task: Given an N-element vector (i.e., array), A, generate another vector, B, such that B only contains those elements of A 
#       that are even numbers greater than 0. The program must also count the number of elements in B and put that value in 
#       register a0 at the end of the program. 
#       Example: N=12 and A = [1,2,7,-8,4,5,12,11,-2,6,3], then B = [2,4,12,6], and a0 should hold the value 4.

.global main 
.option norvc

.data
A: .word  1, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3  # Example array A
B: .space 4 * 12  # Allocate space for array B with 12 elements (assuming maximum length is N)

.text
main:
    la s0, A          # Load address of A into s0
    la s1, B          # Load address of B into s1
    li t0, 12         # Number of elements in A (N)
    li t1, 0          # Index for A
    li t2, 0          # Index for B
    li t3, 0          # Counter for elements in B

loop:
    beq t1, t0, end   # If index for A equals N, end loop
    lw t4, 0(s0)      # Load element from A into t4
    addi s0, s0, 4    # Move to next element in A
    addi t1, t1, 1    # Increment index for A

    bltz t4, skip     # Skip if element is negative
    andi t5, t4, 1    # Check if element is even
    bnez t5, skip     # Skip if element is odd

    sw t4, 0(s1)      # Store element in B
    addi s1, s1, 4    # Move to next position in B
    addi t3, t3, 1    # Increment counter for B

skip:
    j loop            # Repeat loop

end:
    mv a0, t3         # Move counter for B into a0

    # Exit using ecall
    li a7, 10         # Load exit syscall number (10) into a7
    ecall             # Make the system call to exit

.data
array:  .space 40                  # Reserve space for 10 integers (10 * 4 bytes)
msg2:   .asciiz "Printing array: "

.text
dataArray:
    add     s0, x0, x0             # i = 0
    addi    a0, x0, 100            # num = 100 (passed to sub)
    la      s1, array              # s1 = base address of array
    addi    t0, x0, 10             # loop upper bound (10)

Loop:
    bge     s0, t0, print_array    # if i >= 10, exit loop
    jal     ra, compare            # call compare()

    addi    t1, x0, 4              # word size = 4 bytes
    mul     t2, s0, t1             # t2 = i * 4
    add     t2, t2, s1             # t2 = &array[i]
    sw      a3, 0(t2)              # array[i] = result from compare

    addi    s0, s0, 1              # i++
    j       Loop

# -------------------------------
# Function: compare
# Computes a2 = num - i
# If a2 >= 0, returns 1 in a3, else 0
# -------------------------------
compare:
    addi    sp, sp, -4
    sw      ra, 0(sp)

    jal     ra, sub                # a2 = a0 - s0

    lw      ra, 0(sp)
    addi    sp, sp, 4

    bge     a2, x0, return1        # if a2 >= 0, return 1

    add     a3, x0, x0             # else return 0
    jalr    x0, ra, 0

return1:
    addi    a3, x0, 1
    jalr    x0, ra, 0

# -------------------------------
# Function: sub
# a2 = a0 - s0
# -------------------------------
sub:
    sub     a2, a0, s0
    jalr    x0, ra, 0

# -------------------------------
# Printing the array
# -------------------------------
print_array:
    la      a1, msg2
    addi    a0, x0, 4              # syscall: print string
    ecall

    addi    a1, x0, '\n'           # print newline
    addi    a0, x0, 11             # syscall: print char
    ecall

    add     s0, x0, x0             # i = 0
    la      s1, array
    addi    t0, x0, 10

loop_print:
    bge     s0, t0, exit1

    addi    t1, x0, 4              # word size
    mul     t2, s0, t1             # t2 = i * 4
    add     t2, t2, s1             # address of array[i]

    lw      a1, 0(t2)              # load array[i]
    addi    a0, x0, 1              # syscall: print int
    ecall

    addi    a1, x0, '\n'           # newline after each number
    addi    a0, x0, 11             # syscall: print char
    ecall

    addi    s0, s0, 1
    j       loop_print

exit1:

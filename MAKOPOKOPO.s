.data
prompt: .asciz "Enter quantity of grains in litres: "
result_makokopo: .asciz "Number of makokopo: "
result_remainder: .asciz "Remaining litres: "
newline: .asciz "\n"

.text
.globl _start

_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall
    
    # Read input (using test value for Ripes)
    li t0, 115          # Test value: 115 litres of grains
    
    #  non-negative restriction
    blt t0, zero, exit_program
    
    # Calculate division using repeated subtraction
    li t1, 20          # 20 litres per makokopo
    li t2, 0           # quotient (makokopo count)
    mv t3, t0          # copy of original value for remainder calculation
    
division_loop:
    blt t3, t1, division_complete
    sub t3, t3, t1     # subtract 20
    addi t2, t2, 1     # increment makokopo count
    j division_loop
    
division_complete:
    # t2 = number of makokopo (quotient)
    # t3 = remaining litres (remainder)
    
    # Print "Number of makokopo: "
    la a0, result_makokopo
    li a7, 4           # print string
    ecall
    
    # Print number of makokopo
    mv a0, t2
    li a7, 1           # print integer
    ecall
    
    # Print newline
    la a0, newline
    li a7, 4
    ecall
    
    # Print "Remaining litres: "
    la a0, result_remainder
    li a7, 4           # print string
    ecall
    
    # Print remaining litres
    mv a0, t3          # remainder value
    li a7, 1           # print integer
    ecall
    
    # Print newline
    la a0, newline
    li a7, 4
    ecall
    
exit_program:
    li a7, 10          # exit
    ecall
.data
prompt: .asciz "Enter height of triangle: "
star: .asciz "*"
newline: .asciz "\n"

.text
.globl _start

_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall
    
    # Read input
    li s0, 5           # Test height: 5 lines (using s0 to preserve)
    
    # Validate input
    ble s0, zero, exit_program
    
    # Initialize variables
    li t1, 1           # current line number (starts at 1)
    
outer_loop:
    # Check if we've printed all lines
    bgt t1, s0, exit_program
    
    # Calculate number of stars for current line (2*line - 1)
    li t3, 2
    mul t3, t1, t3     # 2 * line_number
    addi t3, t3, -1    # 2 * line_number - 1
    
    # Print stars for current line
    li t2, 0           # star counter for current line
    
print_stars:
    # Check if we've printed enough stars for this line
    beq t2, t3, print_line_end
    
    # Print a star
    la a0, star
    li a7, 4
    ecall
    
    # Increment star counter
    addi t2, t2, 1
    j print_stars
    
print_line_end:
    # Print newline
    la a0, newline
    li a7, 4
    ecall
    
    # Move to next line
    addi t1, t1, 1
    j outer_loop

exit_program:
    li a7, 10
    ecall
.data
prompt: .asciz "Enter day number (1-7): "
day1: .asciz "Mantaha\n"      # Monday
day2: .asciz "Labobedi\n"     # Tuesday  
day3: .asciz "Laboraro\n"     # Wednesday
day4: .asciz "Labone\n"       # Thursday
day5: .asciz "Labohlano\n"    # Friday
day6: .asciz "Moqebelo\n"     # Saturday
day7: .asciz "Sontaha\n"      # Sunday
error_msg: .asciz "Error: Invalid day number\n"

.text
.globl _start

_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall
    
    # Read input (using test value for Ripes)
    li t0, 3           # Test: Wednesday (day 3)
    
    # Validate input range 1-7
    li t1, 1
    blt t0, t1, print_error
    li t1, 7
    bgt t0, t1, print_error
    
    # Use conditional branching approach
    li t1, 1
    beq t0, t1, print_day1
    li t1, 2
    beq t0, t1, print_day2
    li t1, 3
    beq t0, t1, print_day3
    li t1, 4
    beq t0, t1, print_day4
    li t1, 5
    beq t0, t1, print_day5
    li t1, 6
    beq t0, t1, print_day6
    li t1, 7
    beq t0, t1, print_day7
    
    j print_error

print_day1:
    la a0, day1
    li a7, 4
    ecall
    j exit_program

print_day2:
    la a0, day2
    li a7, 4
    ecall
    j exit_program

print_day3:
    la a0, day3
    li a7, 4
    ecall
    j exit_program

print_day4:
    la a0, day4
    li a7, 4
    ecall
    j exit_program

print_day5:
    la a0, day5
    li a7, 4
    ecall
    j exit_program

print_day6:
    la a0, day6
    li a7, 4
    ecall
    j exit_program

print_day7:
    la a0, day7
    li a7, 4
    ecall
    j exit_program

print_error:
    la a0, error_msg
    li a7, 4
    ecall

exit_program:
    li a7, 10
    ecall
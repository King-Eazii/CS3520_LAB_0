.data
prompt: .asciz "Enter number of cattle: "
not_enough: .asciz "Not enough for bohali\n"
small_herd: .asciz "Small herd\n"
wealthy: .asciz "Wealthy cattle owner\n"
error_msg: .asciz "Error: Negative number\n"

.text
.globl _start

_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall
    

    li t0, 45          # Test value: 45 cattle
    
    # non negativity restriction
    blt t0, zero, print_error
    
    # Classes based on number of cattle
    # < 10: Not enough for bohali
    # 10-20: Small herd  
    # > 20: Wealthy cattle owner
    
    li t1, 10
    blt t0, t1, print_not_enough
    
    li t1, 20
    ble t0, t1, print_small_herd
    
    # If we reach here, cattle > 20
    j print_wealthy

print_not_enough:
    la a0, not_enough
    li a7, 4
    ecall
    j exit_program

print_small_herd:
    la a0, small_herd
    li a7, 4
    ecall
    j exit_program

print_wealthy:
    la a0, wealthy
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
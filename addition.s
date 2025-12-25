_start:
    addi x1, x0, 2 # value 2 is loaded in x1 register (operand to be calculated)
    addi x2, x0, 5 # value 5 is loaded in x2 register (number of loop iteration)
    addi x3, x0, 0 # value 0 is loaded in x3 register (final result holding reg)

repeat_addition:
    add x3, x3, x1  #(x3 = x3 + x1)
    addi x2, x2, -1 #(x2 = x2 + (-1))
    bne x2, x0, repeat_addition #(if (x2 != x0), loop repeat_addition)

j .
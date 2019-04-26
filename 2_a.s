.data
	arr : .space 10
.text
main:

li $a0, 10
jal fib
move $a0, $v0
li $v0, 1
syscall
End:
li $v0, 10
syscall

fib:
beq $a0, $0, ZERO_BASE
li $t0, 1
beq $a0, $t0, ONE_BASE

addi $sp, $sp, -12
sw $ra, 0($sp)
addi $a0, $a0, -1
sw $a0, 4($sp)
addi $s0, $a0, -1
sw $s0, 8($sp)

lw $a0, 4($sp)
jal fib
sw $v0, 4($sp)

lw $a0, 8($sp)
jal fib
sw $v0, 8($sp)

lw $t1, 4($sp)
lw $t2, 8($sp)
add $v0, $t1, $t2

lw $ra, 0($sp)
addi $sp, $sp, 12
j $ra


ZERO_BASE:
li $v0, 0
j $ra

ONE_BASE:
li $v0, 1
j $ra
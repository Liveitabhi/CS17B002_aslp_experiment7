.data
	n : .word 10
.text
main:
	la $s0, n
	lw $s0, 0($s0)
	move $a0, $s0
	jal fact
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
fact:
	beq $a0, $t0, BASE_CASE
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	li $t0, 1
	addi $a0, $a0, -1
	jal fact
	j END_REC

BASE_CASE:
	li $v0, 1
	jr $ra

END_REC:
	lw $ra, 0($sp)
	lw $s1, 4($sp)
	mult $v0, $s1
	mflo $v0
	addi $sp, $sp, 8
	jr $ra
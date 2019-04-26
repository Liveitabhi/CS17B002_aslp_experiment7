.data
	m : .float 1.2
	a : .float 6.67
	b1 : .float 2.718
	c : .float 3.14

.text
	main:
la $t0, a					# 6.67 address
la $t1, b1					# 2.718 address
la $t2, c					# 3.14 address
la $t3, m 					# m address
jal calc_p
li $v0, 10
syscall

calc_p:
addi $sp, $sp, -4
sw $ra, 0($sp)
l.s $f0, 0($t0)				# 6.67
l.s $f1, 0($t3)				# m
mul.s $f2, $f1, $f0			# p = 6.67*m
jal calc_z
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

calc_z:
addi $sp, $sp, -4
sw $ra, 0($sp)
mul.s $f3, $f2, $f2			# p*p
mul.s $f2, $f3, $f2			# p*p*p
add.s $f4, $f3, $f2			# z
jal calc_x
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

calc_x:
addi $sp, $sp, -4
sw $ra, 0($sp)
mul.s $f5, $f4, $f4			# z*z
mul.s $f5, $f5, $f4			# z*z*z
l.s $f6, 0($t1)				# 2.718
add.s $f7, $f6, $f5			# x
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra
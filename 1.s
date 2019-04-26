.data
	r : .space 4

.text

main:

li $a0, 3 		# l
li $a1, 6		# m
li $s0, 8		# k
li $s1, 13		# n

jal multi_fun	# calling function

div $a3, $s1	# divide
mflo $s2		
add $s2, $s2, $s0	# add
sw $s2, r
li $v0, 10
syscall			#terminate


multi_fun:

mult $a0, $a1	# multiplying
mflo $a3		
jr $ra			# returning
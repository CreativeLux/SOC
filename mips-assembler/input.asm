.text
fun:
	 li $t0, 8
	 sub $sp, $sp, $t0
	 MOV $t2, $sp
	 li $t3,4
	 sub $t2,$t2,$t3
	 # LOADING ..
	 addi $t9,$sp,0
	 lw $t4, 0($t9)
	 sw $t4,0($t2)

	 li $t1, 0
	 li $t3,4
	 sub $t2,$t2,$t3
	 sw $t1,0($t2)

	 # ADDING ..
	 lw $t1,0($t2)
	 lw $t0,4($t2)
	 li $t3,4
	 add $t2,$t2,$t3
	# ==
	 seq $t1,$t0,$t1
	 sw $t1,0($t2)

	 lw $t0,0($t2)
	 addi $t2,$t2,4
	 beq $zero, $t0,fun0
#Scope Increased 2
	 li $t0, 0
	 sub $sp, $sp, $t0
	 MOV $t2, $sp
	 li $t1, 1
	 li $t3,4
	 sub $t2,$t2,$t3
	 sw $t1,0($t2)

	 lw $v0,0($t2)
	 addi $sp, $sp, 8
	 MOV $t2, $sp
	 jr $ra
#Scope decreased 2
	 li $t0, 0
	 add $sp, $sp, $t0
	 MOV $t2, $sp
fun0:
	 li $t3,4
	 sub $t2,$t2,$t3
	 # LOADING ..
	 addi $t9,$sp,0
	 lw $t4, 0($t9)
	 sw $t4,0($t2)

	 li $t3,4
	 sub $t2,$t2,$t3
	 # LOADING ..
	 addi $t9,$sp,0
	 lw $t4, 0($t9)
	 sw $t4,0($t2)

	 li $t1, 1
	 li $t3,4
	 sub $t2,$t2,$t3
	 sw $t1,0($t2)

	 # ADDING ..
	 lw $t1,0($t2)
	 lw $t0,4($t2)
	 li $t3,4
	 add $t2,$t2,$t3
	# -
	 sub $t1,$t0,$t1
	 sw $t1,0($t2)

	MOV $t0,$sp
	li $t1, 24
	sub $t0,$t0,$t1
	lw $t4,0($t2)
	sw $t4,0($t0)
	li $t0,4
	sub $sp,$sp,$t0
	sw $ra,0($sp)
	MOV $t2,$sp
	li $t0,12
	sub $sp,$sp,$t0
	jal fun

	addi $sp,$sp,12
	lw $ra,0($sp)
	addi $sp,$sp,4
	MOV $t2,$sp
	li $t0,4
	sub $t2,$t2,$t0
	sw $v0,0($t2)
	 # ADDING ..
	 lw $t1,0($t2)
	 lw $t0,4($t2)
	 li $t3,4
	 add $t2,$t2,$t3
	# *
	 mult $t1,$t0,$t1
	 sw $t1,0($t2)

	lw $v0,0($t2)
	 addi $sp, $sp, 8
	 MOV $t2, $sp
	 jr $ra
	 li $t0, 8
	 add $sp, $sp, $t0
	 MOV $t2, $sp
	 jr $ra
main:
	 li $t0, 16
	 sub $sp, $sp, $t0
	 MOV $t2, $sp
	 li $v0,5
	 syscall
	 # STORING ..
	 addi $t9,$sp,4
	 sw $v0, 0($t9)
	 li $t3,4
	 sub $t2,$t2,$t3
	 # LOADING ..
	 addi $t9,$sp,4
	 lw $t4, 0($t9)
	 sw $t4,0($t2)

	MOV $t0,$sp
	li $t1, 24
	sub $t0,$t0,$t1
	lw $t4,0($t2)
	sw $t4,0($t0)
	li $t0,4
	sub $sp,$sp,$t0
	sw $ra,0($sp)
	MOV $t2,$sp
	li $t0,12
	sub $sp,$sp,$t0
	jal fun

	addi $sp,$sp,12
	lw $ra,0($sp)
	addi $sp,$sp,4
	MOV $t2,$sp
	li $t0,4
	sub $t2,$t2,$t0
	sw $v0,0($t2)
	 lw $t1,0($t2)
	 # STORING ..
	 addi $t9,$sp,12
	 sw $t1, 0($t9)
	 addi $t2,$t2,4
	 # LOADING ..
	 addi $t9,$sp,12
	 lw $a0, 0($t9)
	 li $v0,1
	 syscall
	 li $a0,32
	 li $v0,11
	 syscall
	 li $t0, 16
	 add $sp, $sp, $t0
	 MOV $t2, $sp
	 jr $ra
.data
global: .word 0
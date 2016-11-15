.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 30
	sw $t0, 3844($gp)
	li $t0, 30
	sw $t0, 3840($gp)
	li $t0, 0
	sw $t0, 3848($gp)
bwhile0:
	lw $t0, 3848($gp)
	lw $t1, 3844($gp)
	slt $t2, $t0, $t1
	beqz $t2, awhile0
	lw $t2, 3848($gp)
	lw $t3, 3844($gp)
	mul $t4, $t2, $t3
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	lw $t5, 3848($gp)
	sw $t5, 240($t4)
	lw $t5, 3848($gp)
	mul $t5, $t5, 4
	add $t5, $gp, $t5
	lw $t6, 3848($gp)
	li $t7, 1
	add $s0, $t6, $t7
	sw $s0, 0($t5)
	lw $s0, 3848($gp)
	li $s1, 1
	add $s2, $s0, $s1
	sw $s2, 3848($gp)
	j bwhile0
awhile0:
	li $s2, 0
	sw $s2, 3852($gp)
bwhile1:
	lw $s2, 3852($gp)
	lw $s3, 3840($gp)
	slt $s4, $s2, $s3
	beqz $s4, awhile1
	lw $s4, 3852($gp)
	mul $s4, $s4, 4
	add $s4, $gp, $s4
	lw $s5, 3852($gp)
	sw $s5, 240($s4)
	lw $s5, 3852($gp)
	mul $s5, $s5, 4
	add $s5, $gp, $s5
	li $s6, 2
	lw $s7, 3852($gp)
	li $t8, 1
	add $t9, $s7, $t8
	mul $t0, $s6, $t9
	sw $t0, 120($s5)
	lw $t0, 3852($gp)
	li $t1, 1
	add $t2, $t0, $t1
	sw $t2, 3852($gp)
	j bwhile1
awhile1:
	li $t2, 1
	sw $t2, 3848($gp)
bwhile2:
	lw $t2, 3848($gp)
	lw $t3, 3844($gp)
	slt $t4, $t2, $t3
	beqz $t4, awhile2
	li $t4, 1
	sw $t4, 3852($gp)
bwhile3:
	lw $t4, 3852($gp)
	lw $t5, 3840($gp)
	slt $t6, $t4, $t5
	beqz $t6, awhile3
	lw $t6, 3848($gp)
	lw $t7, 3844($gp)
	mul $s0, $t6, $t7
	lw $s1, 3852($gp)
	add $s2, $s0, $s1
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	lw $s3, 3848($gp)
	li $s4, 1
	sub $s5, $s3, $s4
	lw $s6, 3844($gp)
	mul $s7, $s5, $s6
	lw $t8, 3852($gp)
	add $t9, $s7, $t8
	li $t0, 1
	sub $t1, $t9, $t0
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	lw $t2, 240($t1)
	sw $t2, 240($s2)
	lw $t2, 3848($gp)
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	lw $t3, 120($t2)
	lw $t4, 3852($gp)
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	lw $t5, 0($t4)
	sne $t6, $t3, $t5
	beqz $t6, acond0
	lw $t6, 3848($gp)
	lw $t7, 3844($gp)
	mul $s0, $t6, $t7
	lw $s1, 3852($gp)
	add $s2, $s0, $s1
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	lw $s3, 3848($gp)
	lw $s4, 3844($gp)
	mul $s5, $s3, $s4
	lw $s6, 3852($gp)
	add $s7, $s5, $s6
	mul $s7, $s7, 4
	add $s7, $gp, $s7
	lw $t8, 240($s7)
	li $t9, 1
	add $t0, $t8, $t9
	sw $t0, 240($s2)
	j   else0
acond0:
else0:
	lw $t0, 3848($gp)
	li $t1, 1
	sub $t2, $t0, $t1
	lw $t3, 3844($gp)
	mul $t4, $t2, $t3
	lw $t5, 3852($gp)
	add $t6, $t4, $t5
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	lw $t7, 240($t6)
	lw $s0, 3848($gp)
	lw $s1, 3844($gp)
	mul $s2, $s0, $s1
	lw $s3, 3852($gp)
	add $s4, $s2, $s3
	mul $s4, $s4, 4
	add $s4, $gp, $s4
	lw $s5, 240($s4)
	slt $s6, $t7, $s5
	beqz $s6, acond1
	lw $s6, 3848($gp)
	lw $s7, 3844($gp)
	mul $t8, $s6, $s7
	lw $t9, 3852($gp)
	add $t0, $t8, $t9
	mul $t0, $t0, 4
	add $t0, $gp, $t0
	lw $t1, 3848($gp)
	li $t2, 1
	sub $t3, $t1, $t2
	lw $t4, 3844($gp)
	mul $t5, $t3, $t4
	lw $t6, 3852($gp)
	add $t7, $t5, $t6
	mul $t7, $t7, 4
	add $t7, $gp, $t7
	lw $s0, 240($t7)
	li $s1, 1
	add $s2, $s0, $s1
	sw $s2, 240($t0)
	j   else1
acond1:
else1:
	lw $s2, 3848($gp)
	lw $s3, 3844($gp)
	mul $s4, $s2, $s3
	lw $s5, 3852($gp)
	add $s6, $s4, $s5
	li $s7, 1
	sub $t8, $s6, $s7
	mul $t8, $t8, 4
	add $t8, $gp, $t8
	lw $t9, 240($t8)
	lw $t0, 3848($gp)
	lw $t1, 3844($gp)
	mul $t2, $t0, $t1
	lw $t3, 3852($gp)
	add $t4, $t2, $t3
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	lw $t5, 240($t4)
	slt $t6, $t9, $t5
	beqz $t6, acond2
	lw $t6, 3848($gp)
	lw $t7, 3844($gp)
	mul $s0, $t6, $t7
	lw $s1, 3852($gp)
	add $s2, $s0, $s1
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	lw $s3, 3848($gp)
	lw $s4, 3844($gp)
	mul $s5, $s3, $s4
	lw $s6, 3852($gp)
	add $s7, $s5, $s6
	li $t8, 1
	sub $t9, $s7, $t8
	mul $t9, $t9, 4
	add $t9, $gp, $t9
	lw $t0, 240($t9)
	li $t1, 1
	add $t2, $t0, $t1
	sw $t2, 240($s2)
	j   else2
acond2:
else2:
	lw $t2, 3852($gp)
	li $t3, 1
	add $t4, $t2, $t3
	sw $t4, 3852($gp)
	j bwhile3
awhile3:
	lw $t4, 3848($gp)
	li $t5, 1
	add $t6, $t4, $t5
	sw $t6, 3848($gp)
	j bwhile2
awhile2:
	li $t6, 899
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	lw $t7, 240($t6)
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

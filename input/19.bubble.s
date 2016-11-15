.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 0
	mul $t0, $t0, 4
	add $t0, $gp, $t0
	li $t1, 32
	sw $t1, 0($t0)
	li $t1, 1
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	li $t2, 11
	sw $t2, 0($t1)
	li $t2, 2
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	li $t3, 111
	sw $t3, 0($t2)
	li $t3, 3
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	li $t4, 88
	sw $t4, 0($t3)
	li $t4, 4
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	li $t5, 11
	sw $t5, 0($t4)
	li $t5, 5
	mul $t5, $t5, 4
	add $t5, $gp, $t5
	li $t6, 44
	sw $t6, 0($t5)
	li $t6, 6
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	li $t7, 33
	sw $t7, 0($t6)
	li $t7, 7
	mul $t7, $t7, 4
	add $t7, $gp, $t7
	li $s0, 33
	sw $s0, 0($t7)
	li $s0, 8
	mul $s0, $s0, 4
	add $s0, $gp, $s0
	li $s1, 22
	sw $s1, 0($s0)
	li $s1, 9
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	li $s2, 77
	sw $s2, 0($s1)
	li $s2, 10
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	li $s3, 45
	sw $s3, 0($s2)
	li $s3, 11
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	li $s4, 65
	sw $s4, 0($s3)
	li $s4, 12
	mul $s4, $s4, 4
	add $s4, $gp, $s4
	li $s5, 76
	sw $s5, 0($s4)
	li $s5, 13
	mul $s5, $s5, 4
	add $s5, $gp, $s5
	li $s6, 87
	sw $s6, 0($s5)
	li $s6, 14
	mul $s6, $s6, 4
	add $s6, $gp, $s6
	li $s7, 34
	sw $s7, 0($s6)
	li $s7, 0
	sw $s7, 60($gp)
bwhile0:
	lw $s7, 60($gp)
	li $t8, 14
	slt $t9, $s7, $t8
	beqz $t9, awhile0
	lw $t9, 60($gp)
	sw $t9, 72($gp)
	lw $t9, 60($gp)
	li $t0, 1
	add $t1, $t9, $t0
	sw $t1, 64($gp)
bwhile1:
	lw $t1, 64($gp)
	li $t2, 15
	slt $t3, $t1, $t2
	beqz $t3, awhile1
	lw $t3, 64($gp)
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	lw $t4, 0($t3)
	lw $t5, 72($gp)
	mul $t5, $t5, 4
	add $t5, $gp, $t5
	lw $t6, 0($t5)
	slt $t7, $t4, $t6
	beqz $t7, acond0
	lw $t7, 64($gp)
	sw $t7, 72($gp)
	j   else0
acond0:
else0:
	lw $t7, 64($gp)
	li $s0, 1
	add $s1, $t7, $s0
	sw $s1, 64($gp)
	j bwhile1
awhile1:
	lw $s1, 60($gp)
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	lw $s2, 0($s1)
	sw $s2, 68($gp)
	lw $s2, 60($gp)
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	lw $s3, 72($gp)
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	lw $s4, 0($s3)
	sw $s4, 0($s2)
	lw $s4, 72($gp)
	mul $s4, $s4, 4
	add $s4, $gp, $s4
	lw $s5, 68($gp)
	sw $s5, 0($s4)
	lw $s5, 60($gp)
	li $s6, 1
	add $s7, $s5, $s6
	sw $s7, 60($gp)
	j bwhile0
awhile0:
	li $s7, 0
	sw $s7, 60($gp)
bwhile2:
	lw $s7, 60($gp)
	li $t8, 15
	slt $t9, $s7, $t8
	beqz $t9, awhile2
	lw $t9, 60($gp)
	mul $t9, $t9, 4
	add $t9, $gp, $t9
	lw $t0, 0($t9)
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t0, 60($gp)
	li $t1, 1
	add $t2, $t0, $t1
	sw $t2, 60($gp)
	j bwhile2
awhile2:
	li $v0, 10
	syscall
.data

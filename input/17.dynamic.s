.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 0
	mul $t0, $t0, 4
	add $t0, $gp, $t0
	li $t1, 0
	sw $t1, 0($t0)
	li $t1, 1
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	li $t2, 1
	sw $t2, 0($t1)
	li $t2, 2
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	li $t3, 2
	sw $t3, 0($t2)
	li $t3, 3
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	li $t4, 3
	sw $t4, 0($t3)
	li $t4, 4
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	li $t5, 4
	sw $t5, 0($t4)
	li $t5, 5
	mul $t5, $t5, 4
	add $t5, $gp, $t5
	li $t6, 5
	sw $t6, 0($t5)
	li $t6, 6
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	li $t7, 6
	sw $t7, 0($t6)
	li $t7, 7
	mul $t7, $t7, 4
	add $t7, $gp, $t7
	li $s0, 7
	sw $s0, 0($t7)
	li $s0, 8
	mul $s0, $s0, 4
	add $s0, $gp, $s0
	li $s1, 8
	sw $s1, 0($s0)
	li $s1, 9
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	li $s2, 9
	sw $s2, 0($s1)
	li $s2, 10
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	li $s3, 8
	sw $s3, 0($s2)
	li $s3, 11
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	li $s4, 7
	sw $s4, 0($s3)
	li $s4, 12
	mul $s4, $s4, 4
	add $s4, $gp, $s4
	li $s5, 6
	sw $s5, 0($s4)
	li $s5, 13
	mul $s5, $s5, 4
	add $s5, $gp, $s5
	li $s6, 5
	sw $s6, 0($s5)
	li $s6, 14
	mul $s6, $s6, 4
	add $s6, $gp, $s6
	li $s7, 4
	sw $s7, 0($s6)
	li $s7, 15
	mul $s7, $s7, 4
	add $s7, $gp, $s7
	li $t8, 3
	sw $t8, 0($s7)
	li $t8, 16
	mul $t8, $t8, 4
	add $t8, $gp, $t8
	li $t9, 2
	sw $t9, 0($t8)
	li $t9, 17
	mul $t9, $t9, 4
	add $t9, $gp, $t9
	li $t0, 1
	sw $t0, 0($t9)
	li $t0, 18
	mul $t0, $t0, 4
	add $t0, $gp, $t0
	li $t1, 0
	sw $t1, 0($t0)
	li $t1, 0
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	li $t2, 0
	sw $t2, 76($t1)
	li $t2, 1
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	li $t3, 1
	sw $t3, 76($t2)
	li $t3, 2
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	li $t4, 3
	sw $t4, 76($t3)
	li $t4, 3
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	li $t5, 5
	sw $t5, 76($t4)
	li $t5, 4
	mul $t5, $t5, 4
	add $t5, $gp, $t5
	li $t6, 7
	sw $t6, 76($t5)
	li $t6, 5
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	li $t7, 9
	sw $t7, 76($t6)
	li $t7, 6
	mul $t7, $t7, 4
	add $t7, $gp, $t7
	li $s0, 11
	sw $s0, 76($t7)
	li $s0, 7
	mul $s0, $s0, 4
	add $s0, $gp, $s0
	li $s1, 4
	sw $s1, 76($s0)
	li $s1, 8
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	li $s2, 3
	sw $s2, 76($s1)
	li $s2, 9
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	li $s3, 2
	sw $s3, 76($s2)
	li $s3, 10
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	li $s4, 1
	sw $s4, 76($s3)
	li $s4, 11
	mul $s4, $s4, 4
	add $s4, $gp, $s4
	li $s5, 9
	sw $s5, 76($s4)
	li $s5, 12
	mul $s5, $s5, 4
	add $s5, $gp, $s5
	li $s6, 8
	sw $s6, 76($s5)
	li $s6, 13
	mul $s6, $s6, 4
	add $s6, $gp, $s6
	li $s7, 7
	sw $s7, 76($s6)
	li $s7, 14
	mul $s7, $s7, 4
	add $s7, $gp, $s7
	li $t8, 6
	sw $t8, 76($s7)
	li $t8, 15
	mul $t8, $t8, 4
	add $t8, $gp, $t8
	li $t9, 0
	sw $t9, 76($t8)
	li $t9, 20
	sw $t9, 1756($gp)
	li $t9, 0
	sw $t9, 1740($gp)
bwhile0:
	lw $t9, 1740($gp)
	li $t0, 1
	add $t1, $t9, $t0
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	lw $t2, 0($t1)
	li $t3, 0
	sne $t4, $t2, $t3
	beqz $t4, awhile0
	lw $t4, 1740($gp)
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	lw $t5, 1740($gp)
	sw $t5, 140($t4)
	lw $t5, 1740($gp)
	li $t6, 1
	add $t7, $t5, $t6
	sw $t7, 1740($gp)
	j bwhile0
awhile0:
	lw $t7, 1740($gp)
	li $s0, 1
	sub $s1, $t7, $s0
	sw $s1, 1740($gp)
	li $s1, 0
	sw $s1, 1744($gp)
bwhile1:
	lw $s1, 1744($gp)
	li $s2, 1
	add $s3, $s1, $s2
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	lw $s4, 76($s3)
	li $s5, 0
	sne $s6, $s4, $s5
	beqz $s6, awhile1
	lw $s6, 1744($gp)
	lw $s7, 1756($gp)
	mul $t8, $s6, $s7
	mul $t8, $t8, 4
	add $t8, $gp, $t8
	lw $t9, 1744($gp)
	sw $t9, 140($t8)
	lw $t9, 1744($gp)
	li $t0, 1
	add $t1, $t9, $t0
	sw $t1, 1744($gp)
	j bwhile1
awhile1:
	lw $t1, 1744($gp)
	li $t2, 1
	sub $t3, $t1, $t2
	sw $t3, 1744($gp)
	li $t3, 1
	sw $t3, 1748($gp)
bwhile2:
	lw $t3, 1748($gp)
	lw $t4, 1744($gp)
	sle $t5, $t3, $t4
	beqz $t5, awhile2
	li $t5, 1
	sw $t5, 1752($gp)
bwhile3:
	lw $t5, 1752($gp)
	lw $t6, 1740($gp)
	sle $t7, $t5, $t6
	beqz $t7, awhile3
	lw $t7, 1748($gp)
	lw $s0, 1756($gp)
	mul $s1, $t7, $s0
	lw $s2, 1752($gp)
	add $s3, $s1, $s2
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	lw $s4, 1748($gp)
	li $s5, 1
	sub $s6, $s4, $s5
	lw $s7, 1756($gp)
	mul $t8, $s6, $s7
	lw $t9, 1752($gp)
	add $t0, $t8, $t9
	li $t1, 1
	sub $t2, $t0, $t1
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	lw $t3, 140($t2)
	sw $t3, 140($s3)
	lw $t3, 1748($gp)
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	lw $t4, 76($t3)
	lw $t5, 1752($gp)
	mul $t5, $t5, 4
	add $t5, $gp, $t5
	lw $t6, 0($t5)
	sne $t7, $t4, $t6
	beqz $t7, acond0
	lw $t7, 1748($gp)
	lw $s0, 1756($gp)
	mul $s1, $t7, $s0
	lw $s2, 1752($gp)
	add $s3, $s1, $s2
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	lw $s4, 1748($gp)
	lw $s5, 1756($gp)
	mul $s6, $s4, $s5
	lw $s7, 1752($gp)
	add $t8, $s6, $s7
	mul $t8, $t8, 4
	add $t8, $gp, $t8
	lw $t9, 140($t8)
	li $t0, 1
	add $t1, $t9, $t0
	sw $t1, 140($s3)
	j   else0
acond0:
else0:
	lw $t1, 1748($gp)
	li $t2, 1
	sub $t3, $t1, $t2
	lw $t4, 1756($gp)
	mul $t5, $t3, $t4
	lw $t6, 1752($gp)
	add $t7, $t5, $t6
	mul $t7, $t7, 4
	add $t7, $gp, $t7
	lw $s0, 140($t7)
	lw $s1, 1748($gp)
	lw $s2, 1756($gp)
	mul $s3, $s1, $s2
	lw $s4, 1752($gp)
	add $s5, $s3, $s4
	mul $s5, $s5, 4
	add $s5, $gp, $s5
	lw $s6, 140($s5)
	slt $s7, $s0, $s6
	beqz $s7, acond1
	lw $s7, 1748($gp)
	lw $t8, 1756($gp)
	mul $t9, $s7, $t8
	lw $t0, 1752($gp)
	add $t1, $t9, $t0
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	lw $t2, 1748($gp)
	li $t3, 1
	sub $t4, $t2, $t3
	lw $t5, 1756($gp)
	mul $t6, $t4, $t5
	lw $t7, 1752($gp)
	add $s0, $t6, $t7
	mul $s0, $s0, 4
	add $s0, $gp, $s0
	lw $s1, 140($s0)
	li $s2, 1
	add $s3, $s1, $s2
	sw $s3, 140($t1)
	j   else1
acond1:
else1:
	lw $s3, 1748($gp)
	lw $s4, 1756($gp)
	mul $s5, $s3, $s4
	lw $s6, 1752($gp)
	add $s7, $s5, $s6
	li $t8, 1
	sub $t9, $s7, $t8
	mul $t9, $t9, 4
	add $t9, $gp, $t9
	lw $t0, 140($t9)
	lw $t1, 1748($gp)
	lw $t2, 1756($gp)
	mul $t3, $t1, $t2
	lw $t4, 1752($gp)
	add $t5, $t3, $t4
	mul $t5, $t5, 4
	add $t5, $gp, $t5
	lw $t6, 140($t5)
	slt $t7, $t0, $t6
	beqz $t7, acond2
	lw $t7, 1748($gp)
	lw $s0, 1756($gp)
	mul $s1, $t7, $s0
	lw $s2, 1752($gp)
	add $s3, $s1, $s2
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	lw $s4, 1748($gp)
	lw $s5, 1756($gp)
	mul $s6, $s4, $s5
	lw $s7, 1752($gp)
	add $t8, $s6, $s7
	li $t9, 1
	sub $t0, $t8, $t9
	mul $t0, $t0, 4
	add $t0, $gp, $t0
	lw $t1, 140($t0)
	li $t2, 1
	add $t3, $t1, $t2
	sw $t3, 140($s3)
	j   else2
acond2:
else2:
	lw $t3, 1752($gp)
	li $t4, 1
	add $t5, $t3, $t4
	sw $t5, 1752($gp)
	j bwhile3
awhile3:
	lw $t5, 1748($gp)
	li $t6, 1
	add $t7, $t5, $t6
	sw $t7, 1748($gp)
	j bwhile2
awhile2:
	lw $t7, 1744($gp)
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t7, 1740($gp)
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t7, 1744($gp)
	lw $s0, 1756($gp)
	mul $s1, $t7, $s0
	lw $s2, 1740($gp)
	add $s3, $s1, $s2
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	lw $s4, 140($s3)
	move $a0, $s4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

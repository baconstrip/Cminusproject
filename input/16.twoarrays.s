.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 0
	sw $t0, 200($gp)
bwhile0:
	lw $t0, 200($gp)
	li $t1, 50
	slt $t2, $t0, $t1
	beqz $t2, awhile0
	lw $t2, 200($gp)
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	li $t3, 0
	sw $t3, 0($t2)
	lw $t3, 200($gp)
	li $t4, 1
	add $t5, $t3, $t4
	sw $t5, 200($gp)
	j bwhile0
awhile0:
	li $t5, 0
	sw $t5, 204($gp)
bwhile1:
	lw $t5, 204($gp)
	li $t6, 50
	slt $t7, $t5, $t6
	beqz $t7, awhile1
	lw $t7, 204($gp)
	mul $t7, $t7, 4
	add $t7, $gp, $t7
	lw $s0, 204($gp)
	li $s1, 50
	add $s2, $s0, $s1
	sw $s2, 212($t7)
	lw $s2, 204($gp)
	li $s3, 1
	add $s4, $s2, $s3
	sw $s4, 204($gp)
	j bwhile1
awhile1:
	li $s4, 0
	sw $s4, 200($gp)
	li $s4, 0
	sw $s4, 208($gp)
bwhile2:
	lw $s4, 200($gp)
	li $s5, 100
	slt $s6, $s4, $s5
	beqz $s6, awhile2
	lw $s6, 200($gp)
	li $s7, 50
	slt $t8, $s6, $s7
	beqz $t8, acond0
	lw $t8, 208($gp)
	lw $t9, 200($gp)
	mul $t9, $t9, 4
	add $t9, $gp, $t9
	lw $t0, 0($t9)
	add $t1, $t8, $t0
	sw $t1, 208($gp)
	j   else0
acond0:
	lw $t1, 208($gp)
	lw $t2, 200($gp)
	li $t3, 50
	sub $t4, $t2, $t3
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	lw $t5, 212($t4)
	add $t6, $t1, $t5
	sw $t6, 208($gp)
else0:
	lw $t6, 200($gp)
	li $t7, 1
	add $s0, $t6, $t7
	sw $s0, 200($gp)
	j bwhile2
awhile2:
	lw $s0, 208($gp)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $s0, 5
	mul $s0, $s0, 4
	add $s0, $gp, $s0
	lw $s1, 0($s0)
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $s1, 10
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	lw $s2, 212($s1)
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

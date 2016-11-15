.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 0
	sw $t0, 0($gp)
bwhile0:
	lw $t0, 0($gp)
	li $t1, 10
	slt $t2, $t0, $t1
	beqz $t2, awhile0
	lw $t2, 0($gp)
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	lw $t3, 0($gp)
	sw $t3, 4($t2)
	lw $t3, 0($gp)
	li $t4, 1
	add $t5, $t3, $t4
	sw $t5, 0($gp)
	j bwhile0
awhile0:
	li $t5, 0
	sw $t5, 0($gp)
bwhile1:
	lw $t5, 0($gp)
	li $t6, 10
	slt $t7, $t5, $t6
	beqz $t7, awhile1
	lw $t7, 0($gp)
	li $s0, 5
	slt $s1, $t7, $s0
	beqz $s1, acond0
	lw $s1, 0($gp)
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	lw $s2, 4($s1)
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j   else0
acond0:
	li $s2, 0
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else0:
	lw $s2, 0($gp)
	li $s3, 1
	add $s4, $s2, $s3
	sw $s4, 0($gp)
	j bwhile1
awhile1:
	li $v0, 10
	syscall
.data

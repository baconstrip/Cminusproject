.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	la $t0, __str0
	move $a0, $t0
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	sw $t0, 8($gp)
	lw $t0, 8($gp)
	li $t1, 2
	div $t2, $t0, $t1
	li $t3, 2
	mul $t4, $t2, $t3
	lw $t5, 8($gp)
	seq $t6, $t4, $t5
	beqz $t6, acond0
	li $t6, 1
	sw $t6, 4($gp)
	li $t6, 0
	sw $t6, 0($gp)
bwhile0:
	lw $t6, 4($gp)
	lw $t7, 8($gp)
	sle $s0, $t6, $t7
	beqz $s0, awhile0
	lw $s0, 0($gp)
	lw $s1, 4($gp)
	add $s2, $s0, $s1
	sw $s2, 0($gp)
	lw $s2, 4($gp)
	li $s3, 1
	add $s4, $s2, $s3
	sw $s4, 4($gp)
	j bwhile0
awhile0:
	j   else0
acond0:
	li $s4, 1
	sw $s4, 4($gp)
	li $s4, 1
	sw $s4, 0($gp)
bwhile1:
	lw $s4, 4($gp)
	lw $s5, 8($gp)
	sle $s6, $s4, $s5
	beqz $s6, awhile1
	lw $s6, 0($gp)
	lw $s7, 4($gp)
	mul $t8, $s6, $s7
	sw $t8, 0($gp)
	lw $t8, 4($gp)
	li $t9, 1
	add $t0, $t8, $t9
	sw $t0, 4($gp)
	j bwhile1
awhile1:
else0:
	lw $t0, 0($gp)
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data
__str0: .asciiz "Enter a:"

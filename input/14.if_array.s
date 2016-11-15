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
	li $t0, 4
	sw $t0, 400($gp)
	li $v0, 5
	syscall
	move $t0, $v0
	sw $t0, 400($gp)
	lw $t0, 400($gp)
	li $t1, 0
	slt $t2, $t0, $t1
	lw $t3, 400($gp)
	li $t4, 100
	sge $t5, $t3, $t4
	or $t6, $t2, $t5
	beqz $t6, acond0
	la $t6, __str1
	move $a0, $t6
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j   else0
acond0:
	lw $t6, 400($gp)
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	lw $t7, 400($gp)
	li $s0, 2
	mul $s1, $t7, $s0
	sw $s1, 0($t6)
	li $s1, 5
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	li $s2, 5
	sw $s2, 0($s1)
	lw $s2, 400($gp)
	mul $s2, $s2, 4
	add $s2, $gp, $s2
	lw $s3, 0($s2)
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else0:
	li $v0, 10
	syscall
.data
__str0: .asciiz "enter i ="
__str1: .asciiz "out of bound!"

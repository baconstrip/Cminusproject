.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 3
	mul $t0, $t0, 4
	add $t0, $gp, $t0
	li $t1, 4
	sw $t1, 0($t0)
	li $t1, 3
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	lw $t2, 0($t1)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t2, 3
	sw $t2, 40($gp)
	lw $t2, 40($gp)
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	li $t3, 7
	sw $t3, 0($t2)
	lw $t3, 40($gp)
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	lw $t4, 0($t3)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t4, 40($gp)
	li $t5, 2
	add $t6, $t4, $t5
	sw $t6, 40($gp)
	lw $t6, 40($gp)
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	li $t7, 22
	sw $t7, 0($t6)
	li $t7, 5
	mul $t7, $t7, 4
	add $t7, $gp, $t7
	lw $s0, 0($t7)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

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
	li $t1, 5
	mul $t1, $t1, 4
	add $t1, $gp, $t1
	li $t2, 100
	sw $t2, 0($t1)
	li $t2, 3
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	lw $t3, 0($t2)
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t3, 999
	sw $t3, 40($gp)
	li $t3, 2001
	sw $t3, 44($gp)
	li $t3, 5
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	lw $t4, 0($t3)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t4, 0
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	lw $t5, 0($t4)
	move $a0, $t5
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t5, 40($gp)
	li $t6, 0
	mul $t6, $t6, 4
	add $t6, $gp, $t6
	lw $t7, 0($t6)
	add $s0, $t5, $t7
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $s0, 0
	mul $s0, $s0, 4
	add $s0, $gp, $s0
	li $s1, 20
	sw $s1, 0($s0)
	li $s1, 0
	mul $s1, $s1, 4
	add $s1, $gp, $s1
	lw $s2, 0($s1)
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $s2, 40($gp)
	li $s3, 0
	mul $s3, $s3, 4
	add $s3, $gp, $s3
	lw $s4, 0($s3)
	add $s5, $s2, $s4
	move $a0, $s5
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

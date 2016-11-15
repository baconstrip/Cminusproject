.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 3
	sw $t0, 0($gp)
	li $t0, 4
	sw $t0, 4($gp)
	li $t0, 5
	sw $t0, 8($gp)
	li $t0, 13
	sw $t0, 52($gp)
	li $t0, 14
	sw $t0, 56($gp)
	li $t0, 15
	sw $t0, 60($gp)
	li $t0, 0
	lw $t1, 0($gp)
	sub $t2, $t0, $t1
	sw $t2, 4($gp)
	lw $t2, 4($gp)
	mul $t2, $t2, 4
	add $t2, $gp, $t2
	lw $t3, 12($t2)
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t3, 11
	mul $t3, $t3, 4
	add $t3, $gp, $t3
	lw $t4, 12($t3)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t4, 60($gp)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t4, 12
	mul $t4, $t4, 4
	add $t4, $gp, $t4
	li $t5, 100
	sw $t5, 12($t4)
	lw $t5, 60($gp)
	move $a0, $t5
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

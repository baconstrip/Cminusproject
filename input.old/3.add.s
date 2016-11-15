.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 10
	li $t1, 20
	add $t2, $t0, $t1
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t2, 1
	sw $t2, 0($gp)
	li $t3, 3
	sw $t3, 8($gp)
	li $t4, 4
	sw $t4, 12($gp)
	lw $t5, 0($gp)
	lw $t6, 8($gp)
	add $t7, $t5, $t6
	lw $s0, 12($gp)
	add $s1, $t7, $s0
	sw $s1, 4($gp)
	lw $s2, 4($gp)
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

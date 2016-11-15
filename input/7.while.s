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
	sw $t0, 0($gp)
	li $t0, 0
	sw $t0, 8($gp)
	li $t0, 0
	sw $t0, 4($gp)
bwhile0:
	lw $t0, 4($gp)
	lw $t1, 0($gp)
	sle $t2, $t0, $t1
	lw $t3, 4($gp)
	li $t4, 100
	sle $t5, $t3, $t4
	and $t6, $t2, $t5
	beqz $t6, awhile0
	lw $t6, 8($gp)
	lw $t7, 4($gp)
	add $s0, $t6, $t7
	sw $s0, 8($gp)
	lw $s0, 4($gp)
	li $s1, 1
	add $s2, $s0, $s1
	sw $s2, 4($gp)
	j bwhile0
awhile0:
	lw $s2, 8($gp)
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data
__str0: .asciiz "enter a:"

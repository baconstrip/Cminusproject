.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 1
	sw $t0, 0($gp)
	li $t0, 0
	sw $t0, 4($gp)
bwhile0:
	lw $t0, 0($gp)
	li $t1, 10
	sle $t2, $t0, $t1
	beqz $t2, awhile0
	lw $t2, 0($gp)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t2, 4($gp)
	lw $t3, 0($gp)
	add $t4, $t2, $t3
	sw $t4, 4($gp)
	lw $t4, 0($gp)
	li $t5, 1
	add $t6, $t4, $t5
	sw $t6, 0($gp)
	j bwhile0
awhile0:
	lw $t6, 4($gp)
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data

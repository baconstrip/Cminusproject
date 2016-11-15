.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 1
	sw $t0, 4($gp)
bwhile0:
	lw $t0, 4($gp)
	li $t1, 10
	sle $t2, $t0, $t1
	beqz $t2, awhile0
	li $t2, 1
	sw $t2, 0($gp)
bwhile1:
	lw $t2, 0($gp)
	li $t3, 10
	sle $t4, $t2, $t3
	beqz $t4, awhile1
	lw $t4, 0($gp)
	lw $t5, 4($gp)
	mul $t6, $t4, $t5
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t6, 0($gp)
	li $t7, 1
	add $s0, $t6, $t7
	sw $s0, 0($gp)
	j bwhile1
awhile1:
	lw $s0, 4($gp)
	li $s1, 1
	add $s2, $s0, $s1
	sw $s2, 4($gp)
	j bwhile0
awhile0:
	li $v0, 10
	syscall
.data

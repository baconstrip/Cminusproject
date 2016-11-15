.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 0
	sw $t0, 0($gp)
bwhile0:
	lw $t0, 0($gp)
	li $t1, 50
	slt $t2, $t0, $t1
	beqz $t2, awhile0
	li $t2, 0
	sw $t2, 4($gp)
bwhile1:
	lw $t2, 4($gp)
	li $t3, 10
	slt $t4, $t2, $t3
	beqz $t4, awhile1
	lw $t4, 0($gp)
	lw $t5, 4($gp)
	add $t6, $t4, $t5
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t6, 4($gp)
	li $t7, 2
	add $s0, $t6, $t7
	sw $s0, 4($gp)
	j bwhile1
awhile1:
	li $s0, 0
	lw $s1, 4($gp)
	sub $s2, $s0, $s1
	sw $s2, 8($gp)
bwhile2:
	lw $s2, 8($gp)
	lw $s3, 4($gp)
	sne $s4, $s2, $s3
	beqz $s4, awhile2
	lw $s4, 8($gp)
	move $a0, $s4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $s4, 8($gp)
	li $s5, 1
	add $s6, $s4, $s5
	sw $s6, 8($gp)
	j bwhile2
awhile2:
	lw $s6, 0($gp)
	li $s7, 10
	add $t8, $s6, $s7
	sw $t8, 0($gp)
	j bwhile0
awhile0:
	li $v0, 10
	syscall
.data

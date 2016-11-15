.data
.newline: .asciiz "\n"
.text
.globl main
main: nop
	li $t0, 0
	sw $t0, 0($gp)
	lw $t0, 0($gp)
	li $t1, 2
	sub $t2, $t0, $t1
	sw $t2, 4($gp)
	lw $t2, 0($gp)
	beqz $t2, acond0
	li $t2, 1
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j   else0
acond0:
	li $t2, 0
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else0:
	lw $t2, 4($gp)
	beqz $t2, acond1
	lw $t2, 0($gp)
	beqz $t2, acond2
	li $t2, 0
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j   else2
acond2:
	li $t2, 1
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else2:
	j   else1
acond1:
	li $t2, 0
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else1:
	li $v0, 10
	syscall
.data

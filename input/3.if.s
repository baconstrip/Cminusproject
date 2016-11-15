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
	lw $t0, 0($gp)
	beqz $t0, acond0
	li $t0, 1
	lw $t1, 0($gp)
	sub $t2, $t0, $t1
	sw $t2, 4($gp)
	lw $t2, 4($gp)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j   else0
acond0:
	lw $t2, 0($gp)
	sw $t2, 4($gp)
	lw $t2, 4($gp)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else0:
	li $v0, 10
	syscall
.data
__str0: .asciiz "Enter a:"

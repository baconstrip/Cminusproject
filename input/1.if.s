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
	li $t1, 0
	sne $t2, $t0, $t1
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
else0:
	la $t2, __str1
	move $a0, $t2
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.data
__str0: .asciiz "enter a:"
__str1: .asciiz "complete!"

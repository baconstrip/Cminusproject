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
	la $t0, __str1
	move $a0, $t0
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	sw $t0, 4($gp)
	lw $t0, 4($gp)
	lw $t1, 0($gp)
	sgt $t2, $t0, $t1
	beqz $t2, acond0
	lw $t2, 0($gp)
	li $t3, 0
	sgt $t4, $t2, $t3
	beqz $t4, acond1
	la $t4, __str2
	move $a0, $t4
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t4, 0($gp)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j   else1
acond1:
	la $t4, __str3
	move $a0, $t4
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t4, 4($gp)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else1:
	j   else0
acond0:
	lw $t4, 0($gp)
	li $t5, 0
	slt $t6, $t4, $t5
	beqz $t6, acond2
	la $t6, __str4
	move $a0, $t6
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t6, 0($gp)
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j   else2
acond2:
	la $t6, __str5
	move $a0, $t6
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	lw $t6, 4($gp)
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
else2:
else0:
	li $v0, 10
	syscall
.data
__str0: .asciiz "enter a:"
__str1: .asciiz "enter b:"
__str2: .asciiz "a = "
__str3: .asciiz "b = "
__str4: .asciiz "a = "
__str5: .asciiz "b = "

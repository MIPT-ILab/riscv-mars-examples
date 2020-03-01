# RISC-V example program for calculating the sum of two numbers.
# Author Eric Konks
# Copyright 2020 MIPT-V

	.data
__desc_:	.string "This program calculates the sum of two numbers.\n"
__1n_:	.string "Enter 1st number: "
__2n_:	.string "Enter 2nd number: "
__sum_:	.string	"Sum: "
__endsym_:	.string "\n"

	.section .text
	.globl _start
_start:
# Print the description
	li x2, 4	# Syscall 4 (print str)
	la x4, __desc_	# Load string address
	ecall
# Print first enter message
	li x2, 4	
	la x4, __1n_
	ecall
# Read first integer
	li x2, 5	# Syscall 5 (read int)
	ecall	# x2 will contain int
	mv t1, x2	# Save first number
# Print second enter message
	li x2, 4	# Syscall 4 (print str)
	la x4, __2n_	# Load string address
	ecall
# Read second integer
	li x2, 5	# Syscall 5 (red int)
	ecall	#x2 will contain int
# Sum
	add t2, t1, x2	# t2 = number1 + number2
# Print result message
	li x2, 4	# Syscall 4 (print str)
	la x4, __sum_	# Load string address
	ecall
# Print result
	li x2, 1	# Syscall 1 (print int)
	mv x4, t2	# x4 contains integer to print
	ecall
# Print end symbol
	li x2, 4	# Syscall 4 (print str)
	la x4, __endsym_	# Load string address
	ecall
# Exit
	li x2, 0xA	# Syscall 10 (exit)
	ecall
